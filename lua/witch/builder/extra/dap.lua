--- @param palette Palette
--- @param palette_name string
return function(palette, palette_name)
	return {
		-- Dap
		{ "DapBreakpoint", fg = palette.red },
		{ "DapStopped", fg = palette.green },
	}
end
