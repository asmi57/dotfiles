return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
	config = function()
		require('nvim-treesitter.configs').setup({
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			ensure_installed = { 'vim', 'vimdoc', },
			textobjects = {
				select = {
					enable = true,
					keymaps = {
						['ib'] = "@block.inner",
						['ab'] = "@block.outer",
						['il'] = "@loop.inner",
						['al'] = "@loop.outer",
						['if'] = "@function.inner",
						['af'] = "@function.outer",
					}
				}
			}
		})
	end
}
