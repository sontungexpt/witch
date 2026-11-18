local type, pairs = type, pairs
local islist = vim.islist

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
            build = "witch.builder.core",
        },

        treesitter = {
            event = "FileType",
            enabled = true,
            build = "witch.builder.core.treesitter",
        },

        lsp = {
            build = "witch.builder.core.lsp",
            event = "LspAttach",
            enabled = true,
        },

        terminal = {
            enabled = true,
            event = "TermOpen",
            build = "witch.builder.core.terminal",
        },

        markup = {
            build = "witch.builder.core.markup",
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

        -- Extra
        ["blink-cmp"] = {
            build = "witch.builder.extra.blink-cmp",
            enabled = true,
            event = { "InsertEnter", "CmdlineEnter" },
        },

        bracket = {
            enabled = true,
            event = "CursorHold",
            build = "witch.builder.extra.bracket",
        },

        indentline = {
            enabled = true,
            event = "CursorHold",
            build = "witch.builder.extra.indentline",
        },

        nvimtree = {
            build = "witch.builder.extra.nvimtree",
            ft = "NvimTree",
        },

        cmp = {
            event = { "InsertEnter", "CmdlineEnter" },
            build = "witch.builder.extra.cmp",
        },

        dap = {
            build = "witch.builder.extra.dap",
        },

        notify = {
            event = "CursorHold",
            build = "witch.builder.extra.notify",
        },

        noice = {
            event = "CursorHold",
            build = "witch.builder.extra.noice",
        },

        navic = {
            event = "LspAttach",
            build = "witch.builder.extra.navic",
        },
    },
}

--- Deep-merge `user` into `base`.
---
--- - If `base` is `nil`, `user` is used as-is.
--- - If types differ, `user` replaces `base`.
--- - If both are scalars, `user` replaces `base`.
--- - If both are arrays, `user` completely replaces `base`.
--- - If both are maps, they are merged recursively.
---
--- @param base any The base value.
--- @param user any The value to merge into `base`.
--- @return any merged
local function merge(base, user)
    if base == nil then
        return user
    end

    local base_type = type(base)
    if base_type ~= type(user) then
        return user
    elseif base_type ~= "table" then
        return user
    end

    --- @cast base table
    --- @cast user table

    -- Replace arrays entirely.
    if islist(base) or islist(user) then
        return user
    end

    -- Recursively merge maps.
    for k, v in pairs(user) do
        base[k] = merge(base[k], v)
    end

    return base
end

--- @class witch.ConfigMeta
--- @field __index witch.Config
--- @field __newindex fun(self: witch.ConfigMeta, key: string, value: any)
--- @field __call fun(self: witch.ConfigMeta, override: table|nil): witch.ConfigMeta

--- @type witch.ConfigMeta
local mt = {
    __index = config,

    __newindex = function(_, _, _)
        error("config is read-only")
    end,
    _metatable = false,
    --- Merge user options into the config and return the proxy.
    ---
    --- Calling with `nil` returns the proxy unchanged.
    --- Calling with a table deep-merges it into the config.
    ---
    --- @param self witch.ConfigMeta The proxy table.
    --- @param override table|nil User options to merge.
    --- @return witch.ConfigMeta self The proxy table (for chaining).
    __call = function(self, override)
        if override == nil then
            return self
        end
        for k, v in pairs(override) do
            config[k] = merge(config[k], v)
        end
        return self
    end,
}

return setmetatable({}, mt)
