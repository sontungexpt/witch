local type = type
local M = {}

local configs = {
	theme = {
		-- default style of the theme
		-- "dark", "light"
		style = "dark",

		-- more module that you want it should be loaded
		extras = {
			-- bracket = true,
			-- dashboard = true,
			-- diffview = true,
			-- explorer = true,
			-- indentline = true,
			-- yanky = true,
			-- scrollbar = true,
			-- navic = true,
		},

		-- custome your highlight module
		-- see: witch.theme.example
		customs = {
			-- require("witch.theme.example"),
		},

		-- This function is called when witch starts highlighting.
		-- It provides a unique opportunity to modify the default highlight groups.
		-- If you wish to customize the default highlight groups, you can do so here.
		-- This function is invoked after loading all colors and highlight options
		-- but before applying the highlights, allowing users to adjust undesired highlights.
		-- you can do something like this
		--
		-- @param style string : the current style of the theme
		-- @param colors table : the current colors of the theme
		-- @param highlight table : the current highlights of the theme
		-- on_highlight = function(style, colors, highlight)
		-- 	if style == "dark" then
		-- 		-- change the default background of witch
		-- 		colors.bg = "#000000"

		-- 		-- change the Normal highlight group of witch
		-- 		highlight.Normal = { fg = "#ffffff", bg = "#000000" }
		-- 	elseif style == "light" then
		-- 		-- change the default background of witch
		-- 		colors.bg = "#ffffff"

		-- 		-- change the Normal highlight group of witch
		-- 		highlight.Normal = { fg = "#000000", bg = "#ffffff" }
		-- 	end
		-- end,
	},

	-- dims inactive windows
	dim_inactive = {
		enabled = true,
		-- from 0 to 1
		-- as nearer to 1 the dimming will be lighter
		level = 0.46,

		-- Prevent dimming the last active window when switching to a window
		-- with specific filetypes or buftypes listed in the excluded table.
		--
		-- The idea of this option is when change to a window like NvimTree, Telescope, ...
		-- where these windows are considered auxiliary tools.
		-- the last active window retains its status as the main window
		-- and should not be dimmed upon switching.
		excluded = {
			filetypes = {
				NvimTree = true,
			},
			buftypes = {
				nofile = true,
				prompt = true,
				terminal = true,
			},
		},
	},

	-- true if you want to use command Switch
	switcher = true,

	-- add your custom themes here
	more_themes = {

		-- the key is the name of the theme must be in PascalCase
		-- the value is the table of colors to be passed to the theme
		-- with following format in witch.colors.example
		-- Custom1 = {},
		-- Custom2 = {},
	},
}

--- The config properties are read-only
local keep_default_values = function() configs.theme.default = "dark" end

M.setup = function(user_opts)
	M.merge_config(configs, user_opts)
	keep_default_values()

	return configs
end

M.merge_config = function(default_opts, user_opts)
	local default_options_type = type(default_opts)

	if default_options_type == type(user_opts) then
		if default_options_type == "table" and default_opts[1] == nil then
			for k, v in pairs(user_opts) do
				default_opts[k] = M.merge_config(default_opts[k], v)
			end
		else
			default_opts = user_opts
		end
	elseif default_opts == nil then
		default_opts = user_opts
	end
	return default_opts
end

M.get_config = function()
	return require("witch.util").read_only(configs, "Attempt to modify config, this is a read-only table")
end

return M
