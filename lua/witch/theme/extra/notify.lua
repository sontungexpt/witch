local M = {}

M.syntax = function(colors, theme_style)
	return {
		-- Notify
		NotifyBackground = { fg = colors.fg_dark, bg = colors.bg_dark },
		--- Border
		NotifyERRORBorder = {
			fg = colors.border,
			bg = colors.bg_dark,
		},
		NotifyWARNBorder = {
			fg = colors.border,
			bg = colors.bg_dark,
		},
		NotifyINFOBorder = {
			fg = colors.border,
			bg = colors.bg_dark,
		},
		NotifyDEBUGBorder = {
			fg = colors.border,
			bg = colors.bg_dark,
		},
		NotifyTRACEBorder = {
			fg = colors.border,
			bg = colors.bg_dark,
		},
		--- Icons
		NotifyERRORIcon = { fg = colors.error },
		NotifyWARNIcon = { fg = colors.warn },
		NotifyINFOIcon = { fg = colors.info },
		NotifyDEBUGIcon = { fg = colors.comment },
		NotifyTRACEIcon = { fg = colors.purple },
		--- Title
		NotifyERRORTitle = { fg = colors.error },
		NotifyWARNTitle = { fg = colors.warn },
		NotifyINFOTitle = { fg = colors.info },
		NotifyDEBUGTitle = { fg = colors.comment },
		NotifyTRACETitle = { fg = colors.purple },
		--- Body
		NotifyERRORBody = { fg = colors.fg_dark, bg = colors.bg_dark },
		NotifyWARNBody = { fg = colors.fg_dark, bg = colors.bg_dark },
		NotifyINFOBody = { fg = colors.fg_dark, bg = colors.bg_dark },
		NotifyDEBUGBody = { fg = colors.fg_dark, bg = colors.bg_dark },
		NotifyTRACEBody = { fg = colors.fg_dark, bg = colors.bg_dark },
	}
end

return M
