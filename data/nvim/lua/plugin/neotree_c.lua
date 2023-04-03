require("neo-tree").setup({
	window = {
		mappings = {
				["s"] = "open_vsplit",
				["e"] = "",
				["q"] = "close_window"
		}
	}
})

local s = vim.api.nvim_set_keymap
s('n', '<C-n>', ':Neotree<CR>', { noremap = true, silent = true })
