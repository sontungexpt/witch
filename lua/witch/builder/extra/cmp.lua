--- @param palette Palette
--- @param palette_name string
return function(palette, palette_name)
	local result = {
		-- Documentation window
		{ "CmpDocumentation", link = "NormalFloat" },
		{ "CmpDocumentationBorder", link = "FloatBorder" },

		-- Ghost text
		{ "CmpGhostText", link = "NonText" },

		-- Completion item text
		{ "CmpItemAbbr", fg = palette.fg_muted },
		{ "CmpItemAbbrDeprecated", fg = palette.fg_disabled, strikethrough = true },
		{ "CmpItemAbbrMatch", link = "Special" },
		{ "CmpItemAbbrMatchFuzzy", link = "Special" },
		{ "CmpItemMenu", link = "Comment" },

		-- Completion item kinds
		{ "CmpItemKindDefault", fg = palette.fg_muted },
		{ "CmpItemKindCodeium", fg = palette.teal },
		{ "CmpItemKindCopilot", fg = palette.teal },
		{ "CmpItemKindTabNine", fg = palette.teal },
	}

	require("witch.builder.shared.kind").link_kind({
		"LspKind%s",
		"CmpItemKind%s",
	}, result)

	return result
end
