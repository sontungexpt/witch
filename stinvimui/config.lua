local type = type
local M = {}

local configs = {
	theme = {
		style = "dark", -- "dark" or "light"
		extras = {
			-- bracket = true,
			-- dashboard = true,
			-- diffview = true,
			-- explorer = true,
			-- indentline = true,
		},
		customs = {
			-- require("stinvimui.theme.example"),
		},
		-- on_highlight = function(stype, colors, highlight) end,
	},
	dim_inactive = false, -- dims inactive windows
	switcher = false,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
	},
}

--- The config properties are read-only
local keep_default_values = function()
	configs.theme.default = "dark"
end

M.setup = function(user_opts)
	M.merge_config(configs, user_opts)
	keep_default_values()

	return configs
end

M.merge_config = function(default_opts, user_opts)
	local default_options_type = type(default_opts)

	if default_options_type == type(user_opts) then
		if default_options_type == "table" and default_opts[1] == nil then
			for k, v in pairs(user_opts) do
				default_opts[k] = M.merge_config(default_opts[k], v)
			end
		else
			default_opts = user_opts
		end
	elseif default_opts == nil then
		default_opts = user_opts
	end
	return default_opts
end

M.get_config = function()
	return require("stinvimui.util").read_only(configs, "Attempt to modify config, this is a read-only table")
end

return M
