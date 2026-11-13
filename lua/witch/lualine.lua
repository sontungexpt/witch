local color = require("witch.util.color")

local M = {}

--- Convert a palette color to the `"#rrggbb"` string lualine expects.
--- Lualine rejects 24-bit integers (> 255), so integers must be formatted.
---
--- @param c integer|string
--- @return string
local function hex(c)
	if type(c) == "number" then
		return string.format("#%06x", c)
	end
	---@cast c string
	return c
end

--- Read one color attribute of a highlight group (links resolved).
--- Returns `nil` when the group is missing or the attribute is unset
--- (e.g. the default `StatusLine` uses `reverse` and has no `bg`).
---
--- @param name string Highlight group name.
--- @param attr "fg"|"bg"
--- @return string|nil
local function hl(name, attr)
	local ok, def = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
	if ok and def then
		return hex(def[attr])
	end
end

--- @class witch.lualine.Opts
--- @field native?      boolean Prefer colors from core `StatusLine`/`StatusLineNC` (default: true).
--- @field transparent? boolean Use `NONE` for the bar background (default: false).

--- Build a lualine theme table from a palette.
---
---   - `a` accent block (mode indicator), text uses `cursor_text`
---   - `b` accent text on the panel surface
---   - `c` muted text on the bar surface (matches core `StatusLine`)
---
--- @param palette witch.Palette
--- @param opts? witch.lualine.Opts
--- @return table|nil theme
local function build(palette, opts)
	if not palette then
		return nil
	end

	opts = opts or {}
	local native = opts.native ~= false

	-- Bar / inactive surfaces: core groups first, palette as fallback.
	local bar = (native and hl("StatusLine", "bg")) or hex(palette.bg_bar or palette.bg)
	local bar_nc = (native and hl("StatusLineNC", "bg")) or bar
	local panel = hex(palette.bg_panel or palette.bg_float or palette.bg)

	local c_fg = (native and hl("StatusLine", "fg")) or hex(palette.fg_muted or palette.fg_subtle or palette.fg)
	local inactive_fg = (native and hl("StatusLineNC", "fg"))
		or hex(palette.fg_disabled or palette.fg_subtle or palette.fg)

	if opts.transparent then
		bar, bar_nc = "NONE", "NONE"
	end

	--- Text placed on an accent block: prefer `cursor_text`,
	--- else derive a readable tone from the accent itself.
	---
	--- @param accent string `"#rrggbb"`
	--- @return string
	local function on_accent(accent)
		if palette.cursor_text then
			return hex(palette.cursor_text)
		end
		if color.is_light(accent) then
			return hex(color.darken(accent, 0.72) or accent)
		end
		return hex(color.lighten(accent, 0.72) or accent)
	end

	-- Mode -> accent. A missing palette color falls back to `fg`.
	local accents = {
		normal = palette.blue,
		insert = palette.green,
		visual = palette.purple,
		replace = palette.red,
		command = palette.yellow,
		terminal = palette.cyan or palette.green,
	}

	local theme = {}
	for mode, raw in pairs(accents) do
		local accent = hex(raw or palette.fg)
		theme[mode] = {
			a = { fg = on_accent(accent), bg = accent, gui = "bold" },
			b = { fg = accent, bg = panel },
			c = { fg = c_fg, bg = bar },
		}
	end

	-- Inactive windows (also used by winbar/tabline inactive sections).
	theme.inactive = {
		a = { fg = inactive_fg, bg = bar_nc, gui = "bold" },
		b = { fg = inactive_fg, bg = bar_nc },
		c = { fg = inactive_fg, bg = bar_nc },
	}

	return theme
end

--- Build the theme for a palette by name.
---
--- @param palette_name? string Defaults to the active palette.
--- @param opts? witch.lualine.Opts
--- @return table|nil theme
M.get = function(palette_name, opts)
	local witch = require("witch")
	local palette = witch.palette(palette_name or witch.active_palette_name())
	return build(palette, opts)
end

M.build = build

return M
