---@param palette Palette
---@param palette_name string
return function(palette, palette_name)
	local highlights = {
		-- ====================================================================
		-- HEADINGS
		-- ====================================================================
		-- Bare @markup.heading: dùng bởi LaTeX, Typst, RST.
		-- Level cụ thể (.1 → .6) được sinh trong vòng lặp bên dưới.
		{ "@markup.heading", link = "Title" },

		-- ====================================================================
		-- LISTS
		-- ====================================================================
		{ "@markup.list", fg = palette.delimiter },

		{ "@markup.list.checked", fg = palette.green },
		{ "@markup.list.unchecked", fg = palette.fg_muted },

		-- ====================================================================
		-- BLOCK QUOTES
		-- ====================================================================
		-- Bare: dùng cho RST, Typst, Markdown (blockquote).
		{ "@markup.quote", fg = palette.comment, italic = true },

		-- ====================================================================
		-- CODE BLOCKS
		-- ====================================================================
		-- Canonical code block: recessed nhưng không lấn át Normal.
		{ "@markup.raw.block", bg = palette.bg_block, fg = "NONE" },
		{ "@markup.raw", link = "@markup.raw.block" },

		-- Inline code: string color, không nền.
		{ "@markup.raw.inline", fg = palette.string, bg = "NONE" },

		-- ====================================================================
		-- LINKS
		-- ====================================================================
		{ "@markup.link", fg = palette.link, underline = true },
		{ "@markup.link.label", link = "@markup.link" },
		{ "@markup.link.url", link = "Underlined" },

		-- ====================================================================
		-- MATH
		-- ====================================================================
		{ "@markup.math", link = "Special" },
		{ "@markup.math.inline", link = "@markup.math" },

		-- ====================================================================
		-- EMPHASIS
		-- ====================================================================
		{ "@markup.strong", bold = true },
		{ "@markup.emphasis", italic = true },
		{ "@markup.italic", link = "@markup.emphasis" },
		{ "@markup.strikethrough", strikethrough = true },
		{ "@markup.underline", underline = true },

		-- ====================================================================
		-- FOOTNOTES
		-- ====================================================================
		{ "@markup.footnote", fg = palette.link },

		-- ====================================================================
		-- MARKDOWN-SPECIFIC OVERRIDES
		-- Tất cả đều link về canonical capture ở trên (DRY).
		-- ====================================================================

		-- Lists
		{ "@markup.list.markdown", link = "@markup.list" },
		{ "@markup.list.marked.markdown", link = "@markup.list" },
		{ "@markup.list.numbered.markdown", link = "@markup.list" },
		{ "@markup.list.checked.markdown", link = "@markup.list.checked" },
		{ "@markup.list.unchecked.markdown", link = "@markup.list.unchecked" },

		-- Block quotes
		{ "@markup.quote.markdown", link = "@markup.quote" },
		{ "@markup.quote.marker.markdown", fg = palette.comment },

		-- Code blocks
		{ "@markup.raw.block.markdown", link = "@markup.raw.block" },
		{ "@markup.raw.block.fenced.markdown", link = "@markup.raw.block" },
		{ "@markup.raw.delimiter.markdown", link = "Comment" },
		{ "@label.markdown", link = "Comment" },

		-- Inline code (injected bởi markdown_inline parser)
		{ "@markup.raw.markdown_inline", link = "@markup.raw.inline" },

		-- Links
		{ "@markup.link.markdown", link = "@markup.link" },
		{ "@markup.link.label.markdown", link = "@markup.link.label" },
		{ "@markup.link.label.markdown_inline", link = "@markup.link.label" },
		{ "@markup.link.label.symbol", link = "@markup.link.label" },
		{ "@markup.link.url.markdown", link = "@markup.link.url" },
		{ "@markup.link.url.markdown_inline", link = "@markup.link.url" },

		-- Math
		{ "@markup.math.markdown", link = "@markup.math" },
		{ "@markup.math.inline.markdown", link = "@markup.math.inline" },

		-- Footnotes
		{ "@markup.footnote.markdown_inline", link = "@markup.footnote" },

		-- Tables / rules
		{ "@punctuation.special.markdown", link = "Delimiter" },
	}

	-- ========================================================================
	-- HEADING LEVELS (1 → 6)
	-- Sinh cả bare capture (LaTeX, Typst) lẫn .markdown (Markdown).
	-- Marker của heading (dấu #, \section*, ...) dùng comment color.
	-- ========================================================================
	local heading_colors = {
		palette.orange,
		palette.yellow,
		palette.green,
		palette.teal,
		palette.blue,
		palette.purple,
	}

	for i, color in ipairs(heading_colors) do
		local bare = "@markup.heading." .. i
		local md = bare .. ".markdown"
		local marker = bare .. ".marker"
		local marker_md = marker .. ".markdown"

		-- Heading level (bare + markdown alias).
		highlights[#highlights + 1] = { bare, fg = color, bold = true }
		highlights[#highlights + 1] = { md, link = bare }

		-- Heading marker (dấu #, số thứ tự section, ...).
		highlights[#highlights + 1] = { marker, fg = palette.comment, bg = "NONE" }
		highlights[#highlights + 1] = { marker_md, link = marker }
	end

	return highlights
end
