local M = {}

M.syntax = function(colors)
	return {
		-- neo-tree
		NeoTreeNormal = { fg = colors.fg_dark, bg = colors.bg_dark },
		NeoTreeNormalNC = { fg = colors.fg_dark, bg = colors.bg_dark },
		NeoTreeDimText = { fg = colors.fg_dark },
	}
end

return M
