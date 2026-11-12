local tonumber, floor, byte, sub, type, format = tonumber, math.floor, string.byte, string.sub, type, string.format
local bit = bit or require("bit")
local band, rshift = bit.band, bit.rshift

local M = {}

--- Default background color used by `darken` when no background is given.
local BLEND_BG = 0x000000

--- Default foreground color used by `lighten` when no foreground is given.
local BLEND_FG = 0xffffff

--- Byte value of `"#"`.
local HASH = 35

--- Lazy lookup for `"00"`..`"ff"` hex strings.
--- Each entry is formatted once on first use, then cached.
--- @type table<integer, string>
local HEX = setmetatable({}, {
	__index = function(t, i)
		local s = format("%02x", i)
		t[i] = s
		return s
	end,
})

--- Lazily resolved `nvim_get_color_by_name`.
--- @type fun(name: string): integer
local get_color_by_name

--- Cache of parsed colors: string -> 24-bit integer (or `false` if invalid).
--- @type table<string, integer|false>
local packed = {}

--- Parse a color string into a 24-bit integer.
---
--- Supports named colors, `#rgb`, `#rrggbb`, and `#rrggbbaa` (alpha ignored).
---
--- @param s string The color string.
--- @return integer|false rgb The 24-bit RGB value, or `false` if invalid.
local function parse(s)
	local n = packed[s]
	if n ~= nil then
		return n
	end

	get_color_by_name = get_color_by_name or vim.api.nvim_get_color_by_name

	n = get_color_by_name(s)
	if n < 0 then
		n = nil
		if byte(s, 1) == HASH then
			local len = #s
			if len == 4 then
				local v = tonumber(sub(s, 2), 16)
				if v then
					n = (rshift(v, 8) * 17) * 65536 + (band(rshift(v, 4), 15) * 17) * 256 + band(v, 15) * 17
				end
			elseif len == 9 then
				n = tonumber(sub(s, 2, 7), 16)
			end
		end
	end

	n = n or false
	packed[s] = n
	return n
end

--- Blend two colors, integer in / integer out.
---
--- @param fg string|integer|nil Foreground color (name, hex, or integer).
--- @param bg string|integer|nil Background color.
--- @param alpha number Blend ratio: `0` = pure `bg`, `1` = pure `fg`. Clamped to [0, 1].
--- @return integer|nil rgb The blended 24-bit RGB value, or `nil` on invalid input.
local function blend_int(fg, bg, alpha)
	if fg == nil or bg == nil then
		return nil
	end

	if alpha < 0 then alpha = 0 elseif alpha > 1 then alpha = 1 end

	local f = type(fg) == "number" and fg or parse(fg)
	local b = type(bg) == "number" and bg or parse(bg)
	if not f or not b then
		return nil
	end

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
--- Keys are normalized to 24-bit integers when possible.
--- @type table<any, table<any, table<number, string>>>
local cache = {}

--- Blend two colors.
---
--- Returns a `"#rrggbb"` string, or `fg` unchanged if either color is invalid.
---
--- @param fg string|integer|nil Foreground color (name, `#rgb`, `#rrggbb`, or integer).
--- @param bg string|integer|nil Background color.
--- @param alpha number Blend ratio: `0` = pure `bg`, `1` = pure `fg`. Clamped to [0, 1].
--- @return string|integer|nil result The blended color as `"#rrggbb"`, or `fg` on invalid input.
M.blend = function(fg, bg, alpha)
	if fg == nil or bg == nil then
		return fg
	end

	-- Clamp before the cache lookup so 1.5 and 1.0 share an entry
	if alpha < 0 then alpha = 0 elseif alpha > 1 then alpha = 1 end

	-- Normalize to integer for cache key consistency
	local f_key = type(fg) == "number" and fg or parse(fg) or fg
	local b_key = type(bg) == "number" and bg or parse(bg) or bg

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
--- @param hex string|integer|nil The color to darken.
--- @param amount number Blend ratio between 0 and 1 (higher = darker).
--- @param background string|integer|nil The background color (default: `#000000`).
--- @return string|integer|nil result The darkened color as `"#rrggbb"`, or `hex` on invalid input.
M.darken = function(hex, amount, background)
	return blend(hex, background or BLEND_BG, 1 - amount)
end

--- Lighten a color by blending it toward a foreground color.
---
--- @param hex string|integer|nil The color to lighten.
--- @param amount number Blend ratio between 0 and 1 (higher = lighter).
--- @param foreground string|integer|nil The foreground color (default: `#ffffff`).
--- @return string|integer|nil result The lightened color as `"#rrggbb"`, or `hex` on invalid input.
M.lighten = function(hex, amount, foreground)
	return blend(hex, foreground or BLEND_FG, 1 - amount)
end

--- Darken a color and return an integer.
---
--- @param color string|integer|nil The color to darken.
--- @param amount number Blend ratio between 0 and 1 (higher = darker).
--- @param background string|integer|nil The background color (default: `#000000`).
--- @return integer|nil rgb The darkened 24-bit RGB value, or `nil` on invalid input.
M.darken_int = function(color, amount, background)
	return blend_int(color, background or BLEND_BG, 1 - amount)
end

--- Lighten a color and return an integer.
---
--- @param color string|integer|nil The color to lighten.
--- @param amount number Blend ratio between 0 and 1 (higher = lighter).
--- @param foreground string|integer|nil The foreground color (default: `#ffffff`).
--- @return integer|nil rgb The lightened 24-bit RGB value, or `nil` on invalid input.
M.lighten_int = function(color, amount, foreground)
	return blend_int(color, foreground or BLEND_FG, 1 - amount)
end

return M
