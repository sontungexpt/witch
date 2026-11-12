local vim = vim
local type, require, ipairs, pairs = type, require, ipairs, pairs
local g, api = vim.g, vim.api
local nvim_set_hl, autocmd, augroup = api.nvim_set_hl, api.nvim_create_autocmd, api.nvim_create_augroup

local M = {}
local PLUG_NAME = "witch"

local builder = require("witch.builder")
local config = require("witch.config")
local modules = config.modules

local DEFAULT_PALETTES = {
    ["dark"] = "witch.palette.dark",
    ["light"] = "witch.palette.light",
}
local FALLBACK_PALETTE = "dark"
---@type table<string, Palette>
local PALETTE_DICT = setmetatable({}, {
    __index = function(t, name)
        local found_path = DEFAULT_PALETTES[name]
        local palette = found_path and require(found_path)
            -- The config palette name must be PascalCase (e.g. "DarkPalette")
            or config.palletes[name:gsub("^%l", string.upper)]
        rawset(t, name, palette)
        return palette
    end,
})

local active_palette_name
--- Get the current theme style.
--- @return string
M.active_palette_name = function()
    return active_palette_name or FALLBACK_PALETTE
end

--- Get the current palette.
--- @return Palette
M.active_palette = function()
    return PALETTE_DICT[M.active_palette_name()]
end

--- Cache of already-loaded module names for the current palette.
--- Reset on every palette switch.
---@type table<string, boolean>
local loaded = {}

--- Apply a list of highlight definitions synchronously.
---@param highlights table array of {group_name, opts} or dict {group_name = opts}
---@param palette Palette
---@param palette_name string
---@param module_name string
local function apply_highlights(highlights, palette, palette_name, module_name)
    for i = 1, #highlights do
        local hl = highlights[i]
        local hl_name = hl[1]
        hl[1] = nil -- remove group_name from entry because it is invalid field
        nvim_set_hl(0, hl_name, hl)
    end

    api.nvim_exec_autocmds("User", { pattern = "WitchHighlightDone", data = module_name })
end

--- Load a single theme module by name using the registry.
---@param name string module name
---@param palette Palette
---@param palette_name string
local function load_module(name, palette, palette_name)
    local module = modules[name]
    if not module then
        return
    end

    local b = module.build or builder.require(name)
    if type(b) == "function" then
        local highlights = b(palette, palette_name)
        if type(highlights) == "table" then
            apply_highlights(highlights, palette, palette_name, name)
        end
    end
end


--- Set up lazy loading for all modules with `ft` or `event` triggers.
---
--- Modules with `lazy = false` are loaded immediately.
--- Modules with `ft` are loaded on the matching FileType.
--- Modules with `event` are loaded on the matching event.
--- Modules with neither are left alone (manual `registry.require` only).
---
--- Autocmds use `once = true` and self-destruct after firing.
--- `loaded` is a module-level cache so that already-loaded modules can be
--- re-loaded with the new palette when switching themes.
local function setup_modules()

    --- Normalize `spec.event` into a flat list of `{ event, pattern }` pairs.
    ---
    --- `event_spec` accepts three top-level forms:
    ---
    --- 1. **String** — a single event with the default pattern:
    ---
    ---    ```lua
    ---    "TermOpen"
    ---    -- → { { event = "TermOpen", pattern = "*" } }
    ---    ```
    ---
    --- 2. **Array** — each element is an event name with the default pattern:
    ---
    ---    ```lua
    ---    { "InsertEnter", "CmdlineEnter" }
    ---    -- → { { event = "InsertEnter",  pattern = "*" },
    ---    --     { event = "CmdlineEnter", pattern = "*" } }
    ---    ```
    ---
    --- 3. **Map** — each key is an event name, each value is its pattern:
    ---
    ---    ```lua
    ---    {
    ---        User         = "LazyLoad",            -- single pattern
    ---        FileType     = { "lua", "python" },   -- multiple patterns
    ---        BufReadPost  = true,                  -- non-string/table → "*"
    ---    }
    ---    -- → { { event = "User",        pattern = "LazyLoad" },
    ---    --     { event = "FileType",    pattern = "lua" },
    ---    --     { event = "FileType",    pattern = "python" },
    ---     --     { event = "BufReadPost", pattern = "*" } }
    ---    ```
    ---
    --- A single table can also **mix array elements and map entries**:
    ---
    ---    ```lua
    ---    {
    ---        "InsertEnter",                        -- array element → "*"
    ---        User        = "LazyLoad",             -- map entry → "LazyLoad"
    ---        FileType    = { "lua", "python" },    -- map entry → two patterns
    ---        BufReadPost = true,                   -- map entry → "*"
    ---    }
    ---    ```
    ---
    --- **Rules:**
    ---   - Array elements (numeric keys) contribute an event with `pattern = "*"`.
    ---   - Map entries (string keys) contribute an event whose pattern is:
    ---       - the string value, if the value is a string;
    ---       - each element, if the value is an array of strings;
    ---       - `"*"`, for any other value type.
    ---   - Keys that are neither numbers nor strings are ignored.
    ---
    --- @param event_spec string|table The event specification from a module.
    --- @return table[] pairs A flat list of `{ event: string, pattern: string }`.
    local function normalize_events(event_spec)
        if type(event_spec) == "string" then
            return { { event = event_spec, pattern = "*" } }
        end

        if type(event_spec) ~= "table" then
            return {}
        end

        local result = {}
        local n = 0

        for ev, pattern in pairs(event_spec) do
            local ev_type = type(ev)
            if ev_type == "number" then
                -- Array element: event name, default pattern.
                n = n + 1
                result[n] = { event = pattern, pattern = "*" }
            elseif ev_type == "string" then
                local pattern_type = type(pattern)
                -- Map entry: event → pattern (string | array | fallback "*").
                if pattern_type == "string" then
                    n = n + 1
                    result[n] = { event = ev, pattern = pattern }
                elseif pattern_type == "table" then
                    for j = 1, #pattern do
                        n = n + 1
                        result[n] = { event = ev, pattern = pattern[j] }
                    end
                else
                    n = n + 1
                    result[n] = { event = ev, pattern = "*" }
                end
            end
        end

        return result
    end


    local group = augroup(PLUG_NAME, { clear = true })
    for name, mod in pairs(modules) do
        if not mod.enabled then
            goto continue
        end

        -- Immediate load
        if mod.lazy == false then
            if not loaded[name] then
                loaded[name] = true
                load_module(name, M.active_palette(), M.active_palette_name())
            end
            goto continue
        end

        -- FileType trigger
        if mod.ft then
            local fts = type(mod.ft) == "table" and mod.ft or { mod.ft }
            autocmd("FileType", {
                group = group,
                pattern = fts,
                once = true,
                callback = function()
                    if not loaded[name] then
                        loaded[name] = true
                        load_module(name, M.active_palette(), M.active_palette_name())
                    end
                end,
            })
        end

        -- Event trigger (lazy.nvim-style)
        if mod.event then
            local events = normalize_events(mod.event)
            for _, ev in ipairs(events) do
                autocmd(ev.event, {
                    group = group,
                    pattern = ev.pattern,
                    once = true,
                    callback = function()
                        if not loaded[name] then
                            loaded[name] = true
                            load_module(name, M.active_palette(), M.active_palette_name())
                        end
                    end,
                })
            end
        end

        ::continue::
    end
end

--- Enable the :Witch <style> user command.
M.enable_switcher = function()
    api.nvim_create_user_command("Witch", function(args)
        M.load_palette(args.args)
    end, { nargs = 1, force = true })
end

--- Load the theme with the given configuration and style.
---@param palette_name string|nil
M.load_palette = function(palette_name)
    ---@type string
    palette_name = palette_name or FALLBACK_PALETTE

    if active_palette_name == palette_name then
        return
    end

    --- Clear the highlight cache and reload the theme.
    if g.colors_name then
        api.nvim_command("hi clear")
    end

    local active_palette = PALETTE_DICT[palette_name]
    if active_palette then
        active_palette_name = palette_name
    else
        active_palette = PALETTE_DICT[FALLBACK_PALETTE]
        active_palette_name = FALLBACK_PALETTE
    end

    -- Re-load modules that were already loaded under the previous palette.
    for name in pairs(loaded) do
        loaded[name] = true
        load_module(name, active_palette, active_palette_name)
    end

    g.colors_name = PLUG_NAME .. "-" .. active_palette_name
end

--- Set up the Witch plugin.
---@param opts table|nil
M.setup = function(opts)
    if opts then
        config(opts)
    end
    vim.o.termguicolors = true

    M.load_palette(config.palette)
    setup_modules()

    if config.switcher then
        M.enable_switcher()
    end
end

return M
