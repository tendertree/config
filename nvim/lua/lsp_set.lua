local lspconfig = require'lspconfig'
lspconfig.util.default_config = vim.tbl_extend(
"force",
lspconfig.util.default_config,{on_attach=require'completion'.on_attach}
)
--autocomplete
vim.o.completeopt="menu,noinsert,noselect"
vim.g.completion_enable_snippet = 'vim-vsnip'
--lsputil
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
--load lspconfig 
require'lspconfig'.rust_analyzer.setup{
--on_attach=custom_attach
}
--Rust : add inlay 
vim.api.nvim_command([[
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
]])


