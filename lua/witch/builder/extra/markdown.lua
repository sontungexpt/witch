---@param palette Palette
---@param palette_name string
return function(palette, palette_name)
    local highlights = {
        { "@markup.list", fg = palette.blue },
        -- Muted list markers
        { "@markup.list.markdown", fg = palette.cyan1 },

        -- Block code: use NONE to clear the ugly grey background and let inner syntax work.
        { "@markup.raw", bg = "NONE", fg = "NONE" },
        { "@markup.raw.markdown", bg = "NONE", fg = "NONE" },
        { "@markup.raw.block", bg = "NONE", fg = "NONE" },
        { "@markup.raw.block.markdown", bg = "NONE", fg = "NONE" },
        -- Neovim 0.10+ Treesitter compatibility

        -- Inline code: soft pastel orange with a subtle background
        { "@markup.raw.markdown_inline", fg = palette.orange1, bg = palette.bg_dark },

        -- Links: softer, underlined
        { "@markup.link", fg = palette.blue1, underline = true },
        { "@markup.link.url", link = "Underlined" },
        { "@markup.link.label.markdown_inline", fg = palette.pink1 },
        { "@markup.link.label", link = "SpecialChar" },
        { "@markup.link.label.symbol", link = "Identifier" },
        { "@markup.math", link = "Special" },
        { "@markup.strong", bold = true },
        { "@markup.strikethrough", strikethrough = true },
        { "@markup.underline", underline = true },
        { "@markup.heading", link = "Title", bg = "NONE" }, -- clear background
        { "@markup.list.checked", fg = palette.green },
        { "@markup.list.unchecked", fg = palette.red },
    }

    -- Eye-friendly pastel heading colors (avoid harsh red2/purple)
    local heading_colors = {
        palette.blue,
        palette.yellow1,
        palette.teal,
        palette.cyan1,
        palette.green,
        palette.orange1,
    }

    for i, color in ipairs(heading_colors) do
        local heading_group_name = "@markup.heading." .. i .. ".markdown"
        highlights[#highlights + 1] = { heading_group_name, fg = color, bold = true, bg = "NONE" }
        highlights[#highlights + 1] = { "@markup.heading." .. i .. ".marker.markdown", link = heading_group_name, bg = "NONE" }
    end

    return highlights
end
