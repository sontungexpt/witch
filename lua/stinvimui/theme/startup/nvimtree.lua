local M = {}

M.syntax = function(colors, theme_style)
	return {
		{
			group = "NvimTreeNormal",
			styles = {
				fg = colors.fg_sidebar or colors.fg_dark,
				bg = colors.bg_sidebar or colors.bg_dark,
			},
		},
		{
			group = "NvimTreeWinSeparator",
			styles = {
				fg = colors.dark_border,
				bg = colors.bg_sidebar or colors.bg_dark,
			},
		},
		{
			group = "NvimTreeNormalNC",
			styles = {
				fg = colors.fg_sidebar or colors.fg_dark,
				bg = colors.bg_sidebar or colors.bg_dark,
			},
		},
		{
			group = "NvimTreeRootFolder",
			styles = {
				fg = colors.cyan1,
				bold = true,
			},
		},
		{
			group = "NvimTreeGitDirty",
			styles = {
				link = "DiffChange",
			},
		},
		{
			group = "NvimTreeGitNew",
			styles = {
				link = "DiffAdd",
			},
		},
		{
			group = "NvimTreeGitDeleted",
			styles = {
				link = "DiffDelete",
			},
		},
		{
			group = "NvimTreeSpecialFile",
			styles = {
				fg = colors.magenta1,
				underline = true,
			},
		},
		{
			group = "NvimTreeIndentMarker",
			styles = {
				fg = colors.border,
			},
		},
		{
			group = "NvimTreeImageFile",
			styles = {
				fg = colors.pink1,
			},
		},
		{
			group = "NvimTreeSymlink",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "NvimTreeFolderIcon",
			styles = {
				fg = colors.graphite,
			},
		},
		{
			group = "NvimTreeOpenedFolderName",
			styles = {
				fg = colors.orange1,
			},
		},
		{
			group = "NvimTreeFolderName",
			styles = {
				fg = colors.blue1,
			},
		},
		{
			group = "NvimTreeLiveFilterPrefix",
			styles = {
				fg = colors.pink,
			},
		},
		-- {
		--   group = "NvimTreeOpenedFile",
		--   styles = {
		--     fg = colors.blue,
		--   },
		-- },
		-- {
		--  group = "NvimTreeOpenedHL",
		--  styles = {
		--    fg = colors.blue,
		--    bg = colors.bg_highlight,
		--  }
		-- }
	}
end

M.filetypes = {
	"NvimTree",
}

return M
