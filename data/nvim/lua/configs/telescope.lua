local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

require("telescope").load_extension "file_browser"
local fb_actions = require 'telescope'.extensions.file_browser.actions
require("telescope").setup {
	extensions = {
		file_browser = {
			theme = "ivy",
			mappings = {
				["i"] = {
					["<j>"] = actions.move_selection_next,
					["<k>"] = actions.move_selection_previous,


				},
				["n"] = {
					-- your custom normal mode mappings
					['C-a'] = fb_actions.create,
					['h'] = fb_actions.goto_parent_dir,
					['/'] = function()
						vim.cmd('startinsert')
					end
				},
			},
		},
	},
}



vim.api.nvim_set_keymap("n", "tt", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true }
)
