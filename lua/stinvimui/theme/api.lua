local type = type
local require = require
local ipairs = ipairs
local api = vim.api
local util = require("stinvimui.util")

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

M.new_dimmed_ns = function(highlight)
	-- local
	local dim_ns = api.nvim_create_namespace("stinvimui_dimmed")

	local global_hls = api.nvim_get_hl(0, {})

	for hl, opts in pairs(global_hls) do
		-- print(hl, vim.inspect(opts))
		-- print(hl, opts)
		local new_opts = vim.deepcopy(opts)
		if new_opts.fg then
			local hex = string.format("#%06x", new_opts.fg)
			new_opts.fg = util.darken(hex, 0.9)
		end
		if opts.bg then
			local hex = string.format("#%06x", new_opts.bg)
			new_opts.bg = util.darken(hex, 0.9)
		end
		api.nvim_set_hl(dim_ns, hl, new_opts)
	end

	return dim_ns
end

return M
