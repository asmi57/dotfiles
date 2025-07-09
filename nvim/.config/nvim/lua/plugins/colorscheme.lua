return {
	{
		'ellisonleao/gruvbox.nvim',
		config = function()
			vim.cmd.colorscheme('gruvbox')
			vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'StatusLine', {
				fg = '#d5c4a1',
				bg = '#3c3836'
			})
		end,
		priority = 1000,
	}
}
