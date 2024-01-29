local M = {}

M.syntax = function(colors)
	return {
		diffAdded = { link = "DiffAdd" },
		diffRemoved = { link = "DiffDelete" },
		diffChanged = { link = "DiffChange" },
		diffOldFile = { fg = colors.yellow },
		diffNewFile = { link = "DiffAdd" },
		diffFile = { fg = colors.blue },
		diffLine = { fg = colors.comment },
		diffIndexLine = { fg = colors.magenta },
	}
end

return M
