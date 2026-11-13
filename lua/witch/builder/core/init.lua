return function(palette, palette_name)
	return {
		-- ====================================================================
		-- Base UI
		-- Quiet surfaces with consistent background hierarchy.
		-- ====================================================================

		{ "Normal", bg = palette.bg, fg = palette.fg },
		{ "NormalNC", bg = palette.bg, fg = palette.fg },

		{ "NormalFloat", bg = palette.bg_float, fg = palette.fg },

		{
			"FloatTitle",
			bg = palette.bg_float,
			fg = palette.fg_strong,
			bold = true,
		},

		{
			"FloatBorder",
			bg = palette.bg_float,
			fg = palette.border_subtle,
		},

		-- Statusline and tabline.
		{ "StatusLine", bg = palette.bg_bar, fg = palette.fg_muted },
		{ "StatusLineNC", bg = palette.bg_bar, fg = palette.fg_subtle },

		{ "WinBar", link = "StatusLine" },
		{ "WinBarNC", link = "StatusLineNC" },

		{ "TabLine", bg = palette.bg_bar, fg = palette.fg_muted },

		{
			"TabLineSel",
			bg = palette.bg_bar,
			fg = palette.fg_strong,
			bold = true,
		},

		{ "TabLineFill", bg = palette.bg_bar },

		-- Seamless editor gutters.
		{ "SignColumn", bg = palette.bg },

		{ "WinSeparator", fg = palette.border_subtle },
		{ "VertSplit", link = "WinSeparator" },

		{ "EndOfBuffer", fg = palette.bg },

		-- ====================================================================
		-- Cursor, line numbers and folds
		-- ====================================================================

		{
			"Cursor",
			bg = palette.cursor,
			fg = palette.cursor_text,
		},

		{ "TermCursor", link = "Cursor" },
		{ "lCursor", link = "Cursor" },

		{ "LineNr", fg = palette.fg_muted },

		{
			"CursorLineNr",
			fg = palette.fg_strong,
			bold = true,
		},

		{
			"CursorLine",
			bg = palette.bg_cursorline,
		},

		{
			"CursorColumn",
			bg = palette.bg_cursorline,
		},

		-- Fold column must not create a contrasting vertical strip.
		{
			"FoldColumn",
			bg = palette.bg,
			fg = palette.fg_subtle,
		},

		{
			"Folded",
			bg = palette.bg_panel,
			fg = palette.fg_muted,
		},

		-- ====================================================================
		-- Selection, search and spelling
		-- ====================================================================

		{
			"Visual",
			bg = palette.bg_visual,
			fg = palette.fg,
		},

		{ "VisualNOS", link = "Visual" },

		-- Search remains distinguishable through its foreground/background
		-- pairing rather than additional decoration.
		{
			"Search",
			bg = palette.search_bg,
			fg = palette.search,
		},

		{
			"IncSearch",
			bg = palette.search_active_bg,
			fg = palette.search_active,
		},

		{ "CurSearch", link = "IncSearch" },

		{
			"Substitute",
			bg = palette.search_active_bg,
			fg = palette.search_active,
			underline = true,
			sp = palette.error,
		},

		{
			"MatchParen",
			bg = palette.bg_cursorline,
			fg = palette.orange,
			underline = true,
		},

		-- Spelling: underline only, avoiding intrusive backgrounds.
		{ "SpellBad", sp = palette.error, undercurl = true },
		{ "SpellCap", sp = palette.warn, undercurl = true },
		{ "SpellLocal", sp = palette.info, undercurl = true },
		{ "SpellRare", sp = palette.hint, undercurl = true },

		-- ====================================================================
		-- Syntax: Vim classic
		-- Semantic source-of-truth groups.
		-- ====================================================================

		-- Comments.
		{ "Comment", fg = palette.comment },
		{ "SpecialComment", link = "Comment" },

		-- Literals.
		{ "Constant", fg = palette.constant },
		{ "String", fg = palette.string },
		{ "Character", link = "String" },
		{ "Number", fg = palette.number },
		{ "Float", link = "Number" },
		{ "Boolean", fg = palette.boolean },

		-- Identifiers and functions.
		{ "Identifier", fg = palette.variable },
		{ "Function", fg = palette.fn },

		{ "Label", fg = palette.brown },
		{ "Tag", fg = palette.brown },

		-- Statements and keywords.
		{ "Keyword", fg = palette.keyword },
		{ "Statement", link = "Keyword" },
		{ "Conditional", link = "Keyword" },
		{ "Repeat", link = "Keyword" },
		{ "Exception", link = "Keyword" },
		{ "StorageClass", link = "Keyword" },

		{ "Operator", fg = palette.operator },

		-- Preprocessor.
		{ "PreProc", fg = palette.preproc },
		{ "Include", link = "PreProc" },
		{ "Define", link = "PreProc" },
		{ "Macro", link = "PreProc" },
		{ "PreCondit", link = "PreProc" },

		-- Types.
		{ "Type", fg = palette.type },
		{ "Structure", link = "Type" },
		{ "Typedef", link = "Type" },

		-- Special and punctuation.
		{ "Special", fg = palette.special },
		{ "SpecialChar", link = "Special" },
		{ "Delimiter", fg = palette.delimiter },
		{ "Debug", link = "Keyword" },

		-- Miscellaneous.
		{ "Underlined", underline = true },
		{ "Ignore", fg = palette.fg_disabled },
		{ "Error", fg = palette.error },
		{ "Todo", fg = palette.todo, bold = true },

		{ "Bold", bold = true },
		{ "Italic", italic = true },

		-- ====================================================================
		-- Messages and prompts
		-- ====================================================================

		{ "ErrorMsg", fg = palette.error },
		{ "WarningMsg", fg = palette.warn },

		{ "ModeMsg", fg = palette.fg_muted },
		{ "MsgArea", fg = palette.fg },

		{ "MsgSeparator", fg = palette.border_subtle },

		{ "MoreMsg", fg = palette.link },
		{ "Question", fg = palette.link },
		{ "Directory", fg = palette.link },

		{
			"Title",
			fg = palette.fg_strong,
			bold = true,
		},

		-- ====================================================================
		-- Invisible and auxiliary characters
		-- ====================================================================

		{ "NonText", fg = palette.fg_invisible },
		{ "Whitespace", fg = palette.fg_invisible },
		{ "SpecialKey", link = "Whitespace" },

		{ "Conceal", fg = palette.fg_muted },

		-- ====================================================================
		-- Popup menu, wildmenu and quickfix
		-- ====================================================================

		{
			"Pmenu",
			bg = palette.bg_float,
			fg = palette.fg,
		},

		{
			"PmenuSel",
			bg = palette.bg_popup_selected,
			fg = palette.fg_strong,
		},

		-- Scrollbar track blends into the floating window.
		{
			"PmenuSbar",
			bg = palette.bg_float,
		},

		-- Thumb remains subtly visible.
		{
			"PmenuThumb",
			bg = palette.border_subtle,
		},

		{
			"WildMenu",
			bg = palette.bg_popup_selected,
			fg = palette.fg_strong,
		},

		{
			"QuickFixLine",
			bg = palette.bg_cursorline,
			fg = palette.fg,
		},

		-- ====================================================================
		-- Diff
		-- Restrained backgrounds; semantic colors carry the information.
		-- ====================================================================

		{
			"DiffAdd",
			bg = palette.bg_diff_add,
			fg = palette.green,
		},

		{
			"DiffChange",
			bg = palette.bg_diff_change,
			fg = palette.orange,
		},

		{
			"DiffDelete",
			bg = palette.bg_diff_delete,
			fg = palette.red,
		},

		{
			"DiffText",
			bg = palette.bg_diff_change,
			fg = palette.fg_strong,
			bold = true,
		},

		-- ====================================================================
		-- Health
		-- ====================================================================

		{ "healthError", fg = palette.error },
		{ "healthWarning", fg = palette.warn },
		{ "healthSuccess", fg = palette.green },
	}
end
