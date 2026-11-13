--- @param palette Palette
--- @param palette_name string
return function(palette, palette_name)
	local result = {
		-- Cmdline
		{ "NoiceCmdline", fg = palette.fg, bg = palette.bg },
		{ "NoiceCmdlineIcon", fg = palette.info },
		{ "NoiceCmdlineIconSearch", fg = palette.warn },
		{ "NoiceCmdlinePrompt", fg = palette.fg_strong },

		-- Cmdline popup
		{ "NoiceCmdlinePopup", fg = palette.fg, bg = palette.bg_float },
		{ "NoiceCmdlinePopupBorder", fg = palette.border, bg = palette.bg_float },
		{ "NoiceCmdlinePopupTitle", fg = palette.fg_strong },
		{ "NoiceCmdlinePopupBorderSearch", fg = palette.warn },

		-- Confirm
		{ "NoiceConfirm", fg = palette.fg, bg = palette.bg_float },
		{ "NoiceConfirmBorder", fg = palette.border, bg = palette.bg_float },

		-- Cursor
		{ "NoiceCursor", link = "Cursor" },
		{ "NoiceHiddenCursor", blend = 100, nocombine = true },

		-- Views
		{ "NoiceMini", fg = palette.fg, bg = palette.bg_float },
		{ "NoicePopup", fg = palette.fg, bg = palette.bg_float },
		{ "NoicePopupBorder", fg = palette.border, bg = palette.bg_float },
		{ "NoiceSplit", fg = palette.fg, bg = palette.bg_panel },
		{ "NoiceSplitBorder", fg = palette.border, bg = palette.bg_panel },

		-- Popupmenu
		{ "NoicePopupmenu", link = "Pmenu" },
		{ "NoicePopupmenuBorder", link = "FloatBorder" },
		{ "NoicePopupmenuMatch", fg = palette.special },
		{ "NoicePopupmenuSelected", link = "PmenuSel" },

		-- Scrollbar
		{ "NoiceScrollbar", link = "PmenuSbar" },
		{ "NoiceScrollbarThumb", link = "PmenuThumb" },

		-- Virtual text
		{ "NoiceVirtualText", fg = palette.info },

		-- Progress
		{ "NoiceFormatProgressDone", fg = palette.green },
		{ "NoiceFormatProgressTodo", fg = palette.fg_invisible },

		-- Format
		{ "NoiceFormatEvent", fg = palette.fg_subtle },
		{ "NoiceFormatKind", fg = palette.fg_subtle },
		{ "NoiceFormatDate", fg = palette.fg_muted },
		{ "NoiceFormatConfirm", link = "CursorLine" },
		{ "NoiceFormatConfirmDefault", link = "Visual" },
		{ "NoiceFormatTitle", fg = palette.fg_strong },

		-- Format level
		{ "NoiceFormatLevelDebug", fg = palette.comment },
		{ "NoiceFormatLevelTrace", fg = palette.fg_subtle },
		{ "NoiceFormatLevelOff", fg = palette.fg_disabled },
		{ "NoiceFormatLevelInfo", fg = palette.info },
		{ "NoiceFormatLevelWarn", fg = palette.warn },
		{ "NoiceFormatLevelError", fg = palette.error },

		-- LSP progress
		{ "NoiceLspProgressSpinner", fg = palette.cyan },
		{ "NoiceLspProgressTitle", fg = palette.fg_muted },
		{ "NoiceLspProgressClient", fg = palette.fg_strong },
	}

	-- Completion item kinds
	require("witch.builder.shared.kind").link_kind({
		"NoiceCompletionItemKind%s",
	}, result)

	return result
end
