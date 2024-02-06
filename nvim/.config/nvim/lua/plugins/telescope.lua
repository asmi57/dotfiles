return {
	{
		'nvim-telescope/telescope.nvim',
		config = function ()
			require('telescope').setup({
				extensions = {
					['ui-select'] = {}
				}
			})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require('telescope').load_extension('ui-select')
		end
	}
}

