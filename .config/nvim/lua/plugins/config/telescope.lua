-- These are the default options.
require("telescope").setup({
	extensions = {
		hoogle = {
			render = 'default',       -- Select the preview render engine: default|treesitter
			-- default = simple approach to render the document
			-- treesitter = render the document by utilizing treesitter's html parser
			renders = {               -- Render specific options
				treesitter = {
					remove_wrap = false   -- Remove hoogle's own text wrapping. E.g. if you uses neovim's buffer wrapping
					-- (autocmd User TelescopePreviewerLoaded setlocal wrap)
				}
			}
		}
	},
})

-- require('telescope').load_extension('hoogle')
