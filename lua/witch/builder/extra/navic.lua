--- @param palette Palette
--- @param palette_name string
return function(palette, palette_name)
	local result = {
		-- ====================================================================
		-- NAVIC: BREADCRUMBS
		-- ====================================================================
		{ "NavicSeparator", fg = palette.fg_subtle },
		{ "NavicText", fg = palette.fg },

		-- ====================================================================
		-- AERIAL: SYMBOL TEXT
		-- ====================================================================
		{ "AerialNormal", fg = palette.fg },
		{ "AerialPrivate", fg = palette.comment },
		{ "AerialProtected", fg = palette.comment },

		-- ====================================================================
		-- AERIAL: STRUCTURE
		-- ====================================================================
		{ "AerialGuide", fg = palette.fg_invisible },
		{ "AerialLine", bg = palette.bg_cursorline },
		{ "AerialLineNC", bg = palette.bg_panel },
	}

	-- Symbol-kind icons
	require("witch.builder.shared.kind").link_kind({
		"NavicIcons%s",
		"Aerial%sIcon",
	}, result)

	return result
end
