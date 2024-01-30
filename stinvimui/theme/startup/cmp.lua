local M = {}

M.syntax = function(colors, theme_style)
	local options = {
		CmpDocumentation = { fg = colors.fg_dark, bg = colors.bg_dark },
		CmpDocumentationBorder = { fg = colors.border, bg = colors.bg_dark },
		CmpGhostText = { fg = colors.light_gray },
		CmpItemAbbr = { fg = colors.fg_dark },
		CmpItemAbbrDeprecated = { fg = colors.graphite, strikethrough = true },
		CmpItemAbbrMatch = { link = "Special" },
		CmpItemAbbrMatchFuzzy = { link = "Special" },
		CmpItemMenu = { fg = colors.comment },
		CmpItemKindDefault = { fg = colors.fg_dark },
		CmpItemKindCodeium = { fg = colors.teal },
		CmpItemKindCopilot = { fg = colors.teal },
		CmpItemKindTabNine = { fg = colors.teal },
	}

	require("stinvimui.theme.api").link_kind({ "LspKind", "CmpItemKind" }, options)

	-- local kinds = require("stinvimui.theme.kind")
	-- for kind, hl_opts in pairs(kinds) do
	-- 	options["LspKind" .. kind] = hl_opts
	-- 	options["CmpItemKind" .. kind] = hl_opts
	-- end

	return options
end

M.events = {
	"InsertEnter",
}
return M
