local api = vim.api
local pairs, ipairs, tonumber, type = pairs, ipairs, tonumber, type
local nvim_get_hl, nvim_set_hl, nvim_win_set_hl_ns = api.nvim_get_hl, api.nvim_set_hl, api.nvim_win_set_hl_ns
local nvim_list_wins, nvim_get_current_win, nvim_win_get_buf =
	api.nvim_list_wins, api.nvim_get_current_win, api.nvim_win_get_buf

--- Namespace and Augroup identifiers to keep Witch dimming isolated.
local NAMESPACE = "witch_dimmed"
local AUGROUP_NAME = "witch_dimmed"

local M = {}
local color = require("witch.util.color")

--- Excluded buffers configuration.
--- @class Dim.Excluded
--- @field filetypes table<string, boolean>|string[]
--- @field buftypes   table<string, boolean>|string[]

--- Configuration settings. These only change when M.config is called.
--- @class Dim.Config
--- @field keep     number  Fraction of the original color to keep (0 to 1).
--- @field dim_bg   boolean Whether to also dim background colors.
--- @field excluded Dim.Excluded Resolved exclusion sets.

--- @type Dim.Config
local config = {
	keep = 0.65,
	dim_bg = true,
	excluded = { filetypes = {}, buftypes = {} },
}

--- Runtime state. These change frequently during the plugin's lifecycle.
--- @class Dim.State
--- @field ns       integer|nil Highlight namespace used for dimming.
--- @field group    integer|nil Autocmd group id.
--- @field dimmed   table<string, boolean> Cache of groups currently written into the dim namespace.
--- @field applied  table<integer, integer> Cache of window ids mapped to their current namespace.
--- @field pending  boolean Prevents multiple rebuilds from firing in the same event loop tick.

--- Creates a fresh runtime state.
--- @return Dim.State
local function new_state()
	return {
		ns = nil,
		group = nil,
		dimmed = {},
		applied = {},
		pending = false,
	}
end

--- @type Dim.State
local state = new_state()

--- Highlight groups that should never be dimmed.
--- Window separators need to stay bright so the user can see window boundaries.
local SKIP_GROUPS = {
	VertSplit = true,
	WinSeparator = true,
}

--- Converts a list (e.g., `{ "lua", "python" }`) or a map (e.g., `{ lua = true }`) into a lookup set.
--- This allows O(1) checks for excluded filetypes/buftypes later.
--- @param t table|string[]|nil
--- @return table<string, boolean>
local function to_set(t)
	local set = {}
	for k, v in pairs(t or {}) do
		if type(k) == "number" then
			set[v] = true
		elseif v then
			set[k] = true
		end
	end
	return set
end

--- Iterates through all global highlights, applies dimming to root groups,
--- and stores the results inside the dedicated highlight namespace.
--- @return nil
local function rebuild()
	local ns = state.ns
	if not ns then
		return
	end

	-- Cache local variables to speed up the hot loop.
	local blend_int = color.blend_int
	local blend = blend_int
	local keep = config.keep
	local dim_bg = config.dim_bg
	local set_hl = nvim_set_hl

	-- Fetch highlights using `link = true`.
	local all = nvim_get_hl(0, { link = true })
	--- @cast all table<string, vim.api.keyset.get_hl_info>

	-- Auto-detect theme brightness to choose the best blend target.
	local target = 0x000000 -- Default for dark themes (blend to black).
	if all.Normal and color.is_light(all.Normal.bg) then
		-- Use a darker, cooler grey to make the dimming obvious and clean.
		target = 0x94a3b8
	end

	local seen = {}

	for name, def in pairs(all) do
		-- 1. If the group is a link (e.g., `@string.lua` -> `String`), pass it through as-is.
		if def.link then
			---@diagnostic disable-next-line: param-type-mismatch
			set_hl(ns, name, def)
			seen[name] = true

		-- 2. If the group is a window separator, leave it untouched so it stays bright.
		elseif SKIP_GROUPS[name] then
			---@diagnostic disable-next-line: param-type-mismatch
			set_hl(ns, name, def)
			seen[name] = true

		-- 3. For root groups with actual colors, blend them toward the target.
		else
			local fg = def.fg
			local sp = def.sp
			local bg = dim_bg and def.bg

			if fg or sp or bg then
				if fg then
					local blended = blend(fg, target, keep)
					if blended then def.fg = blended end
				end
				if sp then
					local blended = blend(sp, target, keep)
					if blended then def.sp = blended end
				end
				if bg then
					local blended = blend(bg, target, keep)
					if blended then def.bg = blended end
				end

				---@diagnostic disable-next-line: param-type-mismatch
				set_hl(ns, name, def)
				seen[name] = true
			end
		end
	end

	-- Garbage collection: remove groups from the namespace if they were deleted globally.
	for name in pairs(state.dimmed) do
		if not seen[name] then
			set_hl(ns, name, {})
		end
	end
	state.dimmed = seen
end

--- Assigns the dim namespace to all windows except the current one.
--- @param skip integer|nil Window id to ignore (usually the one being closed).
--- @return nil
local function refresh(skip)
	local ns = state.ns
	if not ns then
		return
	end

	-- Cache local variables for faster access.
	local curr = nvim_get_current_win()
	local applied = state.applied
	local ft_set = config.excluded.filetypes
	local bt_set = config.excluded.buftypes
	local set_ns = nvim_win_set_hl_ns
	local win_valid = api.nvim_win_is_valid
	local buf_valid = api.nvim_buf_is_valid

	for _, win in ipairs(nvim_list_wins()) do
		-- Skip the window being closed (WinClosed fires while it is still listed),
		-- and anything that became invalid since nvim_list_wins() returned.
		if win == skip or not win_valid(win) then
			goto continue
		end

		-- `do ... end` limits the scope of `target`. Lua forbids `goto continue`
		-- from jumping into the scope of a local declared after the goto,
		-- and the label sits at the end of the loop body.
		do
			-- 0 means "use the global highlight namespace" (no dimming).
			local target = 0

			-- The focused window is never dimmed, so only inspect the others.
			if win ~= curr then
				-- pcall: the window can be closed between the validity check
				-- above and this call (e.g. by another plugin's autocmd).
				local ok, buf = pcall(nvim_win_get_buf, win)
				if not ok or not buf_valid(buf) then
					-- Window/buffer is dying: skip it entirely instead of
					-- resetting it to namespace 0 with a wrong value.
					goto continue
				end

				-- Dim unless the filetype or buftype is on the exclude list
				-- (e.g. sidebars, terminals, popups that should stay bright).
				local bo = vim.bo[buf]
				if not (ft_set[bo.filetype] or bt_set[bo.buftype]) then
					target = ns
				end
			end

			-- Only touch the window when its namespace actually changes.
			-- The cache is updated only if set_ns succeeded (pcall returns true),
			-- so a failed call never leaves `applied` out of sync with reality.
			if applied[win] ~= target and pcall(set_ns, win, target) then
				applied[win] = target
			end
		end

		::continue::
	end
end

--- Executes the queued rebuild and refresh.
--- @return nil
local function run_pending()
	state.pending = false
	if state.ns then
		rebuild()
		refresh()
	end
end

-- Terminal (and some plugin) buffers get their buftype/filetype set slightly
-- after the window is entered. A 1ms timer defers past that, which a plain
-- vim.schedule (next loop tick) can miss.
local DEFER_MS = 1

local function schedule_rebuild()
	if not state.pending then
		state.pending = true
		vim.defer_fn(run_pending, DEFER_MS)
	end
end

--- Handles window lifecycle events.
--- @param args vim.api.keyset.create_autocmd.callback_args
--- @return nil
local function on_win(args)
	if args.event == "WinClosed" then
		local closing = tonumber(args.match)
		if closing then
			state.applied[closing] = nil
			return refresh(closing)
		end
	end
	schedule_rebuild()
end

--- Configures the dimming feature without enabling it.
--- @param excluded Dim.Excluded|nil Tables of filetypes and buftypes to exclude.
--- @param level    number|nil Opacity level (0 = visible, 1 = black).
--- @param bg       boolean|nil Whether to dim background colors.
--- @return nil
M.config = function(excluded, level, bg)
	if level then
		config.keep = 1 - level
	end
	if bg ~= nil then
		config.dim_bg = bg
	end

	if type(excluded) == "table" then
		config.excluded.filetypes = to_set(excluded.filetypes)
		config.excluded.buftypes = to_set(excluded.buftypes)
	end
end

--- Returns whether dimming is currently enabled.
--- @return boolean
M.is_enabled = function()
	return state.ns ~= nil
end

--- Enables dimming by creating the namespace and registering autocmds.
--- @return nil
M.enable = function()
	if state.ns then
		return
	end

	state.ns = api.nvim_create_namespace(NAMESPACE)
	state.group = api.nvim_create_augroup(AUGROUP_NAME, { clear = true })

	rebuild()
	refresh()

	api.nvim_create_autocmd({ "WinEnter", "WinClosed", "BufWinEnter" }, {
		group = state.group,
		callback = on_win,
	})

	api.nvim_create_autocmd("ColorScheme", {
		group = state.group,
		callback = schedule_rebuild,
	})

	-- Only listen to WitchModuleLoaded because lazy-loaded modules inject new
	-- highlight groups without firing a ColorScheme event.
	-- No need to listen to WitchPaletteChanged because it's already covered by ColorScheme.
	api.nvim_create_autocmd("User", {
		group = state.group,
		pattern = "WitchModuleLoaded",
		callback = schedule_rebuild,
	})
end

--- Disables dimming and restores all windows to default colors.
--- @return nil
M.disable = function()
	if not state.ns then
		return
	end

	-- Remove all event listeners.
	api.nvim_clear_autocmds({ group = state.group })

	-- Restore every tracked window to the global namespace (0).
	for win in pairs(state.applied) do
		if api.nvim_win_is_valid(win) then
			nvim_win_set_hl_ns(win, 0)
		end
	end

	-- Reset runtime state using the factory function.
	state = new_state()
end

--- Toggle dimming on and off.
--- @return nil
M.toggle = function()
	if M.is_enabled() then
		M.disable()
	else
		M.enable()
	end
end

return M
