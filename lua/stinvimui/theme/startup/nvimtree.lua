local M = {}

M.syntax = function(colors, theme_style)
	return {
		-- NvimTree
		NvimTreeNormal = { fg = colors.fg_sidebar or colors.fg_dark, bg = colors.bg_sidebar or colors.bg_dark },
		NvimTreeWinSeparator = { fg = colors.dark_border, bg = colors.bg_sidebar or colors.bg_dark },
		NvimTreeNormalNC = { fg = colors.fg_sidebar or colors.fg_dark, bg = colors.bg_sidebar or colors.bg_dark },
		NvimTreeRootFolder = { fg = colors.cyan1, bold = true },
		NvimTreeGitDirty = { link = "DiffChange" },
		NvimTreeGitNew = { link = "DiffAdd" },
		NvimTreeGitDeleted = { link = "DiffDelete" },
		NvimTreeSpecialFile = { fg = colors.magenta1, underline = true },
		NvimTreeIndentMarker = { fg = colors.border },
		NvimTreeImageFile = { bg = "NONE", fg = colors.pink1 },
		NvimTreeSymlink = { fg = colors.blue },
		NvimTreeFolderIcon = { bg = "NONE", fg = colors.graphite },
		NvimTreeOpenedFolderName = { bg = "NONE", fg = colors.orange1 },
		NvimTreeFolderName = { fg = colors.blue1 },
		NvimTreeLiveFilterPrefix = { fg = colors.pink },
		-- NvimTreeOpenedFile = { bg = colors.bg_highlight, fg = colors.blue },
		-- NvimTreeOpenedHL = { bg = colors.bg_highlight, fg = colors.blue },
	}
end

M.filetypes = {
	"NvimTree",
}

return M
