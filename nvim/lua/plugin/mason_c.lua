require("mason").setup()
require("mason-lspconfig").setup {}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").tsserver.setup { capabilities = capabilities, on_attach = on_attach, }
require("lspconfig").lua_ls.setup { capabilities = capabilities }
require("lspconfig").rust_analyzer.setup { capabilities = capabilities }
require('lspconfig').tailwindcss.setup { capabilities = capabilities }

local capabilitiesHtml = vim.lsp.protocol.make_client_capabilities()
capabilitiesHtml.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.html.setup {
	capabilities = capabilitiesHtml,
}
local lspconfig = require('lspconfig')
lspconfig.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
		"typescriptreact", "vue" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
					["bem.enabled"] = true,
			},
		},
	}
})
