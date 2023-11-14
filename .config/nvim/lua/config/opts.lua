

vim.opt.number = true
vim.opt.relativenumber = true

local tabsize = 4
vim.opt.tabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.expandtab = false

vim.opt.wrap = false

vim.opt.signcolumn = 'yes:3'
vim.opt.scrolloff = 10

vim.opt.list = true
vim.opt.listchars = {
	tab = '│ ',
	trail = '-',
	nbsp = '+'
}
-- os.execute("echo \xe2\x94\x82 | xclip -i -sel clip")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

