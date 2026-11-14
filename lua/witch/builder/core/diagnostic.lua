--- @param palette witch.Palette
--- @param palette_name witch.PaletteName
return function(palette, palette_name)
	return {
		-- ====================================================================
		-- Diagnostics
		-- ====================================================================

		-- Base severity groups (other groups link to these except Underline)
		{ "DiagnosticError", fg = palette.error },
		{ "DiagnosticWarn", fg = palette.warn },
		{ "DiagnosticInfo", fg = palette.info },
		{ "DiagnosticHint", fg = palette.hint },
		{ "DiagnosticOk", fg = palette.green },

		-- Special tags (used directly by the "underline" handler)
		{ "DiagnosticUnnecessary", fg = palette.unnecessary },
		{ "DiagnosticDeprecated", fg = palette.unnecessary, strikethrough = true },

		-- Virtual text
		{ "DiagnosticVirtualTextError", link = "DiagnosticError" },
		{ "DiagnosticVirtualTextWarn", link = "DiagnosticWarn" },
		{ "DiagnosticVirtualTextInfo", link = "DiagnosticInfo" },
		{ "DiagnosticVirtualTextHint", link = "DiagnosticHint" },
		{ "DiagnosticVirtualTextOk", link = "DiagnosticOk" },

		-- Virtual lines
		{ "DiagnosticVirtualLinesError", link = "DiagnosticError" },
		{ "DiagnosticVirtualLinesWarn", link = "DiagnosticWarn" },
		{ "DiagnosticVirtualLinesInfo", link = "DiagnosticInfo" },
		{ "DiagnosticVirtualLinesHint", link = "DiagnosticHint" },
		{ "DiagnosticVirtualLinesOk", link = "DiagnosticOk" },

		-- Underline (not linked by default — set own sp)
		{ "DiagnosticUnderlineError", undercurl = true, sp = palette.error },
		{ "DiagnosticUnderlineWarn", undercurl = true, sp = palette.warn },
		{ "DiagnosticUnderlineInfo", undercurl = true, sp = palette.info },
		{ "DiagnosticUnderlineHint", undercurl = true, sp = palette.hint },
		{ "DiagnosticUnderlineOk", undercurl = true, sp = palette.green },

		-- Floating windows
		{ "DiagnosticFloatingError", link = "DiagnosticError" },
		{ "DiagnosticFloatingWarn", link = "DiagnosticWarn" },
		{ "DiagnosticFloatingInfo", link = "DiagnosticInfo" },
		{ "DiagnosticFloatingHint", link = "DiagnosticHint" },
		{ "DiagnosticFloatingOk", link = "DiagnosticOk" },

		-- Signs
		{ "DiagnosticSignError", link = "DiagnosticError" },
		{ "DiagnosticSignWarn", link = "DiagnosticWarn" },
		{ "DiagnosticSignInfo", link = "DiagnosticInfo" },
		{ "DiagnosticSignHint", link = "DiagnosticHint" },
		{ "DiagnosticSignOk", link = "DiagnosticOk" },
	}
end
