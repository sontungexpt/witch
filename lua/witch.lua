local vim, type, require, ipairs, pairs = vim, type, require, ipairs, pairs
local uv, g, api, defer_fn = (vim.uv or vim.loop), vim.g, vim.api, vim.defer_fn
local hl, autocmd, augroup = api.nvim_set_hl, api.nvim_create_autocmd, api.nvim_create_augroup

local PLUG_NAME = "witch"
local PALETTE_DIR = "witch.palette."
local MODULE_DIR = "witch.theme.module."
local STARTUP_MODULE_DIR = "witch.theme.module.startup."
local STARTUP_MODULES = {
	"default_array",
	"nvimtree",
	"markdown",
	"terminal",
	"cmp",
}

local group_ids = {
	[PLUG_NAME] = augroup(PLUG_NAME, { clear = true }),
}
local current_theme_style = nil

local dimmed_ns = nil -- dimmed_ns == nil means dim is disabled
local dimmed_level = 0.46

local M = {}

local function get_global_group_id()
	return group_ids[PLUG_NAME]
		or (function()
			group_ids[PLUG_NAME] = augroup(PLUG_NAME, { clear = true })
			return group_ids[PLUG_NAME]
		end)()
end

local function rand_unique_name()
	---@diagnostic disable-next-line: undefined-field
	return PLUG_NAME .. "_" .. uv.now() .. "_" .. math.random(1000000, 9999999)
end

function M.current_theme_style() return current_theme_style end

function M.get_palette(style, configs)
	local default, palette = pcall(require, PALETTE_DIR .. style)
	if default then return palette, style end

	-- Check user custom themes, fallback to default
	local pascal_style_theme = style:gsub("^%l", string.upper)

	if configs.more_themes[pascal_style_theme] then
		return configs.more_themes[pascal_style_theme], pascal_style_theme
	else
		local fallback_theme = configs.theme.fallback
		require("witch.util.notify").warn(
			"Theme " .. style .. " not found. Using default theme" .. fallback_theme
		)
		return require(PALETTE_DIR .. fallback_theme), fallback_theme
	end
end

local function async_load_syntax_batch(syntaxs, batch_size, step_delay, module_name)
	local darken = require("witch.util").darken
	local coroutine = coroutine
	local co

	local function resume_coroutine()
		if coroutine.status(co) ~= "dead" then
			local success, errorMsg = coroutine.resume(co)
			if not success then require("witch.util.notify").error("Error in coroutine:", errorMsg) end
		end
	end

	local highlight = function(group_name, styles)
		hl(0, group_name, styles)

		if dimmed_ns then
			if group_name == "VertSplit" or group_name == "WinSeparator" then
				hl(dimmed_ns, group_name, styles)
			else
				styles.fg = darken(styles.fg, dimmed_level)
				styles.bg = darken(styles.bg, dimmed_level)
				hl(dimmed_ns, group_name, styles)
			end
		end
	end

	co = coroutine.create(function()
		if syntaxs[1] == nil then
			local index = 1
			for group_name, styles in pairs(syntaxs) do
				highlight(group_name, styles)

				index = index + 1
				if index % (batch_size or 10) == 0 then
					defer_fn(resume_coroutine, step_delay or 100)
					coroutine.yield()
				end
			end
		else
			local len = #syntaxs
			for i = 1, len do
				highlight(syntaxs[i][1], syntaxs[i][2])
				if i % (batch_size or 10) == 0 then
					defer_fn(resume_coroutine, step_delay or 100)
					coroutine.yield()
				end
			end
		end

		api.nvim_exec_autocmds("User", {
			pattern = "WitchHighlightDone",
			data = module_name,
			modeline = false,
		})
	end)

	resume_coroutine()
end

function M.highlight(get_syntax, palette, on_highlight, module_name)
	local syntax = get_syntax(palette, current_theme_style)

	if type(syntax) == "table" then
		if type(on_highlight) == "function" then
			if syntax[1] ~= nil then
				setmetatable(syntax, {
					__index = function(_, k)
						for i = 1, #syntax do
							if syntax[i][1] == k then return syntax[i][2] end
						end
					end,
					__newindex = function(_, k, v)
						local len = #syntax
						for i = 1, len do
							if syntax[i][1] == k then
								syntax[i][2] = v
								return
							end
						end
						syntax[len + 1] = { k, v }
					end,
				})
			end
			on_highlight(current_theme_style, palette, syntax)
		end

		async_load_syntax_batch(syntax, 35, 80, module_name)
	end
end

--- Load and apply highlight for a module based on its configuration.
--- @param module table The module to load.
--- @param palette table The default color palette.
--- @param on_highlight function The callback function to apply highlight.
local function load_module_highlight(module, palette, on_highlight)
	local module_autocmd_group = augroup(rand_unique_name(), { clear = true })
	local should_run_on_startup = true

	palette = module.palette or palette
	on_highlight = module.on_highlight or on_highlight

	local function apply_syntax(get_syntax)
		if type(get_syntax) == "function" then
			M.highlight(get_syntax, palette, on_highlight, module.name or "unknown")
		else
			M.highlight(module.syntax, palette, on_highlight, module.name or "unknown")
		end
	end

	--- Create an autocommand for a module based on its configuration. The autocommand will be removed after the first run.
	--- @param event table|string The event to trigger the autocommand.
	--- @param callback function The callback function to execute. If the callback returns false, the autocommand will not be removed.
	--- @param pattern string|table|nil The pattern to match for the autocommand.
	--- @param new_group boolean|nil Whether to create a new group for the autocommand.
	local create_autocmd = function(event, callback, pattern, new_group)
		local group = new_group and augroup(rand_unique_name(), { clear = true }) or module_autocmd_group
		group_ids[group] = group
		autocmd(event, {
			group = group,
			pattern = pattern or "*",
			callback = function(args)
				if callback(args) ~= false then
					api.nvim_del_augroup_by_id(group)
					group_ids[group] = nil
				end
			end,
		})
	end

	local filetypes = module.filetypes
	if type(filetypes) == "table" then
		should_run_on_startup = filetypes[1] == nil
		for key, value in pairs(filetypes) do
			if type(key) == "number" then
				create_autocmd("FileType", apply_syntax, value)
			else
				create_autocmd("FileType", function() apply_syntax(value) end, key, true)
			end
		end
	end

	local buftypes = module.buftypes
	if type(buftypes) == "table" then
		if buftypes[1] ~= nil then
			should_run_on_startup = false
			create_autocmd("BufReadPost", function(args)
				local buftype = api.nvim_get_option_value("buftype", { buf = args.buf })
				for _, value in ipairs(buftypes) do
					if buftype == value then
						apply_syntax()
						return true -- break the loop and cleanup the group
					end
				end
				return false
			end, "*")
		end
		for key, value in pairs(buftypes) do
			if type(value) == "function" then
				create_autocmd("BufReadPost", function(args)
					if api.nvim_get_option_value("buftype", { buf = args.buf }) == key then
						apply_syntax(value)
						return true
					end
					return false
				end, "*", true)
			end
		end
	end

	local events = module.events
	if type(events) == "table" then
		should_run_on_startup = events[1] == nil
		for key, value in pairs(events) do
			if type(key) == "number" then
				create_autocmd(value, apply_syntax, "*")
			elseif type(value) == "function" then
				create_autocmd(key, function() apply_syntax(value) end, "*", true)
			elseif
				type(value) == "table"
				and (type(value.pattern) == "table" or type(value.pattern) == "string")
			then
				if type(value.syntax) == "function" then
					create_autocmd(key, function() apply_syntax(value.syntax) end, value.pattern, true)
				else
					should_run_on_startup = false
					create_autocmd(key, apply_syntax, value.pattern)
				end
			end
		end
	end

	if should_run_on_startup then apply_syntax() end
end

local function load_extra_modules(extras, palette, on_highlight)
	--support for both table and array
	for key, enabled in pairs(extras) do
		if enabled then
			local module_name = type(key) == "number" and enabled or key
			local ok, module = pcall(require, MODULE_DIR .. module_name)
			if ok then
				load_module_highlight(module, palette, on_highlight)
			else
				require("witch.util.notify").warn("Extra module " .. module_name .. " not found")
			end
		end
	end
end

local function load_custom_modules(customs, palette, on_highlight)
	local read_only_colors = require("witch.util").read_only(palette)
	for _, module in ipairs(customs) do
		if type(module) == "table" then load_module_highlight(module, read_only_colors, on_highlight) end
	end
end

function M.switch_style(configs, new_style)
	if new_style ~= current_theme_style then M.load(configs, new_style) end
end

function M.enable_switcher(configs)
	api.nvim_create_user_command("Witch", function(args) M.switch_style(configs, args.args) end, {
		nargs = 1,
	})
end

function M.load(configs, theme_style)
	if g.colors_name then api.nvim_command("hi clear") end

	local theme_conf = configs.theme
	local on_highlight = theme_conf.on_highlight

	local palette = nil

	palette, current_theme_style = M.get_palette(theme_style or theme_conf.style, configs)

	if theme_conf.enabled then
		for _, name in ipairs(STARTUP_MODULES) do
			load_module_highlight(require(STARTUP_MODULE_DIR .. name), palette, on_highlight)
		end
	end

	if next(theme_conf.extras) then load_extra_modules(theme_conf.extras, palette, on_highlight) end
	if next(theme_conf.customs) then load_custom_modules(theme_conf.customs, palette, on_highlight) end

	g.colors_name = PLUG_NAME .. "-" .. current_theme_style
end

function M.enable_dim(excluded)
	local is_excluded = function(bufnr)
		return excluded.filetypes[api.nvim_get_option_value("filetype", { buf = bufnr })]
			or excluded.buftypes[api.nvim_get_option_value("buftype", { buf = bufnr })]
			or vim.tbl_contains(excluded.filetypes, api.nvim_get_option_value("filetype", { buf = bufnr }))
			or vim.tbl_contains(excluded.buftypes, api.nvim_get_option_value("buftype", { buf = bufnr }))
	end

	-- Dim other windows when entering a window
	-- (excluding the current window and the win that list in excluded)
	local wins_dimmed = {}
	local dim_wins = function(event)
		if is_excluded(0) then
			if event == "WinClosed" then
				local id, _ = next(wins_dimmed)
				if id then
					api.nvim_win_set_hl_ns(id, 0)
					wins_dimmed[id] = nil
				end
			end
			return
		end

		local win_ids = api.nvim_list_wins()
		local curr_win_id = api.nvim_get_current_win()

		for _, win_id in ipairs(win_ids) do
			if win_id ~= curr_win_id and not is_excluded(api.nvim_win_get_buf(win_id)) then
				wins_dimmed[win_id] = true
				api.nvim_win_set_hl_ns(win_id, dimmed_ns)
			end
		end
		wins_dimmed[curr_win_id] = nil
		api.nvim_win_set_hl_ns(curr_win_id, 0)
	end

	autocmd({ "WinEnter", "WinClosed" }, {
		group = get_global_group_id(),
		callback = function(args)
			if args.event == "WinClosed" then wins_dimmed[api.nvim_get_current_win()] = nil end
			defer_fn(function() dim_wins(args.event) end, 10) -- delay 10ms to make sure the window is completely loaded
		end,
	})
end

function M.setup(user_opts)
	local configs = require("witch.config").setup(user_opts)

	vim.opt.termguicolors = true

	if configs.dim_inactive.enabled then
		dimmed_ns = api.nvim_create_namespace(PLUG_NAME .. "_dimmed")
		dimmed_level = configs.dim_inactive.level or dimmed_level

		M.enable_dim(configs.dim_inactive.excluded)
	end

	M.load(configs)

	if configs.switcher then M.enable_switcher(configs) end

	autocmd("ColorSchemePre", {
		group = get_global_group_id(),
		callback = function()
			for key, id in pairs(group_ids) do
				api.nvim_del_augroup_by_id(id)
				group_ids[key] = nil
			end
		end,
	})
end

return M
