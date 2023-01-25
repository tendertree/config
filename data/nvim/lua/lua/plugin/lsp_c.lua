require("mason-lspconfig").setup {
	ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" },
}


require 'lspconfig'.tsserver.setup {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" }
}

local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup {
	on_attach = on_attach,
}

nvim_lsp.denols.setup {
	-- Omitting some options
	root_dir = nvim_lsp.util.root_pattern("deno.json"),

}

nvim_lsp.sumneko_lua.setup {
	--nvim_lsp.sumneko_lua.setup{
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			},
			workspace = {
				--make the server aware of Neovim runditme fils
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,

			}
		}
	}
}

require 'lspconfig'.jedi_language_server.setup {}

-- auto formatting on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

--rust setup
local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "bt", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<M-d>", rt.code_action_group.code_action_group, { buffer = bufnr })
			vim.keymap.set("n", "by", "<cmd> RustParentModule<CR>")
			vim.keymap.set("n", "bq", "<cmd> RustRunnables<CR>")
		end,
	},
})

--ad
