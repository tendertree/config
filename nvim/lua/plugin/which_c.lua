whichkey = require "which-key"
local conf = {
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
	},
}

local opts = {
	mode = "n",  -- Normal mode
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}
whichkey.setup(conf)
whichkey.register(opts)


local wk = require("which-key")
wk.register({
	b = {
		name = "test",
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
	},
	o = {
		name = "Neotest",
		a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
		f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
		F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
		l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
		L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
		n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
		N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
		o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
		S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
		s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
	}
})
