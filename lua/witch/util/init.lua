local tonumber, floor, min, max, format = tonumber, math.floor, math.min, math.max, string.format

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
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
M.blend = function(fg, bg, alpha)
	if fg == nil or fg:sub(1, 1) ~= "#" then return fg end

	local rgb_bg = hex2rgb(bg)
	local rgb_fg = hex2rgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * rgb_fg[i] + ((1 - alpha) * rgb_bg[i]))
		return floor(min(max(0, ret), 255) + 0.5)
	end

	return format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

M.darken = function(hex, amount, background) return M.blend(hex, background or blend_bg, amount) end

M.lighten = function(hex, amount, foreground) return M.blend(hex, foreground or blend_fg, amount) end

--- Merge two tables recursively
--
--- If both t1 and t2 have the same key, then it will be replaced by t2's value
--- else the value of t2 will be added to t1
--
--- If t1 is a dict, then t2 will be merged to t1 recursively
--- If t1 is a list, then each element of t2 will be appended to t1 if t2 is also a list
--- of each value of each key of t2 will be appended to t1 if t2 is a dict
--
--- @param to table : the table to be merged to
--- @param from table : the table to be merged from
M.merge_tb = function(to, from, force)
	if type(to) == "table" and type(from) == "table" then
		for k, v in pairs(from) do
			if to[1] == nil then -- to is a dict
				to[k] = M.merge_tb(to[k], v)
			else -- to is a list
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

M.read_only = (function()
	local cache = {}

	--- Return a read-only table
	--- @param table table The table should be read only
	--- @param error_msg string|function|nil The error message when you try to modify the table
	--- @return table The read only table
	return function(table, error_msg)
		if not cache[table] then
			cache[table] = setmetatable({}, {
				__index = table,
				__newindex = function(metatable, key, value)
					error(
						type(error_msg) == "function" and error_msg(metatable, key, value)
							or error_msg
							or "Attempt to modify read-only table"
					)
				end,
			})
		end
		return cache[table]
	end
end)()

return M
