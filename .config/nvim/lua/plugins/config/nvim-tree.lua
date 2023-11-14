
local api = require("nvim-tree.api")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
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
		api.config.mappings.default_on_attach(bufnr)
		vim.keymap.set('n', 'C', api.tree.change_root_to_node, {
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true
		})
	end
})

