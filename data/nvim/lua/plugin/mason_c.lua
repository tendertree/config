require("mason-lspconfig").setup {
	ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" },
}


require 'lspconfig'.tsserver.setup {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" }
}
