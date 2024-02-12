local type = type
local require = require
local vim = vim
local g = vim.g
local api = vim.api
local uv = vim.uv or vim.loop
local opts = vim.opt
local cmd = api.nvim_command
local defer_fn = vim.defer_fn
local hl = api.nvim_set_hl
local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup
local del_augroup = api.nvim_del_augroup_by_id

local util = require("witch.util")

local PLUG_NAME = "witch"
local COLOR_DIR = "witch.colors."
local MODULE_DIR = "witch.theme.module."
local STARTUP_MODULE_DIR = "witch.theme.module.startup."
local STARTUP_MODULE = {
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
local dimmed_ns = nil
local dim_level = 0.46

local M = {}

local get_global_group_id = function()
	return group_ids[PLUG_NAME]
		or (function()
			group_ids[PLUG_NAME] = augroup(PLUG_NAME, { clear = true })
			return group_ids[PLUG_NAME]
		end)()
end

local rand_unique_name = function()
	return string.format("%s_%s_%s", PLUG_NAME, uv.hrtime() --[[ now ]], math.random(1000000, 9999999))
end

M.get_current_theme_style = function() return current_theme_style end

M.get_colors = function(style, configs)
	local theme_conf = configs.theme

	local valid, colors = pcall(require, COLOR_DIR .. style)

	if not valid then
		-- check user custom themes

		-- change style to PascalCase
		local pascal_style = style:gsub("^%l", string.upper)

		if configs.more_themes[pascal_style] then
			colors = configs.more_themes[pascal_style]
			style = pascal_style
		else
			require("witch.util.notify").warn(
				"Theme " .. style .. " not found. Using default theme" .. theme_conf.default
			)
			style = theme_conf.default
			colors = require(COLOR_DIR .. theme_conf.default)
		end
	end

	if type(theme_conf.on_highlight) == "function" then theme_conf.on_highlight(style, colors, {}) end

	return colors, style
end

local async_load_syntax_batch = function(syntaxs, batch_size, step_delay, module_name)
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
				styles.fg = util.darken(styles.fg, dim_level)
				styles.bg = util.darken(styles.bg, dim_level)
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

M.highlight = function(get_syntax, colors, on_highlight, module_name)
	local syntax = get_syntax(colors, current_theme_style)

	if type(syntax) == "table" then
		if type(on_highlight) == "function" then on_highlight(current_theme_style, colors, syntax) end

		async_load_syntax_batch(syntax, 30, 80, module_name)
	end
end

local load_module_highlight = function(module, colors, on_highlight)
	local module_autocmd_group = augroup(rand_unique_name(), { clear = true })

	local has_syntax = type(module.syntax) == "function"
	colors = module.colors or colors
	on_highlight = module.on_highlight or on_highlight

	local function create_autocmd(event, group, pattern, get_syntax)
		group_ids[group] = group
		autocmd(event, {
			group = group,
			pattern = pattern,
			once = true,
			callback = function()
				M.highlight(get_syntax, colors, on_highlight, module.name or "unknown")
				del_augroup(group)
				group_ids[group] = nil
			end,
		})
	end

	local function setup_type_autocmds(event, types)
		-- name
		-- name : fuction
		for pattern, get_syntax in pairs(types) do
			if type(pattern) == "number" and has_syntax then
				has_syntax = false -- not need to call module.syntax in start time
				-- pattern = get_syntax
				-- group = module_autocmd_group
				-- get_syntax = module.syntax
				create_autocmd(event, module_autocmd_group, get_syntax, module.syntax)
			elseif type(get_syntax) == "function" then
				-- pattern = pattern
				-- group = side_autocmd_group
				-- get_syntax = get_syntax
				create_autocmd(event, augroup(rand_unique_name(), { clear = true }), pattern, get_syntax)
			end
		end
	end

	local function setup_event_autocmds(events)
		-- name
		-- name : fuction
		-- name : { pattern = "pattern", syntax = function }
		for event, get_syntax in pairs(events) do
			if type(event) == "number" and has_syntax then
				-- not need to call module.syntax in start time
				has_syntax = false

				-- event = get_syntax
				-- get_syntax = module.syntax
				-- group = module_autocmd_group
				-- pattern = "*"
				create_autocmd(get_syntax, module_autocmd_group, "*", module.syntax)
			elseif type(get_syntax) == "function" then
				-- event = event
				-- get_syntax = get_syntax
				-- group = side_autocmd_group
				-- pattern = "*"
				create_autocmd(event, augroup(rand_unique_name(), { clear = true }), "*", get_syntax)
			elseif
				type(get_syntax) == "table"
				and type(get_syntax.syntax) == "function"
				and (type(get_syntax.pattern) == "table" or type(get_syntax.pattern) == "string")
			then
				-- event = event
				-- get_syntax = get_syntax.syntax
				-- group = side_autocmd_group
				-- pattern = get_syntax.pattern
				create_autocmd(
					event,
					augroup(rand_unique_name(), { clear = true }),
					get_syntax.pattern,
					get_syntax.syntax
				)
			end
		end
	end
	if type(module.filetypes) == "table" then setup_type_autocmds("FileType", module.filetypes) end
	if type(module.buftypes) == "table" then setup_type_autocmds("BufReadPre", module.buftypes) end
	if type(module.events) == "table" then setup_event_autocmds(module.events) end

	if has_syntax then M.highlight(module.syntax, colors, on_highlight, module.name or "unknown") end
end

local load_default = function(colors, on_highlight)
	-- highlight(M.syntax, colors, on_highlight)

	for _, name in ipairs(STARTUP_MODULE) do
		load_module_highlight(require(STARTUP_MODULE_DIR .. name), colors, on_highlight)
	end
end

local load_extra_modules = function(extras, colors, on_highlight)
	--support for table and array
	for name, enabled in pairs(extras) do
		if type(name) == "number" then
			name = enabled
			enabled = true
		end
		if enabled then
			local ok, module = pcall(require, MODULE_DIR .. name)
			if ok then
				load_module_highlight(module, colors, on_highlight)
			else
				require("witch.util.notify").warn("Extra module " .. name .. " not found")
			end
		end
	end
end

local load_custom_modules = function(customs, colors, on_highlight)
	local read_only_colors = util.read_only(colors)
	for _, module in ipairs(customs) do
		load_module_highlight(module, read_only_colors, on_highlight)
	end
end

M.switch_style = function(configs, new_style)
	if new_style ~= current_theme_style then
		cmd("hi clear")
		M.load(configs, new_style)
	end
end

M.enable_switcher = function(configs)
	api.nvim_create_user_command("Witch", function(args) M.switch_style(configs, args.args) end, {
		nargs = 1,
	})
end

M.load = function(configs, theme_style)
	local theme_conf = configs.theme
	local on_highlight = theme_conf.on_highlight

	local colors = nil

	colors, current_theme_style = M.get_colors(theme_style or theme_conf.style, configs)

	if theme_conf.enabled then load_default(colors, on_highlight) end

	load_extra_modules(theme_conf.extras, colors, on_highlight)
	load_custom_modules(theme_conf.customs, colors, on_highlight)
end

M.enable_dim = function(excluded)
	local is_excluded = function(bufnr)
		return excluded.filetypes[api.nvim_buf_get_option(bufnr, "filetype")]
			or excluded.buftypes[api.nvim_buf_get_option(bufnr, "buftype")]
	end

	-- Dim other windows when entering a window
	-- (excluding floating windows and the current window and the win that list in excluded)
	local dim_other_wins = function()
		if is_excluded(0) then return end

		local curr_win_id = api.nvim_get_current_win()
		local win_ids = api.nvim_list_wins()

		for _, win_id in ipairs(win_ids) do
			if
				win_id ~= curr_win_id
				and not api.nvim_win_get_config(win_id).relative ~= "" -- Check if not a floating window
				and not is_excluded(api.nvim_win_get_buf(win_id))
			then
				api.nvim_win_set_hl_ns(win_id, dimmed_ns)
			end
		end
		api.nvim_win_set_hl_ns(curr_win_id, 0)
	end

	autocmd({ "WinEnter" }, {
		group = get_global_group_id(),
		callback = function() vim.schedule(dim_other_wins, 400) end,
	})
end

M.setup = function(configs)
	if vim.fn.exists("syntax_on") then cmd("syntax reset") end
	if g.colors_name then cmd("hi clear") end
	opts.termguicolors = true
	g.colors_name = PLUG_NAME

	autocmd("ColorSchemePre", {
		group = get_global_group_id(),
		callback = function()
			for key, id in pairs(group_ids) do
				del_augroup(id)
				group_ids[key] = nil
			end
		end,
	})

	if configs.switcher then M.enable_switcher(configs) end

	if configs.dim_inactive.enabled then
		dimmed_ns = api.nvim_create_namespace(PLUG_NAME .. "_dimmed")
		dim_level = configs.dim_inactive.level or dim_level

		M.enable_dim(configs.dim_inactive.excluded)
	end

	M.load(configs)
end

return M
