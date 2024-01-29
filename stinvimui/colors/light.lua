local util = require("stinvimui.util")

local colors = {
	bg = "#dae3f3",
	-- bg_dim = "#161730",
	-- bg_alt = "#1c2141",
	bg_line = "#2d3546",
	bg_visual = "#c4cfe3",
	bg_sidebar = "#272d48",
	bg_highlight = "#cad5eb",
	bg_gutter = "#afbbd5",

	fg = "#111120",
	fg_dark = "#1b2039",
	fg_sidebar = "#92a3c0",

	yellow = "#ff7f1a",
	yellow1 = "#ef8909",
	yellow2 = "#e79d78",
	bright_yellow = "#fc9521",

	red = "#fc3753",
	red1 = "#f14057",
	red2 = "#e93c7b",

	cyan = "#247ea7",
	cyan1 = "#4b9fd9",

	black = "#000000",
	white = "#ffffff",

	term_green = "#0cb241",
	green = "#37a16f",

	orange = "#ee4b14",
	orange1 = "#ee673f",
	orange2 = "#f96755",
	light_orange = "#d38a63",

	blue = "#2419f4",
	blue1 = "#5a81f2",
	blue2 = "#3873f0",
	link = "#88d0fe",
	teal = "#158fcb",

	gray = "#7c91a2",
	graphite = "#707687",
	light_gray = "#818ca0",

	pink = "#f304de",
	pink1 = "#e534c2",

	purple = "#9f58da",

	brown = "#c17e70",

	magenta = "#f00bde",
	magenta1 = "#ff4a93",

	border = "#3951aa",
	dark_border = "#5c6bbf",
	purple_border = "#b278ea",
	graphite_border = "#797d9a",

	comment = "#8283b4",
	string = "#b62ca6",

	error = "#d85374",
	info = "#5b71f3",
	warn = "#ff9632",
	hint = "#229ba0",
	todo = "#ee7a6c",
	unnecessary = "#afbcd7",
}

colors.bg_dark = util.darken(colors.bg, 0.93)

return colors
