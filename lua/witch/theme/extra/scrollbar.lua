local M = {
	name = "scrollbar",
}

M.syntax = function(colors, theme_style)
	return {
		-- Scrollbar
		ScrollbarHandle = { bg = colors.bg_highlight },

		ScrollbarSearchHandle = { fg = colors.orange, bg = colors.bg_highlight },
		ScrollbarSearch = { fg = colors.orange },

		ScrollbarErrorHandle = { fg = colors.error, bg = colors.bg_highlight },
		ScrollbarError = { fg = colors.error },

		ScrollbarWarnHandle = { fg = colors.warn, bg = colors.bg_highlight },
		ScrollbarWarn = { fg = colors.warn },

		ScrollbarInfoHandle = { fg = colors.info, bg = colors.bg_highlight },
		ScrollbarInfo = { fg = colors.info },

		ScrollbarHintHandle = { fg = colors.hint, bg = colors.bg_highlight },
		ScrollbarHint = { fg = colors.hint },

		ScrollbarMiscHandle = { fg = colors.purple, bg = colors.bg_highlight },
		ScrollbarMisc = { fg = colors.purple },
	}
end

return M
