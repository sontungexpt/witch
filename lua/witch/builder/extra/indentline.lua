--- @param palette Palette
--- @param palette_name string
return function(palette, palette_name)
	return {
		-- Indent Blankline
		{ "IblScope", fg = palette.purple, nocombine = true },
		{ "IblIndent", fg = palette.border_subtle, nocombine = true },

		{ "BlinkIndent", link = "IblIndent" },

		-- indent-blankline v2
		{ "IndentBlanklineChar", link = "IblIndent" },
		{ "IndentBlanklineContextChar", link = "IblScope" },
	}
end
