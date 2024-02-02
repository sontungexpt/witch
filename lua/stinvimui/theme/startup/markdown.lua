local M = {}

M.syntax = function(colors, theme_style)
	local highlights = {
		{
			group = "@markup",
			styles = {
				link = "@none",
			},
		},
		{
			group = "@markup.list",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "@markup.list.markdown",
			styles = {
				fg = colors.orange,
				bold = true,
			},
		},

		{
			group = "@markup.raw",
			styles = {
				link = "String",
			},
		},
		{
			group = "@markup.raw.markdown",
			styles = {
				fg = colors.orange,
			},
		},
		{
			group = "@markup.raw.markdown_inline",
			styles = {
				fg = colors.red1,
				bg = colors.bg_line,
			},
		},

		{
			group = "@markup.link",
			styles = {
				fg = colors.link,
			},
		},
		{
			group = "@markup.link.url",
			styles = {
				link = "Underlined",
			},
		},
		{
			group = "@markup.link.label.markdown_inline",
			styles = {
				fg = colors.pink1,
			},
		},
		{
			group = "@markup.link.label",
			styles = {
				link = "SpecialChar",
			},
		},
		{
			group = "@markup.link.label.symbol",
			styles = {
				link = "Identifier",
			},
		},
		{
			group = "@markup.environment",
			styles = {
				link = "Macro",
			},
		},
		{
			group = "@markup.environment.name",
			styles = {
				link = "Type",
			},
		},
		{
			group = "@markup.math",
			styles = {
				link = "Special",
			},
		},
		{
			group = "@markup.strong",
			styles = {
				bold = true,
			},
		},
		{
			group = "@markup.emphasis",
			styles = {
				italic = true,
			},
		},
		{
			group = "@markup.strikethrough",
			styles = {
				strikethrough = true,
			},
		},
		{
			group = "@markup.underline",
			styles = {
				underline = true,
			},
		},
		{
			group = "@markup.heading",
			styles = {
				link = "Title",
			},
		},
		{
			group = "@markup.list.checked",
			styles = {
				fg = colors.green,
			},
		},
		{
			group = "@markup.list.unchecked",
			styles = {
				fg = colors.red,
			},
		},
	}

	local markdown_rainbows =
		{ colors.blue, colors.yellow, colors.red2, colors.teal, colors.cyan1, colors.purlple }

	for i, color in ipairs(markdown_rainbows) do
		local heading_group_name = "@markup.heading." .. i .. ".markdown"
		highlights[#highlights + 1] = {
			group = heading_group_name,
			styles = {
				fg = color,
				bold = true,
			},
		}
		highlights[#highlights + 1] = {
			group = "@markup.heading." .. i .. ".marker.markdown",
			styles = {
				link = heading_group_name,
			},
		}
	end

	return highlights
end

M.filetypes = {
	"markdown",
}

return M
