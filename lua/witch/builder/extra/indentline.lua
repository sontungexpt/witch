return function(palette, palette_name)
	return {
		-- indent-blankline v2
		{ "IndentBlanklineChar", fg = palette.border_subtle, nocombine = true },
		{ "IndentBlanklineContextChar", fg = palette.purple, nocombine = true },

		-- Indent Blankline
		{ "IblScope", fg = palette.purple, nocombine = true },
		{ "IblIndent", fg = palette.border_subtle, nocombine = true },

		{ "BlinkIndent", link = "IblIndent" },
	}
end
