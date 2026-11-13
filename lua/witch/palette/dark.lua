---dark palette
---@type witch.Palette
return {
	-- ========================================================================
	-- UI SURFACES
	-- ========================================================================

	-- Background hierarchy
	bg                = 0x161f31, -- old: bg
	bg_float          = 0x121928, -- old: bg_dark
	bg_panel          = 0x121928, -- old: bg_dark
	bg_block          = 0x0e131f,
	bg_bar            = 0x0d1829, -- old: bg_bar
	bg_gutter         = 0x1b305d, -- old: bg_gutter
	bg_visual         = 0x253557, -- old: bg_visual
	bg_popup_selected = 0x1f2b49, -- old: bg_highlight
	bg_cursorline     = 0x1f2b49, -- old: bg_highlight

	-- Reference and signature
	bg_reference = 0x1b305d, -- old: bg_gutter
	bg_signature = 0x1b305d, -- old: bg_gutter

	-- Diff surfaces
	-- Old DiffAdd/DiffChange/DiffDelete only changed foreground.
	bg_diff_add    = 0x161f31,
	bg_diff_change = 0x161f31,
	bg_diff_delete = 0x161f31,

	-- ========================================================================
	-- TEXT HIERARCHY
	-- ========================================================================

	fg           = 0xc9d8ee, -- old: fg
	fg_strong    = 0xc9d8ee, -- old: fg
	fg_muted     = 0xa9bad6, -- old: fg_dark
	fg_subtle    = 0x596683, -- old: gray
	fg_disabled  = 0x64739a, -- old: light_gray
	fg_invisible = 0x596683, -- old: gray

	-- ========================================================================
	-- CURSOR
	-- ========================================================================

	-- Matches the old commented Cursor highlight definition.
	cursor      = 0xc9d8ee, -- old: fg
	cursor_text = 0x161f31, -- old: bg

	-- ========================================================================
	-- BORDERS AND SEPARATORS
	-- ========================================================================

	border        = 0x3d88c4, -- old: border
	border_focus  = 0x3d88c4, -- old: border
	border_subtle = 0x37518d, -- old: dark_border

	-- ========================================================================
	-- SYNTAX
	-- ========================================================================

	-- Comments and literals
	comment  = 0x6675ae, -- old: comment
	string   = 0xffd39b, -- old: string
	number   = 0xf78c6c, -- old: orange1
	boolean  = 0xee4c96, -- old: red2
	constant = 0xf99635, -- old: orange

	-- Language structure
	keyword  = 0xda87ea, -- old: magenta
	preproc  = 0x75c8cc, -- old: cyan1
	operator = 0x7bc0cc, -- old: operator

	-- Callable entities
	fn         = 0x50bcef, -- old: blue
	fn_builtin = 0xf78782, -- old: orange2

	-- Types
	type         = 0x7dcfff, -- old: cyan
	type_builtin = 0x698ff1, -- old: blue2

	-- Variables and members
	variable         = 0xc9d8ee, -- old: fg
	variable_builtin = 0xff5874, -- old: red1
	parameter        = 0xe6cc4c, -- old: yellow1
	property         = 0x5cd0a0, -- old: teal
	namespace        = 0x75c8cc, -- old: cyan1

	-- Special tokens and punctuation
	special   = 0xf78782, -- old: orange2
	delimiter = 0xa9bad6, -- old: fg_dark
	link      = 0x90d2fa, -- old: link

	-- ========================================================================
	-- DIAGNOSTICS
	-- ========================================================================

	error       = 0xe64152, -- old: error
	warn        = 0xffcb44, -- old: warn
	info        = 0x59d1f2, -- old: info
	hint        = 0x1abc9c, -- old: hint
	todo        = 0xf78c6c, -- old: orange1
	unnecessary = 0x375172, -- old: unnecessary

	-- ========================================================================
	-- SEARCH
	-- ========================================================================

	search           = 0x000000, -- old: black
	search_bg        = 0xffd59d, -- old: light_orange
	search_active    = 0x000000, -- old: black
	search_active_bg = 0xf99635, -- old: orange

	-- ========================================================================
	-- RAW ACCENTS
	-- ========================================================================

	red     = 0xdc4154, -- old: red
	orange  = 0xf99635, -- old: orange
	yellow  = 0xf0a421, -- old: yellow
	green   = 0x5bcf75, -- old: green
	cyan    = 0x7dcfff, -- old: cyan
	blue    = 0x50bcef, -- old: blue
	purple  = 0xb278ea, -- old: purple
	magenta = 0xda87ea, -- old: magenta
	pink    = 0xf36cde, -- old: pink
	teal    = 0x5cd0a0, -- old: teal
	brown   = 0xc17e70, -- old: brown
	gray    = 0x596683, -- old: gray

	-- ========================================================================
	-- TERMINAL ANSI
	-- ========================================================================

	term_0  = 0x000000, -- old: black
	term_1  = 0xdc4154, -- old: red
	term_2  = 0x5bcf75, -- old: green
	term_3  = 0xf0a421, -- old: yellow
	term_4  = 0x50bcef, -- old: blue
	term_5  = 0xda87ea, -- old: magenta
	term_6  = 0x7dcfff, -- old: cyan
	term_7  = 0xc9d8ee, -- old: fg

	term_8  = 0x596683, -- old: gray
	term_9  = 0xff5874, -- old: red1
	term_10 = 0x4ad860, -- old: term_green
	term_11 = 0xffc021, -- old: bright_yellow
	term_12 = 0x629df2, -- old: blue1
	term_13 = 0xff3483, -- old: magenta1
	term_14 = 0x90d2fa, -- old: link
	term_15 = 0xa9bad6, -- old: fg_dark
}
