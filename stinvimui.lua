local theme = require("stinvimui.theme")
local config = require("stinvimui.config")

local M = {}

M.setup = function(user_opts)
	local configs = config.setup(user_opts)
	theme.setup(configs)
end

return M
