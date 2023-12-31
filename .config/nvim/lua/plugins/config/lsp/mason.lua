
local servers = {
	"lua_ls",
	"pyright",
	"jsonls",
	"rust_analyzer",
	"clangd",
	"kotlin_language_server",
	"jdtls",
	"hls",
	"gopls",
	"taplo",
	"csharp_ls"
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("plugins.config.lsp.handlers").on_attach,
		capabilities = require("plugins.config.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local file = "plugins.config.lsp.settings." .. server
	local require_ok = pcall(require, file)
	if require_ok then
		opts = vim.tbl_deep_extend("force", require(file), opts)
	end

	lspconfig[server].setup(opts)
end
