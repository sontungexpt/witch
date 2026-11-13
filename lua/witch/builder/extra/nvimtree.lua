return function(palette, palette_name)
	return {
		-- ====================================================================
		-- Base UI
		-- ====================================================================

		{ "NvimTreeNormal", fg = palette.fg_muted, bg = palette.bg_bar },
		{ "NvimTreeNormalNC", link = "NvimTreeNormal" },

		{
			"NvimTreeWinSeparator",
			fg = palette.border_subtle,
			bg = palette.bg_bar,
		},

		-- ====================================================================
		-- Git status
		-- ====================================================================

		{ "NvimTreeGitDirty", link = "DiffChange" },
		{ "NvimTreeGitNew", link = "DiffAdd" },
		{ "NvimTreeGitDeleted", link = "DiffDelete" },

		-- ====================================================================
		-- Files and folders
		-- ====================================================================

		{ "NvimTreeRootFolder", fg = palette.cyan, bold = true },
		{ "NvimTreeFolderIcon", fg = palette.border_subtle },
		{ "NvimTreeFolderName", fg = palette.blue },
		{ "NvimTreeOpenedFolderName", fg = palette.orange },
		{ "NvimTreeSymlink", fg = palette.blue },
		{ "NvimTreeImageFile", fg = palette.pink },
		{ "NvimTreeSpecialFile", fg = palette.magenta, underline = true },

		-- ====================================================================
		-- Decorations and interaction
		-- ====================================================================

		{ "NvimTreeIndentMarker", fg = palette.border_subtle },
		{ "NvimTreeLiveFilterPrefix", fg = palette.pink },
		{ "NvimTreeOpenedHL", fg = palette.blue },
	}
end
