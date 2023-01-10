require("lsp-format").setup {}
require "lspconfig".gopls.setup { on_attach = require "lsp-format".on_attach } --lsp config
--local lsp_installer = require("nvim-lsp-installer")
--lsp_installer.on_server_ready(function(server)
--	local opts = {}
--	server:setup(opts)
--end)

-- formatting setting
require("lsp-format").setup {}
require "lspconfig".gopls.setup { on_attach = require "lsp-format".on_attach }
--
local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup {
	on_attach = on_attach,
}

nvim_lsp.tsserver.setup {
	-- Omitting some options
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = nvim_lsp.util.root_pattern("package.json")
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