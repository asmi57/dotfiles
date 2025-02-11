local function register(mode, map, func, merged_opts)
	vim.keymap.set(mode, map, func, merged_opts)

	local which_key_ok, which_key = pcall(require, 'which-key')
	if which_key_ok then
		which_key.register(map, vim.tbl_deep_extend('force', { mode = mode }, merged_opts))
	end
end

return function(default_opts)
	default_opts = default_opts or {
		noremap = true,
		silent = true,
	}

	return function(mode, map, func, opts)
		local merged_opts = vim.tbl_deep_extend('force', default_opts, opts or {})
		if type(map) == "string" then
			register(mode, map, func, merged_opts)
		elseif type(map) == "table" then
			for _, value in pairs(map) do
				register(mode, value, func, merged_opts)
			end
		end
	end
end
