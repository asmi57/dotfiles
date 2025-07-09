local require = function (path)
	local ok, result = pcall(require, path)
	return ok and result or {}
end

return {
	require('plugins.lspconfig'),
	require('plugins.colorscheme'),
	require('plugins.telescope'),
	require('plugins.oil'),
	require('plugins.indent-blankline'),
	require('plugins.treesitter'),
	require('plugins.leap'),
	require('plugins.rust'),
	require('plugins.colorizer'),
	require('plugins.tinyglimmer'),
	require('plugins.dap'),
	require('plugins.pico8'),
}
