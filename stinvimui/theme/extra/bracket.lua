local M = {}

M.syntax = function(colors, theme_style)
	return {
		-- ts-rainbow
		rainbowcol1 = { fg = colors.red },
		rainbowcol2 = { fg = colors.orange },
		rainbowcol3 = { fg = colors.bright_yellow },
		rainbowcol4 = { fg = colors.green },
		rainbowcol5 = { fg = colors.blue },
		rainbowcol6 = { fg = colors.purple },
		rainbowcol7 = { fg = colors.cyan },

		-- ts-rainbow2 (maintained fork)
		TSRainbowRed = { fg = colors.red },
		TSRainbowOrange = { fg = colors.orange },
		TSRainbowYellow = { fg = colors.bright_yellow },
		TSRainbowGreen = { fg = colors.green },
		TSRainbowBlue = { fg = colors.blue },
		TSRainbowViolet = { fg = colors.purple },
		TSRainbowCyan = { fg = colors.cyan },
	}
end

return M
