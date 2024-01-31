local M = {}

--- This function is called when the theme is loaded if no filetypes or buftypes
--- or events are specified in the config.
--- This function that returns the highlight table with following structure:
--- key: highlight group name
--- value: highlight group options
---
--- e.g.
--- return {
--- 	Normal = { fg = colors.fg, bg = colors.bg },
---   NormalFloat = { fg = colors.fg, bg = colors.bg },
---   NormalNC = { fg = colors.fg, bg = colors.bg },
---   -- ...
--- }
---@param colors table : The readonly color table from stinvimui
---@param theme_style any : The theme style from stinvimui
---@return table : The highlight table
M.syntax = function(colors, theme_style)
	return {}
end

-- If you provide M.colors here,
-- the colors argument in M.syntax will be the M.colors
-- else the colors argument in M.syntax will be the stinvimui.colors from stinvimui
M.colors = {}

-- If you provide M.on_highlight here,
-- the on_highlight argument in M.syntax will be the M.on_highlight
-- else the on_highlight argument in M.syntax will be the config.theme.on_highlight from opts in stinvimui.setup(opts)
M.on_highlight = function(stype, colors, highlight) end

M.filetypes = {
	-- if you provide a filetype here with no value
	-- so the M.syntax function will be called when this filetype is loaded
	"NvimTree",

	-- if you provide a filetype here like a key and a value is a function
	-- so the function like other M.syntax and will be called when this filetype is loaded
	markdown = function(colors, theme_style) end,
}

M.buftypes = {
	-- same as M.filetypes but for buftypes

	"terminal",
}

M.events = {
	-- same as M.filetypes but for events
	-- but with one difference that when the value is a table with following structure:
	-- InsertEnter = {
	-- 	syntax = function(colors, theme_style) end,
	-- 	pattern = {},
	-- },
	-- the syntax property is same as M.syntax
	-- the pattern will be used to match the pattern of the event
	--

	"InsertEnter",

	InsertEnter = function(colors, theme_style) end,

	User = {
		syntax = function(colors, theme_style) end,
		pattern = { "VeryLazy" },
	},
}

return M