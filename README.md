# Witch

The main theme for [stinvim](https://github.com/sontungexpt/stinvim).

Easy to use, easy to config, easy to extend.

## Features

- 🎨 Beautiful built-in palettes: `dark`, `light`, `umber`, `parchment`.
- 🧩 Per-module configuration — enable, disable, lazy-load, or override any highlight group.
- ⚡ Lazy loading with lazy.nvim-style triggers: `ft`, `event`, `User`, or eager `lazy = false`.
- 🎯 Batched autocmds — filetypes, `User` events, and pattern-less events share one autocmd per group.
- 🪟 Dim inactive windows with per-filetype / per-buftype exclusion.
- 🔌 Custom palettes — drop in your own color table.
- 🧱 Custom modules — write your own highlight builder and hook it in.
- 🔄 Hot-switch palettes at runtime with `:Witch <palette>`.
- 👀 Incremental highlighting to keep startup fast.

## Preview

The colors in the preview may appear different from those in your Vim due to potential errors during color conversion.

![witch](./docs/readme/preview1.png)

https://github.com/sontungexpt/witch/assets/92097639/ebf730fc-3218-427f-b8a5-ae0fa5895532

## Requirements

- Neovim >= 0.10 (uses `vim.islist`, `nvim_set_hl` with list-form highlights).
- `termguicolors` (set automatically by `setup`).

## Installation

```lua
-- lazy.nvim
{
    "sontungexpt/witch",
    priority = 1000,
    lazy = false,
    config = function(_, opts)
        require("witch").setup(opts)
    end,
}
```

## Setup

```lua
require("witch").setup({
    -- Active palette name.
    -- Built-in: "dark", "light", "umber", "parchment".
    -- Custom: any key you define in `palletes` (lowercased).
    palette = "dark",

    -- User-defined custom palettes. Keys must be PascalCase
    -- (e.g., `MyPalette`), and are referenced in lowercase
    -- (`:Witch mypalette`, or `palette = "mypalette"`).
    palletes = {},

    -- Dim inactive windows.
    dim = {
        enabled = true,
        level = 0.35,        -- 0 = fully dimmed, 1 = no dimming
        fade_bg = true,      -- also fade background groups
        excluded = {
            filetypes = { NvimTree = true },
            buftypes  = { nofile = true, prompt = true, terminal = true },
        },
    },

    -- Per-module configuration. Each key is a module name; the value
    -- is a `Module` table (see below).
    modules = {
        core = { lazy = false, enabled = true },
        treesitter = { event = "FileType", enabled = true },
        lsp = { event = "LspAttach", enabled = true },
        ["blink-cmp"] = { event = { "InsertEnter", "CmdlineEnter" }, enabled = true },
        terminal = { event = "TermOpen", enabled = true },
        bracket = { event = "CursorHold", enabled = true },
        indentline = { event = "CursorHold", enabled = true },
        markdown = { ft = "markdown", enabled = true },
        nvimtree = { ft = "NvimTree" },
        neotree = { ft = "neotree" },
        cmp = { event = { "InsertEnter", "CmdlineEnter" } },
        dashboard = { lazy = false },
        telescope = { ft = "TelescopePrompt" },
        todo = { event = "BufReadPost" },
        gitsigns = { event = { "BufReadPre", "BufNewFile" } },
        dap = { event = "BufReadPost" },
        diffview = { ft = "diffview" },
        notify = { event = "UIEnter" },
        navic = { event = "LspAttach" },
        scrollbar = { lazy = false },
    },
})
```

`setup` may be called multiple times — each call merges your options into the existing config and clears the plugin's augroup before rebuilding lazy-load autocmds.

## Modules

Each entry in `modules` is a `Module`:

```lua
--- @class Module
--- @field enabled? boolean                 Whether the module is enabled. Defaults to false.
--- @field build?   fun(palette, palette_name): table[]  Highlight builder.
--- @field lazy?    boolean                 If `false`, load during setup.
--- @field ft?      string|string[]         Filetype(s) that trigger loading.
--- @field event?   string|string[]|table<string, string|string[]>  Event trigger(s).
```

### Built-in modules

All modules below ship with Witch. Each maps to a `build` function under `lua/witch/theme/module/<name>.lua`; you can enable, disable, override triggers, or replace its `build` from `setup`.

| Name | Highlights |
|------|------------|
| `core` | Base editor groups — `Normal`, `Comment`, `Visual`, `Search`, `StatusLine`, popups, borders, etc. **Required** — every palette expects it. |
| `treesitter` | Tree-sitter capture groups — `@function`, `@keyword`, `@variable`, `@type`, `@string`, … |
| `lsp` | LSP semantic tokens and diagnostic groups (`DiagnosticError`, …). |
| `blink-cmp` | [blink.cmp](https://github.com/Saghen/blink.cmp) completion menu. |
| `cmp` | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) completion menu (alternative to `blink-cmp`). |
| `terminal` | `:terminal` buffer groups — `TermCursor`, terminal color table. |
| `bracket` | [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)-style / rainbow bracket pairs. |
| `indentline` | Indent guide characters (`IblIndent`, `IblScope`, …). |
| `markdown` | Markdown-specific groups — headings, code blocks, links, tables. |
| `nvimtree` | [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) explorer. |
| `neotree` | [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) explorer. |
| `dashboard` | [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) start screen. |
| `telescope` | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) prompt, results, preview. |
| `todo` | [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) — `TODO`, `FIXME`, `HACK`, … |
| `gitsigns` | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) add/change/delete signs. |
| `dap` | [nvim-dap](https://github.com/mfussenegger/nvim-dap) + [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui). |
| `diffview` | [diffview.nvim](https://github.com/sindrets/diffview.nvim) diff panes. |
| `notify` | [nvim-notify](https://github.com/rcarriga/nvim-notify) popups. |
| `navic` | [nvim-navic](https://github.com/SmiteshP/nvim-navic) breadcrumb icons and text. |
| `scrollbar` | [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) scrollbar handles and marks. |

To list them at runtime:

```lua
:lua =vim.tbl_keys(require("witch.config").modules)
```

### `build`

Optional. If omitted, Witch falls back to `require("witch.builder").require(name)`.

If provided, it **must** create and return the highlight table **inside the function body**:

```lua
build = function(palette, palette_name)
    return {
        { "MyGroup", fg = palette.fg, bg = palette.bg, bold = true },
        { "MyOtherGroup", link = "Normal" },
    }
end
```

Each entry is `{ group_name, <nvim_set_hl options> }`. `group_name` is stripped before `nvim_set_hl` is called.

#### ❌ Do not close over an outer table

```lua
local my_highlights = { { "MyGroup", fg = "#ffffff" } }  -- BAD

build = function(palette, palette_name)
    return my_highlights   -- ❌ closure over an outer table
end
```

#### Why

1. **The plugin mutates your table.** `load_module` does `hl[1] = nil` on each entry before calling `nvim_set_hl` (to strip `group_name`, which is not a valid `nvim_set_hl` field). After the first load, every entry in your outer table has `[1] = nil`. On the next `:Witch <palette>` (or the next `setup` call), `hl_name` is `nil` → `nvim_set_hl(0, nil, ...)` errors or silently corrupts your highlights. Reusing the same table across calls is **unsafe by construction** — Witch cannot guarantee it won't rewrite entries.
2. **Memory** — Witch consumes the returned table then drops it. An outer table stays allocated for the whole session even though `nvim_set_hl` already copied its values. Building inside `build` lets the GC reclaim it immediately.
3. **Never reused** — `nvim_set_hl` copies colors into Neovim's store; the Lua table is dead weight afterwards.
4. **Palette correctness** — `build` runs again on every `:Witch <palette>`. An outer table holds stale colors and will re-apply them on palette switch.
5. **No hidden state** — `setup` can be called multiple times; outer tables are captured once and never refresh.

### Lazy-loading rules

| `lazy` | `ft` / `event` | Behavior |
|:------:|:----------------|:---------|
| `false` | — | Loaded immediately during `setup`. |
| `true`/`nil` | `ft = "x"` | Loaded on `FileType x` (or matching type already open at setup). |
| `true`/`nil` | `event = "X"` | Loaded on event `X`. |
| `true`/`nil` | `event = { "X", "Y" }` | Loaded on the first of `X`/`Y`. |
| `true`/`nil` | `event = { X = true }` | Loaded on event `X`. |
| `true`/`nil` | `event = { X = "pattern" }` | Loaded on `X pattern` (glob). |
| `true`/`nil` | `event = { User = "Name" }` | Loaded on `User Name`. |
| `true`/`nil` | `event = { User = { "A", "B" } }` | Loaded on `User A` or `User B`. |
| `true`/`nil` | nothing | **Never loaded** — misleading config, will not fire. |

Triggers are batched into a single autocmd per group (FileType, pattern-less events, `User` events). Glob-pattern events (`BufEnter = "*.lua"` etc.) are not batched — one autocmd per module, self-destructing after the first match.

## Palettes

### Built-in

| Name | Description |
|------|-------------|
| `dark` | Default dark palette. |
| `light` | Light palette. |
| `umber` | Warm dark palette. |
| `parchment` | Warm light palette. |

### Custom

```lua
require("witch").setup({
    palletes = {
        -- Key must be PascalCase; referenced as `mypalette` at runtime.
        MyPalette = {
            bg = "#161f31",
            bg_dark = "#0d1829",
            fg = "#c9d8ee",
            fg_dark = "#a9bad6",
            -- ... see `witch.palette.dark` for the full color set.
        },
    },
    palette = "mypalette",
})
```

Any key added to `palletes` is discoverable via tab-completion on `:Witch`.

## Custom modules

Give your module a unique name and a `build` function:

```lua
require("witch").setup({
    modules = {
        ["my-highlights"] = {
            lazy = false,
            enabled = true,
            build = function(palette, palette_name)
                return {
                    { "MyGroup", fg = palette.fg, bg = palette.bg },
                    { "MyOtherGroup", link = "Normal" },
                }
            end,
        },
    },
})
```

The `build` function is called every time the module is loaded **and** every time the active palette changes (so your groups stay in sync with `:Witch <palette>`).

## Commands

| Command | Description |
|---------|-------------|
| `:Witch <palette>` | Switch to the given palette. Falls back silently if the name is unknown. Tab-completes over all built-in + custom palettes. |
| `:WitchDimToggle` | Toggle dimming of inactive windows. Only registered when `dim.enabled = true`, on the first `WinNew`. |

`g.colors_name` is set to `witch-<palette>` after each `:Witch`, so `:colorscheme` (no args) reports the active palette.

## Events

| `User` event | Data | Fired when |
|--------------|------|------------|
| `WitchModuleLoaded` | module name | A module finishes building its highlights. |
| `WitchPaletteChanged` | palette name | `:Witch <palette>` (or `require("witch").apply_palette(...)`) completes. |

Example — react to a specific module:

```lua
vim.api.nvim_create_autocmd("User", {
    pattern = "WitchModuleLoaded",
    callback = function(ev)
        if ev.data == "nvimtree" then
            -- e.g. force NvimTree to re-render after its colors changed
            require("nvim-tree.view").redraw()
        end
    end,
})
```

## API

```lua
local witch = require("witch")

witch.setup(opts)              -- configure + apply
witch.apply_palette(name)      -- apply a palette programmatically
witch.active_palette_name()    -- e.g. "dark"
witch.active_palette()         -- the raw palette table
```

## Migration from v1

| v1 | v2 |
|----|-----|
| `theme.style = "dark"` | `palette = "dark"` |
| `theme.enabled = true` | handled by per-module `enabled` |
| `theme.extras = { bracket = true }` | `modules = { bracket = { enabled = true, lazy = false } }` |
| `theme.customs = { mod }` | `modules = { [name] = { build = fn } }` |
| `theme.on_highlight = fn` | per-module `build` function |
| `more_themes = { X = {} }` | `palletes = { X = {} }` |
| `dim_inactive` | `dim` (same fields, plus `fade_bg`) |
| `switcher` | removed (`:Witch` is always available) |
| `User WitchHighlightDone` | `User WitchModuleLoaded` |

## Contributing

Because I follow minimalism, I just support the basic features I use.

If you need more features, please open an issue or pull request with an image or a video to show your color scheme.

Hope you enjoy it! I look forward to more highlight styles from you.

## License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for details.
