local gettheme = function ()
	local f = io.open("/tmp/theme", "r")
	if f then
		local data = f:read('a')
		io.close(f)
		return data
	else
		return 'default'
	end
end

local theme = gettheme()
local updatetheme = function(theme)
	if theme == "mocha" then
		vim.cmd.colorscheme('catppuccin-mocha')
		vim.api.nvim_set_hl(0, 'Normal',      { bg = 'none' })
		vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
	elseif theme == "gruv" then
		vim.cmd.colorscheme('gruvbox')
		vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
	else
		print("theme " .. theme .. " not recognized")
	end
end

local autotheme = function()
	updatetheme(gettheme())
end

-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
	-- callback = autotheme
-- })

return {
	{
		'catppuccin/nvim',
		config = autotheme,
	},
	{
		'ellisonleao/gruvbox.nvim',
		config = autotheme,
	}
}
