---@type Palette
-- ============================================================================
-- PARCHMENT - EYE COMFORT (v1)
-- Parchment: dimmed warm paper background + deep earth-tone syntax colors (light variant of Umber).
-- Readability-oriented design for light-sensitive eyes, NOT a medical treatment.
-- Contrast ratios are WCAG values measured against bg_1 (#e0dbd0):
--   * Background luminance is ~79% of the original near-white paper (less glare).
--   * Primary text 9.0:1; no syntax color is darker than it.
--   * Main syntax colors 6.0-6.4:1; light variants ("1") >= 4.8:1.
--   * Dark variants ("2") <= 7.8:1; error 6.0:1; comment 5.2:1.
-- ============================================================================
return {
	-- ========================================================================
	-- Backgrounds (dimmed parchment: much lower luminance than near-white paper)
	-- ========================================================================
	bg_0 = 0xd6d1c6,
	bg_1 = 0xe0dbd0,
	bg_2 = 0xe7e3d9,
	bg_3 = 0xd6d1c6,
	bg_4 = 0xd8d3c7,
	bg_5 = 0xc7c1b3,

	-- ========================================================================
	-- Foregrounds
	-- ========================================================================
	fg_0 = 0x37342f, -- 9.0:1
	fg_1 = 0x494641, -- 6.8:1

	-- ========================================================================
	-- Semantic UI
	-- ========================================================================
	bg = 0xe0dbd0,
	bg_dark = 0xd6d1c6,
	bg_float = 0xe7e3d9,
	bg_bar = 0xd6d1c6,
	bg_visual = 0xc7c1b3,
	bg_highlight = 0xd8d3c7,
	bg_gutter = 0xd6d1c6,
	fg = 0x37342f,
	fg_dark = 0x494641,
	border = 0xb5afa2,
	dark_border = 0x9d978a,
	graphite_border = 0xc7c1b3,

	-- ========================================================================
	-- Semantic syntax
	-- ========================================================================
	comment = 0x5c5750, -- 5.2:1 (italic recommended)
	string = 0x5f4622, -- 6.4:1
	operator = 0x3c4e5c, -- 6.2:1

	-- ========================================================================
	-- Semantic diagnostics (pair with undercurl/underline + icon)
	-- ========================================================================
	error = 0x793d3d, -- 6.0:1
	warn = 0x694725,
	info = 0x3c4e5c,
	hint = 0x32514a,
	todo = 0x5b4766,
	unnecessary = 0xa8a295,

	-- ========================================================================
	-- Accents (main ~6-6.4:1, light variant '1' >= ~4.8:1, dark variant '2' <= ~7.8:1)
	-- ========================================================================

	-- red: Terracotta
	red = 0x793d3d, -- base
	red1 = 0x8e4848, -- light
	red2 = 0x633030, -- dark

	-- orange: Amber
	orange = 0x694725, -- base
	orange1 = 0x7c542d, -- light
	orange2 = 0x56391d, -- dark
	light_orange = 0x705c49,

	-- yellow: Warm Sand
	yellow = 0x614823, -- base
	yellow1 = 0x74562b, -- light
	yellow2 = 0x4f3a1b, -- dark
	bright_yellow = 0x74562b,

	-- green: Sage
	green = 0x3b5133, -- base
	green1 = 0x48623e, -- light
	green2 = 0x304329, -- dark

	-- cyan: Seafoam
	cyan = 0x32514a, -- base
	cyan1 = 0x3e625a, -- light
	cyan2 = 0x28433d, -- dark

	-- blue: Dusty Denim
	blue = 0x3c4e5c, -- base
	blue1 = 0x495e6e, -- light
	blue2 = 0x31404c, -- dark

	-- purple: Mauve
	purple = 0x5b4766, -- base
	purple1 = 0x6c5478, -- light
	purple2 = 0x4b3a54, -- dark

	-- magenta: Dusty Plum (alias)
	magenta = 0x5b4766, -- base
	magenta1 = 0x6c5478, -- light
	magenta2 = 0x4b3a54, -- dark

	-- pink: Dusty Rose
	pink = 0x6f4242, -- base
	pink1 = 0x834e4e, -- light
	pink2 = 0x5c3636, -- dark

	-- teal: Muted Teal (alias)
	teal = 0x32514a, -- base
	teal1 = 0x3e625a, -- light
	teal2 = 0x28433d, -- dark
	link = 0x3c4e5c,

	-- ========================================================================
	-- Neutrals
	-- ========================================================================
	black = 0x2a2825,
	white = 0xe7e3d9,
	gray = 0x5c5750,
	graphite = 0x494641,
	light_gray = 0xa8a295,
	brown = 0x5d3b19,

	-- ========================================================================
	-- Terminal (16 colors) - 'white' slots stay readable on this light background
	-- ========================================================================
	term_0 = 0x37342f,
	term_1 = 0x793d3d,
	term_2 = 0x3b5133,
	term_3 = 0x614823,
	term_4 = 0x3c4e5c,
	term_5 = 0x5b4766,
	term_6 = 0x32514a,
	term_7 = 0x494641,
	term_8 = 0x5c5750,
	term_9 = 0x8e4848,
	term_10 = 0x48623e,
	term_11 = 0x74562b,
	term_12 = 0x495e6e,
	term_13 = 0x6c5478,
	term_14 = 0x3e625a,
	term_15 = 0x37342f,
}
