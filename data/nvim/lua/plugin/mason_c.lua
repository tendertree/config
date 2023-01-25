require("mason-lspconfig").setup {
	ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" },
}


require 'lspconfig'.tsserver.setup {
	    on_attach = on_attach,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" }
}
