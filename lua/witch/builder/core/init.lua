return function(palette, palette_name)
	return {
		-- ====================================================================
		-- Base UI
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
		{ "TabLineSel", bg = palette.blue, fg = palette.black },
		{ "TabLineFill", bg = palette.bg_dark },
		{ "SignColumn" },
		{ "WinSeparator", fg = palette.dark_border },
		{ "VertSplit", fg = palette.dark_border },
		{ "EndOfBuffer", fg = palette.bg },

		-- Line numbers / cursor
		{ "LineNr", fg = palette.light_gray },
		{ "CursorLineNr", fg = palette.pink },
		{ "CursorColumn", bg = palette.bg_highlight },
		{ "CursorLine", bg = palette.bg_highlight },

		-- ====================================================================
		-- Syntax (Vim classic) — full set for linking
		-- ====================================================================
		{ "Comment", fg = palette.comment, italic = true },
		{ "Constant", fg = palette.orange },
		{ "String", fg = palette.string },
		{ "Character", fg = palette.string },
		{ "Number", fg = palette.orange1 },
		{ "Boolean", fg = palette.red2, italic = true },
		{ "Float", fg = palette.orange2 },
		{ "Identifier", fg = palette.magenta },
		{ "Function", fg = palette.blue },
		{ "Statement", fg = palette.magenta },
		{ "Conditional", fg = palette.magenta },
		{ "Repeat", fg = palette.magenta },
		{ "Label", fg = palette.brown },
		{ "Operator", fg = palette.operator },
		{ "Keyword", fg = palette.magenta },
		{ "Exception", fg = palette.magenta },
		{ "PreProc", fg = palette.cyan1 },
		{ "Include", fg = palette.cyan1 },
		{ "Define", fg = palette.cyan1 },
		{ "Macro", fg = palette.cyan1 },
		{ "PreCondit", fg = palette.cyan1 },
		{ "Type", fg = palette.cyan },
		{ "StorageClass", fg = palette.magenta },
		{ "Structure", fg = palette.cyan },
		{ "Typedef", fg = palette.cyan },
		{ "Special", fg = palette.orange2 },
		{ "SpecialChar", fg = palette.orange2 },
		{ "Tag", fg = palette.blue },
		{ "Delimiter", fg = palette.fg_dark },
		{ "SpecialComment", fg = palette.comment, italic = true },
		{ "Debug", fg = palette.orange },
		{ "Underlined", underline = true },
		{ "Ignore", fg = palette.gray },
		{ "Error", fg = palette.error },
		{ "Todo", bg = palette.yellow, fg = palette.bg },
		{ "Bold", bold = true },
		{ "Italic", italic = true },

		-- Messages / prompts
		{ "ErrorMsg", fg = palette.error },
		{ "WarningMsg", fg = palette.warn },
		{ "ModeMsg", fg = palette.fg_dark },
		{ "MsgArea", fg = palette.fg_dark },
		{ "MsgSeparator", fg = palette.border },
		{ "MoreMsg", fg = palette.blue },
		{ "Question", fg = palette.blue },
		{ "Directory", fg = palette.blue },
		{ "Title", bold = true, fg = palette.orange1 },
		{ "NonText", fg = palette.gray },
		{ "SpecialKey", fg = palette.gray },
		{ "Whitespace", fg = palette.light_gray },
		{ "Conceal", fg = palette.orange2 },
		{ "WildMenu", bg = palette.bg_visual },
		{ "QuickFixLine", bg = palette.bg_visual, bold = true },

		-- Search / spelling
		{ "Search", bg = palette.light_orange, fg = palette.black },
		{ "IncSearch", bg = palette.orange, fg = palette.black },
		{ "CurSearch", link = "IncSearch" },
		{ "Substitute", bg = palette.red, fg = palette.black },
		{ "MatchParen", bold = true, fg = palette.orange },
		{ "SpellBad", sp = palette.error, undercurl = true },
		{ "SpellCap", sp = palette.warn, undercurl = true },
		{ "SpellLocal", sp = palette.info, undercurl = true },
		{ "SpellRare", sp = palette.hint, undercurl = true },

		-- Folds
		{ "FoldColumn", bg = palette.bg, fg = palette.comment },
		{ "Folded", bg = palette.bg_gutter, fg = palette.blue },

		-- Diff
		{ "DiffAdd", fg = palette.green },
		{ "DiffChange", fg = palette.orange },
		{ "DiffDelete", fg = palette.red },
		{ "DiffText", fg = palette.fg_dark },

		-- Visual
		{ "Visual", bg = palette.bg_visual },
		{ "VisualNOS", bg = palette.bg_visual },

		-- Pmenu
		{ "Pmenu", bg = palette.bg_float, fg = palette.fg_dark },
		{ "PmenuSel", bg = palette.bg_highlight },
		{ "PmenuSbar", bg = palette.light_gray },
		{ "PmenuThumb" },

		-- Health
		{ "healthError", fg = palette.error },
		{ "healthWarning", fg = palette.warn },
		{ "healthSuccess", fg = palette.green },
	}
end
