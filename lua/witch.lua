local M = {}

M.setup = function(user_opts) require("witch.theme").setup(require("witch.config").setup(user_opts)) end

return M
