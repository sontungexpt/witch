local M = {
	name = "navic",
}

M.syntax = function(colors, theme_style)
	local options = {
		NavicSeparator = { fg = colors.fg },
		NavicText = { fg = colors.fg },

		AerialNormal = { fg = colors.fg },
		AerialGuide = { fg = colors.bg_gutter },
		AerialLine = { link = "LspInlayHint" },
	}

	require("witch.theme.api").link_kind({
		"NavicIcons%s",
		"Aerial%sIcon",
	}, options)

	return options
end

return M
