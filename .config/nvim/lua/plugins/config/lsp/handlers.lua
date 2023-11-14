local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
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
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		vim.api.nvim_exec(
		[[
		augroup lsp_document_highlight
		autocmd! * <buffer>
		autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
		autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		augroup END
		]],
		false
		)
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = false, buffer = bufnr}
	local keymap = function(mode, binding, func)
		vim.keymap.set(mode, binding, func, opts)
	end

	keymap("n", "gD", function() vim.lsp.buf.declaration() end)
	keymap("n", "gd", function() vim.lsp.buf.definition() end)
	keymap("n", "<leader>k", (function() vim.lsp.buf.hover() end))
	keymap("n", "gi", function() vim.lsp.buf.implementation() end)
	keymap("n", "<C-k>", function() vim.lsp.buf.signature_help() end)
	keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end)
	keymap("n", "gr", function() vim.lsp.buf.references() end)
	keymap("n", "<leader>a", function() vim.lsp.buf.code_action() end)
	keymap("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end)
	keymap("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end)
	-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
	-- if client.name == "tsserver" then
		-- client.server_capabilities.documentFormattingProvider = false
	-- end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities()
end

return M
