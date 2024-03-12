local vim = vim
local g = vim.g
local api = vim.api
local uv = vim.uv or vim.loop
local cmd = api.nvim_command
local hl = api.nvim_set_hl
local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup
local del_augroup = api.nvim_del_augroup_by_id
local defer_fn = vim.defer_fn

local type = type
local require = require
local ipairs = ipairs
local pairs = pairs

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
	local is_plug_theme, colors = pcall(require, COLOR_DIR .. style)

	if is_plug_theme then return colors, style end

	-- check user custom themes

	-- change theme name to PascalCase
	local pascal_style_theme = style:gsub("^%l", string.upper)

	if configs.more_themes[pascal_style_theme] then
		return configs.more_themes[pascal_style_theme], pascal_style_theme
	else
		local default_theme = configs.theme.default
		require("witch.util.notify").warn(
			"Theme " .. style .. " not found. Using default theme" .. default_theme
		)
		return require(COLOR_DIR .. default_theme), default_theme
	end
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
		if type(on_highlight) == "function" then
			if syntax[1] ~= nil then
				setmetatable(syntax, {
					__index = function(_, k)
						for i = 1, #syntax do
							if syntax[i][1] == k then return syntax[i][2] end
						end
					end,
					__newindex = function(_, k, v)
						for i = 1, #syntax do
							if syntax[i][1] == k then
								syntax[i][2] = v
								return
							end
						end
						table.insert(syntax, { k, v })
					end,
				})
			end
			on_highlight(current_theme_style, colors, syntax)
		end

		async_load_syntax_batch(syntax, 30, 80, module_name)
	end
end

local load_module_highlight = function(module, colors, on_highlight)
	local module_autocmd_group = augroup(rand_unique_name(), { clear = true })

	local should_run_on_startup = type(module.syntax) == "function"
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
		-- name : function
		for key, value in pairs(types) do
			if type(key) == "number" and should_run_on_startup then
				should_run_on_startup = false -- not need to call module.syntax in start time
				-- pattern = value
				-- group = module_autocmd_group
				-- get_syntax = module.syntax
				create_autocmd(event, module_autocmd_group, value, module.syntax)
			elseif type(value) == "function" then
				-- pattern = key
				-- group = side_autocmd_group
				-- get_syntax = value
				create_autocmd(event, augroup(rand_unique_name(), { clear = true }), key, value)
			end
		end
	end

	local function setup_event_autocmds(events)
		-- name
		-- name : function
		-- name : { pattern = "pattern", syntax = function }
		for key, value in pairs(events) do
			if type(key) == "number" and should_run_on_startup then
				-- not need to call module.syntax in start time
				should_run_on_startup = false
				-- event = value
				-- get_syntax = module.syntax
				-- group = module_autocmd_group
				-- pattern = "*"
				create_autocmd(value, module_autocmd_group, "*", module.syntax)
			elseif type(value) == "function" then
				-- event = key
				-- get_syntax = value
				-- group = random
				-- pattern = "*"
				create_autocmd(key, augroup(rand_unique_name(), { clear = true }), "*", value)
			elseif
				type(value) == "table"
				and type(value.syntax) == "function"
				and (type(value.pattern) == "table" or type(value.pattern) == "string")
			then
				-- event = key
				-- get_syntax = value.syntax
				-- group = random
				-- pattern = value.pattern
				create_autocmd(key, augroup(rand_unique_name(), { clear = true }), value.pattern, value.syntax)
			end
		end
	end
	if type(module.filetypes) == "table" then setup_type_autocmds("FileType", module.filetypes) end
	if type(module.buftypes) == "table" then setup_type_autocmds("BufReadPre", module.buftypes) end
	if type(module.events) == "table" then setup_event_autocmds(module.events) end

	if should_run_on_startup then
		M.highlight(module.syntax, colors, on_highlight, module.name or "unknown")
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

	if theme_conf.enabled then
		for _, name in ipairs(STARTUP_MODULE) do
			load_module_highlight(require(STARTUP_MODULE_DIR .. name), colors, on_highlight)
		end
	end

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
	local dim_win_ids = {}
	local dim_wins = function(event)
		if is_excluded(0) then
			if event == "WinClosed" then
				local id, _ = next(dim_win_ids)
				if id then
					api.nvim_win_set_hl_ns(id, 0)
					dim_win_ids[id] = nil
				end
			end
			return
		end

		local curr_win_id = api.nvim_get_current_win()
		local win_ids = api.nvim_list_wins()

		for _, win_id in ipairs(win_ids) do
			if
				win_id ~= curr_win_id
				and not api.nvim_win_get_config(win_id).relative ~= "" -- Check if not a floating window
				and not is_excluded(api.nvim_win_get_buf(win_id))
			then
				dim_win_ids[win_id] = true
				api.nvim_win_set_hl_ns(win_id, dimmed_ns)
			end
		end
		dim_win_ids[curr_win_id] = nil
		api.nvim_win_set_hl_ns(curr_win_id, 0)
	end

	autocmd({ "WinEnter", "WinClosed" }, {
		group = get_global_group_id(),
		callback = function(args)
			if args.event == "WinClosed" then dim_win_ids[api.nvim_get_current_win()] = nil end
			vim.defer_fn(function() dim_wins(args.event) end, 10) -- delay 10ms to make sure the window is completely loaded
		end,
	})
end

M.setup = function(configs)
	if vim.fn.exists("syntax_on") then cmd("syntax reset") end
	if g.colors_name then cmd("hi clear") end
	vim.opt.termguicolors = true
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
