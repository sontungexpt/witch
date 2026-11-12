---@type Palette
return {
	-- ========================================================================
	-- Backgrounds (dark → light)
	-- ========================================================================
	bg_0 = 0x0d1829,        -- darkest (bars, sidebar)
	bg_1 = 0x121928,        -- main background
	bg_2 = 0x161f31,        -- elevated (floats)
	bg_3 = 0x1b305d,        -- gutter
	bg_4 = 0x1f2b49,        -- cursor line
	bg_5 = 0x253557,        -- visual selection

	-- ========================================================================
	-- Foregrounds
	-- ========================================================================
	fg_0 = 0xc9d8ee,        -- primary text
	fg_1 = 0xa9bad6,        -- secondary text

	-- ========================================================================
	-- Semantic UI
	-- ========================================================================
	bg = 0x121928,          -- = bg_1
	bg_dark = 0x0d1829,     -- = bg_0
	bg_float = 0x161f31,    -- = bg_2
	bg_bar = 0x0d1829,      -- = bg_0
	bg_visual = 0x253557,   -- = bg_5
	bg_highlight = 0x1f2b49,-- = bg_4
	bg_gutter = 0x1b305d,   -- = bg_3

	fg = 0xc9d8ee,          -- = fg_0
	fg_dark = 0xa9bad6,     -- = fg_1

	border = 0x3d88c4,
	dark_border = 0x37518d,
	graphite_border = 0x465968,

	-- ========================================================================
	-- Semantic syntax
	-- ========================================================================
	comment = 0x6675ae,
	string = 0xffd59d,
	operator = 0x7bc0cc,

	-- ========================================================================
	-- Semantic diagnostic
	-- ========================================================================
	error = 0xdc4154,
	warn = 0xffcb44,
	info = 0x90d2fa,
	hint = 0x5cd0a0,
	todo = 0xf78782,
	unnecessary = 0x37518d,

	-- ========================================================================
	-- Accents — base / light / dark variants
	-- ========================================================================
	-- Red
	red = 0xdc4154,         -- base
	red1 = 0xff5874,        -- light
	red2 = 0xee4c96,        -- dark

	-- Orange
	orange = 0xf99635,      -- base
	orange1 = 0xf78c6c,     -- light
	orange2 = 0xf78782,     -- dark
	light_orange = 0xffd59d,

	-- Yellow
	yellow = 0xf0a421,      -- base
	yellow1 = 0xe6cc4c,     -- dark
	bright_yellow = 0xffc021,-- light

	-- Green
	green = 0x5bcf75,       -- base
	green1 = 0x4ad860,      -- light
	green2 = 0x3a9e5a,      -- dark

	-- Cyan
	cyan = 0x7dcfff,        -- base
	cyan1 = 0x75c8cc,       -- dark
	cyan2 = 0x90d2fa,       -- light

	-- Blue
	blue = 0x50bcef,        -- base
	blue1 = 0x629df2,       -- light
	blue2 = 0x698ff1,       -- dark

	-- Purple
	purple = 0xb278ea,      -- base
	purple1 = 0xc99af0,     -- light
	purple2 = 0x8e5cc4,     -- dark

	-- Magenta
	magenta = 0xda87ea,     -- base
	magenta1 = 0xff3483,    -- light
	magenta2 = 0xb06ac0,    -- dark

	-- Pink
	pink = 0xf36cde,        -- base
	pink1 = 0xe95cc2,       -- dark
	pink2 = 0xc94aad,       -- darker

	-- Teal
	teal = 0x5cd0a0,        -- base
	teal1 = 0x7de0b8,       -- light
	teal2 = 0x3fa87c,       -- dark

	link = 0x90d2fa,

	-- ========================================================================
	-- Neutrals
	-- ========================================================================
	black = 0x000000,
	white = 0xffffff,
	gray = 0x596683,
	graphite = 0x738eaf,
	light_gray = 0x64739a,
	brown = 0xc17e70,

	-- ========================================================================
	-- Terminal (16 colors)
	-- ========================================================================
	term_0 = 0x0d1829,
	term_1 = 0xdc4154,
	term_2 = 0x5bcf75,
	term_3 = 0xf0a421,
	term_4 = 0x50bcef,
	term_5 = 0xda87ea,
	term_6 = 0x7dcfff,
	term_7 = 0xc9d8ee,
	term_8 = 0x465968,
	term_9 = 0xff5874,
	term_10 = 0x4ad860,
	term_11 = 0xffc021,
	term_12 = 0x629df2,
	term_13 = 0xff3483,
	term_14 = 0x90d2fa,
	term_15 = 0xa9bad6,
}
