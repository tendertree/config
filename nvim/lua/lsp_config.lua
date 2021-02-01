local lspconfig = require'lspconfig'
lspconfig.util.default_config = vim.tbl_extend(
"force",
lspconfig.util.default_config,{on_attach=require'completion'.on_attach}
)
--autocomplete popup menu 
vim.o.completeopt="menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.g.completion_enable_snippet = 'UltiSnips'
--lspsaga 
local saga = require 'lspsaga'
saga.init_lsp_saga{
max_hover_width = 100
}
--
require'lspconfig'.rust_analyzer.setup{
}
vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting()")
--active inlay 
vim.api.nvim_command('au InsertLeave *.rs lua require"lsp_extensions".inlay_hints {prefix=" ", highlight = "Comment", enabled = {"TypeHint","ChainingHint", "ParameterHint"}}') 

