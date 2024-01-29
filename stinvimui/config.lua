local M = {}

local configs = {
	theme = {
		style = "dark", -- "dark" or "light"
		extra = {
			-- bracket = true,
			-- dashboard = true,
			-- diffview = true,
			-- explorer = true,
			-- indentline = true,
		},
		on_highlight = function(stype, colors, highlight) end,
	},
	dim_inactive = false, -- dims inactive windows
	enable_switcher = false,
	-- sidebars = { "qf", "vista_kind", "terminal", "packer" }, -- sidebars to be "dimmed"
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
	return setmetatable({}, {
		__index = configs,
		__newindex = function(_, k, v)
			error(("Attempt to modify key: %s to value: %s, config is read only"):format(tostring(k), tostring(v)), 2)
		end,
	})
end

return M
