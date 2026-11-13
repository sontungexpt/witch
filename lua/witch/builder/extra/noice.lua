return function(palette, palette_name)
	return {
		-- Cmdline
		{ "NoiceCmdline", link = "MsgArea" },
		{ "NoiceCmdlineIcon", link = "DiagnosticSignInfo" },
		{ "NoiceCmdlineIconSearch", link = "DiagnosticSignWarn" },
		{ "NoiceCmdlinePrompt", link = "Title" },

		-- Cmdline popup
		{ "NoiceCmdlinePopup", link = "NormalFloat" },
		{ "NoiceCmdlinePopupBorder", link = "FloatBorder" },
		{ "NoiceCmdlinePopupTitle", link = "Title" },
		{ "NoiceCmdlinePopupBorderSearch", link = "FloatBorder" },

		-- Confirm
		{ "NoiceConfirm", link = "NormalFloat" },
		{ "NoiceConfirmBorder", link = "FloatBorder" },

		-- Cursor
		{ "NoiceCursor", link = "Cursor" },

		-- Mini
		{ "NoiceMini", link = "MsgArea" },

		-- Popup
		{ "NoicePopup", link = "NormalFloat" },
		{ "NoicePopupBorder", link = "FloatBorder" },

		-- Popupmenu
		{ "NoicePopupmenu", link = "Pmenu" },
		{ "NoicePopupmenuBorder", link = "FloatBorder" },
		{ "NoicePopupmenuMatch", link = "Special" },
		{ "NoicePopupmenuSelected", link = "PmenuSel" },

		-- Scrollbar
		{ "NoiceScrollbar", link = "PmenuSbar" },
		{ "NoiceScrollbarThumb", link = "PmenuThumb" },

		-- Split
		{ "NoiceSplit", link = "NormalFloat" },
		{ "NoiceSplitBorder", link = "FloatBorder" },

		-- VirtualText
		{ "NoiceVirtualText", link = "DiagnosticVirtualTextInfo" },

		-- Format progress
		{ "NoiceFormatProgressDone", link = "Search" },
		{ "NoiceFormatProgressTodo", link = "CursorLine" },

		-- Format
		{ "NoiceFormatEvent", link = "NonText" },
		{ "NoiceFormatKind", link = "NonText" },
		{ "NoiceFormatDate", link = "Special" },
		{ "NoiceFormatConfirm", link = "CursorLine" },
		{ "NoiceFormatConfirmDefault", link = "Visual" },
		{ "NoiceFormatTitle", link = "Title" },

		-- Format level
		{ "NoiceFormatLevelDebug", link = "NonText" },
		{ "NoiceFormatLevelTrace", link = "NonText" },
		{ "NoiceFormatLevelOff", link = "NonText" },
		{ "NoiceFormatLevelInfo", link = "DiagnosticVirtualTextInfo" },
		{ "NoiceFormatLevelWarn", link = "DiagnosticVirtualTextWarn" },
		{ "NoiceFormatLevelError", link = "DiagnosticVirtualTextError" },

		-- Lsp progress
		{ "NoiceLspProgressSpinner", link = "Constant" },
		{ "NoiceLspProgressTitle", link = "NonText" },
		{ "NoiceLspProgressClient", link = "Title" },

		-- Hidden cursor
		{ "NoiceHiddenCursor", blend = 100, nocombine = true },
	}
end
