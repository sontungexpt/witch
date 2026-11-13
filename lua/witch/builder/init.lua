local require, next = require, next

local M = {}

local PATH = {
	core = "witch.builder.core",
	treesitter = "witch.builder.core.treesitter",
	lsp = "witch.builder.core.lsp",
	terminal = "witch.builder.core.terminal",
	markdown = "witch.builder.core.markdown",

	-- Extra
	["blink-cmp"] = "witch.builder.extra.blink-cmp",
	cmp = "witch.builder.extra.cmp",

	nvimtree = "witch.builder.extra.nvimtree",

	indentline = "witch.builder.extra.indentline",
	bracket = "witch.builder.extra.bracket",

	gitsigns = "witch.builder.extra.gitsigns",

	dap = "witch.builder.extra.dap",

	diffview = "witch.builder.extra.diffview",
	notify = "witch.builder.extra.notify",
	navic = "witch.builder.extra.navic",
}


--- Require a module by name.
--- @param name string
--- @return table|nil
M.require = function(name)
	local path = PATH[name]
	if not path then
		return nil
	end
	return require(path)
end

--- Iterator over all module names (including disabled ones).
---
--- Usage:
---   for name in M.iter() do ... end
---
--- @return fun(): string|nil
M.names = function()
	local prev = nil
	return function()
		prev = next(PATH, prev)
		return prev
	end
end

return M
