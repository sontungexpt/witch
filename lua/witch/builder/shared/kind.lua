local type, require, ipairs, pairs = type, require, ipairs, pairs

local M = {}

local default_kinds = {
	Array = { link = "@punctuation.bracket" },
	Boolean = { link = "@boolean" },
	Class = { link = "@type" },
	Color = { link = "Special" },
	Constant = { link = "@constant" },
	Constructor = { link = "@constructor" },
	Enum = { link = "@lsp.type.enum" },
	EnumMember = { link = "@lsp.type.enumMember" },
	Event = { link = "Special" },
	Field = { link = "@variable.member" },
	File = { link = "Normal" },
	Folder = { link = "Directory" },
	Function = { link = "@function" },
	Interface = { link = "@lsp.type.interface" },
	Key = { link = "@variable.member" },
	Keyword = { link = "@lsp.type.keyword" },
	Method = { link = "@function.method" },
	Module = { link = "@module" },
	Namespace = { link = "@module" },
	Null = { link = "@constant.builtin" },
	Number = { link = "@number" },
	Object = { link = "@constant" },
	Operator = { link = "@operator" },
	Package = { link = "@module" },
	Property = { link = "@property" },
	Reference = { link = "@markup.link" },
	Snippet = { link = "Conceal" },
	String = { link = "@string" },
	Struct = { link = "@lsp.type.struct" },
	Unit = { link = "@lsp.type.struct" },
	Text = { link = "@markup" },
	TypeParameter = { link = "@lsp.type.typeParameter" },
	Variable = { link = "@variable" },
	Value = { link = "@string" },
}



--- Precompute kind-based highlight links into an array of flat specs.
---
--- Each entry is `{ "GroupName", link = "Target" }` — no nested table.
---
---@param formatable_strings string|string[] Format strings like "CmpItemKind%s".
---@param highlight table[] Array of `{ name, ...spec }` to append to.
---@param kinds table|nil Kind definitions (default: `witch.theme.kind`).
---@return table[] highlight The mutated array.
M.link_kind = function(formatable_strings, highlight, kinds)
	kinds = type(kinds) == "table" and kinds or default_kinds

	local function link_prefix(formatable_string)
		for kind, hl_opts in pairs(kinds) do
			local entry = { formatable_string:format(kind) }
			for k, v in pairs(hl_opts) do
				entry[k] = v
			end
			highlight[#highlight + 1] = entry
		end
	end

	if type(formatable_strings) == "string" then
		link_prefix(formatable_strings)
	elseif type(formatable_strings) == "table" then
		for _, formatable_string in ipairs(formatable_strings) do
			link_prefix(formatable_string)
		end
	end

	return highlight
end

return M
