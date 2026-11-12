return function(palette, palette_name)
	return {
		-- indent-blankline v2
		{ "IndentBlanklineChar", fg = palette.graphite_border, nocombine = true },
		{ "IndentBlanklineContextChar", fg = palette.purple, nocombine = true },

		-- Indent Blankline
		{ "IblScope", fg = palette.purple, nocombine = true },
		{ "IblIndent", fg = palette.graphite_border, nocombine = true },
		{ "BlinkIndent", link = "IblIndent" },
	}
end
