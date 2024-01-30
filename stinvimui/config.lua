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
		},

		-- custome your highlight module
		-- see: stinvimui.theme.example
		customs = {
			-- require("stinvimui.theme.example"),
		},

		-- this function will be called when stinvimui start highlight
		-- this is the unique way to change the default highlight of stinvimui
		-- when you want to change the default highlight groups
		-- you can do something like this
		-- on_highlight = function(style, colors, highlight)
		-- 	if style == "dark" then
		-- 		-- change the default background of stinvimui
		-- 		colors.bg = "#000000"

		-- 		-- change the Normal highlight group of stinvimui
		-- 		highlight.Normal = { fg = "#ffffff", bg = "#000000" }
		-- 	elseif style == "light" then
		-- 		-- change the default background of stinvimui
		-- 		colors.bg = "#ffffff"

		-- 		-- change the Normal highlight group of stinvimui
		-- 		highlight.Normal = { fg = "#000000", bg = "#ffffff" }
		-- 	end
		-- end,
	},

	-- dim_inactive = false, -- dims inactive windows

	-- true if you want to use command StinvimUISwitch
	switcher = true,

	-- add your custom themes here
	more_themes = {

		-- the key is the name of the theme must be in PascalCase
		-- the value is the table of colors to be passed to the theme
		-- with following format in stinvimui.colors.example
		-- Custom1 = {},
		-- Custom2 = {},
	},
}

--- The config properties are read-only
local keep_default_values = function()
	configs.theme.default = "dark"
end

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
	return require("stinvimui.util").read_only(configs, "Attempt to modify config, this is a read-only table")
end

return M
