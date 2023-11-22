
local api = require("nvim-tree.api")

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	on_attach = function(bufnr)
		local opts = {
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true
		}
		api.config.mappings.default_on_attach(bufnr)

		vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts)
		vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts)
		vim.keymap.set('n', '<leader>e', api.tree.close, opts)

	end
})

