require("neo-tree").setup({
	filesfilesystem = {
		filtered_items = {
			visible = true,
		 show_hidden_count = true,
	 hide_dotfiles = false,
	 hide_gitignored = true,
	 hide_by_name = {
	   -- '.git',
	   -- '.DS_Store',
	   -- 'thumbs.db',
	 },
		}
	},
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
