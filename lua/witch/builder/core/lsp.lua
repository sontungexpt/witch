return function(palette, palette_name)
	return {
		-- ====================================================================
		-- LSP references / code lens / info
		-- ====================================================================
		{ "LspReferenceText", bg = palette.bg_gutter },
		{ "LspReferenceRead", bg = palette.bg_gutter },
		{ "LspReferenceWrite", bg = palette.bg_gutter },
		{ "LspSignatureActiveParameter", bg = palette.bg_gutter, bold = true },
		{ "LspCodeLens", fg = palette.gray },
		{ "LspCodeLensSeparator", fg = palette.border },
		{ "LspInfoBorder", fg = palette.border, bg = palette.bg_float },

		-- ====================================================================
		-- Diagnostic
		-- ====================================================================
		{ "DiagnosticError", fg = palette.error },
		{ "DiagnosticWarn", fg = palette.warn },
		{ "DiagnosticInfo", fg = palette.info },
		{ "DiagnosticHint", fg = palette.hint },
		{ "DiagnosticUnnecessary", fg = palette.unnecessary },
		{ "DiagnosticVirtualTextError", fg = palette.error },
		{ "DiagnosticVirtualTextWarn", fg = palette.warn },
		{ "DiagnosticVirtualTextInfo", fg = palette.info },
		{ "DiagnosticVirtualTextHint", fg = palette.hint },
		{ "DiagnosticUnderlineError", undercurl = true, sp = palette.error },
		{ "DiagnosticUnderlineWarn", undercurl = true, sp = palette.warn },
		{ "DiagnosticUnderlineInfo", undercurl = true, sp = palette.info },
		{ "DiagnosticUnderlineHint", undercurl = true, sp = palette.hint },
		{ "DiagnosticFloatingError", fg = palette.error },
		{ "DiagnosticFloatingWarn", fg = palette.warn },
		{ "DiagnosticFloatingInfo", fg = palette.info },
		{ "DiagnosticFloatingHint", fg = palette.hint },
		{ "DiagnosticSignError", fg = palette.error },
		{ "DiagnosticSignWarn", fg = palette.warn },
		{ "DiagnosticSignInfo", fg = palette.info },
		{ "DiagnosticSignHint", fg = palette.hint },

		-- ====================================================================
		-- LSP semantic tokens — link only to groups defined in main.lua
		-- ====================================================================
		{ "@lsp.type.boolean", link = "Boolean" },
		{ "@lsp.type.builtinType", link = "Type" },
		{ "@lsp.type.class", link = "Type" },
		{ "@lsp.type.comment", link = "Comment" },
		{ "@lsp.type.decorator", link = "PreProc" },
		{ "@lsp.type.deriveHelper", link = "PreProc" },
		{ "@lsp.type.enum", link = "Type" },
		{ "@lsp.type.enumMember", link = "Constant" },
		{ "@lsp.type.escapeSequence", link = "SpecialChar" },
		{ "@lsp.type.formatSpecifier", link = "SpecialChar" },
		{ "@lsp.type.generic", link = "Identifier" },
		{ "@lsp.type.interface", fg = palette.blue2 },
		{ "@lsp.type.keyword", link = "Keyword" },
		{ "@lsp.type.lifetime", link = "StorageClass" },
		{ "@lsp.type.namespace", link = "Include" },
		{ "@lsp.type.number", link = "Number" },
		{ "@lsp.type.operator", link = "Operator" },
		{ "@lsp.type.parameter", link = "Identifier" },
		{ "@lsp.type.property", link = "Identifier" },
		{ "@lsp.type.selfKeyword", link = "Identifier" },
		{ "@lsp.type.selfTypeKeyword", link = "Identifier" },
		{ "@lsp.type.string", link = "String" },
		{ "@lsp.type.struct", link = "Type" },
		{ "@lsp.type.typeAlias", link = "Typedef" },
		{ "@lsp.type.typeParameter", link = "Type" },
		{ "@lsp.type.unresolvedReference", undercurl = true, sp = palette.error },
		{ "@lsp.type.variable", fg = palette.fg },

		-- Extended semantic tokens
		{ "@lsp.type.annotation", link = "PreProc" },
		{ "@lsp.type.concept", link = "Identifier" },
		{ "@lsp.type.event", link = "Type" },
		{ "@lsp.type.function", link = "Function" },
		{ "@lsp.type.macro", link = "Macro" },
		{ "@lsp.type.method", link = "Function" },
		{ "@lsp.type.modifier", link = "Keyword" },
		{ "@lsp.type.regexp", link = "String" },
		{ "@lsp.type.type", link = "Type" },

		-- ====================================================================
		-- LSP typemod — link only to groups defined in main.lua
		-- ====================================================================
		{ "@lsp.typemod.class.defaultLibrary", link = "Type" },
		{ "@lsp.typemod.enum.defaultLibrary", link = "Type" },
		{ "@lsp.typemod.enumMember.defaultLibrary", link = "Constant" },
		{ "@lsp.typemod.function.defaultLibrary", link = "Function" },
		{ "@lsp.typemod.keyword.async", link = "Keyword" },
		{ "@lsp.typemod.keyword.injected", link = "Keyword" },
		{ "@lsp.typemod.macro.defaultLibrary", link = "Macro" },
		{ "@lsp.typemod.method.defaultLibrary", link = "Function" },
		{ "@lsp.typemod.operator.injected", link = "Operator" },
		{ "@lsp.typemod.string.injected", link = "String" },
		{ "@lsp.typemod.struct.defaultLibrary", link = "Type" },
		{ "@lsp.typemod.type.defaultLibrary", fg = palette.blue2 },
		{ "@lsp.typemod.typeAlias.defaultLibrary", fg = palette.blue2 },
		{ "@lsp.typemod.variable.callable", link = "Function" },
		{ "@lsp.typemod.variable.defaultLibrary", link = "Identifier" },
		{ "@lsp.typemod.variable.injected", link = "Identifier" },
		{ "@lsp.typemod.variable.static", link = "Constant" },
		{ "@lsp.typemod.variable.globalScope", fg = palette.magenta },

		-- Extended typemod
		{ "@lsp.typemod.function.injected", link = "Function" },
		{ "@lsp.typemod.macro.injected", link = "Macro" },
		{ "@lsp.typemod.method.injected", link = "Function" },
		{ "@lsp.typemod.property.injected", link = "Identifier" },
		{ "@lsp.typemod.type.injected", link = "Type" },
		{ "@lsp.typemod.variable.readonly", link = "Constant" },

		-- ====================================================================
		-- LspSaga
		-- ====================================================================
		{ "SagaVirtLine", bg = palette.bg_float, fg = palette.dark_border },
		{ "CodeActionNumber", fg = palette.purple },
		{ "DiagnosticShowBorder", bg = palette.bg_float, fg = palette.border },
	}
end
