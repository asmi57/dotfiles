local function require_or_nil(path)
	local ok, retval = pcall(require, path)
	if ok then
		return retval
	else
		print(string.format('require(%s) failed: %s', path, retval))
		return nil
	end
end

return {
	require_or_nil('plugins.catppuccin'),
	require_or_nil('plugins.plenary'),
	require_or_nil('plugins.telescope'),
	require_or_nil('plugins.noice'),
	require_or_nil('plugins.oil'),
	require_or_nil('plugins.indent-blankline'),
	require_or_nil('plugins.treesitter'),
	require_or_nil('plugins.vgit'),
	require_or_nil('plugins.leap'),
	-- require_or_nil('plugins.which-key'),
	require_or_nil('plugins.rust'),
	require_or_nil('plugins.nvim-cmp'),
	require_or_nil('plugins.lspconfig'),
}
