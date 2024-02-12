local M = {
	name = "yanky",
}

M.syntax = function(colors, theme_style)
	return {
		YankyPut = { link = "IncSearch" },
		YankyYanked = { link = "IncSearch" },
	}
end

M.events = {
	"YankPost",
}

return M
