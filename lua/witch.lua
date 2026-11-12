local vim = vim
local type, require, pairs = type, require, pairs
local g, api = vim.g, vim.api
local nvim_set_hl, autocmd, augroup = api.nvim_set_hl, api.nvim_create_autocmd, api.nvim_create_augroup

local M = {}
local PLUG_NAME = "witch"

local builder = require("witch.builder")
local config = require("witch.config")
local modules = config.modules

local group = augroup(PLUG_NAME, { clear = true })

local DEFAULT_PALETTES = {
    ["dark"] = "witch.palette.dark",
    ["light"] = "witch.palette.light",
    ["umber"] = "witch.palette.umber",
    ["parchment"] = "witch.palette.parchment",
}
local FALLBACK_PALETTE = "dark"

--- @type table<string, Palette>
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
--- Get a sorted list of all available theme names (built-in + custom).
--- @return string[]
local function available_palette_names()
    local names = {}
    local seen = {}

    -- 1. Add built-in themes
    for name, _ in pairs(DEFAULT_PALETTES) do
        names[#names + 1] = name
        seen[name] = true
    end

    -- 2. Add custom themes from config
    if config.palletes then
        for name, _ in pairs(config.palletes) do
            local lower_name = name:gsub("^%u", string.lower)
            if not seen[lower_name] then
                names[#names + 1] = lower_name
                seen[lower_name] = true
            end
        end
    end

    table.sort(names)
    return names
end


local active_palette_name

--- Get the current palette name.
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
--- @type table<string, boolean>
local loaded = {}

--- Load a single theme module by name.
--- @param name string Module name.
--- @param palette Palette The active palette.
--- @param palette_name string The active palette name.
local function load_module(name, palette, palette_name)
    local module = modules[name]
    if not module then
        return
    end

    local b = module.build or builder.require(name)
    if type(b) == "function" then
        local highlights = b(palette, palette_name)

        if type(highlights) == "table" then
            for i = 1, #highlights do
                local hl = highlights[i]
                local hl_name = hl[1]
                hl[1] = nil -- remove group_name from entry because it is invalid field
                nvim_set_hl(0, hl_name, hl)
            end
        end
    end
    api.nvim_exec_autocmds("User", { pattern = "WitchModuleLoaded", data = name })
end

--- A single normalized event entry.
--- @class EventPattern
--- @field event string The event name (e.g. `"InsertEnter"`, `"User"`).
--- @field pattern string The autocmd pattern (e.g. `"*"`, `"LazyLoad"`, `"*.lua"`).

--- Accepted shapes of `spec.event`.
---
--- - `string` — a single event name.
--- - `table` — an array, a map, or a mix of both.
---
--- @alias EventSpec string|table

--- Normalize `spec.event` into a flat list of `{ event, pattern }` pairs.
---
--- Supported forms:
---
--- 1. **String** — a single event with the default pattern:
---    `"TermOpen"` → `{ { "TermOpen", "*" } }`
---
--- 2. **Array** — each element is an event name with the default pattern:
---    `{ "InsertEnter", "CmdlineEnter" }` → two entries with `pattern = "*"`.
---
--- 3. **Map** — each key is an event name, each value is its pattern:
---    - `{ User = "LazyLoad" }` → `{ "User", "LazyLoad" }`
---    - `{ FileType = { "lua", "python" } }` → two `"FileType"` entries
---    - `{ BufReadPost = true }` → `{ "BufReadPost", "*" }`
---
--- A single table may mix array elements and map entries.
---
--- **Rules:**
--- - Numeric keys (array elements) → event name with `pattern = "*"`.
--- - String keys (map entries) → event name with pattern from value:
---   - string → used as-is;
---   - array of strings → one entry per element;
---   - any other type → `"*"`.
--- - Other key types are ignored.
---
--- @param event_spec EventSpec The event specification from a module.
--- @return EventPattern[] pairs A flat list of `{ event, pattern }` entries.
--- @return integer count The number of entries in `pairs`.
local function normalize_events(event_spec)
    local event_spec_type = type(event_spec)
    if event_spec_type == "string" then
        return { { event = event_spec, pattern = "*" } }, 1
    elseif event_spec_type ~= "table" then
        return {}, 0
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

    return result, n
end

--- Set up lazy loading for all modules with `ft` or `event` triggers.
---
--- - Modules with `lazy = false` are loaded immediately.
--- - Modules with `ft` are loaded on the matching `FileType`.
--- - Modules with `event` are loaded on the matching event (lazy.nvim-style).
--- - Modules with none of the above are left alone (manual load only).
---
--- Autocmds use `once = true` and self-destruct after firing.
--- `loaded` is a module-level cache so that already-loaded modules can be
--- re-loaded with the new palette when switching themes.
local function setup_modules()
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
            local events, count = normalize_events(mod.event)
            for i = 1, count do
                local ev = events[i]
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

--- Load the theme with the given palette name.
--- @param palette_name string|nil Palette name. Falls back to `FALLBACK_PALETTE` if `nil`.
M.load_palette = function(palette_name)
    --- @type string
    palette_name = palette_name or FALLBACK_PALETTE

    if active_palette_name == palette_name then
        return
    end

    -- Clear the highlight cache and reload the theme.
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
        load_module(name, active_palette, active_palette_name)
    end

    g.colors_name = PLUG_NAME .. "-" .. active_palette_name

    api.nvim_exec_autocmds("User", { pattern = "WitchPaletteChanged", data = active_palette_name })
end

--- Set up the Witch plugin.
--- @param opts table|nil User configuration options.
M.setup = function(opts)
    if opts then
        config(opts)
    end
    vim.o.termguicolors = true

    M.load_palette(config.palette)
    setup_modules()

    api.nvim_create_user_command("Witch", function(args)
        M.load_palette(vim.trim(args.args))
    end, {
        nargs = 1,
        force = true,
        complete = function(arg_lead)
            return vim.tbl_filter(function(theme)
                return vim.startswith(theme, arg_lead)
            end, available_palette_names())
        end,
    })

    local dim_config = config.dim
    if dim_config.enabled then
        autocmd("WinNew", {
            once = true,
            callback = function()
                local dim = require("witch.dim")
                dim.config(
                    dim_config.excluded,
                    dim_config.level,
                    dim_config.fade_bg
                )
                dim.enable()
                api.nvim_create_user_command("WitchDimToggle", dim.toggle, {
                    desc = "Toggle Witch dimming",
                    force = true
                })
            end,
        })
    end
end

return M
