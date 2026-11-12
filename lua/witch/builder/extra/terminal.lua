return function(palette, palette_name)
	local g = vim.g

	-- Normal and bright black.
	g.terminal_color_0 = palette.term_0
	g.terminal_color_8 = palette.term_8

	-- Normal and bright white.
	g.terminal_color_7 = palette.term_7
	g.terminal_color_15 = palette.term_15

	-- Red.
	g.terminal_color_1 = palette.term_1
	g.terminal_color_9 = palette.term_9

	-- Green.
	g.terminal_color_2 = palette.term_2
	g.terminal_color_10 = palette.term_10

	-- Yellow.
	g.terminal_color_3 = palette.term_3
	g.terminal_color_11 = palette.term_11

	-- Blue.
	g.terminal_color_4 = palette.term_4
	g.terminal_color_12 = palette.term_12

	-- Magenta.
	g.terminal_color_5 = palette.term_5
	g.terminal_color_13 = palette.term_13

	-- Cyan.
	g.terminal_color_6 = palette.term_6
	g.terminal_color_14 = palette.term_14

end
