return {
	tildeop = true,
	number = true,
	relativenumber = true,
	termguicolors = true,
	ignorecase = true,
	smartcase = true,
	swapfile = false,
	shell = "/usr/bin/bash",

	-- Screenspace {{{

	wrap = false,
	signcolumn = 'yes:2',
	scrolloff = 10,
	sidescrolloff = 10,
	foldmethod = 'marker',

	-- }}}
	-- Tabs {{{

	list = true,
	listchars = {
		tab = '│ ',
		trail = '-',
		nbsp = '+'
	},

	tabstop = 4,
	shiftwidth = 4,
	expandtab = false,

	-- }}}
}
