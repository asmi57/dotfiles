return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp',
		'FelipeLema/cmp-async-path',
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
		'Saecki/crates.nvim',
		'rafamadriz/friendly-snippets',
	},
	config = function()
		require('plugins.temp.cmp')
	end
}
