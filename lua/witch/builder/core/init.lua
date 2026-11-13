--- @param palette witch.Palette
--- @param palette_name string
return function(palette, palette_name)
	return {
		-- ====================================================================
		-- Base UI
		-- Quiet surfaces with consistent background hierarchy.
		-- ====================================================================

		{ "Normal", bg = palette.bg, fg = palette.fg },

		-- Non-current windows and the message area share the normal surface.
		{ "NormalNC", link = "Normal" },
		{ "NormalFloat", bg = palette.bg_float, fg = palette.fg },

		{
			"FloatTitle",
			bg = palette.bg_float,
			fg = palette.fg_strong,
			bold = true,
		},

		{ "FloatFooter", link = "FloatTitle" },

		{
			"FloatBorder",
			bg = palette.bg_float,
			fg = palette.border_subtle,
		},

		-- Floating-window shadow (border = "shadow").
		{ "FloatShadow", bg = palette.bg_block },
		{ "FloatShadowThrough", bg = palette.bg_block },

		-- Statusline and tabline.
		{ "StatusLine", bg = palette.bg_bar, fg = palette.fg_muted },
		{ "StatusLineNC", bg = palette.bg_bar, fg = palette.fg_subtle },

		{ "StatusLineTerm", link = "StatusLine" },
		{ "StatusLineTermNC", link = "StatusLineNC" },

		{ "WinBar", link = "StatusLine" },
		{ "WinBarNC", link = "StatusLineNC" },

		-- Tabline matches the statusline surface.
		{ "TabLine", link = "StatusLine" },

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
		{ "CursorIM", link = "Cursor" },

		{ "LineNr", fg = palette.fg_muted },
		{ "LineNrAbove", link = "LineNr" },
		{ "LineNrBelow", link = "LineNr" },

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

		-- Column ruler set via 'colorcolumn'.
		{
			"ColorColumn",
			bg = palette.bg_block,
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

		-- Cursorline indicators for fold/sign columns.
		{ "CursorLineFold", link = "FoldColumn" },
		{ "CursorLineSign", link = "SignColumn" },

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

		-- Labels and tags share the "marker" accent.
		{ "Label", fg = palette.brown },
		{ "Tag", link = "Label" },

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
		{ "OkMsg", fg = palette.green },

		-- Error/status message variants and health checks share the
		-- corresponding semantic source-of-truth group.
		-- StderrMsg/StdoutMsg are introduced in Neovim 0.12.
		-- Defining them is harmless on older versions (no effect).
		{ "StderrMsg", link = "ErrorMsg" },
		{ "StdoutMsg", fg = palette.fg_muted },

		-- health* groups were replaced by Diagnostic* groups in Neovim 0.11+.
		-- The links below are the canonical, version-proof equivalents.
		{ "DiagnosticError", link = "ErrorMsg" },
		{ "DiagnosticWarn", link = "WarningMsg" },
		{ "DiagnosticOk", link = "OkMsg" },

		{ "ModeMsg", fg = palette.fg_muted },
		{ "MsgArea", link = "Normal" },

		{ "MsgSeparator", fg = palette.border_subtle },

		-- "More", prompt and directory listing all use the link accent.
		{ "MoreMsg", fg = palette.link },
		{ "Question", link = "MoreMsg" },
		{ "Directory", link = "MoreMsg" },

		{
			"Title",
			fg = palette.fg_strong,
			bold = true,
		},

		-- ====================================================================
		-- Invisible and auxiliary characters
		-- ====================================================================

		{ "NonText", fg = palette.fg_invisible },
		{ "Whitespace", link = "NonText" },
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

		-- Item "kind" (Function, Variable, ...) inside the popup.
		{ "PmenuKind", bg = palette.bg_float, fg = palette.fg_muted },
		{
			"PmenuKindSel",
			bg = palette.bg_popup_selected,
			fg = palette.fg_subtle,
		},

		-- Item "extra text" (source/annotation) inside the popup.
		{ "PmenuExtra", bg = palette.bg_float, fg = palette.fg_subtle },
		{
			"PmenuExtraSel",
			bg = palette.bg_popup_selected,
			fg = palette.fg_muted,
		},

		-- Matched text within the popup menu (combined with Pmenu/PmenuSel).
		-- PmenuMatch/PmenuMatchSel are available from Neovim 0.10+ (vim-patch:9.1.0476).
		{ "PmenuMatch", fg = palette.orange, bold = true },
		{ "PmenuMatchSel", fg = palette.yellow, bold = true },

		{
			"PmenuBorder",
			bg = palette.bg_float,
			fg = palette.border,
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

		-- Popup-menu shadow (border = "shadow").
		{ "PmenuShadow", bg = palette.bg_block },
		{ "PmenuShadowThrough", bg = palette.bg_block },

		-- Wildmenu selection mirrors the popup selection.
		{ "WildMenu", link = "PmenuSel" },

		{
			"QuickFixLine",
			bg = palette.bg_cursorline,
			fg = palette.fg,
		},

		-- ====================================================================
		-- Completion and snippets
		-- ====================================================================

		-- Matched text of the currently inserted completion.
		-- ComplMatchIns is available from Neovim 0.10+ (vim-patch:9.1.0936).
		{ "ComplMatchIns", link = "PmenuMatch" },

		-- Text inserted when "preinsert" is in 'completeopt'.
		{
			"PreInsert",
			fg = palette.fg_subtle,
			italic = true,
		},

		-- Virtual text of the selected completion.
		{ "ComplHint", fg = palette.fg_subtle, italic = true },
		{ "ComplHintMore", link = "ComplHint" },

		-- Snippet tabstops.
		{
			"SnippetTabstop",
			bg = palette.bg_reference,
			fg = palette.fg,
		},

		{
			"SnippetTabstopActive",
			bg = palette.bg_signature,
			fg = palette.fg_strong,
			bold = true,
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

		{ "DiffTextAdd", link = "DiffText" },
	}
end
