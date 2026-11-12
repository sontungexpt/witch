return function(palette, palette_name)
	local result = {
		-- Menu
		{ "BlinkCmpMenu", fg = palette.fg_dark, bg = palette.bg_float or palette.bg_dark },
		{ "BlinkCmpMenuBorder", fg = palette.border, bg = palette.bg_float or palette.bg_dark },
		{ "BlinkCmpMenuSelection", fg = palette.fg, bg = palette.bg_highlight, bold = true },

		-- Scrollbar
		{ "BlinkCmpScrollBarThumb", bg = palette.light_gray },
		{ "BlinkCmpScrollBarGutter", bg = palette.bg_float or palette.bg_dark },

		-- Label
		{ "BlinkCmpLabel", fg = palette.fg_dark },
		{ "BlinkCmpLabelDeprecated", fg = palette.graphite, strikethrough = true },
		{ "BlinkCmpLabelMatch", fg = palette.blue, bold = true },
		{ "BlinkCmpLabelDetail", fg = palette.comment },
		{ "BlinkCmpLabelDescription", fg = palette.comment },

		-- Documentation
		{ "BlinkCmpDoc", fg = palette.fg_dark, bg = palette.bg_float or palette.bg_dark },
		{ "BlinkCmpDocBorder", fg = palette.border, bg = palette.bg_float or palette.bg_dark },
		{ "BlinkCmpDocSeparator", fg = palette.border, bg = palette.bg_float or palette.bg_dark },
		{ "BlinkCmpDocCursorLine", bg = palette.bg_highlight },

		-- Signature help
		{ "BlinkCmpSignatureHelp", fg = palette.fg_dark, bg = palette.bg_float or palette.bg_dark },
		{ "BlinkCmpSignatureHelpBorder", fg = palette.border, bg = palette.bg_float or palette.bg_dark },
		{ "BlinkCmpSignatureHelpActiveParameter", fg = palette.orange, bold = true },

		-- Ghost text
		{ "BlinkCmpGhostText", fg = palette.light_gray },

		-- Kind base
		{ "BlinkCmpKind", fg = palette.blue },
	}

	require("witch.builder.shared.kind").link_kind({
		"BlinkCmpKind%s",
	}, result)

	return result
end
