local s = vim.api.nvim_set_keymap
--This is my keybind
local completion = require('completion')
local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
  end
--lsp key bind set   
  local custom_attach = function()
    completion.on_attach()
    mapper('n', '<leader>dn', 'vim.lsp.buf.code_action()')
    mapper('n', '<leader>dp', 'vim.lsp.buf.definition()')
  end
--colemak 
  require("nforcolemak")
  --file tree

s('n','<C-b>',':NvimTreeToggle<CR>',{noremap =true})
