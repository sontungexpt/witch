local colors = {
	bg = "#161f31", -- the background color
	bg_dark = "#0d1829", -- the background color of floating windows
	bg_line = "#0d1829", -- the background color of the statusline and tabline
	bg_visual = "#253557", -- the background color of the visual selection
	bg_highlight = "#1f2b49", -- the background color of the line the cursor is on
	bg_gutter = "#1b305d", -- the background color of fold
	bg_sidebar = "#1b305d", -- the background color of the sidebar, fallback to bf_dark if not defined

	fg = "#c9d8ee", -- the foreground color
	fg_dark = "#a9bad6", -- the foreground color of floating windows
	fg_sidebar = "#a9bad6", -- the foreground color of the sidebar, fallback to fg_dark if not defined

	yellow = "#f0a421",
	yellow1 = "#e6cc4c",
	bright_yellow = "#ffc021",

	red = "#dc4154",
	red1 = "#ff5874",
	red2 = "#ee4c96",

	cyan = "#7dcfff",
	cyan1 = "#75c8cc",

	black = "#000000",
	white = "#ffffff",

	green = "#5bcf75",

	orange = "#f99635",
	orange1 = "#f78c6c",
	orange2 = "#f78782",
	light_orange = "#ffd59d",

	blue = "#50bcef",
	blue1 = "#629df2",
	blue2 = "#698ff1",

	link = "#8bdafe",

	teal = "#5cd0a0",

	gray = "#596683",
	graphite = "#738eaf",
	light_gray = "#64739a",

	pink = "#f36cde",
	pink1 = "#ed66c2",

	purple = "#b278ea",

	brown = "#c17e70",

	magenta = "#da87ea",
	magenta1 = "#ff3483",

	border = "#3d88c4",
	dark_border = "#37518d",
	graphite_border = "#465968",

	comment = "#6675ae", -- the color of comments
	string = "#ffd39b", -- the color of strings
	operator = "#7bc0cc", -- the color of operators

	error = "#e64152",
	info = "#59d1f2",
	warn = "#ffcb44",
	hint = "#1abc9c",
	todo = "#f78c6c",
	unnecessary = "#375172",

	-- if you want to change the terminal colors, you can do so here
	-- the term_0 - term_15 colors has the priority over the term_black - term_bright_white colors
	term_0 = "#000000",
	term_8 = "#4d4d4d",

	term_7 = "#ffffff",
	term_15 = "#ffffff",

	term_1 = "#fc3753",
	term_9 = "#fc3753",

	term_2 = "#37a16f",
	term_10 = "#4ad860",

	term_3 = "#f0a421",
	term_11 = "#f0a421",

	term_4 = "#1e9eff",
	term_12 = "#1e9eff",

	term_5 = "#f36cde",
	term_13 = "#f36cde",

	term_6 = "#7dcfff",
	term_14 = "#7dcfff",

	term_black = "#000000",
	term_bright_black = "#4d4d4d",

	term_white = "#ffffff",
	term_bright_white = "#ffffff",

	term_red = "#fc3753",
	term_bright_red = "#fc3753",

	term_green = "#4ad860",
	term_bright_green = "#4ad860",

	term_yellow = "#f0a421",
	term_bright_yellow = "#f0a421",

	term_blue = "#1e9eff",
	term_bright_blue = "#1e9eff",

	term_magenta = "#f36cde",
	term_bright_magenta = "#f36cde",

	term_cyan = "#7dcfff",
	term_bright_cyan = "#7dcfff",
}

return colors
