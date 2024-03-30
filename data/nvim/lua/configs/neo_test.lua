require("neotest").setup {
	adapters = {
		require "neotest-python" {
			dap = { justMyCode = false },
			runner = "unittest",
		},
		require('neotest-jest')({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
		require "neotest-go",
		require "neotest-rust",
		require "neotest-plenary",
		require "neotest-vim-test" {
			ignore_file_types = { "python", "vim", "lua", "rust" },
		},
	},
	config = true,
	keys = {
	},
}


--neodev setttings

require("neodev").setup({
	library = { plugins = { "neotest" }, types = true },
	...
})
