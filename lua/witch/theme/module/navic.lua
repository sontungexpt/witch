local M = {
	name = "navic",
}

M.syntax = function(colors, theme_style)
	return {
		NavicSeparator = { fg = colors.fg },
		NavicText = { fg = colors.fg },

		AerialNormal = { fg = colors.fg },
		AerialGuide = { fg = colors.bg_gutter },
		AerialLine = { link = "LspInlayHint" },
	}
end

return M
