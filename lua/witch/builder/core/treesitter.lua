--- @param palette witch.Palette
--- @param palette_name string
return function(palette, palette_name)
	return {
		-- ====================================================================
		-- Variables and members
		-- ====================================================================

		{ "@variable", link = "Identifier" },
		{ "@variable.builtin", fg = palette.variable_builtin },
		{ "@variable.parameter", fg = palette.parameter },
		{ "@variable.parameter.builtin", link = "@variable.parameter" },

		{ "@module", fg = palette.namespace },
		{ "@module.builtin", link = "@module" },

		{ "@property", fg = palette.property },
		{ "@variable.member", link = "@property" },

		{ "@operator", link = "Operator" },

		{ "@conceal", link = "Conceal" },
		{ "@annotation", link = "PreProc" },
		{ "@attribute", link = "PreProc" },
		{ "@attribute.builtin", link = "PreProc" },
		{ "@label", link = "Label" },

		-- ====================================================================
		-- Functions
		-- ====================================================================

		{ "@function", link = "Function" },
		{ "@function.call", link = "Function" },
		{ "@function.method", link = "Function" },
		{ "@function.method.call", link = "Function" },
		{ "@function.builtin", fg = palette.fn_builtin },
		{ "@function.macro", link = "Macro" },

		{ "@constructor", link = "Type" },
		{ "@constructor.tsx", link = "Type" },

		-- ====================================================================
		-- Types
		-- ====================================================================

		{ "@type", link = "Type" },
		{ "@type.builtin", fg = palette.type_builtin },
		{ "@type.qualifier", link = "Keyword" },
		{ "@type.definition", link = "Typedef" },

		-- ====================================================================
		-- Keywords
		-- ====================================================================

		{ "@keyword", link = "Keyword" },
		{ "@keyword.function", link = "Keyword" },
		{ "@keyword.return", link = "Keyword" },
		{ "@keyword.type", link = "Keyword" },
		{ "@keyword.modifier", link = "Keyword" },
		{ "@keyword.coroutine", link = "Keyword" },
		{ "@keyword.import", link = "Keyword" },

		{ "@keyword.conditional", link = "Conditional" },
		{ "@keyword.conditional.ternary", link = "Conditional" },
		{ "@keyword.repeat", link = "Repeat" },
		{ "@keyword.exception", link = "Exception" },
		{ "@keyword.storage", link = "StorageClass" },
		{ "@keyword.operator", link = "Operator" },
		{ "@keyword.debug", link = "Debug" },
		{ "@keyword.directive", link = "PreProc" },
		{ "@keyword.directive.define", link = "Macro" },

		-- ====================================================================
		-- Strings, numbers and constants
		-- ====================================================================

		{ "@string", link = "String" },
		{ "@string.documentation", link = "String" },
		{ "@string.escape", link = "SpecialChar" },
		{ "@string.regexp", link = "SpecialChar" },
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
		-- Comments
		-- ====================================================================

		{ "@comment", link = "Comment" },
		{ "@comment.error", fg = palette.error },
		{ "@comment.note", fg = palette.hint },
		{ "@comment.todo", fg = palette.todo },
		{ "@comment.warning", fg = palette.warn },

		-- ====================================================================
		-- Punctuation
		-- ====================================================================

		{ "@punctuation.bracket", link = "Delimiter" },
		{ "@punctuation.delimiter", link = "Delimiter" },
		{ "@punctuation.special", link = "Special" },

		-- ====================================================================
		-- Tags (HTML, JSX, TSX, XML, Vue, Svelte)
		-- ====================================================================

		{ "@tag", link = "Tag" },
		{ "@tag.attribute", link = "@property" },
		{ "@tag.tsx", link = "Type" },
		{ "@tag.delimiter", link = "Delimiter" },
		{ "@tag.delimiter.tsx", link = "Delimiter" },

		-- ====================================================================
		-- Diff
		-- ====================================================================

		{ "@diff.plus", link = "DiffAdd" },
		{ "@diff.minus", link = "DiffDelete" },
		{ "@diff.delta", link = "DiffChange" },
	}
end
