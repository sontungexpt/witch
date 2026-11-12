---@type Palette
return {
	-- Backgrounds (Mist Gray - zero glare, perfect for weak eyes)
	bg_0 = 0xf3f4f6, -- Lightest gray (Floats, Popups)
	bg_1 = 0xe5e7eb, -- Main background (Muted mist gray)
	bg_2 = 0xd1d5db, -- UI elements (Statusline, Sidebars)
	bg_3 = 0xbfc4cc, -- Gutter (Line numbers, SignColumn)
	bg_4 = 0xdadde3, -- CursorLine (Very subtle)
	bg_5 = 0xc7d2e5, -- Visual selection (Muted, dusty blue)

	-- Foregrounds (Slate - soft but high enough contrast to read)
	fg_0 = 0x2d3748, -- Primary text (Deep slate, not black)
	fg_1 = 0x4a5568, -- Secondary text (Comments, hints)

	-- Semantic UI
	bg = 0xe5e7eb,
	bg_dark = 0xf3f4f6,
	bg_float = 0xf3f4f6,
	bg_bar = 0xd1d5db,
	bg_visual = 0xc7d2e5,
	bg_highlight = 0xdadde3,
	bg_gutter = 0xbfc4cc,

	fg = 0x2d3748,
	fg_dark = 0x4a5568,

	border = 0xbac0c9,
	dark_border = 0x9ca3af,
	graphite_border = 0xd1d5db,

	-- Semantic syntax (Muted and gentle)
	comment = 0x718096,     -- Soft cool gray
	string = 0x2f855a,      -- Muted forest green
	operator = 0x6b46c1,    -- Soft indigo

	-- Semantic diagnostic
	error = 0xc53030,       -- Soft ruby
	warn = 0xb7791f,        -- Dusty gold
	info = 0x3182ce,        -- Gentle blue
	hint = 0x319795,        -- Soft teal
	todo = 0x805ad5,        -- Muted violet
	unnecessary = 0xbac0c9,

	-- Accents (Gentle tones)
	red = 0xc53030, red1 = 0xe53e3e, red2 = 0x9b2c2c,
	orange = 0xc05621, orange1 = 0xdd6b20, orange2 = 0x9c4221, light_orange = 0xfbd38d,
	yellow = 0x975a16, yellow1 = 0xb7791f, yellow2 = 0x744210, bright_yellow = 0xd69e2e,
	green = 0x2f855a, green1 = 0x38a169, green2 = 0x276749,
	cyan = 0x285e61, cyan1 = 0x319795, cyan2 = 0x234e52,
	blue = 0x2b6cb0, blue1 = 0x3182ce, blue2 = 0x2c5282,
	purple = 0x553c9a, purple1 = 0x6b46c1, purple2 = 0x44337a,
	magenta = 0x97266d, magenta1 = 0xb83280, magenta2 = 0x702459,
	pink = 0xb83280, pink1 = 0xd53f8c, pink2 = 0x97266d,
	teal = 0x285e61, teal1 = 0x319795, teal2 = 0x234e52,

	link = 0x2b6cb0,

	-- Neutrals
	black = 0x2d3748, -- Mapped to primary text (no pure black)
	white = 0xf3f4f6, -- Mapped to lightest bg (no pure white)
	gray = 0x718096, graphite = 0x4a5568, light_gray = 0x9ca3af, brown = 0x8b5a2b,

	-- Terminal (16 colors)
	term_0 = 0x2d3748, term_1 = 0xc53030, term_2 = 0x2f855a, term_3 = 0x975a16,
	term_4 = 0x2b6cb0, term_5 = 0x553c9a, term_6 = 0x285e61, term_7 = 0xd1d5db,
	term_8 = 0x718096, term_9 = 0xe53e3e, term_10 = 0x38a169, term_11 = 0xb7791f,
	term_12 = 0x3182ce, term_13 = 0x6b46c1, term_14 = 0x319795, term_15 = 0xf3f4f6,
}
