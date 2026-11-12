return function(palette, palette_name)
	local result = {
		{ "CmpDocumentation", fg = palette.fg_dark, bg = palette.bg_dark },
		{ "CmpDocumentationBorder", fg = palette.border, bg = palette.bg_dark },
		{ "CmpGhostText", fg = palette.light_gray },
		{ "CmpItemAbbr", fg = palette.fg_dark },
		{ "CmpItemAbbrDeprecated", fg = palette.graphite, strikethrough = true },
		{ "CmpItemAbbrMatch", link = "Special" },
		{ "CmpItemAbbrMatchFuzzy", link = "Special" },
		{ "CmpItemMenu", fg = palette.comment },
		{ "CmpItemKindDefault", fg = palette.fg_dark },
		{ "CmpItemKindCodeium", fg = palette.teal },
		{ "CmpItemKindCopilot", fg = palette.teal },
		{ "CmpItemKindTabNine", fg = palette.teal },
	}

	require("witch.builder.share.kind").link_kind({
		"LspKind%s",
		"CmpItemKind%s",
	}, result)

	return result
end
