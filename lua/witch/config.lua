local type, pairs = type, pairs
local islist = vim.islist

--- @alias CustomPaletteName string

--- @class witch.Config.Module
--- @field enabled? boolean Whether the module is enabled.
--- @field build? fun(palette: witch.Palette, palette_name: string): table[] The highlight builder function.
--- @field lazy? boolean If `false`, the module is loaded immediately during setup.
--- @field ft? string|string[] Filetype(s) that trigger loading.
---
--- Event(s) that trigger loading.
--- `event` supports lazy.nvim-style forms:
---   - `"TermOpen"` — single event, default pattern.
---   - `{ "InsertEnter", "CmdlineEnter" }` — multiple events, default pattern.
---   - `{ User = "LazyLoad" }` — event → pattern.
---   - `{ User = { "LazyLoad", "VeryLazy" } }` — event → multiple patterns.
---   - `{ InsertEnter = true }` — non-string/non-table value → default pattern.
--- @field event? string|string[]|table<string, string|string[]>
---

--- @class witch.Config
--- @field palette string Active palette name.
--- @field modules table<string, witch.Config.Module> Per-module configuration overrides.
--- @field palletes table<CustomPaletteName, witch.Palette> User-defined custom palettes. the keys must be PascalCase (e.g., "DarkPalette").
--- @field dim witch.Config.Dim Configuration for dimming inactive windows.

--- @class witch.Config.Dim
--- @field enabled boolean Whether dimming is active.
--- @field level number Dim level from `0` to `1`.
--- @field excluded table{ filetypes: table<string, boolean>, buftypes: table<string, boolean> } Buffers excluded from dimming.
--- @field fade_bg boolean Whether to also fade background groups.

--- @type witch.Config
local config = {
    palette = "umber",
    palletes = {},
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
