local language_servers = require("config.servers")

return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup({
				ui = {
					border = 'rounded'
				}
			})
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup()
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.lspconfig.servers').setup(language_servers)
		end
	}
}
