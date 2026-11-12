return function(palette, palette_name)
	local result = {
		-- Notify
		{ "NotifyBackground", fg = palette.fg_dark, bg = palette.bg_float },

		-- Border
		{ "NotifyERRORBorder", fg = palette.border, bg = palette.bg_float },
		{ "NotifyWARNBorder", fg = palette.border, bg = palette.bg_float },
		{ "NotifyINFOBorder", fg = palette.border, bg = palette.bg_float },
		{ "NotifyDEBUGBorder", fg = palette.border, bg = palette.bg_float },
		{ "NotifyTRACEBorder", fg = palette.border, bg = palette.bg_float },

		-- Icons
		{ "NotifyERRORIcon", fg = palette.error },
		{ "NotifyWARNIcon", fg = palette.warn },
		{ "NotifyINFOIcon", fg = palette.info },
		{ "NotifyDEBUGIcon", fg = palette.comment },
		{ "NotifyTRACEIcon", fg = palette.purple },

		-- Title
		{ "NotifyERRORTitle", fg = palette.error },
		{ "NotifyWARNTitle", fg = palette.warn },
		{ "NotifyINFOTitle", fg = palette.info },
		{ "NotifyDEBUGTitle", fg = palette.comment },
		{ "NotifyTRACETitle", fg = palette.purple },

		-- Body
		{ "NotifyERRORBody", fg = palette.fg_dark, bg = palette.bg_float },
		{ "NotifyWARNBody", fg = palette.fg_dark, bg = palette.bg_float },
		{ "NotifyINFOBody", fg = palette.fg_dark, bg = palette.bg_float },
		{ "NotifyDEBUGBody", fg = palette.fg_dark, bg = palette.bg_float },
		{ "NotifyTRACEBody", fg = palette.fg_dark, bg = palette.bg_float },
	}

	require("witch.module.share.kind").link_kind({
		"NoiceCompletionItemKind%s",
	}, result)

	return result
end
