local type, require, ipairs = type, require, ipairs

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

M.highlight = function(module)
	local theme = require("witch.theme")
	local current_theme_style = theme.get_current_theme_style()

	require("witch.theme").highlight(
		module.syntax,
		module.colors or theme.get_colors(current_theme_style, require("witch.config").get_config()),
		module.on_highlight or require("witch.config").get_config().on_highlight,
		module.name or "unknown"
	)
end

return M
