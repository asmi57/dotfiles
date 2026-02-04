LspConfigs = {}

LspOnAttach = function(ev)
	local bind = require('functions').keybind({
		noremap = true,
		silent = true,
		buffer = ev.buf
	})


	bind('n', '<leader>k', function() vim.lsp.buf.hover({ border = "rounded" }) end)
	bind('n', '<leader>a', vim.lsp.buf.code_action)
	bind('n', '<leader>df', vim.diagnostic.open_float)
	bind('n', '<leader>rf', vim.lsp.buf.format)
	bind('n', '<leader>rn', ':Lspsaga rename<CR>')
	bind('n', 'gd', vim.lsp.buf.definition)
	bind('n', 'gD', vim.lsp.buf.declaration)
	bind('n', 'gr', vim.lsp.buf.references)
end


return {
	'neovim/nvim-lspconfig',
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"maan2003/lsp_lines.nvim",
		"nvimdev/lspsaga.nvim",
	},

	config = function()
		vim.api.nvim_create_autocmd('LspAttach', { callback = LspOnAttach })

		require("mason").setup({ ui = { border = "single" } })
		local caps = vim.lsp.protocol.make_client_capabilities()
		local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
		local capabilities = vim.tbl_deep_extend("force", {}, caps, cmp_caps)

		local default_opts = { capabilities = capabilities }
		for _, lsp in pairs(LanguageServers) do
			local ok, config = pcall(require, "plugins.lspconfig.settings." .. lsp)
			if not ok then config = {} end
			config = vim.tbl_deep_extend('force', config, default_opts)
			vim.lsp.config(lsp, config)
			LspConfigs[lsp] = config
		end
		vim.lsp.enable(LanguageServers, true)

		vim.diagnostic.config({
			virtual_text = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				}
			},
			update_in_insert = true,
			underline = true,
			severity_sort = { reverse = true },
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})


		require('plugins.lspconfig.completion')
		require('plugins.lspconfig.lspsaga')
	end
}
