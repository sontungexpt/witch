return function(palette, palette_name)
	return {
		-- ====================================================================
		-- Base UI (windows, floats, bars, tabs)
		-- ====================================================================
		{ "Normal", bg = palette.bg, fg = palette.fg },
		{ "NormalNC", bg = palette.bg, fg = palette.fg },
		{ "NormalFloat", bg = palette.bg_float, fg = palette.fg_dark },
		{ "FloatTitle", bg = palette.bg_float, fg = palette.fg_dark },
		{ "FloatBorder", bg = palette.bg_float, fg = palette.border },
		{ "StatusLine", bg = palette.bg_bar, fg = palette.fg },
		{ "StatusLineNC", bg = palette.bg_dark, fg = palette.fg_dark },
		{ "WinBar", link = "StatusLine" },
		{ "WinBarNC", link = "StatusLineNC" },
		{ "TabLine", bg = palette.bg_bar, fg = palette.fg },
		{ "TabLineSel", bg = palette.bg_visual, fg = palette.fg, bold = true },
		{ "TabLineFill", bg = palette.bg_dark },
		{ "SignColumn" },
		{ "WinSeparator", fg = palette.dark_border },
		{ "VertSplit", fg = palette.dark_border },
		{ "EndOfBuffer", fg = palette.bg },

		-- ====================================================================
		-- Cursor, line numbers, folds
		-- ====================================================================
		{ "LineNr", fg = palette.comment },
		{ "CursorLineNr", fg = palette.pink, bold = true },
		{ "CursorColumn", bg = palette.bg_highlight },
		{ "CursorLine", bg = palette.bg_highlight },
		{ "FoldColumn", bg = palette.bg, fg = palette.comment },
		{ "Folded", bg = palette.bg_gutter, fg = palette.blue },

		-- ====================================================================
		-- Selection, search, spelling
		-- ====================================================================
		{ "Visual", bg = palette.bg_visual },
		{ "VisualNOS", bg = palette.bg_visual },
		{ "Search", bg = palette.orange2, fg = palette.bg },
		{ "IncSearch", bg = palette.orange, fg = palette.bg, bold = true },
		{ "CurSearch", link = "IncSearch" },
		{ "Substitute", bg = palette.red2, fg = palette.bg },
		{ "MatchParen", bold = true, fg = palette.orange },
		{ "SpellBad", sp = palette.error, undercurl = true },
		{ "SpellCap", sp = palette.warn, undercurl = true },
		{ "SpellLocal", sp = palette.info, undercurl = true },
		{ "SpellRare", sp = palette.hint, undercurl = true },

		-- ====================================================================
		-- Syntax (Vim classic) - full set for linking
		-- ====================================================================
		-- Comments
		{ "Comment", fg = palette.comment, italic = true },
		{ "SpecialComment", fg = palette.comment, italic = true },

		-- Literals
		{ "Constant", fg = palette.orange },
		{ "String", fg = palette.string },
		{ "Character", fg = palette.string },
		{ "Number", fg = palette.orange1 },
		{ "Boolean", fg = palette.red2, italic = true },
		{ "Float", fg = palette.orange2 },

		-- Names and functions
		{ "Identifier", fg = palette.magenta },
		{ "Function", fg = palette.blue },
		{ "Label", fg = palette.brown },
		{ "Tag", fg = palette.blue },

		-- Statements and keywords
		{ "Statement", fg = palette.magenta },
		{ "Conditional", fg = palette.magenta },
		{ "Repeat", fg = palette.magenta },
		{ "Keyword", fg = palette.magenta },
		{ "Exception", fg = palette.magenta },
		{ "StorageClass", fg = palette.magenta },
		{ "Operator", fg = palette.operator },

		-- Preprocessor
		{ "PreProc", fg = palette.cyan1 },
		{ "Include", fg = palette.cyan1 },
		{ "Define", fg = palette.cyan1 },
		{ "Macro", fg = palette.cyan1 },
		{ "PreCondit", fg = palette.cyan1 },

		-- Types
		{ "Type", fg = palette.cyan },
		{ "Structure", fg = palette.cyan },
		{ "Typedef", fg = palette.cyan },

		-- Special and punctuation
		{ "Special", fg = palette.orange2 },
		{ "SpecialChar", fg = palette.orange2 },
		{ "Delimiter", fg = palette.fg_dark },
		{ "Debug", fg = palette.orange },

		-- Misc
		{ "Underlined", underline = true },
		{ "Ignore", fg = palette.gray },
		{ "Error", fg = palette.error },
		{ "Todo", bg = palette.yellow2, fg = palette.bg, bold = true },
		{ "Bold", bold = true },
		{ "Italic", italic = true },

		-- ====================================================================
		-- Messages and prompts
		-- ====================================================================
		{ "ErrorMsg", fg = palette.error },
		{ "WarningMsg", fg = palette.warn },
		{ "ModeMsg", fg = palette.fg_dark },
		{ "MsgArea", fg = palette.fg_dark },
		{ "MsgSeparator", fg = palette.border },
		{ "MoreMsg", fg = palette.blue },
		{ "Question", fg = palette.blue },
		{ "Directory", fg = palette.blue },
		{ "Title", bold = true, fg = palette.orange1 },

		-- ====================================================================
		-- Invisible and auxiliary characters
		-- ====================================================================
		{ "NonText", fg = palette.gray },
		{ "SpecialKey", fg = palette.gray },
		{ "Whitespace", fg = palette.light_gray },
		{ "Conceal", fg = palette.orange2 },

		-- ====================================================================
		-- Popup menu, wildmenu, quickfix
		-- ====================================================================
		{ "Pmenu", bg = palette.bg_float, fg = palette.fg_dark },
		{ "PmenuSel", bg = palette.bg_visual, bold = true },
		{ "PmenuSbar", bg = palette.light_gray },
		{ "PmenuThumb", bg = palette.border },
		{ "WildMenu", bg = palette.bg_visual },
		{ "QuickFixLine", bg = palette.bg_visual, bold = true },

		-- ====================================================================
		-- Diff
		-- ====================================================================
		{ "DiffAdd", fg = palette.green },
		{ "DiffChange", fg = palette.orange },
		{ "DiffDelete", fg = palette.red },
		{ "DiffText", fg = palette.fg_dark },

		-- ====================================================================
		-- Health
		-- ====================================================================
		{ "healthError", fg = palette.error },
		{ "healthWarning", fg = palette.warn },
		{ "healthSuccess", fg = palette.green },
	}
end
