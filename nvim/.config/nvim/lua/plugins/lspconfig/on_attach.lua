return function(event)
	local bind = require('functions').keybind({
		noremap = true,
		silent = true,
		buffer = event.buf
	})

	bind('n', '<leader>k',  function() vim.lsp.buf.hover({ border = "rounded" }) end)
	bind('n', '<leader>a',  vim.lsp.buf.code_action)
	bind('n', '<leader>df', vim.diagnostic.open_float)
	bind('n', '<leader>rn', "<CMD>Lspsaga rename<CR>")
	bind('n', 'gd',         vim.lsp.buf.definition)
	bind('n', 'gD',         vim.lsp.buf.declaration)
	bind('n', 'gr',         "<CMD>Lspsaga finder<CR>")
end

