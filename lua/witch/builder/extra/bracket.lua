--- @param palette Palette
--- @param palette_name string
return function(palette, palette_name)
	return {
		-- RainbowDelimiter
		{ "RainbowDelimiterRed", fg = palette.red },
		{ "RainbowDelimiterOrange", fg = palette.orange },
		{ "RainbowDelimiterYellow", fg = palette.yellow },
		{ "RainbowDelimiterBlue", fg = palette.blue },
		{ "RainbowDelimiterGreen", fg = palette.green },
		{ "RainbowDelimiterCyan", fg = palette.cyan },
		{ "RainbowDelimiterViolet", fg = palette.purple },
	}
end
