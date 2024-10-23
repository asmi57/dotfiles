vim.g.mapleader = ' '

local bind = require('functions').keybind({ noremap = true, silent = true })

-- Plugin Agnostic {{{
-- Basic remaps {{{

bind('n', '<ESC>', vim.cmd.noh)
bind('n', 'U', vim.cmd.redo) -- sensible
bind('n', '<leader><tab>', function() -- toggle hard tabs
	vim.cmd('set expandtab!')
	vim.cmd('set expandtab?')
end, { desc = "Toggle hard tabs" })
bind('t', '<C-x>', vim.cmd.stopinsert) -- escape terminal mode

bind({ 'n', 'i', 'v' }, "<S-Left>",  "<Left>")
bind({ 'n', 'i', 'v' }, "<S-Right>", "<Right>")
bind({ 'n', 'i', 'v' }, "<S-Up>",    "<Up>")
bind({ 'n', 'i', 'v' }, "<S-Down>",  "<Down>")

bind({ 'n', 'i', 'v' }, "", require("functions").comment)

-- }}}
-- Navigate buffers {{{

bind('n', '<leader>x',  vim.cmd.bdelete,   { desc = "Close current buffer" })
bind('n', '<leader>bd', vim.cmd.bdelete,   { desc = "Close current buffer" })
bind('n', '<leader>bn', vim.cmd.bnext,     { desc = "Switch to next buffer"})
bind('n', '<leader>bp', vim.cmd.bprevious, { desc = "Switch to previous buffer"})

-- }}}
-- Splits {{{

bind('n', '<C-Left>' , '<C-w><Left>')
bind('n', '<C-Right>', '<C-w><Right>')
bind('n', '<C-Up>',    '<C-w><Up>')
bind('n', '<C-Down>',  '<C-w><Down>')

bind('n', '<leader>r<C-Left>',  ':vertical resize -6<cr>')
bind('n', '<leader>r<C-Right>', ':vertical resize +6<cr>')
bind('n', '<leader>r<C-Up>',    ':resize -6<cr>')
bind('n', '<leader>r<C-Down>',  ':resize +6<cr>')

bind('n', '<leader>r<Left>',  ':vertical resize -2<cr>')
bind('n', '<leader>r<Right>', ':vertical resize +2<cr>')
bind('n', '<leader>r<Up>',    ':resize -2<cr>')
bind('n', '<leader>r<Down>',  ':resize +2<cr>')

-- }}}
-- }}}
-- Plugin Specific {{{
-- Telescope {{{

local telescope_ok, telescope = pcall(require, 'telescope.builtin')
if telescope_ok then
	bind('n', '<leader>ff',  telescope.find_files,   { desc = "Telescope files" })
	bind('n', '<leader>fw',  telescope.live_grep,    { desc = "Telescope live grep" })
	bind('n', '<leader>fb',  telescope.buffers,      { desc = "Telescope buffers" })
	bind('n', '<leader>fd',  telescope.diagnostics,  { desc = "Telescope diagnostics" })
	bind('n', '<leader>fg',  telescope.git_status,   { desc = "Telescope git status" })
end

-- }}}
-- Oil {{{

local oil_ok, oil = pcall(require, 'oil')
if oil_ok then
	bind('n', '<leader>e', oil.open_float, { desc = "Open Oil (float)" })
	bind('n', '-',         oil.open,       { desc = "Open Oil" })
end

-- }}}
-- Rust {{{

bind('n', '<leader>rf', ':RustFmt<CR>')

-- }}}
-- }}}
