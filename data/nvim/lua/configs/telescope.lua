local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions
require("telescope").setup {
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
					['<C-w'] = function() vim.cmd('normal vdb') end,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,

				},
				["n"] = {
					-- your custom normal mode mappings
					['N'] = fb_actions.create,
					['h'] = fb_actions.goto_parent_dir,
					['/'] = function()
						vim.cmd('startinsert')
					end
				},
			},
		},
	},
}

require("telescope").load_extension "file_browser"

--local opts = { noremap = true, silent = true }
--vim.keymap.set('n', ';f', '<cmd>lua require("telescope.builtin).find_files({no_ignore=false,hidden=true})<cr>', opts)
--vim.keymap.set('n', ';r', '<cmd>lua require("telescope.builtin).live_grep({no_ignore=false,hidden=true})<cr>', opts)
--#region
vim.api.nvim_set_keymap("n", "tt", ":Telescope file_browser", { noremap = true }
)


telescope.load_extension "file_browser"
telescope.load_extension "projects" -- project.nvim
