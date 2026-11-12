local levels, notify, schedule = vim.log.levels, vim.notify, vim.schedule

return {
	info = function(msg, opts)
		schedule(function() notify(msg, levels.INFO, opts or { title = "Witch" }) end)
	end,
	warn = function(msg, opts)
		schedule(function() notify(msg, levels.WARN, opts or { title = "Witch" }) end)
	end,
	error = function(msg, opts)
		schedule(function() notify(msg, levels.ERROR, opts or { title = "Witch" }) end)
	end,
}
