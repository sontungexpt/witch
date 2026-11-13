local vim = vim
local type, require, pairs = type, require, pairs
local g, api = vim.g, vim.api
local nvim_set_hl, autocmd = api.nvim_set_hl, api.nvim_create_autocmd

local M = {}
local PLUG_NAME = "witch"

local builder = require("witch.builder")
local config = require("witch.config")
local modules = config.modules

--- @class Palette
--- @field [string] integer|string

--- @type table<string, string>
local BUILTIN_PALETTES = {
    ["dark"] = "witch.palette.dark",
    ["light"] = "witch.palette.light",
    ["umber"] = "witch.palette.umber",
    ["parchment"] = "witch.palette.parchment",
    ["nocturne"] = "witch.palette.nocturne",
}
local FALLBACK_PALETTE = "dark"

--- Cache for loaded palettes to avoid redundant require calls.
--- @type table<string, Palette>
local PALETTE_DICT = setmetatable({}, {
    __index = function(t, name)
        local found_path = BUILTIN_PALETTES[name]
        local palette = found_path and require(found_path)
            -- The config palette name must be PascalCase (e.g., "DarkPalette")
            or config.palletes[name:gsub("^%l", string.upper)]
        rawset(t, name, palette)
        return palette
    end,
})

local active_palette_name

--- Get a sorted list of all available theme names (built-in + custom).
--- @return string[]
local function available_palette_names()
    local seen = {}
    for name, _ in pairs(BUILTIN_PALETTES) do
        seen[name] = true
    end

    -- Add custom themes from config
    if config.palletes then
        for name, _ in pairs(config.palletes) do
            --- User provided palette name must be PascalCase (e.g., "DarkPalette")
            if name:match("^%l") then
                seen[name] = true
            end
        end
    end

    local names = vim.tbl_keys(seen)
    table.sort(names)
    return names
end

--- Get the name of the currently active palette.
--- @return string
M.active_palette_name = function()
    return active_palette_name or FALLBACK_PALETTE
end

--- Get the currently active palette table.
--- @return Palette
M.active_palette = function()
    return PALETTE_DICT[M.active_palette_name()]
end

--- Cache of already-loaded module names for the current palette.
--- @type table<string, boolean>
local loaded_modules = {}

--- Load and apply a single theme module by name.
--- @param name string Module name.
--- @param palette Palette The active palette.
--- @param palette_name string The active palette name.
local function load_module(name, palette, palette_name)
    local module = modules[name]
    if not module then
        return
    end

    local build_func = module.build or builder.require(name)
    if type(build_func) == "function" then
        local highlights = build_func(palette, palette_name)

        if type(highlights) == "table" then
            for i = 1, #highlights do
                local hl = highlights[i]
                local hl_name = hl[1]

                -- Remove group_name from the entry because it is an invalid field for nvim_set_hl.
                hl[1] = nil
                nvim_set_hl(0, hl_name, hl)
            end
        end
    end
    api.nvim_exec_autocmds("User", { pattern = "WitchModuleLoaded", data = name })
end

--- Set up lazy loading for all modules based on `ft` or `event` triggers.
--- This batches all filetype and event triggers into single autocmds for performance.
--- @param augroup integer The autocmd group ID to use for the lazy loading autocmds.
local function setup_lazy_modules(augroup)


    --- Filetype → modules. Batched into a single `FileType` autocmd below.
    --- @type table<string, string[]>
    local modules_by_ft = {}

    --- User event name → modules. Batched into a single `User` autocmd below.
    --- @type table<string, string[]>
    local modules_by_user_event = {}

    --- Pattern-less events → modules. Batched into a single autocmd below.
    --- @type table<string, string[]>
    local modules_by_event = {}

    --- Append `name` to a module list keyed by `key` in `bucket`.
    --- @param bucket table<string, string[]>
    --- @param key string
    --- @param name string
    local function register(bucket, key, name)
        local list = bucket[key]
        if not list then
            list = {}
            bucket[key] = list
        end
        list[#list + 1] = name
    end

    --- Keep this function local to avoid polluting the global namespace.
    --- Ensure a module is loaded only once.
    --- @param name string
    local function ensure_loaded(name)
        if loaded_modules[name] then
            return
        end
        loaded_modules[name] = true
        load_module(name, M.active_palette(), M.active_palette_name())
    end

    --- Pop the module list stored at `bucket[key]`, load each module, and
    --- report whether `bucket` is now empty (so the caller can self-destruct
    --- its autocmd).
    --- @param bucket table<string, string[]>
    --- @param key string
    --- @return boolean empty
    local function drain_trigger(bucket, key)
        local names = bucket[key]
        if not names then
            return false
        end
        bucket[key] = nil
        for _, name in ipairs(names) do
            ensure_loaded(name)
        end
        return next(bucket) == nil
    end

    -- 1. Group modules by their triggers, spawn per-module autocmds immediately
    --    for glob pattern events (non-User).
    for name, mod in pairs(modules) do
        if mod.enabled then
            if mod.lazy == false then
                ensure_loaded(name)
            else
                local ft = mod.ft
                local ft_type = type(ft)
                if ft_type == "string" then
                    register(modules_by_ft, ft, name)
                elseif ft_type == "table" then
                    for _, f in ipairs(ft) do
                        register(modules_by_ft, f, name)
                    end
                end

                local event = mod.event
                local event_type = type(event)
                if event_type == "string" then
                    register(modules_by_event, event, name)
                elseif event_type == "table" then
                    for ev, pattern in pairs(event) do
                        local ev_type = type(ev)
                        if ev_type == "number" then
                            -- event = { "InsertEnter", "CmdlineEnter" }
                            ---@cast pattern string
                            register(modules_by_event, pattern, name)
                        elseif ev_type == "string" then
                            local pattern_type = type(pattern)
                            if ev == "User" then
                                -- event = { User = "LazyLoad" }
                                -- event = { User = { "LazyLoad", "VeryLazy" } }
                                if pattern_type == "string" then
                                    register(modules_by_user_event, pattern, name)
                                elseif pattern_type == "table" then
                                    for _, ue in ipairs(pattern) do
                                        register(modules_by_user_event, ue, name)
                                    end
                                else
                                    -- event = { User = true }
                                    register(modules_by_event, "User", name)
                                end
                            elseif pattern_type == "string" or pattern_type == "table" then
                                -- event = { BufEnter = "*.lua" } — glob, not batched
                                autocmd(ev, {
                                    group = augroup,
                                    once = true,
                                    pattern = pattern,
                                    callback = function()
                                        ensure_loaded(name)
                                    end,
                                })
                            else
                                -- event = { InsertEnter = true }
                                register(modules_by_event, ev, name)
                            end
                        end
                    end
                end
            end
        end
    end

    -- 2. Single batched FileType autocmd
    if next(modules_by_ft) ~= nil then
        autocmd("FileType", {
            group = augroup,
            pattern = vim.tbl_keys(modules_by_ft),
            callback = function(args)
                return drain_trigger(modules_by_ft, args.match)
            end,
        })

        -- Catch buffers already open before setup (Optimized O(M) loop)
        for _, buf in ipairs(api.nvim_list_bufs()) do
            if api.nvim_buf_is_loaded(buf) then
                local names = modules_by_ft[vim.bo[buf].filetype]
                if names then
                    modules_by_ft[vim.bo[buf].filetype] = nil
                    for _, name in ipairs(names) do
                        ensure_loaded(name)
                    end
                end
            end
        end
    end

    -- 3. Single batched autocmd for standard (pattern-less) events.
    --    No self-destruct — the autocmd stays alive but becomes a no-op once
    --    every event has been consumed (preserves original behavior).
    if next(modules_by_event) then
        autocmd(vim.tbl_keys(modules_by_event), {
            group = augroup,
            callback = function(args)
                drain_trigger(modules_by_event, args.event)
            end,
        })
    end

    -- 4. Single batched `User` autocmd — pattern = union of all names,
    --    dispatch by args.match (= the fired user event name).
    if next(modules_by_user_event) then
        autocmd("User", {
            group = augroup,
            pattern = vim.tbl_keys(modules_by_user_event),
            callback = function(args)
                return drain_trigger(modules_by_user_event, args.match)
            end,
        })
    end
end

--- Apply a theme palette by name.
--- @param palette_name string|nil The name of the palette to apply. Defaults to `DEFAULT_PALETTE`.
M.apply_palette = function(palette_name)
    --- @type string
    palette_name = palette_name or FALLBACK_PALETTE

    if active_palette_name == palette_name then
        return
    end

    -- Clear the current highlight cache
    if g.colors_name and g.colors_name ~= "" then
        api.nvim_command("hi clear")
    end

    -- Resolve and set the active palette
    local active_palette = PALETTE_DICT[palette_name]
    if active_palette then
        active_palette_name = palette_name
    else
        active_palette = PALETTE_DICT[FALLBACK_PALETTE]
        active_palette_name = FALLBACK_PALETTE
    end

    -- Re-apply highlights for all modules that were already loaded
    for name in pairs(loaded_modules) do
        load_module(name, active_palette, active_palette_name)
    end

    g.colors_name = PLUG_NAME .. "-" .. active_palette_name

    -- 1. Notify the Neovim ecosystem (lualine, nvim-tree, etc.)
    api.nvim_exec_autocmds("ColorScheme", { pattern = g.colors_name })

    -- 2. Notify custom listeners (specific to Witch)
    api.nvim_exec_autocmds("User", { pattern = "WitchPaletteChanged", data = active_palette_name })
end

--- Set up the Witch plugin.
--- @param opts table|nil User configuration options.
M.setup = function(opts)
    if opts then
        config(opts)
    end
    vim.o.termguicolors = true

    M.apply_palette(config.palette)

    local group = api.nvim_create_augroup(PLUG_NAME, { clear = true })
    setup_lazy_modules(group)

    -- Register the :Witch command with autocomplete
    api.nvim_create_user_command("Witch", function(args)
        M.apply_palette(vim.trim(args.args))
    end, {
        nargs = 1,
        force = true,
        complete = function(arg_lead)
            return vim.tbl_filter(function(theme)
                return vim.startswith(theme, arg_lead)
            end, available_palette_names())
        end,
    })

    -- Initialize dimming feature if enabled
    local dim_config = config.dim
    if dim_config.enabled then
        autocmd("WinNew", {
            group = group,
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
