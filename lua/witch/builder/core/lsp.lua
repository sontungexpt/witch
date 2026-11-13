return function(palette, palette_name)
	return {
		-- ====================================================================
		-- LSP references / code lens / signature
		-- ====================================================================

		-- References remain subtle and do not recolor entire lines.
		{ "LspReferenceText", underline = true, sp = palette.border },
		{ "LspReferenceRead", link = "LspReferenceText" },
		{ "LspReferenceWrite", underline = true, sp = palette.property },

		-- Signature parameter emphasis without a background.
		{
			"LspSignatureActiveParameter",
			fg = palette.parameter,
			underline = true,
			sp = palette.parameter,
		},

		{ "LspCodeLens", fg = palette.comment },
		{ "LspCodeLensSeparator", fg = palette.border_subtle },
		{ "LspInfoBorder", link = "FloatBorder" },

		-- ====================================================================
		-- Diagnostics
		-- ====================================================================

		{ "DiagnosticError", fg = palette.error },
		{ "DiagnosticWarn", fg = palette.warn },
		{ "DiagnosticInfo", fg = palette.info },
		{ "DiagnosticHint", fg = palette.hint },
		{ "DiagnosticUnnecessary", fg = palette.unnecessary },

		-- Virtual text.
		{ "DiagnosticVirtualTextError", link = "DiagnosticError" },
		{ "DiagnosticVirtualTextWarn", link = "DiagnosticWarn" },
		{ "DiagnosticVirtualTextInfo", link = "DiagnosticInfo" },
		{ "DiagnosticVirtualTextHint", link = "DiagnosticHint" },

		-- Undercurl: severity without large colored backgrounds.
		{ "DiagnosticUnderlineError", undercurl = true, sp = palette.error },
		{ "DiagnosticUnderlineWarn", undercurl = true, sp = palette.warn },
		{ "DiagnosticUnderlineInfo", undercurl = true, sp = palette.info },
		{ "DiagnosticUnderlineHint", undercurl = true, sp = palette.hint },

		-- Floating diagnostics.
		{ "DiagnosticFloatingError", link = "DiagnosticError" },
		{ "DiagnosticFloatingWarn", link = "DiagnosticWarn" },
		{ "DiagnosticFloatingInfo", link = "DiagnosticInfo" },
		{ "DiagnosticFloatingHint", link = "DiagnosticHint" },

		-- Diagnostic signs.
		{ "DiagnosticSignError", link = "DiagnosticError" },
		{ "DiagnosticSignWarn", link = "DiagnosticWarn" },
		{ "DiagnosticSignInfo", link = "DiagnosticInfo" },
		{ "DiagnosticSignHint", link = "DiagnosticHint" },

		-- ====================================================================
		-- LSP semantic tokens
		-- ====================================================================

		-- Variables and members.
		{ "@lsp.type.variable", link = "Identifier" },
		{ "@lsp.type.parameter", link = "@variable.parameter" },
		{ "@lsp.type.property", link = "@property" },
		{ "@lsp.type.namespace", link = "@module" },
		{ "@lsp.type.selfKeyword", link = "@variable.builtin" },

		{ "@lsp.typemod.variable.globalScope", link = "Identifier" },
		{ "@lsp.typemod.variable.defaultLibrary", link = "@variable.builtin" },
		{ "@lsp.typemod.variable.injected", link = "Identifier" },
		{ "@lsp.typemod.variable.static", link = "Identifier" },
		{ "@lsp.typemod.variable.readonly", link = "Constant" },

		{ "@lsp.typemod.property.injected", link = "@property" },

		-- Types.
		{ "@lsp.type.interface", link = "Type" },
		{ "@lsp.type.class", link = "Type" },
		{ "@lsp.type.enum", link = "Type" },
		{ "@lsp.type.struct", link = "Type" },
		{ "@lsp.type.type", link = "Type" },
		{ "@lsp.type.typeAlias", link = "Type" },
		{ "@lsp.type.typeParameter", link = "Type" },
		{ "@lsp.type.generic", link = "Type" },
		{ "@lsp.type.concept", link = "Type" },
		{ "@lsp.type.selfTypeKeyword", link = "Type" },

		{ "@lsp.type.builtinType", link = "@type.builtin" },
		{ "@lsp.typemod.class.defaultLibrary", link = "@type.builtin" },
		{ "@lsp.typemod.enum.defaultLibrary", link = "@type.builtin" },
		{ "@lsp.typemod.struct.defaultLibrary", link = "@type.builtin" },
		{ "@lsp.typemod.type.defaultLibrary", link = "@type.builtin" },
		{ "@lsp.typemod.typeAlias.defaultLibrary", link = "@type.builtin" },
		{ "@lsp.typemod.type.injected", link = "Type" },

		-- Functions.
		{ "@lsp.type.function", link = "Function" },
		{ "@lsp.type.method", link = "Function" },

		{ "@lsp.typemod.function.defaultLibrary", link = "@function.builtin" },
		{ "@lsp.typemod.method.defaultLibrary", link = "@function.builtin" },

		{ "@lsp.typemod.function.injected", link = "Function" },
		{ "@lsp.typemod.method.injected", link = "Function" },

		-- Keywords and modifiers.
		{ "@lsp.type.keyword", link = "Keyword" },
		{ "@lsp.type.modifier", link = "Keyword" },
		{ "@lsp.type.lifetime", link = "Keyword" },

		{ "@lsp.typemod.keyword.async", link = "Keyword" },
		{ "@lsp.typemod.keyword.injected", link = "Keyword" },

		-- Literals.
		{ "@lsp.type.boolean", link = "Boolean" },
		{ "@lsp.type.number", link = "Number" },
		{ "@lsp.type.string", link = "String" },

		{ "@lsp.type.escapeSequence", link = "SpecialChar" },
		{ "@lsp.type.formatSpecifier", link = "SpecialChar" },
		{ "@lsp.type.regexp", link = "SpecialChar" },

		{ "@lsp.typemod.string.injected", link = "String" },

		-- Constants.
		{ "@lsp.type.enumMember", link = "Constant" },
		{ "@lsp.typemod.enumMember.defaultLibrary", link = "Constant" },

		-- Members.
		{ "@lsp.type.event", link = "@property" },

		-- Comments and preprocessor.
		{ "@lsp.type.comment", link = "Comment" },
		{ "@lsp.type.annotation", link = "PreProc" },
		{ "@lsp.type.decorator", link = "PreProc" },
		{ "@lsp.type.deriveHelper", link = "PreProc" },
		{ "@lsp.type.macro", link = "Macro" },

		{ "@lsp.typemod.macro.defaultLibrary", link = "Macro" },
		{ "@lsp.typemod.macro.injected", link = "Macro" },

		-- Operators.
		{ "@lsp.type.operator", link = "Operator" },
		{ "@lsp.typemod.operator.injected", link = "Operator" },

		-- Unresolved references.
		{ "@lsp.type.unresolvedReference", link = "DiagnosticUnderlineError" },

		-- ====================================================================
		-- LspSaga
		-- ====================================================================

		{ "SagaVirtLine", bg = palette.bg_float, fg = palette.fg_muted },

		{ "CodeActionNumber", fg = palette.purple },
		{ "DiagnosticShowBorder", link = "FloatBorder" },
	}
end
