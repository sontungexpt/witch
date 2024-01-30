local type = type
local require = require
local ipairs = ipairs

local M = {}

M.link_kind = function(prefixs, highlight, kinds)
	kinds = type(kinds) == "table" and kinds or require("stinvimui.theme.kind")
	highlight = highlight or {}

	local function linkPrefix(prefix)
		for kind, hl_opts in pairs(kinds) do
			highlight[prefix .. kind] = hl_opts
		end
	end

	if type(prefixs) == "string" then
		linkPrefix(prefixs)
	elseif type(prefixs) == "table" then
		for _, prefix in ipairs(prefixs) do
			linkPrefix(prefix)
		end
	end

	return highlight
end

return M
