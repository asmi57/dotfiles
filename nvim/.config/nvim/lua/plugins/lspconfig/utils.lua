local lspconfig = require('lspconfig')

local M = {}

M.misc_config = function()
	local signs = {
		["DiagnosticSignError"] = "" ,
		["DiagnosticSignWarn"] = "" ,
		["DiagnosticSignHint"] = "" ,
		["DiagnosticSignInfo"] = "" ,
	}

	for name, icon in pairs(signs) do
		vim.fn.sign_define(name, { texthl = name, text = icon, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

end

M.lsp_keybinds = function(bufnr)
	local bind = require('functions').keybind({
		noremap = true,
		silent = true,
		buffer = bufnr
	})

	vim.g.mapleader = ' '
	bind('n', '<leader>k',  vim.lsp.buf.hover,         { desc = "Hover information" })
	bind('n', '<leader>a',  vim.lsp.buf.code_action,   { desc = "List code actions" })
	bind('n', '<leader>df', vim.diagnostic.open_float, { desc = "Open diagnostic in float" })
	bind('n', '<leader>rn', vim.lsp.buf.rename,        { desc = "Rename symbol" })
	bind('n', 'gd', vim.lsp.buf.definition,            { desc = "Go to definition" })
	bind('n', 'gr', vim.lsp.buf.references,            { desc = "Go to references" })
end

return M
