local util = require("stinvimui.util")

local colors = {
	bg = "#161f31",
	-- bg_dim = "#161730",
	-- bg_alt = "#1c2141",
	bg_line = "#0d1829",
	bg_visual = "#253557",
	bg_highlight = "#1f2b49",
	bg_gutter = "#1b305d",

	fg = "#c9d8ee",
	fg_dark = "#a9bad6",

	yellow = "#f0a421",
	yellow1 = "#e6cc4c",
	bright_yellow = "#ffc021",

	red = "#dc4154",
	red1 = "#ff5874",
	red2 = "#ee4091",

	cyan = "#7dcfff",
	cyan1 = "#75c8cc",

	black = "#000000",
	white = "#ffffff",

	term_green = "#4ad860",
	green = "#57cc75",

	orange = "#FF8800",
	orange1 = "#f78c6c",
	orange2 = "#f78682",
	light_orange = "#ffd39b",

	blue = "#50bcef",
	blue1 = "#40aef2",
	blue2 = "#698ff1",

	link = "#8bdafe",

	teal = "#55c5a2",

	gray = "#626b84",
	graphite = "#738eaf",
	light_gray = "#64739a",

	pink = "#f36cde",
	pink1 = "#ed66c2",

	purple = "#a661ea",

	brown = "#c17e70",

	magenta = "#da87ea",
	magenta1 = "#ff2c83",

	border = "#3d88c4",
	dark_border = "#37518d",
	purple_border = "#b278ea",
	graphite_border = "#465968",

	comment = "#6675ae",
	string = "#ffd39b",

	error = "#e64152",
	info = "#59d1f2",
	warn = "#ffcb44",
	hint = "#1abc9c",
	todo = "#f78c6c",
	unnecessary = "#375172",
}

colors.bg_dark = util.darken(colors.bg, 0.84)

return colors
