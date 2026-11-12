local api, augroup = vim.api, vim.api.nvim_create_augroup

local PLUG_NAME = "witch"

local M = {}

--- The highlight namespace used for dimming inactive windows.
--- `nil` means dimming is disabled.
M.ns = nil

--- Dimming level (0 = darkest, 1 = lightest).
M.level = 0.46

--- Enable dimming of inactive windows.
---@param excluded table filetypes and buftypes to exclude from dimming
---@param level number|nil dimming level from 0 to 1
function M.setup(excluded, level)
	M.level = level or M.level
	M.ns = api.nvim_create_namespace(PLUG_NAME .. "_dimmed")

	local wins_dimmed = {}

	local function is_excluded(bufnr)
		local ft = api.nvim_get_option_value("filetype", { buf = bufnr })
		local bt = api.nvim_get_option_value("buftype", { buf = bufnr })
		return excluded.filetypes[ft]
			or excluded.buftypes[bt]
			or vim.tbl_contains(excluded.filetypes, ft)
			or vim.tbl_contains(excluded.buftypes, bt)
	end

	local function dim_wins()
		if is_excluded(0) then
			local id, _ = next(wins_dimmed)
			if id then
				api.nvim_win_set_hl_ns(id, 0)
				wins_dimmed[id] = nil
			end
			return
		end

		local win_ids = api.nvim_list_wins()
		local curr_win_id = api.nvim_get_current_win()

		for _, win_id in ipairs(win_ids) do
			if win_id ~= curr_win_id and not is_excluded(api.nvim_win_get_buf(win_id)) then
				wins_dimmed[win_id] = true
				api.nvim_win_set_hl_ns(win_id, M.ns)
			end
		end
		wins_dimmed[curr_win_id] = nil
		api.nvim_win_set_hl_ns(curr_win_id, 0)
	end

	vim.api.nvim_create_autocmd({ "WinEnter", "WinClosed" }, {
		group = augroup(PLUG_NAME .. "_dim", { clear = true }),
		callback = function(args)
			if args.event == "WinClosed" then
				wins_dimmed[api.nvim_get_current_win()] = nil
			end
			dim_wins()
		end,
	})
end

--- Disable dimming and clean up the namespace.
function M.disable()
	if M.ns then
		-- Clear the namespace from all windows
		local win_ids = api.nvim_list_wins()
		for _, win_id in ipairs(win_ids) do
			api.nvim_win_set_hl_ns(win_id, 0)
		end
		M.ns = nil
	end
end

return M
