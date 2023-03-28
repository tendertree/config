require("mason").setup()
require("mason-lspconfig").setup {}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").tsserver.setup { capabilities = capabilities, on_attach = on_attach, }
require("lspconfig").lua_ls.setup { capabilities = capabilities }
require("lspconfig").rust_analyzer.setup { capabilities = capabilities }


local capabilitiesHtml = vim.lsp.protocol.make_client_capabilities()
capabilitiesHtml.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.html.setup {
	capabilities = capabilitiesHtml,
}
