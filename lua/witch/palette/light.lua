---light palette
---@type witch.Palette
return {
	-- ========================================================================
	-- UI SURFACES
	-- ========================================================================

	bg                = 0xf3f4f6,
	bg_float          = 0xf9fafb,
	bg_panel          = 0xf9fafb,
	bg_block          = 0xe5e7eb,
	bg_bar            = 0xe5e7eb,
	bg_gutter         = 0xd1d5db,

	bg_visual         = 0xbae6fd,
	bg_popup_selected = 0xbae6fd,
	bg_cursorline     = 0xe5e7eb,

	bg_reference      = 0xe5e7eb,
	bg_signature      = 0xbae6fd,

	-- Preserve the original light surface instead of introducing
	-- additional diff background colors.
	bg_diff_add       = 0xf3f4f6,
	bg_diff_change    = 0xf3f4f6,
	bg_diff_delete    = 0xf3f4f6,

	-- ========================================================================
	-- TEXT HIERARCHY
	-- ========================================================================

	fg           = 0x1f2937,
	fg_strong    = 0x1f2937,
	fg_muted     = 0x4b5563,
	fg_subtle    = 0x6b7280,
	fg_disabled  = 0x9ca3af,
	fg_invisible = 0x9ca3af,

	-- ========================================================================
	-- CURSOR
	-- ========================================================================

	cursor      = 0x1d4ed8,
	cursor_text = 0xf3f4f6,

	-- ========================================================================
	-- BORDERS AND SEPARATORS
	-- ========================================================================

	border        = 0x9ca3af,
	border_focus  = 0x1d4ed8,
	border_subtle = 0xe5e7eb,

	-- ========================================================================
	-- SYNTAX
	-- ========================================================================

	-- Comments and literals
	comment  = 0x6b7280,
	string   = 0x047857,
	number   = 0xa16207,
	boolean  = 0x6d28d9,
	constant = 0xc2410c,

	-- Language structure
	keyword = 0x6d28d9,
	preproc = 0xa21caf,

	-- Operators
	operator = 0x6d28d9,

	-- Callable entities
	fn         = 0x1d4ed8,
	fn_builtin = 0x2563eb,

	-- Types
	type         = 0x0f766e,
	type_builtin = 0x0e7490,

	-- Variables and members
	variable         = 0x1f2937,
	variable_builtin = 0x0e7490,
	parameter        = 0x9f1239,
	property         = 0x1d4ed8,
	namespace        = 0x1e40af,

	-- Special tokens and punctuation
	special   = 0xca8a04,
	delimiter = 0x4b5563,
	link      = 0x1d4ed8,

	-- ========================================================================
	-- DIAGNOSTICS
	-- ========================================================================

	error       = 0xbe123c,
	warn        = 0xb45309,
	info        = 0x1d4ed8,
	hint        = 0x0f766e,
	todo        = 0x7e22ce,
	unnecessary = 0xd1d5db,

	-- ========================================================================
	-- SEARCH
	-- ========================================================================

	search           = 0x1f2937,
	search_bg        = 0xfde68a,
	search_active    = 0x1f2937,
	search_active_bg = 0xeab308,

	-- ========================================================================
	-- RAW ACCENTS
	-- ========================================================================

	red     = 0xbe123c,
	orange  = 0xc2410c,
	yellow  = 0xa16207,
	green   = 0x15803d,
	cyan    = 0x0e7490,
	blue    = 0x1d4ed8,
	purple  = 0x6d28d9,
	magenta = 0xa21caf,
	pink    = 0xbe185d,
	teal    = 0x0f766e,
	brown   = 0x78350f,
	gray    = 0x6b7280,

	-- ========================================================================
	-- TERMINAL ANSI — 16 COLORS
	-- ========================================================================

	-- Normal
	term_0 = 0x1f2937,
	term_1 = 0xbe123c,
	term_2 = 0x15803d,
	term_3 = 0xa16207,
	term_4 = 0x1d4ed8,
	term_5 = 0x6d28d9,
	term_6 = 0x0e7490,
	term_7 = 0xe5e7eb,

	-- Bright
	term_8  = 0x6b7280,
	term_9  = 0xe11d48,
	term_10 = 0x16a34a,
	term_11 = 0xca8a04,
	term_12 = 0x2563eb,
	term_13 = 0x7c3aed,
	term_14 = 0x0891b2,
	term_15 = 0xf9fafb,
}
