--- @param palette witch.Palette
--- @param palette_name string
return function(palette, palette_name)
	local result = {
		-- Menu — link to core popup menu groups
		{ "BlinkCmpMenu", link = "Pmenu" },
		{ "BlinkCmpMenuBorder", link = "FloatBorder" },
		{ "BlinkCmpMenuSelection", link = "PmenuSel" },

		-- Scrollbar — link to core popup scrollbar groups
		{ "BlinkCmpScrollBarThumb", link = "PmenuThumb" },
		{ "BlinkCmpScrollBarGutter", link = "PmenuSbar" },

		-- Label — explicit colors for text distinction
		{ "BlinkCmpLabel", fg = palette.fg_muted },
		{ "BlinkCmpLabelDeprecated", fg = palette.border_subtle, strikethrough = true },
		{ "BlinkCmpLabelMatch", fg = palette.blue, bold = true },
		{ "BlinkCmpLabelDetail", fg = palette.comment },
		{ "BlinkCmpLabelDescription", fg = palette.comment },

		-- Documentation — link to core float groups
		{ "BlinkCmpDoc", link = "NormalFloat" },
		{ "BlinkCmpDocBorder", link = "FloatBorder" },
		{ "BlinkCmpDocSeparator", link = "FloatBorder" },
		{ "BlinkCmpDocCursorLine", link = "Visual" },

		-- Signature help — link to core float groups
		{ "BlinkCmpSignatureHelp", link = "NormalFloat" },
		{ "BlinkCmpSignatureHelpBorder", link = "FloatBorder" },
		{ "BlinkCmpSignatureHelpActiveParameter", fg = palette.orange, bold = true },

		-- Ghost text — link to core structural text
		{ "BlinkCmpGhostText", link = "NonText" },

		-- Kind base — link to core function group
		{ "BlinkCmpKind", link = "Function" },
	}

	require("witch.builder.shared.kind").link_kind({
		"BlinkCmpKind%s",
	}, result)

	return result
end
