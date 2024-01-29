local M = {}

M.syntax = function(colors, theme_style)
	return {
		MiniCompletionActiveParameter = { underline = true },

		MiniCursorword = { bg = colors.fg_gutter },
		MiniCursorwordCurrent = { bg = colors.fg_gutter },

		MiniIndentscopeSymbol = { fg = colors.blue1, nocombine = true },
		MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

		MiniJump = { bg = colors.magenta2, fg = "#ffffff" },

		MiniJump2dSpot = { fg = colors.magenta2, bold = true, nocombine = true },

		MiniStarterCurrent = { nocombine = true },
		MiniStarterFooter = { fg = colors.yellow, italic = true },
		MiniStarterHeader = { fg = colors.blue },
		MiniStarterInactive = { fg = colors.comment, style = options.styles.comments },
		MiniStarterItem = { fg = colors.fg, bg = options.transparent and colors.none or colors.bg },
		MiniStarterItemBullet = { fg = colors.border_highlight },
		MiniStarterItemPrefix = { fg = colors.warning },
		MiniStarterSection = { fg = colors.blue1 },
		MiniStarterQuery = { fg = colors.info },

		MiniStatuslineDevinfo = { fg = colors.fg_dark, bg = colors.bg_highlight },
		MiniStatuslineFileinfo = { fg = colors.fg_dark, bg = colors.bg_highlight },
		MiniStatuslineFilename = { fg = colors.fg_dark, bg = colors.fg_gutter },
		MiniStatuslineInactive = { fg = colors.blue, bg = colors.bg_statusline },
		MiniStatuslineModeCommand = { fg = colors.black, bg = colors.yellow, bold = true },
		MiniStatuslineModeInsert = { fg = colors.black, bg = colors.green, bold = true },
		MiniStatuslineModeNormal = { fg = colors.black, bg = colors.blue, bold = true },
		MiniStatuslineModeOther = { fg = colors.black, bg = colors.teal, bold = true },
		MiniStatuslineModeReplace = { fg = colors.black, bg = colors.red, bold = true },
		MiniStatuslineModeVisual = { fg = colors.black, bg = colors.magenta, bold = true },

		MiniSurround = { bg = colors.orange, fg = colors.black },

		MiniTablineCurrent = { fg = colors.fg, bg = colors.fg_gutter },
		MiniTablineFill = { bg = colors.black },
		MiniTablineHidden = { fg = colors.dark5, bg = colors.bg_statusline },
		MiniTablineModifiedCurrent = { fg = colors.warning, bg = colors.fg_gutter },
		MiniTablineModifiedHidden = { bg = colors.bg_statusline, fg = util.darken(colors.warning, 0.7) },
		MiniTablineModifiedVisible = { fg = colors.warning, bg = colors.bg_statusline },
		MiniTablineTabpagesection = { bg = colors.bg_statusline, fg = colors.none },
		MiniTablineVisible = { fg = colors.fg, bg = colors.bg_statusline },

		MiniTestEmphasis = { bold = true },
		MiniTestFail = { fg = colors.red, bold = true },
		MiniTestPass = { fg = colors.green, bold = true },

		MiniTrailspace = { bg = colors.red },
	}
end

return M
