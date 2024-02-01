local M = {}

M.syntax = function(colors, theme_style)
	return {
		DashboardShortCut = { fg = colors.cyan },
		DashboardHeader = { fg = colors.blue },
		DashboardCenter = { fg = colors.magenta },
		DashboardFooter = { fg = colors.blue1 },
		DashboardKey = { fg = colors.orange },
		DashboardDesc = { fg = colors.cyan },
		DashboardIcon = { fg = colors.cyan, bold = true },
	}
end

return M
