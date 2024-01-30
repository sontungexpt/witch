local M = {}

--- This function is called when the theme is loaded.
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

M.colors = {}

M.on_highlight = function(stype, colors, highlight) end

M.filetypes = {
	md = function(colors, theme_style) end,
}

M.buftypes = {}

M.events = {
	InsertEnter = {
		syntax = function(colors, theme_style) end,
		pattern = {},
	},
}

return M
