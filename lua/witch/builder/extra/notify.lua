--- @param palette witch.Palette
--- @param palette_name string
return function(palette, palette_name)
	local result = {
		-- ====================================================================
		-- NOTIFY: WINDOW
		-- ====================================================================
		{ "NotifyBackground", fg = palette.fg, bg = palette.bg_float },

		-- ====================================================================
		-- NOTIFY: BORDERS
		-- ====================================================================
		{ "NotifyERRORBorder", fg = palette.error, bg = palette.bg_float },
		{ "NotifyWARNBorder", fg = palette.warn, bg = palette.bg_float },
		{ "NotifyINFOBorder", fg = palette.info, bg = palette.bg_float },
		{ "NotifyDEBUGBorder", fg = palette.border, bg = palette.bg_float },
		{ "NotifyTRACEBorder", fg = palette.purple, bg = palette.bg_float },

		-- ====================================================================
		-- NOTIFY: ICONS
		-- ====================================================================
		{ "NotifyERRORIcon", fg = palette.error },
		{ "NotifyWARNIcon", fg = palette.warn },
		{ "NotifyINFOIcon", fg = palette.info },
		{ "NotifyDEBUGIcon", fg = palette.comment },
		{ "NotifyTRACEIcon", fg = palette.purple },

		-- ====================================================================
		-- NOTIFY: TITLES
		-- ====================================================================
		{ "NotifyERRORTitle", fg = palette.error },
		{ "NotifyWARNTitle", fg = palette.warn },
		{ "NotifyINFOTitle", fg = palette.info },
		{ "NotifyDEBUGTitle", fg = palette.comment },
		{ "NotifyTRACETitle", fg = palette.purple },

		-- ====================================================================
		-- NOTIFY: BODY
		-- ====================================================================
		{ "NotifyERRORBody", fg = palette.fg, bg = palette.bg_float },
		{ "NotifyWARNBody", fg = palette.fg, bg = palette.bg_float },
		{ "NotifyINFOBody", fg = palette.fg, bg = palette.bg_float },
		{ "NotifyDEBUGBody", fg = palette.fg_muted, bg = palette.bg_float },
		{ "NotifyTRACEBody", fg = palette.fg_muted, bg = palette.bg_float },
	}

	return result
end
