
local opts = require("config.opts")
for k, v in pairs(opts) do
	vim.opt[k] = v
end


local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	 vim.fn.system({'git','clone','--filter=blob:none','https://github.com/folke/lazy.nvim.git','--branch=stable',lazypath})
end
vim.opt.rtp:prepend(lazypath)

local plugins = require('config.lazyplugins')
require('lazy').setup(plugins)

require("config.binds")
require("config.auto")
