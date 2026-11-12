local tonumber, floor, min, max, format =
	tonumber, math.floor, math.min, math.max, string.format

local M = {}

local blend_bg = "#000000"
local blend_fg = "#ffffff"

--- Convert hex color to rgb
---@param hex_color string : hex color code e.g. #ffffff or #fff
local hex2rgb = function(hex_color)
	if #hex_color == 4 then
		local r = (tonumber(hex_color:sub(2, 2), 16) * 17) % 256
		local g = (tonumber(hex_color:sub(3, 3), 16) * 17) % 256
		local b = (tonumber(hex_color:sub(4, 4), 16) * 17) % 256
		return { r, g, b }
	end
	local r = tonumber(hex_color:sub(2, 3), 16)
	local g = tonumber(hex_color:sub(4, 5), 16)
	local b = tonumber(hex_color:sub(6, 7), 16)
	return { r, g, b }
end

--- Blend two colors
---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1
M.blend = function(fg, bg, alpha)
	if fg == nil or fg:sub(1, 1) ~= "#" then
		return fg
	end

	local rgb_bg = hex2rgb(bg)
	local rgb_fg = hex2rgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * rgb_fg[i] + ((1 - alpha) * rgb_bg[i]))
		return floor(min(max(0, ret), 255) + 0.5)
	end

	return format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

M.darken = function(hex, amount, background)
	return M.blend(hex, background or blend_bg, amount)
end

M.lighten = function(hex, amount, foreground)
	return M.blend(hex, foreground or blend_fg, amount)
end

--- Merge two tables recursively
---@param to table
---@param from table
---@param force boolean|nil
M.merge_tb = function(to, from, force)
	if type(to) == "table" and type(from) == "table" then
		for k, v in pairs(from) do
			if to[1] == nil then
				to[k] = M.merge_tb(to[k], v)
			else
				to[#to + 1] = v
			end
		end
	elseif force then
		to = from
	elseif to == nil then
		to = from
	end
	return to
end

return M
