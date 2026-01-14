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
}
