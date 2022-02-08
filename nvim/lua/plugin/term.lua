require("toggleterm").setup{
open_mapping = [[<F4>]],
}


local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "gitui", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<F7>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
