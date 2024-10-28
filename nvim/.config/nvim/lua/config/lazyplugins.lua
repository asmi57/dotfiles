local require = function (path)
	local ok, result = pcall(require, path)
	return ok and result or {}
end

return {
	require('plugins.lspconfig'),
	require('plugins.catppuccin'),
	require('plugins.telescope'),
	require('plugins.oil'),
	require('plugins.indent-blankline'),
	require('plugins.treesitter'),
	require('plugins.leap'),
	require('plugins.rust'),
}
