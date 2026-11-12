local require, next = require, next

local M = {}

local PATH = {
	main = "witch.builder.main",
	["blink-cmp"] = "witch.builder.extra.blink-cmp",
	nvimtree = "witch.builder.extra.nvimtree",
	markdown = "witch.builder.extra.markdown",
	terminal = "witch.builder.extra.terminal",
	cmp = "witch.builder.extra.cmp",
	bracket = "witch.builder.extra.bracket",
	dashboard = "witch.builder.extra.dashboard",
	diffview = "witch.builder.extra.diffview",
	indentline = "witch.builder.extra.indentline",
	neotree = "witch.builder.extra.neotree",
	notify = "witch.builder.extra.notify",
	navic = "witch.builder.extra.navic",
	scrollbar = "witch.builder.extra.scrollbar",
	yanky = "witch.builder.extra.yanky",
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
