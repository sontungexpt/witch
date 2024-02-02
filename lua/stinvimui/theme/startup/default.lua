local util = require("stinvimui.util")

local M = {}

M.syntax = function(colors, theme_style)
	return {
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
			group = "@constant.builtin",
			styles = {
				link = "Special",
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
			group = "CursorColumn",
			styles = {
				bg = colors.bg_highlight,
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
			group = "@lsp.type.property",
			styles = {
				link = "@property",
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
			group = "@module",
			styles = {
				link = "Include",
			},
		},
		{
			group = "Question",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "@keyword.storage",
			styles = {
				link = "StorageClass",
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
			group = "@lsp.type.interface",
			styles = {
				fg = colors.blue2,
			},
		},
		{
			group = "PmenuThumb",
			styles = {},
		},
		{
			group = "@variable",
			styles = {
				fg = colors.fg,
			},
		},
		{
			group = "PmenuSbar",
			styles = {
				bg = colors.light_gray,
			},
		},
		{
			group = "@lsp.type.escapeSequence",
			styles = {
				link = "@string.escape",
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
			group = "NormalFloat",
			styles = {
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			group = "@lsp.type.deriveHelper",
			styles = {
				link = "@attribute",
			},
		},
		{
			group = "MoreMsg",
			styles = {
				fg = colors.blue,
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
			group = "Normal",
			styles = {
				bg = colors.bg,
				fg = colors.fg,
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
			group = "Boolean",
			styles = {
				fg = colors.red2,
				italic = true,
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
			group = "DiagnosticShowBorder",
			styles = {
				bg = colors.bg_dark,
				fg = colors.border,
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
			group = "@lsp.type.lifetime",
			styles = {
				link = "@keyword.storage",
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
			group = "WarningMsg",
			styles = {
				fg = colors.warn,
			},
		},
		{
			group = "@tag.delimiter",
			styles = {
				link = "Delimiter",
			},
		},
		{
			group = "RainbowDelimiterBlue",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "@tag.attribute",
			styles = {
				link = "Identifier",
			},
		},
		{
			group = "RainbowDelimiterYellow",
			styles = {
				fg = colors.bright_yellow,
			},
		},
		{
			group = "@keyword.repeat",
			styles = {
				link = "Repeat",
			},
		},
		{
			group = "Repeat",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "@keyword.directive",
			styles = {
				link = "PreProc",
			},
		},
		{
			group = "PreProc",
			styles = {
				fg = colors.cyan1,
			},
		},
		{
			group = "@none",
			styles = {},
		},
		{
			group = "@lsp.type.enum",
			styles = {
				link = "Type",
			},
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
			group = "Function",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "@function.method",
			styles = {
				link = "Function",
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
			group = "@function.macro",
			styles = {
				link = "Macro",
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
			group = "@function.call",
			styles = {
				link = "Function",
			},
		},
		{
			group = "Special",
			styles = {
				fg = colors.orange2,
			},
		},
		{
			group = "DiffText",
			styles = {
				fg = colors.fg_dark,
			},
		},
		{
			group = "@lsp.typemod.variable.globalScope",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "DiffAdd",
			styles = {
				fg = colors.green,
			},
		},
		{
			group = "@lsp.type.decorator",
			styles = {
				link = "@attribute",
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
			group = "Debug",
			styles = {
				fg = colors.orange,
			},
		},
		{
			group = "@keyword.conditional",
			styles = {
				link = "Conditional",
			},
		},
		{
			group = "Conditional",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "@lsp.type.comment",
			styles = {
				link = "Comment",
			},
		},
		{
			group = "@conceal",
			styles = {
				link = "Conceal",
			},
		},
		{
			group = "Conceal",
			styles = {
				fg = colors.orange2,
			},
		},
		{
			group = "@annotation",
			styles = {
				link = "PreProc",
			},
		},
		{
			group = "dosIniLabel",
			styles = {
				link = "@property",
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
			group = "@property",
			styles = {
				fg = colors.teal,
			},
		},
		{
			group = "Italic",
			styles = {
				italic = true,
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
			group = "Underlined",
			styles = {
				underline = true,
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
			group = "Label",
			styles = {
				fg = colors.brown,
			},
		},
		{
			group = "LineNr",
			styles = {
				fg = colors.light_gray,
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
			group = "@attribute",
			styles = {
				link = "PreProc",
			},
		},
		{
			group = "WinBarNC",
			styles = {
				link = "StatusLineNC",
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
			group = "WinBar",
			styles = {
				link = "StatusLine",
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
			group = "TabLineSel",
			styles = {
				bg = colors.blue,
				fg = colors.black,
			},
		},
		{
			group = "TabLineFill",
			styles = {
				bg = colors.black,
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
			group = "@number.float",
			styles = {
				link = "Float",
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
			group = "CursorLineNr",
			styles = {
				fg = colors.pink,
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
			group = "SignColumn",
			styles = {},
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
			group = "ErrorMsg",
			styles = {
				fg = colors.error,
			},
		},
		{
			group = "@lsp.type.selfKeyword",
			styles = {
				link = "@variable.builtin",
			},
		},
		{
			group = "Directory",
			styles = {
				fg = colors.blue,
			},
		},
		{
			group = "CursorLine",
			styles = {
				bg = colors.bg_highlight,
			},
		},
		{
			group = "CodeActionNumber",
			styles = {
				fg = colors.purple,
			},
		},
		{
			group = "SagaVirtLine",
			styles = {
				bg = colors.bg_dark,
				fg = colors.dark_border,
			},
		},
		{
			group = "IblScope",
			styles = {
				fg = colors.purple,
				nocombine = true,
			},
		},
		{
			group = "@lsp.type.generic",
			styles = {
				link = "@variable",
			},
		},
		{
			group = "IblIndent",
			styles = {
				fg = colors.graphite_border,
				nocombine = true,
			},
		},
		{
			group = "@lsp.type.enumMember",
			styles = {
				link = "Constant",
			},
		},
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
		{
			group = "LazyProgressTodo",
			styles = {
				bold = true,
				fg = colors.bg_gutter,
			},
		},
		{
			group = "MsgSeparator",
			styles = {
				fg = colors.border,
			},
		},
		{
			group = "LazyProgressDone",
			styles = {
				bold = true,
				fg = colors.magenta1,
			},
		},
		{
			group = "GitSignsCurrentLineBlame",
			styles = {
				link = "NonText",
			},
		},
		{
			group = "NonText",
			styles = {
				fg = colors.gray,
			},
		},
		{
			group = "GitSignsDelete",
			styles = {
				link = "DiffDelete",
			},
		},
		{
			group = "DiffDelete",
			styles = {
				fg = colors.red,
			},
		},
		{
			group = "GitSignsChange",
			styles = {
				link = "DiffChange",
			},
		},
		{
			group = "DiffChange",
			styles = {
				fg = colors.orange,
			},
		},
		{
			group = "GitSignsAdd",
			styles = {
				link = "DiffAdd",
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
		{
			group = "@lsp.type.keyword",
			styles = {
				link = "Keyword",
			},
		},
		{
			group = "Number",
			styles = {
				fg = colors.orange1,
			},
		},
		{
			group = "RainbowDelimiterGreen",
			styles = {
				fg = colors.green,
			},
		},
		{
			group = "Bold",
			styles = {
				bold = true,
			},
		},
		{
			group = "@lsp.type.formatSpecifier",
			styles = {
				link = "@markup.list",
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
			group = "Title",
			styles = {
				bold = true,
				fg = colors.orange1,
			},
		},
		{
			group = "@lsp.typemod.variable.static",
			styles = {
				link = "Constant",
			},
		},
		{
			group = "Constant",
			styles = {
				fg = colors.orange,
			},
		},
		{
			group = "@lsp.typemod.variable.injected",
			styles = {
				link = "Identifier",
			},
		},
		{
			group = "Identifier",
			styles = {
				fg = colors.magenta,
			},
		},
		{
			group = "@lsp.typemod.variable.defaultLibrary",
			styles = {
				link = "@variable.builtin",
			},
		},
		{
			group = "@variable.builtin",
			styles = {
				fg = colors.red1,
			},
		},
		{
			group = "@lsp.typemod.variable.callable",
			styles = {
				link = "@function",
			},
		},
		{
			group = "@function",
			styles = {
				link = "Function",
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
			group = "@type.builtin",
			styles = {
				fg = colors.blue2,
			},
		},
		{
			group = "@lsp.typemod.string.injected",
			styles = {
				link = "@string",
			},
		},
		{
			group = "PmenuSel",
			styles = {
				bg = colors.bg_highlight,
			},
		},
		{
			group = "@lsp.typemod.operator.injected",
			styles = {
				link = "@operator",
			},
		},
		{
			group = "@operator",
			styles = {
				fg = colors.operator,
			},
		},
		{
			group = "@lsp.typemod.method.defaultLibrary",
			styles = {
				link = "@function.builtin",
			},
		},
		{
			group = "@function.builtin",
			styles = {
				link = "Special",
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
			group = "@keyword.exception",
			styles = {
				link = "Exception",
			},
		},
		{
			group = "@lsp.typemod.keyword.async",
			styles = {
				link = "@keyword.coroutine",
			},
		},
		{
			group = "@keyword.coroutine",
			styles = {
				link = "Keyword",
			},
		},
	}
end

return M
