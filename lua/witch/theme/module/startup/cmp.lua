local M = {
	name = "cmp",
	events = {
		"InsertEnter",
	},
}

M.syntax = function(colors, theme_style)
	local options = {
		{
			"CmpDocumentation",
			{
				fg = colors.fg_dark,
				bg = colors.bg_dark,
			},
		},
		{
			"CmpDocumentationBorder",
			{
				fg = colors.border,
				bg = colors.bg_dark,
			},
		},
		{
			"CmpGhostText",
			{
				fg = colors.light_gray,
			},
		},
		{
			"CmpItemAbbr",
			{
				fg = colors.fg_dark,
			},
		},
		{
			"CmpItemAbbrDeprecated",
			{
				fg = colors.graphite,
				strikethrough = true,
			},
		},
		{
			"CmpItemAbbrMatch",
			{
				link = "Special",
			},
		},
		{
			"CmpItemAbbrMatchFuzzy",
			{
				link = "Special",
			},
		},
		{
			"CmpItemMenu",
			{
				fg = colors.comment,
			},
		},

		{
			"CmpItemKindDefault",
			{
				fg = colors.fg_dark,
			},
		},

		{
			"CmpItemKindCodeium",
			{
				fg = colors.teal,
			},
		},
		{
			"CmpItemKindCopilot",
			{
				fg = colors.teal,
			},
		},
		{
			"CmpItemKindTabNine",
			{
				fg = colors.teal,
			},
		},
	}

	require("witch.theme.api").link_kind({
		"LspKind%s",
		"CmpItemKind%s",
	}, options)

	return options
end

return M
