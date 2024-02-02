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

local util = require("stinvimui.util")

local PLUG_NAME = "stinvimui"
local COLOR_DIR = "stinvimui.colors."
local EXTRA_THEME_HIGHLIGHT = "stinvimui.theme.extra."
local STARTUP_MODULE_DIR = "stinvimui.theme.startup."
local STARTUP_MODULE = {
	"default",
	"nvimtree",
	"markdown",
	"terminal",
	"cmp",
}

local autocmd_group_ids = {
	[PLUG_NAME] = nil,
}
local current_theme_style = nil
local dimmed_ns = nil
local dim_level = 0.46

local M = {}

local get_global_group_id = function()
	if autocmd_group_ids[PLUG_NAME] == nil then
		autocmd_group_ids[PLUG_NAME] = augroup(PLUG_NAME, { clear = true })
	end
	return autocmd_group_ids[PLUG_NAME]
end

local rand_unique_name = function()
	local now = uv.hrtime()
	local rand = math.random(1000000, 9999999)
	return string.format("%s_%s_%s", PLUG_NAME, now, rand)
end

local get_colors = function(style, configs)
	local theme_conf = configs.theme

	local valid, colors = pcall(require, COLOR_DIR .. style)

	if not valid then
		-- change style to PascalCase
		local pascal_style = style:gsub("^%l", string.upper)

		if configs.more_themes[pascal_style] then
			colors = configs.more_themes[pascal_style]
			style = pascal_style
		else
			require("stinvimui.util.notify").warn(
				"Theme " .. style .. " not found. Using default theme" .. theme_conf.default
			)
			style = theme_conf.default
			colors = require(COLOR_DIR .. theme_conf.default)
		end
	end

	if type(theme_conf.on_highlight) == "function" then
		theme_conf.on_highlight(style, colors, {})
	end

	return colors, style
end

local function async_load_syntax_batch(syntax, batch_size, step_delay)
	local coroutine = coroutine
	local co

	local function resume_coroutine()
		if coroutine.status(co) ~= "dead" then
			local success, errorMsg = coroutine.resume(co)
			if not success then
				require("stinvimui.util.notify").error("Error in coroutine:", errorMsg)
			end
		end
	end

	co = coroutine.create(function()
		batch_size = batch_size or 10

		for i = 1, #syntax do
			local group_name = syntax[i].group
			local styles = syntax[i].styles
			hl(0, group_name, styles)

			if dimmed_ns then
				local dimmed_opts = util.merge_tb({}, styles)
				if group_name ~= "VertSplit" and group_name ~= "WinSeparator" then
					local fg = dimmed_opts.fg
					local bg = dimmed_opts.bg
					if fg and fg ~= "NONE" then
						dimmed_opts.fg = util.darken(fg, dim_level)
					end
					if bg and bg ~= "NONE" then
						dimmed_opts.bg = util.darken(bg, dim_level)
					end
				end
				hl(dimmed_ns, group_name, dimmed_opts)
			end

			if i % batch_size == 0 then
				defer_fn(resume_coroutine, step_delay or 100)
				coroutine.yield()
			end
		end

		api.nvim_exec_autocmds("User", { pattern = "StinvimuiHighlightDone", modeline = false })
	end)

	resume_coroutine()
end

local highlight = function(get_syntax, colors, on_highlight)
	local syntax = get_syntax(colors, current_theme_style)

	if type(syntax) == "table" then
		if type(on_highlight) == "function" then
			on_highlight(current_theme_style, colors, syntax)
		end

		async_load_syntax_batch(syntax, 40, 80)

		-- for group_name, options in pairs(syntax) do
		-- 	hl(0, group_name, options)
		-- end
	end
end

local load_module_highlight = function(module, colors, on_highlight)
	local module_autocmd_group = augroup(rand_unique_name(), { clear = true })
	local side_autocmd_group = augroup(rand_unique_name(), { clear = true })

	local has_syntax = type(module.syntax) == "function"
	colors = module.colors or colors
	on_highlight = module.on_highlight or on_highlight

	local function create_autocmd(event, group, pattern, get_syntax)
		autocmd_group_ids[group] = group
		autocmd(event, {
			group = group,
			pattern = pattern,
			once = true,
			callback = function()
				highlight(get_syntax, colors, on_highlight)
				autocmd_group_ids[group] = nil
				del_augroup(group)
			end,
		})
	end

	local function setup_type_autocmds(event, types)
		if type(types) == "table" then
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
					create_autocmd(event, side_autocmd_group, pattern, get_syntax)
				end
			end
		end
	end

	local function setup_event_autocmds(events)
		if type(events) == "table" then
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
					create_autocmd(event, side_autocmd_group, "*", get_syntax)
				elseif
					type(get_syntax) == "table"
					and type(get_syntax.syntax) == "function"
					and (type(get_syntax.pattern) == "table" or type(get_syntax.pattern) == "string")
				then
					-- event = event
					-- get_syntax = get_syntax.syntax
					-- group = side_autocmd_group
					-- pattern = get_syntax.pattern
					create_autocmd(event, side_autocmd_group, get_syntax.pattern, get_syntax.syntax)
				end
			end
		end
	end

	setup_type_autocmds("FileType", module.filetypes)
	setup_type_autocmds("BufReadPre", module.buftypes)
	setup_event_autocmds(module.events)

	if has_syntax then
		highlight(module.syntax, colors, on_highlight)
	end
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
			local ok, module = pcall(require, EXTRA_THEME_HIGHLIGHT .. name)
			if ok then
				load_module_highlight(module, colors, on_highlight)
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
		M.load(configs, new_style)
	end
end

M.enable_switcher = function(configs)
	api.nvim_create_user_command("Stinvimui", function(args)
		M.switch_style(configs, args.args)
	end, {
		nargs = 1,
	})
end

M.load = function(configs, theme_style)
	local theme_conf = configs.theme
	local on_highlight = theme_conf.on_highlight

	local colors = nil

	colors, current_theme_style = get_colors(theme_style or theme_conf.style, configs)

	load_default(colors, on_highlight)

	load_extra_modules(theme_conf.extras, colors, on_highlight)
	load_custom_modules(theme_conf.customs, colors, on_highlight)
end

M.enable_dim = function(excluded)
	local get_buf_option = api.nvim_buf_get_option
	local win_get_buf = api.nvim_win_get_buf
	local excluded_filetypes = excluded.filetypes
	local excluded_buftypes = excluded.buftypes
	local get_current_win = api.nvim_get_current_win

	-- check if a window is not a floating window
	local is_floating = function(win_id)
		return api.nvim_win_get_config(win_id).relative ~= ""
	end

	-- dim other windows except current window by setting their winhighlight to
	-- NormalDimmed except some special windows like NvimTree
	local dim = function()
		if excluded_filetypes[get_buf_option(0, "filetype")] or excluded_buftypes[get_buf_option(0, "buftype")] then
			return
		end

		local curr_win_id = get_current_win()
		local win_ids = api.nvim_list_wins()

		for _, win_id in ipairs(win_ids) do
			local bufnr = win_get_buf(win_id)
			if
				win_id ~= curr_win_id
				and not is_floating(win_id)
				and not excluded_filetypes[get_buf_option(bufnr, "filetype")]
				and not excluded_buftypes[get_buf_option(bufnr, "buftype")]
			then
				api.nvim_win_set_hl_ns(win_id, dimmed_ns)
			end
		end
		api.nvim_win_set_hl_ns(curr_win_id, 0)
	end

	autocmd({ "WinEnter" }, {
		group = get_global_group_id(),
		callback = function()
			vim.schedule(function()
				dim()
			end, 400)
		end,
	})
end

M.setup = function(configs)
	if vim.fn.exists("syntax_on") then
		cmd("syntax reset")
	end
	if g.colors_name then
		cmd("hi clear")
	end
	opts.termguicolors = true
	g.colors_name = PLUG_NAME

	autocmd("ColorSchemePre", {
		group = get_global_group_id(),
		callback = function()
			for _, id in pairs(autocmd_group_ids) do
				del_augroup(id)
				autocmd_group_ids[id] = nil
			end
		end,
	})

	if configs.switcher then
		M.enable_switcher(configs)
	end

	if configs.dim_inactive.enabled then
		dimmed_ns = api.nvim_create_namespace(PLUG_NAME .. "_dimmed")
		dim_level = configs.dim_inactive.level or dim_level
		M.enable_dim(configs.dim_inactive.excluded)
	end

	M.load(configs)
end

return M
