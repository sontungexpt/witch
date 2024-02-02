local theme = require("witch.theme")
local config = require("witch.config")

local M = {}

M.setup = function(user_opts)
	local configs = config.setup(user_opts)
	theme.setup(configs)
end

return M
