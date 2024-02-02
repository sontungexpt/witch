local util = require("stinvimui.util")

local M = {}

M.syntax = function(colors, theme_style)
	return {
		{
			group = "Normal",
			styles = {
				bg = colors.bg,
				fg = colors.fg,
			},
		},
		{
			group = "NormalNC",
			styles = {
				bg = colors.bg,
				fg = colors.fg,
			},
		},
		{
			group = "NormalFloat",
			styles = {
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			group = "StatusLine",
			styles = {
				bg = colors.bg_line,
				fg = colors.fg,
			},
		},
		{
			group = "StatusLineNC",
			styles = {
				bg = util.darken(colors.bg_line, 0.95),
				fg = colors.fg,
			},
		},
		{
			group = "WinBarNC",
			styles = {
				link = "StatusLineNC",
			},
		},
		{
			group = "WinBar",
			styles = {
				link = "StatusLine",
			},
		},
		{
			group = "TabLine",
			styles = {
				bg = colors.bg_line,
				fg = colors.fg,
			},
		},
		{
			group = "TabLineSel",
			styles = {
				bg = colors.blue,
				fg = colors.black,
			},
		},
		{
			group = "SignColumn",
			styles = {},
		},
		{
			group = "WinSeparator",
			styles = {
				fg = colors.dark_border,
			},
		},
		{
			group = "VertSplit",
			styles = {
				fg = colors.dark_border,
			},
		},
		{
			group = "LineNr",
			styles = {
				fg = colors.light_gray,
			},
		},
		{
			group = "TabLineFill",
			styles = {
				bg = colors.black,
			},
		},
		{
			group = "CursorLineNr",
			styles = {
				fg = colors.pink,
			},
		},
		{
			group = "CursorColumn",
			styles = {
				bg = colors.bg_highlight,
			},
		},
		{
			group = "CursorLine",
			styles = {
				bg = colors.bg_highlight,
			},
		},
		{
			group = "Pmenu",
			styles = {
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			group = "PmenuSel",
			styles = {
				bg = colors.bg_highlight,
			},
		},
		{
			group = "PmenuThumb",
			styles = {},
		},
		{
			group = "PmenuSbar",
			styles = {
				bg = colors.light_gray,
			},
		},
		{
			group = "Comment",
			styles = {
				fg = colors.comment,
				italic = true,
			},
		},
		{
			group = "Question",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "VisualNOS",
			styles = {
				bg = colors.bg_visual,
			},
		},
		{
			group = "Visual",
			styles = {
				bg = colors.bg_visual,
			},
		},
		{
			group = "QuickFixLine",
			styles = {
				bg = colors.bg_visual,
				bold = true,
			},
		},
		{
			group = "PreProc",
			styles = {
				fg = colors.cyan1,
			},
		},
		{
			group = "Boolean",
			styles = {
				fg = colors.red2,
				italic = true,
			},
		},
		{
			group = "FloatTitle",
			styles = {
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			group = "FloatBorder",
			styles = {
				bg = colors.bg_dark,
				fg = colors.border,
			},
		},
		{
			group = "SpellRare",
			styles = {
				sp = colors.hint,
				undercurl = true,
			},
		},
		{
			group = "SpellLocal",
			styles = {
				sp = colors.info,
				undercurl = true,
			},
		},
		{
			group = "SpellCap",
			styles = {
				sp = colors.warn,
				undercurl = true,
			},
		},
		{
			group = "SpellBad",
			styles = {
				sp = colors.error,
				undercurl = true,
			},
		},
		{
			group = "MatchParen",
			styles = {
				bold = true,
				fg = colors.orange,
			},
		},
		{
			group = "Search",
			styles = {
				bg = colors.light_orange,
				fg = colors.black,
			},
		},
		{
			group = "Substitute",
			styles = {
				bg = colors.red,
				fg = colors.black,
			},
		},
		{
			group = "FoldColumn",
			styles = {
				bg = colors.bg,
				fg = colors.comment,
			},
		},
		{
			group = "Folded",
			styles = {
				bg = colors.bg_gutter,
				fg = colors.blue,
			},
		},
		{
			group = "MsgArea",
			styles = {
				fg = colors.fg_dark,
			},
		},
		{
			group = "ModeMsg",
			styles = {
				fg = colors.fg_dark,
			},
		},
		{
			group = "MsgSeparator",
			styles = {
				fg = colors.border,
			},
		},
		{
			group = "MoreMsg",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "WarningMsg",
			styles = {
				fg = colors.warn,
			},
		},
		{
			group = "ErrorMsg",
			styles = {
				fg = colors.error,
			},
		},
		{
			group = "Directory",
			styles = {
				fg = colors.blue,
			},
		},

		{
			group = "Identifier",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "Constant",
			styles = {
				fg = colors.orange,
			},
		},
		{
			group = "Title",
			styles = {
				bold = true,
				fg = colors.orange1,
			},
		},
		{
			group = "NonText",
			styles = {
				fg = colors.gray,
			},
		},
		{
			group = "Number",
			styles = {
				fg = colors.orange1,
			},
		},
		{
			group = "Special",
			styles = {
				fg = colors.orange2,
			},
		},
		{
			group = "Function",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "Debug",
			styles = {
				fg = colors.orange,
			},
		},
		{
			group = "Repeat",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "Conditional",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "Conceal",
			styles = {
				fg = colors.orange2,
			},
		},
		{
			group = "Todo",
			styles = {
				bg = colors.yellow,
				fg = colors.bg,
			},
		},
		{
			group = "Label",
			styles = {
				fg = colors.brown,
			},
		},
		{
			group = "Statement",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "Keyword",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "Type",
			styles = {
				fg = colors.cyan,
			},
		},
		{
			group = "Character",
			styles = {
				fg = colors.string,
			},
		},
		{
			group = "String",
			styles = {
				fg = colors.string,
			},
		},
		{
			group = "WildMenu",
			styles = {
				bg = colors.bg_visual,
			},
		},
		{
			group = "SpecialKey",
			styles = {
				fg = colors.gray,
			},
		},
		{
			group = "Whitespace",
			styles = {
				fg = colors.light_gray,
			},
		},
		{
			group = "Italic",
			styles = {
				italic = true,
			},
		},
		{
			group = "Underlined",
			styles = {
				underline = true,
			},
		},
		{
			group = "Bold",
			styles = {
				bold = true,
			},
		},
		{
			group = "DiffAdd",
			styles = {
				fg = colors.green,
			},
		},
		{
			group = "DiffText",
			styles = {
				fg = colors.fg_dark,
			},
		},
		{
			group = "DiffChange",
			styles = {
				fg = colors.orange,
			},
		},
		{
			group = "DiffDelete",
			styles = {
				fg = colors.red,
			},
		},
		{
			group = "DiagnosticUnderlineHint",
			styles = {
				sp = colors.hint,
				undercurl = true,
			},
		},
		{
			group = "DiagnosticUnderlineInfo",
			styles = {
				sp = colors.info,
				undercurl = true,
			},
		},
		{
			group = "DiagnosticUnderlineWarn",
			styles = {
				sp = colors.warn,
				undercurl = true,
			},
		},
		{
			group = "DiagnosticUnderlineError",
			styles = {
				sp = colors.error,
				undercurl = true,
			},
		},
		{
			group = "DiagnosticVirtualTextHint",
			styles = {
				fg = colors.hint,
			},
		},
		{
			group = "DiagnosticVirtualTextInfo",
			styles = {
				fg = colors.info,
			},
		},
		{
			group = "DiagnosticVirtualTextWarn",
			styles = {
				fg = colors.warn,
			},
		},
		{
			group = "DiagnosticVirtualTextError",
			styles = {
				fg = colors.error,
			},
		},
		{
			group = "DiagnosticUnnecessary",
			styles = {
				fg = colors.unnecessary,
			},
		},
		{
			group = "DiagnosticHint",
			styles = {
				fg = colors.hint,
			},
		},
		{
			group = "DiagnosticInfo",
			styles = {
				fg = colors.info,
			},
		},
		{
			group = "DiagnosticWarn",
			styles = {
				fg = colors.warn,
			},
		},
		{
			group = "DiagnosticError",
			styles = {
				fg = colors.error,
			},
		},
		{
			group = "LspCodeLensSeparator",
			styles = {
				fg = colors.border,
			},
		},
		{
			group = "LspInfoBorder",
			styles = {
				bg = colors.bg_dark,
				fg = colors.border,
			},
		},
		{
			group = "LspCodeLens",
			styles = {
				fg = colors.gray,
			},
		},
		{
			group = "LspSignatureActiveParameter",
			styles = {
				bg = colors.bg_gutter,
				bold = true,
			},
		},
		{
			group = "LspReferenceWrite",
			styles = {
				bg = colors.bg_gutter,
			},
		},
		{
			group = "LspReferenceRead",
			styles = {
				bg = colors.bg_gutter,
			},
		},
		{
			group = "LspReferenceText",
			styles = {
				bg = colors.bg_gutter,
			},
		},
		{
			group = "healthWarning",
			styles = {
				fg = colors.warn,
			},
		},
		{
			group = "healthSuccess",
			styles = {
				fg = colors.green,
			},
		},
		{
			group = "healthError",
			styles = {
				fg = colors.error,
			},
		},
		{
			group = "CurSearch",
			styles = {
				link = "IncSearch",
			},
		},
		{
			group = "IncSearch",
			styles = {
				bg = colors.orange,
				fg = colors.black,
			},
		},

		{
			group = "@module",
			styles = {
				link = "Include",
			},
		},
		{
			group = "@variable",
			styles = {
				fg = colors.fg,
			},
		},
		{
			group = "@operator",
			styles = {
				fg = colors.operator,
			},
		},
		{
			group = "@function",
			styles = {
				link = "Function",
			},
		},
		{
			group = "@function.builtin",
			styles = {
				link = "Special",
			},
		},
		{
			group = "@type.builtin",
			styles = {
				fg = colors.blue2,
			},
		},
		{
			group = "@variable.builtin",
			styles = {
				fg = colors.red1,
			},
		},

		{
			group = "@constant.builtin",
			styles = {
				link = "Special",
			},
		},
		{
			group = "@tag.delimiter.tsx",
			styles = {
				fg = colors.blue2,
			},
		},
		{
			group = "@constructor.tsx",
			styles = {
				fg = colors.blue1,
			},
		},
		{
			group = "@tag.tsx",
			styles = {
				fg = colors.red,
			},
		},
		{
			group = "@diff.delta",
			styles = {
				link = "DiffChange",
			},
		},
		{
			group = "@diff.minus",
			styles = {
				link = "DiffDelete",
			},
		},
		{
			group = "@diff.plus",
			styles = {
				link = "DiffAdd",
			},
		},
		{
			group = "@punctuation.special.markdown",
			styles = {
				fg = colors.border,
			},
		},
		{
			group = "@punctuation.special",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "@punctuation.bracket",
			styles = {
				fg = colors.fg_dark,
			},
		},
		{
			group = "@punctuation.delimiter",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "@module.builtin",
			styles = {
				fg = colors.red1,
			},
		},
		{
			group = "@variable.member",
			styles = {
				fg = colors.teal,
			},
		},
		{
			group = "@variable.parameter.builtin",
			styles = {
				fg = colors.yellow,
			},
		},
		{
			group = "@constructor",
			styles = {
				fg = colors.red,
			},
		},
		{
			group = "@lsp.type.parameter",
			styles = {
				link = "@variable.parameter",
			},
		},
		{
			group = "@string.regexp",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "@string.documentation",
			styles = {
				fg = colors.yellow,
			},
		},
		{
			group = "@type.qualifier",
			styles = {
				link = "Keyword",
			},
		},
		{
			group = "@comment.todo",
			styles = {
				fg = colors.orange1,
			},
		},
		{
			group = "@comment.warning",
			styles = {
				fg = colors.warn,
			},
		},
		{
			group = "@comment.info",
			styles = {
				fg = colors.info,
			},
		},
		{
			group = "@comment.hint",
			styles = {
				fg = colors.hint,
			},
		},
		{
			group = "@comment.error",
			styles = {
				fg = colors.error,
			},
		},
		{
			group = "@tag.delimiter",
			styles = {
				link = "Delimiter",
			},
		},
		{
			group = "@tag.attribute",
			styles = {
				link = "Identifier",
			},
		},
		{
			group = "@none",
			styles = {},
		},
		{
			group = "@namespace.builtin",
			styles = {
				link = "@variable.builtin",
			},
		},
		{
			group = "@function.method.call",
			styles = {
				link = "Function",
			},
		},
		{
			group = "@function.method",
			styles = {
				link = "Function",
			},
		},
		{
			group = "@function.macro",
			styles = {
				link = "Macro",
			},
		},
		{
			group = "@function.call",
			styles = {
				link = "Function",
			},
		},
		{
			group = "@conceal",
			styles = {
				link = "Conceal",
			},
		},
		{
			group = "@annotation",
			styles = {
				link = "PreProc",
			},
		},
		{
			group = "@keyword.exception",
			styles = {
				link = "Exception",
			},
		},
		{
			group = "@keyword.coroutine",
			styles = {
				link = "Keyword",
			},
		},
		{
			group = "@keyword.storage",
			styles = {
				link = "StorageClass",
			},
		},
		{
			group = "@keyword.repeat",
			styles = {
				link = "Repeat",
			},
		},
		{
			group = "@keyword.directive",
			styles = {
				link = "PreProc",
			},
		},
		{
			group = "@keyword.return",
			styles = {
				link = "Keyword",
			},
		},
		{
			group = "@keyword.operator",
			styles = {
				link = "@operator",
			},
		},
		{
			group = "@keyword.import",
			styles = {
				link = "Include",
			},
		},
		{
			group = "@keyword.directive.define",
			styles = {
				link = "Macro",
			},
		},
		{
			group = "@keyword.debug",
			styles = {
				link = "Debug",
			},
		},
		{
			group = "@keyword.conditional",
			styles = {
				link = "Conditional",
			},
		},
		{
			group = "dosIniLabel",
			styles = {
				link = "@property",
			},
		},
		{
			group = "@property",
			styles = {
				fg = colors.teal,
			},
		},
		{
			group = "@attribute",
			styles = {
				link = "PreProc",
			},
		},
		{
			group = "@variable.parameter",
			styles = {
				fg = colors.yellow1,
			},
		},

		{
			group = "@string.escape",
			styles = {
				fg = colors.magenta1,
			},
		},
		{
			group = "@comment.note",
			styles = {
				fg = colors.hint,
			},
		},

		{
			group = "@number.float",
			styles = {
				link = "Float",
			},
		},

		{
			group = "@lsp.type.selfKeyword",
			styles = {
				link = "@variable.builtin",
			},
		},
		{
			group = "@lsp.type.generic",
			styles = {
				link = "@variable",
			},
		},
		{
			group = "@lsp.type.enumMember",
			styles = {
				link = "Constant",
			},
		},
		{
			group = "@lsp.type.keyword",
			styles = {
				link = "Keyword",
			},
		},
		{
			group = "@lsp.type.formatSpecifier",
			styles = {
				link = "@markup.list",
			},
		},
		{
			group = "@lsp.typemod.variable.static",
			styles = {
				link = "Constant",
			},
		},
		{
			group = "@lsp.typemod.variable.injected",
			styles = {
				link = "Identifier",
			},
		},
		{
			group = "@lsp.typemod.variable.defaultLibrary",
			styles = {
				link = "@variable.builtin",
			},
		},
		{
			group = "@lsp.typemod.variable.callable",
			styles = {
				link = "@function",
			},
		},
		{
			group = "@lsp.typemod.typeAlias.defaultLibrary",
			styles = {
				fg = colors.blue2,
			},
		},
		{
			group = "@lsp.typemod.type.defaultLibrary",
			styles = {
				fg = colors.blue2,
			},
		},
		{
			group = "@lsp.typemod.struct.defaultLibrary",
			styles = {
				link = "@type.builtin",
			},
		},
		{
			group = "@lsp.typemod.string.injected",
			styles = {
				link = "@string",
			},
		},
		{
			group = "@lsp.typemod.operator.injected",
			styles = {
				link = "@operator",
			},
		},
		{
			group = "@lsp.typemod.method.defaultLibrary",
			styles = {
				link = "@function.builtin",
			},
		},
		{
			group = "@lsp.typemod.macro.defaultLibrary",
			styles = {
				link = "@function.builtin",
			},
		},
		{
			group = "@lsp.typemod.keyword.injected",
			styles = {
				link = "@keyword",
			},
		},
		{
			group = "@lsp.typemod.keyword.async",
			styles = {
				link = "@keyword.coroutine",
			},
		},
		{
			group = "@lsp.typemod.function.defaultLibrary",
			styles = {
				link = "@function.builtin",
			},
		},
		{
			group = "@lsp.typemod.enumMember.defaultLibrary",
			styles = {
				link = "@constant.builtin",
			},
		},
		{
			group = "@lsp.typemod.enum.defaultLibrary",
			styles = {
				link = "@type.builtin",
			},
		},
		{
			group = "@lsp.typemod.class.defaultLibrary",
			styles = {
				link = "@type.builtin",
			},
		},
		{
			group = "@lsp.type.variable",
			styles = {},
		},
		{
			group = "@lsp.type.unresolvedReference",
			styles = {
				sp = colors.error,
				undercurl = true,
			},
		},
		{
			group = "@lsp.type.typeAlias",
			styles = {
				link = "@type.definition",
			},
		},
		{
			group = "@lsp.type.string",
			styles = {
				link = "@string",
			},
		},
		{
			group = "@lsp.type.selfTypeKeyword",
			styles = {
				link = "@variable.builtin",
			},
		},
		{
			group = "@lsp.type.property",
			styles = {
				link = "@property",
			},
		},
		{
			group = "@lsp.type.operator",
			styles = {
				link = "@operator",
			},
		},
		{
			group = "@lsp.type.number",
			styles = {
				link = "Number",
			},
		},
		{
			group = "@lsp.type.namespace",
			styles = {
				link = "@module",
			},
		},
		{
			group = "@lsp.type.interface",
			styles = {
				fg = colors.blue2,
			},
		},
		{
			group = "@lsp.type.escapeSequence",
			styles = {
				link = "@string.escape",
			},
		},
		{
			group = "@lsp.type.deriveHelper",
			styles = {
				link = "@attribute",
			},
		},
		{
			group = "@lsp.type.builtinType",
			styles = {
				link = "@type.builtin",
			},
		},
		{
			group = "@lsp.type.boolean",
			styles = {
				link = "Boolean",
			},
		},
		{
			group = "@lsp.type.comment",
			styles = {
				link = "Comment",
			},
		},
		{
			group = "@lsp.typemod.variable.globalScope",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "@lsp.type.decorator",
			styles = {
				link = "@attribute",
			},
		},
		{
			group = "@lsp.type.enum",
			styles = {
				link = "Type",
			},
		},
		{
			group = "@lsp.type.lifetime",
			styles = {
				link = "@keyword.storage",
			},
		},

		-- RainbowDelimiter
		{
			group = "RainbowDelimiterBlue",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "RainbowDelimiterYellow",
			styles = {
				fg = colors.bright_yellow,
			},
		},
		{
			group = "RainbowDelimiterOrange",
			styles = {
				fg = colors.orange,
			},
		},
		{
			group = "RainbowDelimiterRed",
			styles = {
				fg = colors.red,
			},
		},
		{
			group = "RainbowDelimiterGreen",
			styles = {
				fg = colors.green,
			},
		},
		{
			group = "RainbowDelimiterCyan",
			styles = {
				fg = colors.cyan,
			},
		},
		{
			group = "RainbowDelimiterViolet",
			styles = {
				fg = colors.purple,
			},
		},

		-- GitSigns
		{
			group = "GitSignsCurrentLineBlame",
			styles = {
				link = "NonText",
			},
		},
		{
			group = "GitSignsDelete",
			styles = {
				link = "DiffDelete",
			},
		},
		{
			group = "GitSignsChange",
			styles = {
				link = "DiffChange",
			},
		},
		{
			group = "GitSignsAdd",
			styles = {
				link = "DiffAdd",
			},
		},

		-- Lazy
		{
			group = "LazyProgressTodo",
			styles = {
				bold = true,
				fg = colors.bg_gutter,
			},
		},
		{
			group = "LazyProgressDone",
			styles = {
				bold = true,
				fg = colors.magenta1,
			},
		},

		-- WhichKey
		{
			group = "WhichKeyValue",
			styles = {
				fg = colors.fg_dark,
			},
		},
		{
			group = "WhichKeyFloat",
			styles = {
				bg = colors.bg_dark,
			},
		},
		{
			group = "WhichKeySeparator",
			styles = {
				fg = colors.comment,
			},
		},
		{
			group = "WhichKeySeperator",
			styles = {
				fg = colors.comment,
			},
		},
		{
			group = "WhichKeyDesc",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "WhichKeyGroup",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "WhichKey",
			styles = {
				fg = colors.cyan,
			},
		},

		-- Telescope
		{
			group = "TelescopeNormal",
			styles = {
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			group = "TelescopeBorder",
			styles = {
				bg = colors.bg_dark,
				fg = colors.border,
			},
		},

		-- Indent Blankline
		{
			group = "IblScope",
			styles = {
				fg = colors.purple,
				nocombine = true,
			},
		},
		{
			group = "IblIndent",
			styles = {
				fg = colors.graphite_border,
				nocombine = true,
			},
		},

		-- LspSaga
		{
			group = "SagaVirtLine",
			styles = {
				bg = colors.bg_dark,
				fg = colors.dark_border,
			},
		},
		{
			group = "CodeActionNumber",
			styles = {
				fg = colors.purple,
			},
		},

		{
			group = "DiagnosticShowBorder",
			styles = {
				bg = colors.bg_dark,
				fg = colors.border,
			},
		},
	}
end

return M
