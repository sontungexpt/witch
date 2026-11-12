local api = vim.api
local pairs, ipairs, tonumber, type = pairs, ipairs, tonumber, type
local nvim_get_hl, nvim_set_hl, nvim_win_set_hl_ns = api.nvim_get_hl, api.nvim_set_hl, api.nvim_win_set_hl_ns
local nvim_list_wins, nvim_get_current_win, nvim_win_get_buf =
	api.nvim_list_wins, api.nvim_get_current_win, api.nvim_win_get_buf

--- @type string Plugin identifier used for namespace / augroup names.
local PLUG_NAME = "witch"

local M = {}

--- Blend a color toward a target color and return the resulting integer.
--- @type fun(fg: string|integer|nil, bg: string|integer|nil, alpha: number): integer|nil
local blend_int

--- @class Dim.Excluded
--- @field filetypes table<string, boolean>|string[] Filetypes to exclude from dimming.
--- @field buftypes   table<string, boolean>|string[] Buftypes to exclude from dimming.

--- @class Dim.State
--- @field keep     number  Fraction of the original color to keep (0–1).
--- @field dim_bg   boolean Whether background colors should be dimmed too.
--- @field excluded Dim.Excluded Resolved exclusion sets.
--- @field ns       integer|nil Highlight namespace used for dimming.
--- @field group    integer|nil Autocmd group id.
--- @field dimmed   table<string, boolean> Groups currently written into the dim namespace.
--- @field applied  table<integer, integer> Map of winid -> namespace currently applied.
--- @field pending  boolean Whether a rebuild is already scheduled.

--- @type Dim.State
local state = {
	keep = 0.46, -- Keep 46% of the original color (54% opacity)
	dim_bg = true,
	excluded = { filetypes = {}, buftypes = {} },
	ns = nil,
	group = nil,
	dimmed = {},
	applied = {},
	pending = false,
}

--- Convert an array-or-map table into a lookup set.
--- Accepts both `{ "lua", "vim" }` and `{ lua = true, vim = true }` shapes.
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

--- Rebuild the dim namespace from all currently defined highlight groups.
--- For each group, fg/sp/bg are blended toward black using `state.keep`,
--- except `VertSplit` / `WinSeparator` which are copied verbatim.
--- Groups no longer present in the global table are cleared from the namespace.
--- @return nil
local function rebuild()
	local ns = state.ns
	if not ns then
		return
	end

	blend_int = blend_int or require("witch.util.color").blend_int
	local keep = state.keep
	local dim_bg = state.dim_bg

	-- FETCH ALL CURRENT HIGHLIGHTS
	local all = nvim_get_hl(0, { link = false })
	--- @cast all table<string, vim.api.keyset.get_hl_info>

	local target = 0x000000
	local seen = {}

	for name, def in pairs(all) do
		local fg, sp, bg = def.fg, def.sp, dim_bg and def.bg
		if fg or sp or bg then
			if name == "VertSplit" or name == "WinSeparator" then
				---@diagnostic disable-next-line: param-type-mismatch
				nvim_set_hl(ns, name, def)
				seen[name] = true
				goto continue
			end

			-- Use blend_int which returns an Integer (not a String)
			if fg then
				local blended = blend_int(fg, target, keep)
				if blended then def.fg = blended end
			end
			if sp then
				local blended = blend_int(sp, target, keep)
				if blended then def.sp = blended end
			end
			if bg then
				local blended = blend_int(bg, target, keep)
				if blended then def.bg = blended end
			end

			---@diagnostic disable-next-line: param-type-mismatch
			nvim_set_hl(ns, name, def)
			seen[name] = true
		end
		::continue::
	end

	-- Remove old groups that no longer exist
	for name in pairs(state.dimmed) do
		if not seen[name] then
			nvim_set_hl(ns, name, {})
		end
	end
	state.dimmed = seen
end

--- Update the highlight namespace applied to each window.
--- The current window always gets namespace `0` (no dimming); other windows
--- receive the dim namespace unless their filetype/buftype is excluded.
--- @param skip integer|nil Window id to ignore (e.g. the one being closed).
--- @return nil
local function refresh(skip)
	local ns = state.ns
	if not ns then
		return
	end

	local curr = nvim_get_current_win()
	local applied = state.applied
	local ft_set = state.excluded.filetypes
	local bt_set = state.excluded.buftypes

	for _, win in ipairs(nvim_list_wins()) do
		if win ~= skip and api.nvim_win_is_valid(win) then
			local target = 0
			if win ~= curr then
				local bo = vim.bo[nvim_win_get_buf(win)]
				if not (ft_set[bo.filetype] or bt_set[bo.buftype]) then
					target = ns
				end
			end
			if applied[win] ~= target then
				applied[win] = target
				nvim_win_set_hl_ns(win, target)
			end
		end
	end
end

--- Execute the pending rebuild + refresh inside the main loop.
--- @return nil
local function run_pending()
	state.pending = false
	if state.ns then
		rebuild()
		refresh()
	end
end

--- Coalesce rebuild requests: schedule a single `run_pending` per tick.
--- @return nil
local function schedule_rebuild()
	if not state.pending then
		state.pending = true
		vim.schedule(run_pending)
	end
end

--- Autocmd callback for window lifecycle events.
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
	refresh()
end

--- Enable dimming of inactive windows.
--- @param excluded Dim.Excluded|nil Tables of filetypes/buftypes to exclude.
--- @param level    number|nil Opacity level (0 = fully visible, 1 = fully black). `keep = 1 - level`.
--- @param bg       boolean|nil Whether to dim background colors as well.
--- @return nil
function M.setup(excluded, level, bg)
	if level then
		state.keep = 1 - level
	end
	if bg ~= nil then
		state.dim_bg = bg
	end

	excluded = excluded or {}
	state.excluded.filetypes = to_set(excluded.filetypes)
	state.excluded.buftypes = to_set(excluded.buftypes)

	state.ns = api.nvim_create_namespace(PLUG_NAME .. "_dimmed")
	state.group = api.nvim_create_augroup(PLUG_NAME .. "_dim", { clear = true })

	rebuild()
	refresh()

	api.nvim_create_autocmd({ "WinEnter", "WinClosed", "BufWinEnter" }, {
		group = state.group,
		callback = on_win,
	})

	-- Continuously rebuild when Treesitter or LSP updates
	api.nvim_create_autocmd("ColorScheme", {
		group = state.group,
		callback = schedule_rebuild,
	})
	api.nvim_create_autocmd("User", {
		group = state.group,
		pattern = { "WitchModuleLoaded", "WitchPaletteChanged" },
		callback = schedule_rebuild,
	})
	-- Also listen to LspAttach to make sure LSP tokens get dimmed
	api.nvim_create_autocmd("LspAttach", {
		group = state.group,
		callback = schedule_rebuild,
	})
end

--- Disable dimming and restore all windows to the default namespace.
--- @return nil
function M.disable()
	if not state.ns then
		return
	end
	api.nvim_clear_autocmds({ group = state.group })
	for win in pairs(state.applied) do
		if api.nvim_win_is_valid(win) then
			nvim_win_set_hl_ns(win, 0)
		end
	end
	state.applied, state.ns = {}, nil
end

return M
