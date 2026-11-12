
return function(palette, palette_name)
	return {
		-- NvimTree
		{
			"NvimTreeNormal",
			fg = palette.fg_dark,
			bg = palette.bg_bar,
		},
		{
			"NvimTreeWinSeparator",
			fg = palette.dark_border,
			bg = palette.bg_bar,
		},
		{
			"NvimTreeNormalNC",
			fg = palette.fg_dark,
			bg = palette.bg_bar,
		},
		{
			"NvimTreeRootFolder",
			fg = palette.cyan,
			bold = true,
		},
		{
			"NvimTreeGitDirty",
			link = "DiffChange",
		},
		{
			"NvimTreeGitNew",
			link = "DiffAdd",
		},
		{
			"NvimTreeGitDeleted",
			link = "DiffDelete",
		},
		{
			"NvimTreeSpecialFile",
			fg = palette.magenta1,
			underline = true,
		},
		{
			"NvimTreeIndentMarker",
			fg = palette.border,
		},
		{
			"NvimTreeImageFile",
			fg = palette.pink1,
		},
		{
			"NvimTreeSymlink",
			fg = palette.blue,
		},
		{
			"NvimTreeFolderIcon",
			fg = palette.graphite,
		},
		{
			"NvimTreeOpenedFolderName",
			fg = palette.orange1,
		},
		{
			"NvimTreeFolderName",
			fg = palette.blue1,
		},
		{
			"NvimTreeLiveFilterPrefix",
			fg = palette.pink,
		},
		{
			"NvimTreeOpenedHL",
			fg = palette.blue,
		},
	}
end
