return {
	'catppuccin/nvim',
	config = function()
		vim.cmd.colorscheme('catppuccin-mocha')
		vim.api.nvim_set_hl(0, 'Normal',      { bg = 'none' })
		vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
		vim.api.nvim_set_hl(0, 'Folded', { bg = 'None', fg = '#6C7086' })
	end
}
