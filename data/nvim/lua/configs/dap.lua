local dap = require('dap')
local dapui = require("dapui")


require('mason-nvim-dap').setup({
	ensure_installed = { 'codelldb', 'jq' },
	handlers = {
		function(config)
			require('mason-nvim-dap').default_setup(config)
		end,
		rust = function(config)
			config.adapters = {
					name = "rust",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,

				},
				require('mason-nvim-dap').default_setup(config)
		end

	}
})
