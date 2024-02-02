local type = type
local require = require
local ipairs = ipairs

local M = {}

M.link_kind = function(formatable_strings, highlight, kinds)
	kinds = type(kinds) == "table" and kinds or require("witch.theme.kind")

	local function linkPrefix(formatable_string)
		if highlight[1] == nil then
			for kind, hl_opts in pairs(kinds) do
				highlight[formatable_string:format(kind)] = hl_opts
			end
		else
			for kind, hl_opts in pairs(kinds) do
				highlight[#highlight + 1] = {
					formatable_string:format(kind),
					hl_opts,
				}
			end
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
