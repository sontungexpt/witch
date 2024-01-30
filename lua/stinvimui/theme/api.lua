local type = type
local require = require
local ipairs = ipairs

local M = {}

M.link_kind = function(formatable_strings, highlight, kinds)
	kinds = type(kinds) == "table" and kinds or require("stinvimui.theme.kind")
	highlight = highlight or {}

	local function linkPrefix(formatable_string)
		for kind, hl_opts in pairs(kinds) do
			highlight[formatable_string:format(kind)] = hl_opts
		end
	end

	if type(formatable_strings) == "string" then
		linkPrefix(formatable_strings)
	elseif type(formatable_strings) == "table" then
		for _, formatable_string in ipairs(formatable_strings) do
			linkPrefix(formatable_string)
		end
	end

	return highlight
end

return M
