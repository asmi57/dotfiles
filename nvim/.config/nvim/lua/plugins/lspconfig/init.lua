return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},

	config = function()
		require("mason").setup({ ui = { border = "single" } })
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single"
		})

		local lspconfig = require("lspconfig")

		local caps = vim.lsp.protocol.make_client_capabilities()
		local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
		local capabilities = vim.tbl_deep_extend("force", {}, caps, cmp_caps)

		local on_attach = function(event)
			local bind = require('functions').keybind({
				noremap = true,
				silent = true,
				buffer = event.buf
			})

			bind('n', '<leader>k',  vim.lsp.buf.hover)
			bind('n', '<leader>a',  vim.lsp.buf.code_action)
			bind('n', '<leader>df', vim.diagnostic.open_float)
			bind('n', '<leader>rn', vim.lsp.buf.rename)
			bind('n', 'gd',         vim.lsp.buf.definition)
			bind('n', 'gD',         vim.lsp.buf.declaration)
			bind('n', 'gr',         vim.lsp.buf.references)
		end

		local default_opts = {
			on_attach = on_attach,
			capabilities = capabilities
		}

		for _, server_name in ipairs(require("config.servers")) do
			local file = 'plugins.lspconfig.settings.' .. server_name
			local ok, overrides = pcall(require, file)

			default_opts = vim.tbl_deep_extend('force', ok and overrides or {}, default_opts)

			lspconfig[server_name].setup(default_opts)
		end

		require('plugins.lspconfig.completion')
		require('plugins.lspconfig.diagnostic')

	end
}
