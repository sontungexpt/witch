The main theme for [stinvim](https://github.com/sontungexpt/stinvim)

Easy to use, easy to config, easy to extend.

It's still in development, so there are some bugs. If you find any bug, please report it to me.

## Features

🤩 Beautiful colorscheme.

😁 Support for many themes, including: dark, light, and more(coming soon).

🤔 Easy to config, easy to extend.

😆 Stinvimui boasts robust support for loading customized syntax highlighting tailored to specific filetypes, buftypes, events

😁 Easy to switch between themes easily with `:Stinvimui <theme_name>` command

👀 Try to load highlighting incrementally, so it will not slow down your vim startup time.

## Preview

![stinvimui](./docs/readme/preview1.png)

## Installation

```lua
    -- lazy
    {
        "sontungexpt/stinvimui",
        priority = 1000,
        lazy = false,
        config = function(_, opts)
            require("stinvimui").setup(opts)
        end,
    },

```

## Options

```lua
    require("stinvimui").setup {
        theme = {
            -- default style of the theme
            -- "dark", "light"
            style = "dark",

            -- more module of stinvimui that you want it should be loaded
            extras = {
                -- bracket = true,
                -- dashboard = true,
                -- diffview = true,
                -- explorer = true,
                -- indentline = true,
            },

            -- custome your highlight module
            -- see: stinvimui.theme.example
            customs = {
                -- require("stinvimui.theme.example"),
            },

            -- this function will be called when stinvimui start highlight
            -- this is the unique way to change the default highlight of stinvimui
            -- when you want to change the default highlight groups
            -- you can do something like this
            -- on_highlight = function(style, colors, highlight)
            -- 	if style == "dark" then
            -- 		-- change the default background of stinvimui
            -- 		colors.bg = "#000000"

            -- 		-- change the Normal highlight group of stinvimui
            -- 		highlight.Normal = { fg = "#ffffff", bg = "#000000" }
            -- 	elseif style == "light" then
            -- 		-- change the default background of stinvimui
            -- 		colors.bg = "#ffffff"

            -- 		-- change the Normal highlight group of stinvimui
            -- 		highlight.Normal = { fg = "#000000", bg = "#ffffff" }
            -- 	end
            -- end,
            on_highlight = function(style, colors, highlight)
            end
        },

        -- dim_inactive = false, -- dims inactive windows

        -- true if you want to use command StinvimUISwitch
        switcher = true,

        -- add your custom themes here
        more_themes = {
            -- the key is the name of the theme must be in PascalCase
            -- the value is the table of colors to be passed to the theme
            -- with following format in stinvimui.colors.example

            -- Custom1 = {},
            -- Custom2 = {},
        },
    }
```
