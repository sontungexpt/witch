---@type Palette
-- ============================================================================
-- UMBER FOCUS - EYE COMFORT (v4.1)
-- Warm espresso / muted botanical earth tones.
-- Designed for light-sensitive eyes with reduced contrast sensitivity
-- (e.g. uveitis). Readability-oriented design, NOT a medical treatment.
--
-- Contrast ratios are WCAG values measured against bg_1 (#1C1A18):
--   * Primary text 9.0:1; no color is brighter (term_15 = fg_0, no glaring white).
--   * Main syntax colors 6.6-7.2:1; light variants ("1") max ~8.4:1.
--   * Dark variants ("2") >= 5.2:1; error 6.6:1; comment 6.2:1.
-- Tip: use italic comments, bold keywords, and undercurl + icons for
-- diagnostics so meaning never depends on color alone.
-- ============================================================================
return {
	-- ========================================================================
	-- Backgrounds
	-- ========================================================================
	bg_0 = 0x141312,
	bg_1 = 0x1c1a18,
	bg_2 = 0x282521,
	bg_3 = 0x1c1a18,
	bg_4 = 0x302c27,
	bg_5 = 0x35322e,

	-- ========================================================================
	-- Foregrounds
	-- ========================================================================
	fg_0 = 0xc0bab0, -- 9.0:1
	fg_1 = 0xaaa49a, -- 7.0:1

	-- ========================================================================
	-- Semantic UI
	-- ========================================================================
	bg = 0x1c1a18,
	bg_dark = 0x141312,
	bg_float = 0x282521,
	bg_bar = 0x141312,
	bg_visual = 0x35322e,
	bg_highlight = 0x302c27,
	bg_gutter = 0x1c1a18,
	fg = 0xc0bab0,
	fg_dark = 0xaaa49a,
	border = 0x45413b,
	dark_border = 0x302d29,
	graphite_border = 0x514c45,

	-- ========================================================================
	-- Semantic syntax
	-- ========================================================================
	comment = 0x9f9a92, -- 6.2:1 (italic recommended)
	string = 0xb8a27d, -- 7.0:1
	operator = 0x8ea4b5, -- 6.7:1

	-- ========================================================================
	-- Semantic diagnostics (pair with undercurl/underline + icon)
	-- ========================================================================
	error = 0xd78c87, -- 6.6:1
	warn = 0xc79c77,
	info = 0x8ea4b5,
	hint = 0x89afa7,
	todo = 0xaf9dbd,
	unnecessary = 0x625c54,

	-- ========================================================================
	-- Accents (main ~6.6-7.2:1, light variant "1" <= ~8.2:1, dark variant "2" >= ~5.2:1)
	-- ========================================================================

	-- red: Muted Terracotta
	red = 0xd78c87,
	red1 = 0xe79692,
	red2 = 0xbe7b77,

	-- orange: Warm Amber
	orange = 0xc79c77,
	orange1 = 0xd5a77f,
	orange2 = 0xae8867,
	light_orange = 0xc4b29a,

	-- yellow: Aged Sand
	yellow = 0xbaa47a,
	yellow1 = 0xc7b083,
	yellow2 = 0xa3906b,
	bright_yellow = 0xc7b083,

	-- green: Muted Sage
	green = 0x95ae89,
	green1 = 0x9fba93,
	green2 = 0x809676,

	-- cyan: Soft Seafoam
	cyan = 0x89afa7,
	cyan1 = 0x92bab3,
	cyan2 = 0x759690,

	-- blue: Warm Slate
	blue = 0x8ea4b5,
	blue1 = 0x99b0c2,
	blue2 = 0x7c8f9f,

	-- purple: Dusty Mauve
	purple = 0xaf9dbd,
	purple1 = 0xbba8cb,
	purple2 = 0x9888a5,

	-- magenta: Dusty Mauve (alias)
	magenta = 0xaf9dbd,
	magenta1 = 0xbba8cb,
	magenta2 = 0x9888a5,

	-- pink: Dusty Rose
	pink = 0xc19595,
	pink1 = 0xcfa0a0,
	pink2 = 0xaa8383,

	-- teal: Soft Seafoam (alias)
	teal = 0x89afa7,
	teal1 = 0x92bab3,
	teal2 = 0x759690,
	link = 0x8ea4b5,

	-- ========================================================================
	-- Neutrals
	-- ========================================================================
	black = 0x141312,
	white = 0xc0bab0,
	gray = 0x9f9a92,
	graphite = 0xaaa49a,
	light_gray = 0x625c54,
	brown = 0xb18966,

	-- ========================================================================
	-- Terminal (16 colors)
	-- ========================================================================
	term_0 = 0x1c1a18,
	term_1 = 0xd78c87,
	term_2 = 0x95ae89,
	term_3 = 0xbaa47a,
	term_4 = 0x8ea4b5,
	term_5 = 0xaf9dbd,
	term_6 = 0x89afa7,
	term_7 = 0xc0bab0,
	term_8 = 0x9f9a92,
	term_9 = 0xe79692,
	term_10 = 0x9fba93,
	term_11 = 0xc7b083,
	term_12 = 0x99b0c2,
	term_13 = 0xbba8cb,
	term_14 = 0x92bab3,
	term_15 = 0xc0bab0,
}
