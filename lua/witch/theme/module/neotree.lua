local M = {
	name = "neotree",
}

M.syntax = function(colors, theme_style)
	return {
		-- neo-tree
		NeoTreeNormal = { fg = colors.fg_dark, bg = colors.bg_dark },
		NeoTreeNormalNC = { fg = colors.fg_dark, bg = colors.bg_dark },
		NeoTreeDimText = { fg = colors.fg_dark },
	}
end

return M
