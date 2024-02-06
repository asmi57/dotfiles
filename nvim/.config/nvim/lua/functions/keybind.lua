return function(default_opts)
	default_opts = default_opts or {
		noremap = true,
		silent = true,
	}

	return function (mode, map, func, opts)

		local merged_opts = vim.tbl_deep_extend('force', default_opts, opts or {})
		vim.keymap.set(mode, map, func, merged_opts)

		local which_key_ok, which_key = pcall(require, 'which-key')
		if which_key_ok then
			which_key.register(map, vim.tbl_deep_extend('force', { mode = mode }, merged_opts))
		end
	end
end
