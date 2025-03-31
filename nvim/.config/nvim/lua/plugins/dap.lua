return {
	"mfussenegger/nvim-dap",
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio'
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')
		dapui.setup()

		dap.listeners.after.event_initialized['dapui_config'] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated['dapui_config'] = function()
			dapui.close()
		end
		dap.listeners.after.event_exited['dapui_config'] = function()
			dapui.close()
		end

		dap.adapters.codelldb = {
			type = 'executable',
			command = 'codelldb',
		}

		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
			},
		}

	end
}
