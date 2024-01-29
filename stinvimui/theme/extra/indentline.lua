local M = {}

M.syntax = function(colors, theme_style)
	return {
		-- indent-blankline v2
		IndentBlanklineChar = { fg = colors.graphite_border, nocombine = true },
		IndentBlanklineContextChar = { fg = colors.purple, nocombine = true },
	}
end

return M
