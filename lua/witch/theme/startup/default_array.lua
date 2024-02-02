local util = require("witch.util")

local M = {}

M.syntax = function(colors, theme_style)
	return {
		{
			"Normal",
			{
				bg = colors.bg,
				fg = colors.fg,
			},
		},
		{
			"NormalNC",
			{
				bg = colors.bg,
				fg = colors.fg,
			},
		},
		{
			"NormalFloat",
			{
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			"StatusLine",
			{
				bg = colors.bg_line,
				fg = colors.fg,
			},
		},
		{
			"StatusLineNC",
			{
				bg = util.darken(colors.bg_line, 0.95),
				fg = colors.fg,
			},
		},
		{
			"WinBarNC",
			{
				link = "StatusLineNC",
			},
		},
		{
			"WinBar",
			{
				link = "StatusLine",
			},
		},
		{
			"TabLine",
			{
				bg = colors.bg_line,
				fg = colors.fg,
			},
		},
		{
			"TabLineSel",
			{
				bg = colors.blue,
				fg = colors.black,
			},
		},
		{
			"SignColumn",
			{},
		},
		{
			"WinSeparator",
			{
				fg = colors.dark_border,
			},
		},
		{
			"VertSplit",
			{
				fg = colors.dark_border,
			},
		},
		{
			"LineNr",
			{
				fg = colors.light_gray,
			},
		},
		{
			"TabLineFill",
			{
				bg = colors.black,
			},
		},
		{
			"CursorLineNr",
			{
				fg = colors.pink,
			},
		},
		{
			"CursorColumn",
			{
				bg = colors.bg_highlight,
			},
		},
		{
			"CursorLine",
			{
				bg = colors.bg_highlight,
			},
		},
		{
			"Pmenu",
			{
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			"PmenuSel",
			{
				bg = colors.bg_highlight,
			},
		},
		{
			"PmenuThumb",
			{},
		},
		{
			"PmenuSbar",
			{
				bg = colors.light_gray,
			},
		},
		{
			"Comment",
			{
				fg = colors.comment,
				italic = true,
			},
		},
		{
			"Question",
			{
				fg = colors.blue,
			},
		},
		{
			"VisualNOS",
			{
				bg = colors.bg_visual,
			},
		},
		{
			"Visual",
			{
				bg = colors.bg_visual,
			},
		},
		{
			"QuickFixLine",
			{
				bg = colors.bg_visual,
				bold = true,
			},
		},
		{
			"PreProc",
			{
				fg = colors.cyan1,
			},
		},
		{
			"Boolean",
			{
				fg = colors.red2,
				italic = true,
			},
		},
		{
			"FloatTitle",
			{
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			"FloatBorder",
			{
				bg = colors.bg_dark,
				fg = colors.border,
			},
		},
		{
			"SpellRare",
			{
				sp = colors.hint,
				undercurl = true,
			},
		},
		{
			"SpellLocal",
			{
				sp = colors.info,
				undercurl = true,
			},
		},
		{
			"SpellCap",
			{
				sp = colors.warn,
				undercurl = true,
			},
		},
		{
			"SpellBad",
			{
				sp = colors.error,
				undercurl = true,
			},
		},
		{
			"MatchParen",
			{
				bold = true,
				fg = colors.orange,
			},
		},
		{
			"Search",
			{
				bg = colors.light_orange,
				fg = colors.black,
			},
		},
		{
			"Substitute",
			{
				bg = colors.red,
				fg = colors.black,
			},
		},
		{
			"FoldColumn",
			{
				bg = colors.bg,
				fg = colors.comment,
			},
		},
		{
			"Folded",
			{
				bg = colors.bg_gutter,
				fg = colors.blue,
			},
		},
		{
			"MsgArea",
			{
				fg = colors.fg_dark,
			},
		},
		{
			"ModeMsg",
			{
				fg = colors.fg_dark,
			},
		},
		{
			"MsgSeparator",
			{
				fg = colors.border,
			},
		},
		{
			"MoreMsg",
			{
				fg = colors.blue,
			},
		},
		{
			"WarningMsg",
			{
				fg = colors.warn,
			},
		},
		{
			"ErrorMsg",
			{
				fg = colors.error,
			},
		},
		{
			"Directory",
			{
				fg = colors.blue,
			},
		},

		{
			"Identifier",
			{
				fg = colors.magenta,
			},
		},
		{
			"Constant",
			{
				fg = colors.orange,
			},
		},
		{
			"Title",
			{
				bold = true,
				fg = colors.orange1,
			},
		},
		{
			"NonText",
			{
				fg = colors.gray,
			},
		},
		{
			"Number",
			{
				fg = colors.orange1,
			},
		},
		{
			"Special",
			{
				fg = colors.orange2,
			},
		},
		{
			"Function",
			{
				fg = colors.blue,
			},
		},
		{
			"Debug",
			{
				fg = colors.orange,
			},
		},
		{
			"Repeat",
			{
				fg = colors.magenta,
			},
		},
		{
			"Conditional",
			{
				fg = colors.magenta,
			},
		},
		{
			"Conceal",
			{
				fg = colors.orange2,
			},
		},
		{
			"Todo",
			{
				bg = colors.yellow,
				fg = colors.bg,
			},
		},
		{
			"Label",
			{
				fg = colors.brown,
			},
		},
		{
			"Statement",
			{
				fg = colors.magenta,
			},
		},
		{
			"Keyword",
			{
				fg = colors.magenta,
			},
		},
		{
			"Type",
			{
				fg = colors.cyan,
			},
		},
		{
			"Character",
			{
				fg = colors.string,
			},
		},
		{
			"String",
			{
				fg = colors.string,
			},
		},
		{
			"WildMenu",
			{
				bg = colors.bg_visual,
			},
		},
		{
			"SpecialKey",
			{
				fg = colors.gray,
			},
		},
		{
			"Whitespace",
			{
				fg = colors.light_gray,
			},
		},
		{
			"Italic",
			{
				italic = true,
			},
		},
		{
			"Underlined",
			{
				underline = true,
			},
		},
		{
			"Bold",
			{
				bold = true,
			},
		},
		{
			"DiffAdd",
			{
				fg = colors.green,
			},
		},
		{
			"DiffText",
			{
				fg = colors.fg_dark,
			},
		},
		{
			"DiffChange",
			{
				fg = colors.orange,
			},
		},
		{
			"DiffDelete",
			{
				fg = colors.red,
			},
		},
		{
			"DiagnosticUnderlineHint",
			{
				sp = colors.hint,
				undercurl = true,
			},
		},
		{
			"DiagnosticUnderlineInfo",
			{
				sp = colors.info,
				undercurl = true,
			},
		},
		{
			"DiagnosticUnderlineWarn",
			{
				sp = colors.warn,
				undercurl = true,
			},
		},
		{
			"DiagnosticUnderlineError",
			{
				sp = colors.error,
				undercurl = true,
			},
		},
		{
			"DiagnosticVirtualTextHint",
			{
				fg = colors.hint,
			},
		},
		{
			"DiagnosticVirtualTextInfo",
			{
				fg = colors.info,
			},
		},
		{
			"DiagnosticVirtualTextWarn",
			{
				fg = colors.warn,
			},
		},
		{
			"DiagnosticVirtualTextError",
			{
				fg = colors.error,
			},
		},
		{
			"DiagnosticUnnecessary",
			{
				fg = colors.unnecessary,
			},
		},
		{
			"DiagnosticHint",
			{
				fg = colors.hint,
			},
		},
		{
			"DiagnosticInfo",
			{
				fg = colors.info,
			},
		},
		{
			"DiagnosticWarn",
			{
				fg = colors.warn,
			},
		},
		{
			"DiagnosticError",
			{
				fg = colors.error,
			},
		},
		{
			"LspCodeLensSeparator",
			{
				fg = colors.border,
			},
		},
		{
			"LspInfoBorder",
			{
				bg = colors.bg_dark,
				fg = colors.border,
			},
		},
		{
			"LspCodeLens",
			{
				fg = colors.gray,
			},
		},
		{
			"LspSignatureActiveParameter",
			{
				bg = colors.bg_gutter,
				bold = true,
			},
		},
		{
			"LspReferenceWrite",
			{
				bg = colors.bg_gutter,
			},
		},
		{
			"LspReferenceRead",
			{
				bg = colors.bg_gutter,
			},
		},
		{
			"LspReferenceText",
			{
				bg = colors.bg_gutter,
			},
		},
		{
			"healthWarning",
			{
				fg = colors.warn,
			},
		},
		{
			"healthSuccess",
			{
				fg = colors.green,
			},
		},
		{
			"healthError",
			{
				fg = colors.error,
			},
		},
		{
			"CurSearch",
			{
				link = "IncSearch",
			},
		},
		{
			"IncSearch",
			{
				bg = colors.orange,
				fg = colors.black,
			},
		},

		{
			"@module",
			{
				link = "Include",
			},
		},
		{
			"@variable",
			{
				fg = colors.fg,
			},
		},
		{
			"@operator",
			{
				fg = colors.operator,
			},
		},
		{
			"@function",
			{
				link = "Function",
			},
		},
		{
			"@function.builtin",
			{
				link = "Special",
			},
		},
		{
			"@type.builtin",
			{
				fg = colors.blue2,
			},
		},
		{
			"@variable.builtin",
			{
				fg = colors.red1,
			},
		},

		{
			"@constant.builtin",
			{
				link = "Special",
			},
		},
		{
			"@tag.delimiter.tsx",
			{
				fg = colors.blue2,
			},
		},
		{
			"@constructor.tsx",
			{
				fg = colors.blue1,
			},
		},
		{
			"@tag.tsx",
			{
				fg = colors.red,
			},
		},
		{
			"@diff.delta",
			{
				link = "DiffChange",
			},
		},
		{
			"@diff.minus",
			{
				link = "DiffDelete",
			},
		},
		{
			"@diff.plus",
			{
				link = "DiffAdd",
			},
		},
		{
			"@punctuation.special.markdown",
			{
				fg = colors.border,
			},
		},
		{
			"@punctuation.special",
			{
				fg = colors.blue,
			},
		},
		{
			"@punctuation.bracket",
			{
				fg = colors.fg_dark,
			},
		},
		{
			"@punctuation.delimiter",
			{
				fg = colors.blue,
			},
		},
		{
			"@module.builtin",
			{
				fg = colors.red1,
			},
		},
		{
			"@variable.member",
			{
				fg = colors.teal,
			},
		},
		{
			"@variable.parameter.builtin",
			{
				fg = colors.yellow,
			},
		},
		{
			"@constructor",
			{
				fg = colors.red,
			},
		},
		{
			"@lsp.type.parameter",
			{
				link = "@variable.parameter",
			},
		},
		{
			"@string.regexp",
			{
				fg = colors.blue,
			},
		},
		{
			"@string.documentation",
			{
				fg = colors.yellow,
			},
		},
		{
			"@type.qualifier",
			{
				link = "Keyword",
			},
		},
		{
			"@comment.todo",
			{
				fg = colors.orange1,
			},
		},
		{
			"@comment.warning",
			{
				fg = colors.warn,
			},
		},
		{
			"@comment.info",
			{
				fg = colors.info,
			},
		},
		{
			"@comment.hint",
			{
				fg = colors.hint,
			},
		},
		{
			"@comment.error",
			{
				fg = colors.error,
			},
		},
		{
			"@tag.delimiter",
			{
				link = "Delimiter",
			},
		},
		{
			"@tag.attribute",
			{
				link = "Identifier",
			},
		},
		{
			"@none",
			{},
		},
		{
			"@namespace.builtin",
			{
				link = "@variable.builtin",
			},
		},
		{
			"@function.method.call",
			{
				link = "Function",
			},
		},
		{
			"@function.method",
			{
				link = "Function",
			},
		},
		{
			"@function.macro",
			{
				link = "Macro",
			},
		},
		{
			"@function.call",
			{
				link = "Function",
			},
		},
		{
			"@conceal",
			{
				link = "Conceal",
			},
		},
		{
			"@annotation",
			{
				link = "PreProc",
			},
		},
		{
			"@keyword.exception",
			{
				link = "Exception",
			},
		},
		{
			"@keyword.coroutine",
			{
				link = "Keyword",
			},
		},
		{
			"@keyword.storage",
			{
				link = "StorageClass",
			},
		},
		{
			"@keyword.repeat",
			{
				link = "Repeat",
			},
		},
		{
			"@keyword.directive",
			{
				link = "PreProc",
			},
		},
		{
			"@keyword.return",
			{
				link = "Keyword",
			},
		},
		{
			"@keyword.operator",
			{
				link = "@operator",
			},
		},
		{
			"@keyword.import",
			{
				link = "Include",
			},
		},
		{
			"@keyword.directive.define",
			{
				link = "Macro",
			},
		},
		{
			"@keyword.debug",
			{
				link = "Debug",
			},
		},
		{
			"@keyword.conditional",
			{
				link = "Conditional",
			},
		},
		{
			"dosIniLabel",
			{
				link = "@property",
			},
		},
		{
			"@property",
			{
				fg = colors.teal,
			},
		},
		{
			"@attribute",
			{
				link = "PreProc",
			},
		},
		{
			"@variable.parameter",
			{
				fg = colors.yellow1,
			},
		},

		{
			"@string.escape",
			{
				fg = colors.magenta1,
			},
		},
		{
			"@comment.note",
			{
				fg = colors.hint,
			},
		},

		{
			"@number.float",
			{
				link = "Float",
			},
		},

		{
			"@lsp.type.selfKeyword",
			{
				link = "@variable.builtin",
			},
		},
		{
			"@lsp.type.generic",
			{
				link = "@variable",
			},
		},
		{
			"@lsp.type.enumMember",
			{
				link = "Constant",
			},
		},
		{
			"@lsp.type.keyword",
			{
				link = "Keyword",
			},
		},
		{
			"@lsp.type.formatSpecifier",
			{
				link = "@markup.list",
			},
		},
		{
			"@lsp.typemod.variable.static",
			{
				link = "Constant",
			},
		},
		{
			"@lsp.typemod.variable.injected",
			{
				link = "Identifier",
			},
		},
		{
			"@lsp.typemod.variable.defaultLibrary",
			{
				link = "@variable.builtin",
			},
		},
		{
			"@lsp.typemod.variable.callable",
			{
				link = "@function",
			},
		},
		{
			"@lsp.typemod.typeAlias.defaultLibrary",
			{
				fg = colors.blue2,
			},
		},
		{
			"@lsp.typemod.type.defaultLibrary",
			{
				fg = colors.blue2,
			},
		},
		{
			"@lsp.typemod.struct.defaultLibrary",
			{
				link = "@type.builtin",
			},
		},
		{
			"@lsp.typemod.string.injected",
			{
				link = "@string",
			},
		},
		{
			"@lsp.typemod.operator.injected",
			{
				link = "@operator",
			},
		},
		{
			"@lsp.typemod.method.defaultLibrary",
			{
				link = "@function.builtin",
			},
		},
		{
			"@lsp.typemod.macro.defaultLibrary",
			{
				link = "@function.builtin",
			},
		},
		{
			"@lsp.typemod.keyword.injected",
			{
				link = "@keyword",
			},
		},
		{
			"@lsp.typemod.keyword.async",
			{
				link = "@keyword.coroutine",
			},
		},
		{
			"@lsp.typemod.function.defaultLibrary",
			{
				link = "@function.builtin",
			},
		},
		{
			"@lsp.typemod.enumMember.defaultLibrary",
			{
				link = "@constant.builtin",
			},
		},
		{
			"@lsp.typemod.enum.defaultLibrary",
			{
				link = "@type.builtin",
			},
		},
		{
			"@lsp.typemod.class.defaultLibrary",
			{
				link = "@type.builtin",
			},
		},
		{
			"@lsp.type.variable",
			{},
		},
		{
			"@lsp.type.unresolvedReference",
			{
				sp = colors.error,
				undercurl = true,
			},
		},
		{
			"@lsp.type.typeAlias",
			{
				link = "@type.definition",
			},
		},
		{
			"@lsp.type.string",
			{
				link = "@string",
			},
		},
		{
			"@lsp.type.selfTypeKeyword",
			{
				link = "@variable.builtin",
			},
		},
		{
			"@lsp.type.property",
			{
				link = "@property",
			},
		},
		{
			"@lsp.type.operator",
			{
				link = "@operator",
			},
		},
		{
			"@lsp.type.number",
			{
				link = "Number",
			},
		},
		{
			"@lsp.type.namespace",
			{
				link = "@module",
			},
		},
		{
			"@lsp.type.interface",
			{
				fg = colors.blue2,
			},
		},
		{
			"@lsp.type.escapeSequence",
			{
				link = "@string.escape",
			},
		},
		{
			"@lsp.type.deriveHelper",
			{
				link = "@attribute",
			},
		},
		{
			"@lsp.type.builtinType",
			{
				link = "@type.builtin",
			},
		},
		{
			"@lsp.type.boolean",
			{
				link = "Boolean",
			},
		},
		{
			"@lsp.type.comment",
			{
				link = "Comment",
			},
		},
		{
			"@lsp.typemod.variable.globalScope",
			{
				fg = colors.magenta,
			},
		},
		{
			"@lsp.type.decorator",
			{
				link = "@attribute",
			},
		},
		{
			"@lsp.type.enum",
			{
				link = "Type",
			},
		},
		{
			"@lsp.type.lifetime",
			{
				link = "@keyword.storage",
			},
		},

		-- RainbowDelimiter
		{
			"RainbowDelimiterBlue",
			{
				fg = colors.blue,
			},
		},
		{
			"RainbowDelimiterYellow",
			{
				fg = colors.bright_yellow,
			},
		},
		{
			"RainbowDelimiterOrange",
			{
				fg = colors.orange,
			},
		},
		{
			"RainbowDelimiterRed",
			{
				fg = colors.red,
			},
		},
		{
			"RainbowDelimiterGreen",
			{
				fg = colors.green,
			},
		},
		{
			"RainbowDelimiterCyan",
			{
				fg = colors.cyan,
			},
		},
		{
			"RainbowDelimiterViolet",
			{
				fg = colors.purple,
			},
		},

		-- GitSigns
		{
			"GitSignsCurrentLineBlame",
			{
				link = "NonText",
			},
		},
		{
			"GitSignsDelete",
			{
				link = "DiffDelete",
			},
		},
		{
			"GitSignsChange",
			{
				link = "DiffChange",
			},
		},
		{
			"GitSignsAdd",
			{
				link = "DiffAdd",
			},
		},

		-- Lazy
		{
			"LazyProgressTodo",
			{
				bold = true,
				fg = colors.bg_gutter,
			},
		},
		{
			"LazyProgressDone",
			{
				bold = true,
				fg = colors.magenta1,
			},
		},

		-- WhichKey
		{
			"WhichKeyValue",
			{
				fg = colors.fg_dark,
			},
		},
		{
			"WhichKeyFloat",
			{
				bg = colors.bg_dark,
			},
		},
		{
			"WhichKeySeparator",
			{
				fg = colors.comment,
			},
		},
		{
			"WhichKeySeperator",
			{
				fg = colors.comment,
			},
		},
		{
			"WhichKeyDesc",
			{
				fg = colors.magenta,
			},
		},
		{
			"WhichKeyGroup",
			{
				fg = colors.blue,
			},
		},
		{
			"WhichKey",
			{
				fg = colors.cyan,
			},
		},

		-- Telescope
		{
			"TelescopeNormal",
			{
				bg = colors.bg_dark,
				fg = colors.fg_dark,
			},
		},
		{
			"TelescopeBorder",
			{
				bg = colors.bg_dark,
				fg = colors.border,
			},
		},

		-- Indent Blankline
		{
			"IblScope",
			{
				fg = colors.purple,
				nocombine = true,
			},
		},
		{
			"IblIndent",
			{
				fg = colors.graphite_border,
				nocombine = true,
			},
		},

		-- LspSaga
		{
			"SagaVirtLine",
			{
				bg = colors.bg_dark,
				fg = colors.dark_border,
			},
		},
		{
			"CodeActionNumber",
			{
				fg = colors.purple,
			},
		},

		{
			"DiagnosticShowBorder",
			{
				bg = colors.bg_dark,
				fg = colors.border,
			},
		},
	}
end

return M
