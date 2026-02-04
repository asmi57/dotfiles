local require = function(path)
	local ok, result = pcall(require, path)
	return ok and result or {}
end

return {
	require('plugins.colorizer'),
	require('plugins.colorscheme'),
	require('plugins.conform'),
	require('plugins.haskell'),
	require('plugins.indent-blankline'),
	require('plugins.leap'),
	require('plugins.lint'),
	require('plugins.lspconfig'),
	require('plugins.oil'),
	require('plugins.pico8'),
	require('plugins.telescope'),
	require('plugins.tinyglimmer'),
	require('plugins.treesitter'),
	{
		"geg2102/nvim-python-repl",
		ft = { "python", "lua", "scala" },
		config = function()
			require("nvim-python-repl").setup({
				execute_on_send = false,
				vsplit = false,
				spawn_command = {
					python = "ptpython"
				}
			})
		end
	},
	{
		'axkirillov/unified.nvim',
		config = function()
			require("unified").setup({
				signs = {
					add = "│",
					delete = "│",
					change = "│",
				},
				highlights = {
					add = "DiffAdd",
					delete = "DiffDelete",
					change = "DiffChange",
				},
				line_symbols = {
					add = "+",
					delete = "-",
					change = "~",
				},
				auto_refresh = true, -- Whether to automatically refresh diff when buffer changes
			})
		end
	}
}
