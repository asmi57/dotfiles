local function bind(mode, map, func, opts)
	vim.keymap.set(mode, map, func, opts or {
		noremap = true,
		silent = true,
	})
end

vim.g.mapleader = ' '

-- Basic remaps
bind('n', 'u', vim.cmd.undo)
bind('n', 'U', vim.cmd.redo)

bind('n', '<ESC>', vim.cmd.noh)

bind('n', '<leader>df', vim.diagnostic.open_float)

-- Navigate buffers
bind('n', '<leader>x',  vim.cmd.bdelete)
bind('n', '<leader>bn', vim.cmd.bnext)
bind('n', '<leader>bp', vim.cmd.bprevious)
bind('n', '<leader>bl', vim.cmd.buffers)

-- Navigate splits
bind('n', '<C-Left>' , '<C-w><Left>')
bind('n', '<C-Right>', '<C-w><Right>')
bind('n', '<C-Up>',    '<C-w><Up>')
bind('n', '<C-Down>',  '<C-w><Down>')

-- Resize splits
bind('n', '<leader>r<C-Left>',  ':vertical resize -6<cr>')
bind('n', '<leader>r<C-Right>', ':vertical resize +6<cr>')
bind('n', '<leader>r<C-Up>',    ':resize -6<cr>')
bind('n', '<leader>r<C-Down>',  ':resize +6<cr>')

bind('n', '<leader>r<Left>',  ':vertical resize -2<cr>')
bind('n', '<leader>r<Right>', ':vertical resize +2<cr>')
bind('n', '<leader>r<Up>',    ':resize -2<cr>')
bind('n', '<leader>r<Down>',  ':resize +2<cr>')

-- Toggle hard tabs
bind('n', '<leader><tab>', function()
	vim.cmd('set expandtab!')
	vim.cmd('set expandtab?')
end)

-- Escape terminal mode
bind('t', '<C-x>', vim.cmd.stopinsert)

-- Plugin specific

-- Telescope
local success, builtins = pcall(require, 'telescope.builtin')
if success then
	bind('n', '<leader>ff', builtins.find_files)
	bind('n', '<leader>fb', builtins.buffers)
	bind('n', '<leader>fw', builtins.live_grep)
	bind('n', '<leader>fh', builtins.help_tags)
end

-- NvimTree
local success, nvim_tree_api = pcall(require, 'nvim-tree.api')
if success then
	bind('n', '<leader>e', nvim_tree_api.tree.open)
end

