-- ============================================================================
-- UMBER FOCUS (parchment palette)
-- UVEITIS-AWARE LIGHT DEVELOPER PALETTE
--
-- Warm parchment / muted botanical / earthy slate.
--
-- Design priorities:
--   1. Warm, low-glare light surfaces.
--   2. Strong essential-text readability.
--   3. Distinct but restrained syntax colors.
--   4. Quiet UI surfaces and structural decoration.
--   5. Consistent warm color temperature.
--
-- Existing colors preserved; new semantic fields reuse existing values.
--
-- Medical limitation:
-- An accessibility-oriented design experiment, not a treatment
-- or medical recommendation for uveitis.
-- ============================================================================

---@type witch.Palette
return {
	-- ========================================================================
	-- UI SURFACES
	-- ========================================================================

	-- Background scale (dark → light)
	bg_0 = 0xd6d1c6,
	bg_1 = 0xe0dbd0,
	bg_2 = 0xe7e3d9,
	bg_3 = 0xd6d1c6,
	bg_4 = 0xd8d3c7,
	bg_5 = 0xc7c1b3,

	-- Semantic surfaces
	bg                = 0xe0dbd0,
	bg_float          = 0xe7e3d9,
	bg_panel          = 0xe7e3d9,
	bg_bar            = 0xd6d1c6,
	bg_gutter         = 0xd6d1c6,
	bg_block          = 0xd6d1c6,

	bg_visual         = 0xc7c1b3,
	bg_popup_selected = 0xc7c1b3,
	bg_cursorline     = 0xd8d3c7,

	bg_reference      = 0xd8d3c7,
	bg_signature      = 0xc7c1b3,

	-- Diff surfaces
	bg_diff_add       = 0xd8d3c7,
	bg_diff_change    = 0xe7e3d9,
	bg_diff_delete    = 0xc7c1b3,

	-- ========================================================================
	-- TEXT HIERARCHY
	-- ========================================================================

	fg           = 0x37342f,
	fg_strong    = 0x37342f,
	fg_muted     = 0x494641,
	fg_subtle    = 0x5c5750,
	fg_disabled  = 0xa8a295,
	fg_invisible = 0xa8a295,

	-- ========================================================================
	-- CURSOR
	-- ========================================================================

	cursor      = 0x694725,
	cursor_text = 0xe0dbd0,

	-- ========================================================================
	-- BORDERS AND SEPARATORS
	-- ========================================================================

	border        = 0x9d978a,
	border_focus  = 0x5d3b19,
	border_subtle = 0xc7c1b3,

	-- ========================================================================
	-- SYNTAX
	-- ========================================================================

	-- Comments and literals
	comment  = 0x5c5750,
	string   = 0x5f4622,
	number   = 0x614823,
	boolean  = 0x5b4766,
	constant = 0x694725,

	-- Language structure
	keyword = 0x5b4766,
	preproc = 0x5b4766,

	-- Operators
	operator = 0x3c4e5c,

	-- Callable entities
	fn         = 0x3c4e5c,
	fn_builtin = 0x495e6e,

	-- Types
	type         = 0x3b5133,
	type_builtin = 0x32514a,

	-- Variables and members
	variable         = 0x37342f,
	variable_builtin = 0x3e625a,
	parameter        = 0x7c542d,
	property         = 0x32514a,
	namespace        = 0x31404c,

	-- Special tokens and punctuation
	special   = 0x74562b,
	delimiter = 0x494641,
	link      = 0x3c4e5c,

	-- ========================================================================
	-- DIAGNOSTICS
	-- ========================================================================

	error       = 0x793d3d,
	warn        = 0x694725,
	info        = 0x3c4e5c,
	hint        = 0x32514a,
	todo        = 0x5b4766,
	unnecessary = 0xa8a295,

	-- ========================================================================
	-- SEARCH
	-- ========================================================================

	search           = 0x37342f,
	search_bg        = 0xe2c994,
	search_active    = 0x37342f,
	search_active_bg = 0xc99b76,

	-- ========================================================================
	-- RAW ACCENTS
	-- ========================================================================

	red     = 0x793d3d,
	orange  = 0x694725,
	yellow  = 0x614823,
	green   = 0x3b5133,
	cyan    = 0x32514a,
	blue    = 0x3c4e5c,
	purple  = 0x5b4766,
	magenta = 0x5b4766,
	pink    = 0x6f4242,
	teal    = 0x32514a,
	brown   = 0x5d3b19,
	gray    = 0x5c5750,

	-- ========================================================================
	-- TERMINAL ANSI — 16 COLORS
	-- ========================================================================

	-- Normal
	term_0 = 0x37342f,
	term_1 = 0x793d3d,
	term_2 = 0x3b5133,
	term_3 = 0x614823,
	term_4 = 0x3c4e5c,
	term_5 = 0x5b4766,
	term_6 = 0x32514a,
	term_7 = 0x494641,

	-- Bright
	term_8  = 0x5c5750,
	term_9  = 0x8e4848,
	term_10 = 0x48623e,
	term_11 = 0x74562b,
	term_12 = 0x495e6e,
	term_13 = 0x6c5478,
	term_14 = 0x3e625a,
	term_15 = 0x37342f,
}
