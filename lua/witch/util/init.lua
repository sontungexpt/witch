local tonumber = tonumber
local M = {}
local blend_bg = "#000000"
local blend_fg = "#ffffff"
-- local day_brightness = 0.3

--- Convert hex color to rgb
---@param hex_color string : hex color code e.g. #ffffff or #fff
local hex2rgb = function(hex_color)
	if hex_color:len() == 4 then
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
---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
M.blend = function(foreground, background, alpha)
	if foreground == nil or foreground:sub(1, 1) ~= "#" then return foreground end

	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local rgb_bg = hex2rgb(background)
	local rgb_fg = hex2rgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * rgb_fg[i] + ((1 - alpha) * rgb_bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
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
M.merge_tb = function(to, from)
	if type(to) == "table" and type(from) == "table" then
		for k, v in pairs(from) do
			if to[1] == nil then -- to is a dict
				to[k] = M.merge_tb(to[k], v)
			else -- to is a list
				to[#to + 1] = v
			end
		end
	else
		to = from
	end
	return to
end

M.read_only = function(tbl, err_msg)
	local cache = {}

	function M.read_only(table, error_msg)
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

	return M.read_only(tbl, err_msg)
end

return M
