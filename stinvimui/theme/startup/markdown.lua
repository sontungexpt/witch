local M = {}

M.syntax = function(colors, theme_style)
	local highlights = {

		-- For special punctutation that does not fall in the catagories before.
		["@markup"] = { link = "@none" },
		["@markup.list"] = { fg = colors.blue },
		["@markup.list.markdown"] = { fg = colors.orange, bold = true },
		["@markup.raw"] = { link = "String" },
		["@markup.raw.markdown"] = { fg = colors.orange },
		["@markup.raw.markdown_inline"] = { fg = colors.red1, bg = colors.bg_line },
		["@markup.link"] = { fg = colors.link },
		["@markup.link.url"] = { link = "Underlined" },
		["@markup.link.label.markdown_inline"] = { fg = colors.pink1 },
		["@markup.link.label"] = { link = "SpecialChar" },
		["@markup.link.label.symbol"] = { link = "Identifier" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "Type" },
		["@markup.math"] = { link = "Special" },
		["@markup.strong"] = { bold = true },
		["@markup.emphasis"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { link = "Title" },
		-- For brackets and parens.
		["@markup.list.checked"] = { fg = colors.green },
		-- For brackets and parens.
		["@markup.list.unchecked"] = { fg = colors.red },
	}

	local markdown_rainbows = { colors.blue, colors.yellow, colors.red2, colors.teal, colors.cyan1, colors.purlple }

	for i, color in ipairs(markdown_rainbows) do
		local heading_group_name = "@markup.heading." .. i .. ".markdown"
		highlights[heading_group_name] = { fg = color, bold = true }
		highlights["@markup.heading." .. i .. ".marker.markdown"] = { link = heading_group_name }
	end

	return highlights
end

M.filetypes = {
	"markdown",
}

return M
