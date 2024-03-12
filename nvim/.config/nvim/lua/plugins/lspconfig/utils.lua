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
	local v = vim
	local bind = require('functions').keybind({
		noremap = true,
		silent = true,
		buffer = bufnr
	})

	local lspsafe = function(f)
		return function()
			if v.lsp.buf.server_ready()
			then f()
			else print("LSP Not Ready!") end
		end
	end

	v.g.mapleader = ' '
	bind('n', '<leader>k',  lspsafe(v.lsp.buf.hover),         { desc = "Hover information" })
	bind('n', '<leader>a',  lspsafe(v.lsp.buf.code_action),   { desc = "List code actions" })
	bind('n', '<leader>df', lspsafe(v.diagnostic.open_float), { desc = "Open diagnostic in float" })
	bind('n', '<leader>rn', lspsafe(v.lsp.buf.rename),        { desc = "Rename symbol" })
	bind('n', 'gd',         lspsafe(v.lsp.buf.definition),    { desc = "Go to definition" })
	bind('n', 'gD',         lspsafe(v.lsp.buf.declaration),   { desc = "Go to declaration" })
	bind('n', 'gr',         lspsafe(v.lsp.buf.references),    { desc = "Go to references" })
end

return M
