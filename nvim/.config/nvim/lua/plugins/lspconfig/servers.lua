local lspconfig = require('lspconfig')
local utils = require('plugins.lspconfig.utils')

local on_attach = function(client, bufnr)
	utils.lsp_keybinds(bufnr)
end


local setup_server = function(server_name)

	local capabilities = nil
	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if ok then
		capabilities = cmp_nvim_lsp.default_capabilities()
	else
		print('failed')
	end

	local opts = {
		on_attach = on_attach,
		capabilities = capabilities
	}
	local file = 'plugins.lspconfig.settings.' .. server_name
	if pcall(require, file) then
		opts = vim.tbl_deep_extend('force', require(file), opts)
	end

	lspconfig[server_name].setup(opts)
end

return {
	setup = function(servers)
		utils.misc_config()
		for _, server in pairs(servers) do
			setup_server(server)
		end
	end
}


