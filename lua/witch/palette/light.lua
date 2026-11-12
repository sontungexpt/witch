---@type Palette
return {
	-- Backgrounds (Cool mist gray - zero glare)
	-- We avoid pure white (#ffffff) to prevent screen glare.
	bg_0 = 0xf9fafb, -- Lightest gray (Floating windows, Popups)
	bg_1 = 0xf3f4f6, -- Main background (Soft, anti-glare)
	bg_2 = 0xe5e7eb, -- UI elements (Statusline, Sidebars)
	bg_3 = 0xd1d5db, -- Gutter (Line numbers, SignColumn)
	bg_4 = 0xe5e7eb, -- CursorLine (Subtle highlight)
	bg_5 = 0xbae6fd, -- Visual selection (Muted, dusty blue)

	-- Foregrounds (Deep slate - soft but high enough contrast to read)
	-- We avoid pure black (#000000) to reduce halation (text bleeding).
	fg_0 = 0x1f2937, -- Primary text (Deep slate, easy on the eyes)
	fg_1 = 0x4b5563, -- Secondary text (Comments, hints)

	-- Semantic UI
	bg = 0xf3f4f6,
	bg_dark = 0xf9fafb,
	bg_float = 0xf9fafb,
	bg_bar = 0xe5e7eb,
	bg_visual = 0xbae6fd,
	bg_highlight = 0xe5e7eb,
	bg_gutter = 0xd1d5db,

	fg = 0x1f2937,
	fg_dark = 0x4b5563,

	border = 0xd1d5db,
	dark_border = 0x9ca3af,
	graphite_border = 0xe5e7eb,

	-- Semantic syntax (Muted, pastel tones)
	-- Colors are desaturated and balanced in luminance to reduce chromatic aberration.
	comment = 0x6b7280,     -- Soft cool gray
	string = 0x047857,      -- Muted emerald green
	operator = 0x6d28d9,    -- Soft violet

	-- Semantic diagnostic
	error = 0xbe123c,       -- Deep rose (strong but not neon)
	warn = 0xb45309,        -- Muted amber
	info = 0x1d4ed8,        -- Gentle blue
	hint = 0x0f766e,        -- Soft teal
	todo = 0x7e22ce,        -- Muted purple
	unnecessary = 0xd1d5db,

	-- Accents (Gentle tones - 700 color range)
	red = 0xbe123c, red1 = 0xe11d48, red2 = 0x9f1239,
	orange = 0xc2410c, orange1 = 0xea580c, orange2 = 0x9a3412, light_orange = 0xfed7aa,
	yellow = 0xa16207, yellow1 = 0xca8a04, yellow2 = 0x854d0e, bright_yellow = 0xeab308,
	green = 0x15803d, green1 = 0x16a34a, green2 = 0x166534,
	cyan = 0x0e7490, cyan1 = 0x0891b2, cyan2 = 0x155e75,
	blue = 0x1d4ed8, blue1 = 0x2563eb, blue2 = 0x1e40af,
	purple = 0x6d28d9, purple1 = 0x7c3aed, purple2 = 0x5b21b6,
	magenta = 0xa21caf, magenta1 = 0xc026d3, magenta2 = 0x86198f,
	pink = 0xbe185d, pink1 = 0xdb2777, pink2 = 0x9d174d,
	teal = 0x0f766e, teal1 = 0x0d9488, teal2 = 0x115e59,

	link = 0x1d4ed8,

	-- Neutrals
	black = 0x1f2937, -- Mapped to primary text (no pure black)
	white = 0xf9fafb, -- Mapped to lightest bg (no pure white)
	gray = 0x6b7280, graphite = 0x4b5563, light_gray = 0x9ca3af, brown = 0x78350f,

	-- Terminal (16 colors)
	term_0 = 0x1f2937, term_1 = 0xbe123c, term_2 = 0x15803d, term_3 = 0xa16207,
	term_4 = 0x1d4ed8, term_5 = 0x6d28d9, term_6 = 0x0e7490, term_7 = 0xe5e7eb,
	term_8 = 0x6b7280, term_9 = 0xe11d48, term_10 = 0x16a34a, term_11 = 0xca8a04,
	term_12 = 0x2563eb, term_13 = 0x7c3aed, term_14 = 0x0891b2, term_15 = 0xf9fafb,
}
