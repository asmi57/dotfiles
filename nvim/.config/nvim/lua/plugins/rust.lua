return {
	'rust-lang/rust.vim',
	dependencies = { 'simrat39/rust-tools.nvim' },
	lazy = true,
	ft = { "rust" },
	config = function()
		vim.g.rustfmt_autosave = false

		local rt = require('rust-tools')
		local mason_registry = require('mason-registry')

		local codelldb = mason_registry.get_package("codelldb")
		local extension_path = codelldb:get_install_path() .. '/extension/'
		local codelldb_path = extension_path .. 'adapter/codelldb'
		local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

		rt.setup({
			dap = {
				adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
			},
			server = {
				on_attach = function(_, bufnr)
					require('plugins.lspconfig.on_attach')({ buf = bufnr })
					local bind = require('functions').keybind({
						noremap = true,
						silent = true,
						buffer = bufnr
					})
					bind("n", "<C-space>", rt.hover_actions.hover_actions)
					-- bind("n", "<leader>a", rt.code_action_group.code_action_group)
				end
			},
			tools = {
				hover_actions = {
					auto_focus = true
				}
			},
		})
	end
}
