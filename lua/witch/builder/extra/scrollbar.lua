
return function(palette, palette_name)
	return {
		-- Scrollbar
		{ "ScrollbarHandle", bg = palette.bg_highlight },

		{ "ScrollbarSearchHandle", fg = palette.orange, bg = palette.bg_highlight },
		{ "ScrollbarSearch", fg = palette.orange },

		{ "ScrollbarErrorHandle", fg = palette.error, bg = palette.bg_highlight },
		{ "ScrollbarError", fg = palette.error },

		{ "ScrollbarWarnHandle", fg = palette.warn, bg = palette.bg_highlight },
		{ "ScrollbarWarn", fg = palette.warn },

		{ "ScrollbarInfoHandle", fg = palette.info, bg = palette.bg_highlight },
		{ "ScrollbarInfo", fg = palette.info },

		{ "ScrollbarHintHandle", fg = palette.hint, bg = palette.bg_highlight },
		{ "ScrollbarHint", fg = palette.hint },

		{ "ScrollbarMiscHandle", fg = palette.purple, bg = palette.bg_highlight },
		{ "ScrollbarMisc", fg = palette.purple },
	}
end
