---@param palette Palette
---@param palette_name string
return function(palette, palette_name)
	return {
		-- ====================================================================
		-- BASE UI
		-- ====================================================================
		{ "NvimTreeNormal", bg = palette.bg_bar, fg = palette.fg_muted },
		{ "NvimTreeNormalNC", link = "NvimTreeNormal" },
		{ "NvimTreeWinSeparator", link = "WinSeparator" },

		-- ====================================================================
		-- GIT STATUS
		-- ====================================================================
		{ "NvimTreeGitDirty", link = "DiffChange" },
		{ "NvimTreeGitNew", link = "DiffAdd" },
		{ "NvimTreeGitDeleted", link = "DiffDelete" },

		-- ====================================================================
		-- FILES AND FOLDERS
		-- ====================================================================
		{ "NvimTreeRootFolder", fg = palette.fg_strong, bold = true },
		{ "NvimTreeFolderIcon", link = "Directory" },
		{ "NvimTreeFolderName", fg = palette.blue },
		{ "NvimTreeOpenedFolderName", fg = palette.fg_strong, bold = true },
		{ "NvimTreeSymlink", link = "Directory" },
		{ "NvimTreeImageFile", fg = palette.pink },
		{ "NvimTreeSpecialFile", fg = palette.special, underline = true },

		-- ====================================================================
		-- DECORATIONS
		-- ====================================================================
		{ "NvimTreeIndentMarker", link = "NonText" },
		{ "NvimTreeLiveFilterPrefix", link = "IncSearch" },
		{ "NvimTreeOpenedHL", link = "Special" },
	}
end
