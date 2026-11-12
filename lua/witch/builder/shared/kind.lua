
local M = {}

--- Default LSP Completion Kinds mapped for maximum visual hierarchy and beauty.
--- Leverages Neovim's fallback mechanism: @lsp.type.* -> @treesitter -> Vim Classic.
--- @type table<string, table>
local default_kinds = {
	-- Data Structures and Types (Usually Yellow/Teal)
	Class = { link = "@lsp.type.class" },
	Enum = { link = "@lsp.type.enum" },
	Interface = { link = "@lsp.type.interface" },
	Struct = { link = "@lsp.type.struct" },
	TypeParameter = { link = "@lsp.type.typeParameter" },
	Object = { link = "@type" },
	Unit = { link = "@lsp.type.struct" },

	-- Callables and Functions (Usually Blue)
	Function = { link = "@lsp.type.function" },
	Method = { link = "@lsp.type.method" },
	Constructor = { link = "@constructor" },
	Event = { link = "@lsp.type.event" },

	-- Variables and Properties (Usually Standard Text Color)
	Variable = { link = "@lsp.type.variable" },
	Field = { link = "@variable.member" },
	Property = { link = "@lsp.type.property" },
	Key = { link = "@property" },
	Reference = { link = "@variable" },

	-- Constants and Literals (Usually Orange/Peach)
	Constant = { link = "@constant" },
	EnumMember = { link = "@lsp.type.enumMember" },
	Value = { link = "@constant" },
	Boolean = { link = "@boolean" },
	Number = { link = "@number" },
	String = { link = "@string" },
	Color = { link = "@string.special" },
	Null = { link = "@constant.builtin" },

	-- Modules and Imports (Usually Cyan/Purple)
	Module = { link = "@module" },
	Namespace = { link = "@lsp.type.namespace" },
	Package = { link = "@module" },

	-- Keywords and Misc
	Keyword = { link = "@lsp.type.keyword" },
	Operator = { link = "@operator" },
	Array = { link = "@punctuation.bracket" },

	-- Files, Folders, and Text
	File = { link = "@text" },
	Folder = { link = "Directory" },
	Text = { link = "@text" },
	Snippet = { link = "Conceal" },
}

--- Precompute kind-based highlight links into an array of flat specs.
---
--- Each entry is `{ "GroupName", link = "Target" }` — no nested table.
---
---@param formatable_strings string|string[] Format strings like "CmpItemKind%s".
---@param highlight table[] Array of `{ name, ...spec }` to append to.
---@param kinds table|nil Kind definitions (default: `default_kinds`).
---@return table[] highlight The mutated array.
M.link_kind = function(formatable_strings, highlight, kinds)
	kinds = type(kinds) == "table" and kinds or default_kinds
	local ipairs, pairs = ipairs, pairs

	local function link_prefix(formatable_string)
		for kind, hl_opts in pairs(kinds) do
			local entry = { formatable_string:format(kind) }
			-- Copy options (e.g., link = "@type") into the entry
			for k, v in pairs(hl_opts) do
				entry[k] = v
			end
			highlight[#highlight + 1] = entry
		end
	end

	local formatable_strings_type = type(formatable_strings)
	if formatable_strings_type == "string" then
		link_prefix(formatable_strings)
	elseif formatable_strings_type == "table" then
		for _, formatable_string in ipairs(formatable_strings) do
			link_prefix(formatable_string)
		end
	end

	return highlight
end

return M
