return function(palette, palette_name)
	return {
		-- ts-rainbow
		{ "rainbowcol1", fg = palette.red },
		{ "rainbowcol2", fg = palette.orange },
		{ "rainbowcol3", fg = palette.bright_yellow },
		{ "rainbowcol4", fg = palette.green },
		{ "rainbowcol5", fg = palette.blue },
		{ "rainbowcol6", fg = palette.purple },
		{ "rainbowcol7", fg = palette.cyan },

		-- ts-rainbow2 (maintained fork)
		{ "TSRainbowRed", fg = palette.red },
		{ "TSRainbowOrange", fg = palette.orange },
		{ "TSRainbowYellow", fg = palette.bright_yellow },
		{ "TSRainbowGreen", fg = palette.green },
		{ "TSRainbowBlue", fg = palette.blue },
		{ "TSRainbowViolet", fg = palette.purple },
		{ "TSRainbowCyan", fg = palette.cyan },
	}
end
