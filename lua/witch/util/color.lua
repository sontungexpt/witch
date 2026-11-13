local tonumber, floor, byte, sub, type, format = tonumber, math.floor, string.byte, string.sub, type, string.format
--- @diagnostic disable-next-line: undefined-global
local bit = bit or require("bit")
local band, rshift = bit.band, bit.rshift

--- Color utilities: parsing, blending, darkening/lightening and luminance checks.
--- @class witch.util.color
local M = {}

--- Default background color used by `darken` when none is given.
--- @type integer
local BLEND_BG = 0x000000

--- Default foreground color used by `lighten` when none is given.
--- @type integer
local BLEND_FG = 0xffffff

--- Byte value of `"#"`.
--- @type integer
local HASH = 35

--- Lazy lookup table for `"00"`..`"ff"` hex strings.
--- Each entry is formatted once on first access, then cached.
--- @private
--- @type table<integer, string>
local HEX = setmetatable({}, {
	__index = function(t, i)
		local s = format("%02x", i)
		t[i] = s
		return s
	end,
})

--- Cache of parsed colors: `string -> 24-bit integer`, or `-1` if the string is invalid.
--- @private
--- @type table<string, integer>
local packed = {}

--- Parse a color string into a 24-bit integer.
---
--- Supported formats: named colors, `#rgb`, `#rrggbb`, `#rrggbbaa` (alpha is dropped).
--- Results (including failures) are memoized in `packed`.
---
--- @private
--- @param s string The color string.
--- @return integer rgb The 24-bit RGB value, or `-1` if `s` is not a valid color.
local function parse(s)
	local cached = packed[s]
	if cached ~= nil then
		return cached
	end

	-- Returns -1 when `s` is not a known color name.
	local n = vim.api.nvim_get_color_by_name(s)

	if n < 0 and byte(s, 1) == HASH then
		local len = #s
		if len == 4 then
			-- #rgb: expand each nibble (0xf -> 0xff) via * 17.
			local v = tonumber(sub(s, 2), 16)
			if v then
				n = (rshift(v, 8) * 17) * 65536 + (band(rshift(v, 4), 15) * 17) * 256 + band(v, 15) * 17
			end
		elseif len == 9 then
			-- #rrggbbaa: keep only the rrggbb part.
			n = tonumber(sub(s, 2, 7), 16) or -1
		end
	end

	packed[s] = n
	return n
end

--- Blend two colors. Integer in, integer out.
---
--- Computes `alpha * fg + (1 - alpha) * bg` per channel, rounded to nearest.
---
--- @nodiscard
--- @param fg witch.Color|nil Foreground color.
--- @param bg witch.Color|nil Background color.
--- @param alpha number Blend ratio: `0` = pure `bg`, `1` = pure `fg`. Clamped to `[0, 1]`.
--- @return integer|nil rgb The blended 24-bit RGB value, or `nil` if either color is `nil`/invalid.
local function blend_int(fg, bg, alpha)
	if fg == nil or bg == nil then
		return nil
	end

	if alpha < 0 then alpha = 0 elseif alpha > 1 then alpha = 1 end

	--- @diagnostic disable-next-line
	local f = type(fg) == "number" and fg or parse(fg)
	if f < 0 then return nil end

	--- @diagnostic disable-next-line
	local b = type(bg) == "number" and bg or parse(bg)
	if b < 0 then return nil end

	local ia = 1 - alpha

	local r = floor(alpha * rshift(f, 16) + ia * rshift(b, 16) + 0.5)
	local g = floor(alpha * band(rshift(f, 8), 255) + ia * band(rshift(b, 8), 255) + 0.5)
	local bl = floor(alpha * band(f, 255) + ia * band(b, 255) + 0.5)

	r = r < 0 and 0 or r > 255 and 255 or r
	g = g < 0 and 0 or g > 255 and 255 or g
	bl = bl < 0 and 0 or bl > 255 and 255 or bl

	return r * 65536 + g * 256 + bl
end

M.blend_int = blend_int

--- Cache of blended colors: `cache[fg][bg][alpha] -> "#rrggbb"`.
--- Keys are normalized to 24-bit integers.
--- @private
--- @type table<integer, table<integer, table<number, string>>>
local cache = {}

--- Blend two colors and return a hex string.
---
--- Returns `fg` unchanged when either color is `nil` or invalid, so the result is always
--- safe to pass straight into a highlight definition.
---
--- @nodiscard
--- @param fg witch.Color|nil Foreground color.
--- @param bg witch.Color|nil Background color.
--- @param alpha number Blend ratio: `0` = pure `bg`, `1` = pure `fg`. Clamped to `[0, 1]`.
--- @return witch.Color|nil result `"#rrggbb"` on success, otherwise `fg` as given.
--- @overload fun(fg: nil, bg: witch.Color|nil, alpha: number): nil
M.blend = function(fg, bg, alpha)
	if fg == nil or bg == nil then
		return fg
	end

	-- Clamp before the cache lookup so 1.5 and 1.0 share an entry.
	if alpha < 0 then alpha = 0 elseif alpha > 1 then alpha = 1 end

	-- Normalize to integer for cache key consistency.
	-- An invalid color becomes a negative key; that is safe because blend_int
	-- returns nil for it below, so nothing is ever stored under that key.
	--- @diagnostic disable-next-line
	local f_key = type(fg) == "number" and fg or parse(fg)
	if f_key < 0 then return nil end
	--- @diagnostic disable-next-line
	local b_key = type(bg) == "number" and bg or parse(bg)
	if b_key < 0 then return nil end

	local by_bg = cache[f_key]
	if by_bg then
		local by_alpha = by_bg[b_key]
		if by_alpha then
			local hit = by_alpha[alpha]
			if hit then
				return hit
			end
		end
	end

	local o = blend_int(fg, bg, alpha)
	if not o then
		return fg
	end

	local out = "#" .. HEX[rshift(o, 16)] .. HEX[band(rshift(o, 8), 255)] .. HEX[band(o, 255)]

	if not by_bg then
		by_bg = {}
		cache[f_key] = by_bg
	end
	local by_alpha = by_bg[b_key]
	if not by_alpha then
		by_alpha = {}
		by_bg[b_key] = by_alpha
	end
	by_alpha[alpha] = out

	return out
end

local blend = M.blend

--- Darken a color by blending it toward a background color.
---
--- @nodiscard
--- @param hex witch.Color|nil The color to darken.
--- @param amount number Darkening strength in `[0, 1]` (`0` = unchanged, `1` = pure `background`).
--- @param background witch.Color|nil Color to blend toward. Default: `#000000`.
--- @return witch.Color|nil result `"#rrggbb"` on success, otherwise `hex` as given.
M.darken = function(hex, amount, background)
	return blend(hex, background or BLEND_BG, 1 - amount)
end

--- Lighten a color by blending it toward a foreground color.
---
--- @nodiscard
--- @param hex witch.Color|nil The color to lighten.
--- @param amount number Lightening strength in `[0, 1]` (`0` = unchanged, `1` = pure `foreground`).
--- @param foreground witch.Color|nil Color to blend toward. Default: `#ffffff`.
--- @return witch.Color|nil result `"#rrggbb"` on success, otherwise `hex` as given.
M.lighten = function(hex, amount, foreground)
	return blend(hex, foreground or BLEND_FG, 1 - amount)
end

--- Darken a color and return a 24-bit integer.
---
--- @nodiscard
--- @param color witch.Color|nil The color to darken.
--- @param amount number Darkening strength in `[0, 1]` (`0` = unchanged, `1` = pure `background`).
--- @param background witch.Color|nil Color to blend toward. Default: `#000000`.
--- @return integer|nil rgb The darkened RGB value, or `nil` on `nil`/invalid input.
M.darken_int = function(color, amount, background)
	return blend_int(color, background or BLEND_BG, 1 - amount)
end

--- Lighten a color and return a 24-bit integer.
---
--- @nodiscard
--- @param color witch.Color|nil The color to lighten.
--- @param amount number Lightening strength in `[0, 1]` (`0` = unchanged, `1` = pure `foreground`).
--- @param foreground witch.Color|nil Color to blend toward. Default: `#ffffff`.
--- @return integer|nil rgb The lightened RGB value, or `nil` on `nil`/invalid input.
M.lighten_int = function(color, amount, foreground)
	return blend_int(color, foreground or BLEND_FG, 1 - amount)
end

--- Check whether a color is perceived as light.
---
--- Uses the ITU-R BT.601 luma approximation (`0.299R + 0.587G + 0.114B`) on the raw
--- sRGB channels. This is a cheap perceptual estimate, not WCAG relative luminance
--- (which would linearize gamma first). A luma above `128` counts as light.
---
--- @nodiscard
--- @param color witch.Color|nil The color to check.
--- @return boolean is_light `true` if light; `false` if dark, `nil`, or invalid.
M.is_light = function(color)
	if color == nil then
		return false
	end

	local c
	if type(color) == "number" then
		c = color
	elseif type(color) == "string" then
		c = parse(color)
	else
		return false
	end

	-- Invalid colors (parse failure or negative input) are never "light".
	if c < 0 then
		return false
	end

	-- Extract R, G, B channels.
	local r = rshift(c, 16)
	local g = band(rshift(c, 8), 255)
	local b = band(c, 255)

	-- Perceived luma (ITU-R BT.601).
	local luminance = 0.299 * r + 0.587 * g + 0.114 * b

	return luminance > 128
end

return M
