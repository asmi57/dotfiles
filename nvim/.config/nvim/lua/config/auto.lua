vim.api.nvim_create_autocmd({ "Filetype" }, {
	callback = function(ev)
		if ev.match == "haskell" then
			vim.bo[ev.buf].tabstop = 2
			vim.bo[ev.buf].shiftwidth = 2
			vim.bo[ev.buf].expandtab = true

			local ht = require('haskell-tools')
			local bufnr = ev.buf
			local opts = { noremap = true, silent = true, buffer = bufnr, }
			-- haskell-language-server relies heavily on codeLenses,
			-- so auto-refresh (see advanced configuration) is enabled by default
			vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
			-- Hoogle search for the type signature of the definition under the cursor
			vim.keymap.set('n', '<space>ho', ht.hoogle.hoogle_signature, opts)
			-- Evaluate all code snippets
			vim.keymap.set('n', '<space>he', ht.lsp.buf_eval_all, opts)
			-- Toggle a GHCi repl for the current package
			vim.keymap.set('n', '<leader>hr', ht.repl.toggle, opts)
			-- Toggle a GHCi repl for the current buffer
			vim.keymap.set('n', '<leader>hb', function()
				ht.repl.toggle(vim.api.nvim_buf_get_name(0))
			end, opts)
			vim.keymap.set('n', '<leader>hq', ht.repl.quit, opts)
		end
	end
})
