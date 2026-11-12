return function(palette, palette_name)
	local highlights = {
		-- For special punctuation that does not fall in the categories before.
		{ "@markup", link = "@none" },
		{ "@markup.list", fg = palette.blue },
		{ "@markup.list.markdown", fg = palette.orange, bold = true },
		{ "@markup.raw", link = "String" },
		{ "@markup.raw.markdown", fg = palette.orange },
		{ "@markup.raw.markdown_inline", fg = palette.red1, bg = palette.bg_bar },
		{ "@markup.link", fg = palette.link },
		{ "@markup.link.url", link = "Underlined" },
		{ "@markup.link.label.markdown_inline", fg = palette.pink1 },
		{ "@markup.link.label", link = "SpecialChar" },
		{ "@markup.link.label.symbol", link = "Identifier" },
		{ "@markup.environment", link = "Macro" },
		{ "@markup.environment.name", link = "Type" },
		{ "@markup.math", link = "Special" },
		{ "@markup.strong", bold = true },
		{ "@markup.emphasis", italic = true },
		{ "@markup.strikethrough", strikethrough = true },
		{ "@markup.underline", underline = true },
		{ "@markup.heading", link = "Title" },
		{ "@markup.list.checked", fg = palette.green },
		{ "@markup.list.unchecked", fg = palette.red },
	}

	for i, color in ipairs({
		palette.blue,
		palette.yellow,
		palette.red2,
		palette.teal,
		palette.cyan1,
		palette.purple,
	}) do
		local heading_group_name = "@markup.heading." .. i .. ".markdown"
		highlights[#highlights + 1] = { heading_group_name, fg = color, bold = true }
		highlights[#highlights + 1] = { "@markup.heading." .. i .. ".marker.markdown", link = heading_group_name }
	end

	return highlights
end
