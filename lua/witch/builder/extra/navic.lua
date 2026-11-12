return function(palette, palette_name)
	local result = {
		{ "NavicSeparator", fg = palette.fg },
		{ "NavicText", fg = palette.fg },
		{ "AerialNormal", fg = palette.fg },
		{ "AerialGuide", fg = palette.bg_gutter },
		{ "AerialLine", link = "LspInlayHint" },
	}

	require("witch.builder.share.kind").link_kind({
		"NavicIcons%s",
		"Aerial%sIcon",
	}, result)

	return result
end
