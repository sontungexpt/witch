local g = vim.g
local M = {}

M.syntax = function(colors)
	-- Set the color for normal and bright black.
	g.terminal_color_0 = colors.term_0 or colors.term_black or colors.black
	g.terminal_color_8 = colors.term_8 or colors.term_bright_black or colors.gray

	-- Set the color for normal and bright white.
	g.terminal_color_7 = colors.term_7 or colors.term_white or colors.fg
	g.terminal_color_15 = colors.term_15 or colors.term_bright_white or colors.fg_dark

	-- Set the color for red and bright red.
	g.terminal_color_1 = colors.term_1 or colors.term_red or colors.red
	g.terminal_color_9 = colors.term_9 or colors.term_bright_red or colors.red

	-- Set the color for green and bright green.
	g.terminal_color_2 = colors.term_2 or colors.term_green or colors.green
	g.terminal_color_10 = colors.term_10 or colors.term_bright_green or colors.green

	-- Set the color for yellow and bright yellow.
	g.terminal_color_3 = colors.term_3 or colors.term_yellow or colors.yellow
	g.terminal_color_11 = colors.term_11 or colors.term_bright_yellow or colors.yellow

	-- Set the color for blue and bright blue.
	g.terminal_color_4 = colors.term_4 or colors.term_blue or colors.blue
	g.terminal_color_12 = colors.term_12 or colors.term_bright_blue or colors.blue

	-- Set the color for magenta and bright magenta.
	g.terminal_color_5 = colors.term_5 or colors.term_magenta or colors.magenta
	g.terminal_color_13 = colors.term_13 or colors.term_bright_magenta or colors.magenta

	-- Set the color for cyan and bright cyan.
	g.terminal_color_6 = colors.term_6 or colors.term_cyan or colors.cyan
	g.terminal_color_14 = colors.term_14 or colors.term_bright_cyan or colors.cyan
end

M.events = {
	"TermOpen",
}

return M
