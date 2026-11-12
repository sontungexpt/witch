---@type Palette
return {
	-- ========================================================================
	-- Backgrounds (light → dark)
	-- ========================================================================
	bg_0 = "#f4f6f7",        -- lightest (floats, elevated)
	bg_1 = "#dee2ea",        -- main background
	bg_2 = "#bbbed6",        -- bars, sidebar
	bg_3 = "#afbbd5",        -- gutter
	bg_4 = "#cad5eb",        -- cursor line
	bg_5 = "#b6bfeb",        -- visual selection

	-- ========================================================================
	-- Foregrounds
	-- ========================================================================
	fg_0 = "#111120",        -- primary text
	fg_1 = "#1b2039",        -- secondary text

	-- ========================================================================
	-- Semantic UI
	-- ========================================================================
	bg = "#dee2ea",          -- = bg_1
	bg_dark = "#f4f6f7",     -- = bg_0 (lighter on light theme)
	bg_float = "#f4f6f7",    -- = bg_0
	bg_bar = "#bbbed6",      -- = bg_2
	bg_visual = "#b6bfeb",   -- = bg_5
	bg_highlight = "#cad5eb",-- = bg_4
	bg_gutter = "#afbbd5",   -- = bg_3

	fg = "#111120",          -- = fg_0
	fg_dark = "#1b2039",     -- = fg_1

	border = "#3951aa",
	dark_border = "#5c6bbf",
	graphite_border = "#797d9a",

	-- ========================================================================
	-- Semantic syntax
	-- ========================================================================
	comment = "#7b81a6",
	string = "#a235a6",
	operator = "#a544e9",

	-- ========================================================================
	-- Semantic diagnostic
	-- ========================================================================
	error = "#d85374",
	warn = "#ff6933",
	info = "#5b71f3",
	hint = "#229ba0",
	todo = "#ee7a6c",
	unnecessary = "#afbcd7",

	-- ========================================================================
	-- Accents — base / light / dark variants
	-- ========================================================================
	-- Red
	red = "#fc3753",         -- base
	red1 = "#f14057",        -- light
	red2 = "#e93c7b",        -- dark

	-- Orange
	orange = "#ee4b14",      -- base
	orange1 = "#ee673f",     -- light
	orange2 = "#f96755",     -- dark
	light_orange = "#d38a63",

	-- Yellow
	yellow = "#ff7722",      -- base
	yellow1 = "#ec8a09",     -- dark
	yellow2 = "#e29d78",     -- light
	bright_yellow = "#fc8c21",

	-- Green
	green = "#37a16f",       -- base
	green1 = "#2e8a5c",      -- dark
	green2 = "#4dbd86",      -- light

	-- Cyan
	cyan = "#247ea7",        -- base
	cyan1 = "#4b9fd9",       -- light
	cyan2 = "#1a5f80",       -- dark

	-- Blue
	blue = "#2419f4",        -- base
	blue1 = "#647ee2",       -- light
	blue2 = "#3873f0",       -- dark

	-- Purple
	purple = "#9f58da",      -- base
	purple1 = "#b47ae6",     -- light
	purple2 = "#7a3fb0",     -- dark

	-- Magenta
	magenta = "#f00bde",     -- base
	magenta1 = "#ff4a93",    -- light
	magenta2 = "#b008a3",    -- dark

	-- Pink
	pink = "#f304de",        -- base
	pink1 = "#e534c2",       -- dark
	pink2 = "#b802a8",       -- darker

	-- Teal
	teal = "#2e7e9c",        -- base
	teal1 = "#4aa6c4",       -- light
	teal2 = "#1f5c73",       -- dark

	link = "#2a6bb5",

	-- ========================================================================
	-- Neutrals
	-- ========================================================================
	black = "#000000",
	white = "#ffffff",
	gray = "#7c91a2",
	graphite = "#707687",
	light_gray = "#818ca0",
	brown = "#c17e70",

	-- ========================================================================
	-- Terminal (16 colors)
	-- ========================================================================
	term_0 = "#111120",      -- black (fg on light theme)
	term_1 = "#fc3753",      -- red
	term_2 = "#37a16f",      -- green
	term_3 = "#ff7722",      -- yellow
	term_4 = "#2419f4",      -- blue
	term_5 = "#f00bde",      -- magenta
	term_6 = "#247ea7",      -- cyan
	term_7 = "#dee2ea",      -- white (bg on light theme)
	term_8 = "#7c91a2",      -- bright black
	term_9 = "#f14057",      -- bright red
	term_10 = "#0cb241",     -- bright green
	term_11 = "#fc8c21",     -- bright yellow
	term_12 = "#647ee2",     -- bright blue
	term_13 = "#ff4a93",     -- bright magenta
	term_14 = "#4b9fd9",     -- bright cyan
	term_15 = "#ffffff",     -- bright white
}
