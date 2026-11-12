return function(palette, palette_name)
	return {
		{ "diffAdded", link = "DiffAdd" },
		{ "diffRemoved", link = "DiffDelete" },
		{ "diffChanged", link = "DiffChange" },
		{ "diffOldFile", fg = palette.yellow },
		{ "diffNewFile", link = "DiffAdd" },
		{ "diffFile", fg = palette.blue },
		{ "diffLine", fg = palette.comment },
		{ "diffIndexLine", fg = palette.magenta },
	}
end
