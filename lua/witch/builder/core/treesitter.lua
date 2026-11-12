return function(palette, palette_name)
	return {
		-- ====================================================================
		-- Treesitter — core
		-- ====================================================================
		{ "@variable", fg = palette.fg },
		{ "@variable.builtin", fg = palette.red1 },
		{ "@variable.member", fg = palette.teal },
		{ "@variable.parameter", fg = palette.yellow1 },
		{ "@variable.parameter.builtin", fg = palette.yellow },
		{ "@module", link = "Include" },
		{ "@module.builtin", fg = palette.red1 },
		{ "@namespace.builtin", link = "Identifier" },
		{ "@property", fg = palette.teal },
		{ "@operator", fg = palette.operator },
		{ "@conceal", link = "Conceal" },
		{ "@annotation", link = "PreProc" },
		{ "@attribute", link = "PreProc" },
		{ "@attribute.builtin", link = "PreProc" },
		{ "@label", link = "Label" },
		{ "@none" },
		{ "dosIniLabel", link = "Identifier" },

		-- ====================================================================
		-- Treesitter — functions
		-- ====================================================================
		{ "@function", link = "Function" },
		{ "@function.builtin", link = "Special" },
		{ "@function.call", link = "Function" },
		{ "@function.method", link = "Function" },
		{ "@function.method.call", link = "Function" },
		{ "@function.macro", link = "Macro" },
		{ "@constructor", fg = palette.red },
		{ "@constructor.tsx", fg = palette.blue1 },

		-- ====================================================================
		-- Treesitter — types
		-- ====================================================================
		{ "@type", link = "Type" },
		{ "@type.builtin", fg = palette.blue2 },
		{ "@type.definition", link = "Typedef" },
		{ "@type.qualifier", link = "Keyword" },

		-- ====================================================================
		-- Treesitter — keywords
		-- ====================================================================
		{ "@keyword", link = "Keyword" },
		{ "@keyword.function", link = "Keyword" },
		{ "@keyword.conditional", link = "Conditional" },
		{ "@keyword.conditional.ternary", link = "Conditional" },
		{ "@keyword.coroutine", link = "Keyword" },
		{ "@keyword.debug", link = "Debug" },
		{ "@keyword.directive", link = "PreProc" },
		{ "@keyword.directive.define", link = "Macro" },
		{ "@keyword.exception", link = "Exception" },
		{ "@keyword.import", link = "Include" },
		{ "@keyword.modifier", link = "Keyword" },
		{ "@keyword.operator", link = "Operator" },
		{ "@keyword.repeat", link = "Repeat" },
		{ "@keyword.return", link = "Keyword" },
		{ "@keyword.storage", link = "StorageClass" },
		{ "@keyword.type", link = "Keyword" },

		-- ====================================================================
		-- Treesitter — strings, numbers, constants
		-- ====================================================================
		{ "@string", link = "String" },
		{ "@string.documentation", fg = palette.yellow },
		{ "@string.escape", fg = palette.magenta1 },
		{ "@string.regexp", fg = palette.blue },
		{ "@string.special", link = "SpecialChar" },
		{ "@string.special.path", link = "Underlined" },
		{ "@string.special.symbol", link = "Identifier" },
		{ "@string.special.url", link = "Underlined" },
		{ "@character", link = "Character" },
		{ "@character.special", link = "SpecialChar" },
		{ "@number", link = "Number" },
		{ "@number.float", link = "Float" },
		{ "@boolean", link = "Boolean" },
		{ "@constant", link = "Constant" },
		{ "@constant.builtin", link = "Special" },
		{ "@constant.macro", link = "Macro" },

		-- ====================================================================
		-- Treesitter — comments
		-- ====================================================================
		{ "@comment", link = "Comment" },
		{ "@comment.error", fg = palette.error },
		{ "@comment.hint", fg = palette.hint },
		{ "@comment.info", fg = palette.info },
		{ "@comment.note", fg = palette.hint },
		{ "@comment.todo", fg = palette.todo },
		{ "@comment.warning", fg = palette.warn },

		-- ====================================================================
		-- Treesitter — punctuation
		-- ====================================================================
		{ "@punctuation.bracket", fg = palette.fg_dark },
		{ "@punctuation.delimiter", fg = palette.blue },
		{ "@punctuation.special", fg = palette.blue },
		{ "@punctuation.special.markdown", fg = palette.border },

		-- ====================================================================
		-- Treesitter — tags
		-- ====================================================================
		{ "@tag", link = "Label" },
		{ "@tag.attribute", link = "Identifier" },
		{ "@tag.delimiter", link = "Delimiter" },
		{ "@tag.tsx", fg = palette.red },
		{ "@tag.delimiter.tsx", fg = palette.blue2 },

		-- ====================================================================
		-- Treesitter — markup
		-- ====================================================================
		{ "@markup", link = "@none" },
		{ "@markup.heading", link = "Title" },
		{ "@markup.list", fg = palette.blue },
		{ "@markup.list.checked", fg = palette.green },
		{ "@markup.list.unchecked", fg = palette.red },
		{ "@markup.raw", link = "String" },
		{ "@markup.link", fg = palette.link },
		{ "@markup.link.label", link = "SpecialChar" },
		{ "@markup.link.url", link = "Underlined" },
		{ "@markup.math", link = "Special" },
		{ "@markup.strong", bold = true },
		{ "@markup.emphasis", italic = true },
		{ "@markup.strikethrough", strikethrough = true },
		{ "@markup.underline", underline = true },
		{ "@markup.environment", link = "Macro" },
		{ "@markup.environment.name", link = "Type" },

		-- ====================================================================
		-- Treesitter — diff
		-- ====================================================================
		{ "@diff.plus", link = "DiffAdd" },
		{ "@diff.minus", link = "DiffDelete" },
		{ "@diff.delta", link = "DiffChange" },
	}
end
