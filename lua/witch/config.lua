local type, pairs = type, pairs
local islist = vim.islist

local M = {}

--- @type witch.Config
local config = {
    palette = "umber",
    palettes = {},
    dim = {
        enabled = true,
        level = 0.35,
        excluded = {
            filetypes = { NvimTree = true },
            buftypes = { nofile = true, prompt = true, terminal = true },
        },
        fade_bg = true,
    },
    modules = {
        core = {
            lazy = false,
            enabled = true,
        },

        treesitter = {
            event = "FileType",
            enabled = true,
        },

        lsp = {
            event = "LspAttach",
            enabled = true,
        },

        terminal = {
            enabled = true,
            event = "TermOpen",
        },

        markup = {
            enabled = true,
            ft = {
                "markdown",
                "latex",
                "tex",
                "html",
                "typst",
                "org",
                "rst",
                "xml",
                -- "pandoc",
                -- "rmd",
                -- "quarto",
            },
        },

        ["blink-cmp"] = {
            enabled = true,
            event = { "InsertEnter", "CmdlineEnter" },
        },

        bracket = {
            enabled = true,
            event = "CursorHold",
        },

        indentline = {
            enabled = true,
            event = "CursorHold",
        },


        nvimtree = {
            ft = "NvimTree",
        },

        cmp = {
            event = { "InsertEnter", "CmdlineEnter" },
        },

        dap = {
        },

        notify = {
            event = "CursorHold"
        },

        noice = {
            event = "CursorHold"
        },

        navic = {
            event = "LspAttach"
        },
    },
}
M.current = config

--- Deep-merge `user` into `base`, preserving type consistency.
---
--- - If `base` is `nil`, `user` is used as-is (new field).
--- - If `base` and `user` have different types, `base` is kept.
--- - If both are scalars of the same type, `user` overrides `base`.
--- - If both are arrays, `user` completely replaces `base`.
--- - If both are maps, they are merged recursively.
---
--- @param base any The base value.
--- @param user any The value to merge into `base`.
--- @return any merged The merged value.
local function merge(base, user)
    if base == nil then
        return user
    end
    if type(base) ~= type(user) then
        return base
    end
    if type(base) ~= "table" then
        return user
    end

    -- Array: completely replace
    if islist(base) and islist(user) then
        return user
    end

    -- Map: deep merge
    for k, v in pairs(user) do
        base[k] = merge(base[k], v)
    end
    return base
end

--- Merge user options into the config and return the updated config.
---
--- @param override table|nil User options to merge.
--- @return witch.Config config The updated config.
M.config = function (override)
    if override == nil then
        return config
    end
    for k, v in pairs(override) do
        config[k] = merge(config[k], v)
    end
    return config
end

return M
