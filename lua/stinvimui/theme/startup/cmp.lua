local M = {}

M.syntax = function(colors, theme_style)
	local options = {
		{
			group = "CmpDocumentation",
			styles = {
				fg = colors.fg_dark,
				bg = colors.bg_dark,
			},
		},
		{
			group = "CmpDocumentationBorder",
			styles = {
				fg = colors.border,
				bg = colors.bg_dark,
			},
		},
		{
			group = "CmpGhostText",
			styles = {
				fg = colors.light_gray,
			},
		},
		{
			group = "CmpItemAbbr",
			styles = {
				fg = colors.fg_dark,
			},
		},
		{
			group = "CmpItemAbbrDeprecated",
			styles = {
				fg = colors.graphite,
				strikethrough = true,
			},
		},
		{
			group = "CmpItemAbbrMatch",
			styles = {
				link = "Special",
			},
		},
		{
			group = "CmpItemAbbrMatchFuzzy",
			styles = {
				link = "Special",
			},
		},
		{
			group = "CmpItemMenu",
			styles = {
				fg = colors.comment,
			},
		},

		{
			group = "CmpItemKindDefault",
			styles = {
				fg = colors.fg_dark,
			},
		},

		{
			group = "CmpItemKindCodeium",
			styles = {
				fg = colors.teal,
			},
		},
		{
			group = "CmpItemKindCopilot",
			styles = {
				fg = colors.teal,
			},
		},
		{
			group = "CmpItemKindTabNine",
			styles = {
				fg = colors.teal,
			},
		},
	}

	require("stinvimui.theme.api").link_kind({
		"LspKind%s",
		"CmpItemKind%s",
		-- "NavicIcons%s",
		-- "Aerial%sIcon"
		-- "NoiceCompletionItemKind%s",
	}, options)

	return options
end

M.events = {
	"InsertEnter",
}
return M
