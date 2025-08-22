local grp = "UserAutocmds"
local grpid = vim.api.nvim_create_augroup(grp, { clear = true })



UiuaLspId = nil
vim.api.nvim_create_autocmd({ "BufAdd", "VimEnter" }, {
	group = grpid,
	pattern = { '*.ua' },
	desc = "Uiua Language Server",
	callback = function(event)
		if UiuaLspId == nil then
			UiuaLspId = vim.lsp.start({
				name = "uiua-ls",
				cmd = { 'uiua', 'lsp' },
				root_dir = vim.env.PWD,
			})
		end
		vim.lsp.buf_attach_client(event.buf, UiuaLspId)
	end
})

