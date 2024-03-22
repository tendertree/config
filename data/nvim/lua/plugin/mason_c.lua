require("mason").setup()
require("mason-lspconfig").setup {}
local navbuddy = require("nvim-navbuddy")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr) end
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		'html',
		'cssls',
		'rust_analyzer',
		'jsonls',
		'pylsp'

	},

	handlers = {
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have a dedicated handler.
		function(server_name)
			-- I use lsp-status which adds itself to the capabilities table
			require("lspconfig")[server_name].setup({ on_attach = on_attach, capabilities = capabilities })
		end,
		["lua_ls"] = function()
			require("lspconfig").lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
					},
				},
			})
		end,

		["rust_analyzer"] = function()
			require("rust-tools").setup({
				capabilities = capabilities,
			})
		end,

		["pylsp"] = function()
			require("lspconfig").pylsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							-- formatter options
							black = { enabled = true },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							-- linter options
							pylint = { enabled = true, executable = "pylint" },
							pyflakes = { enabled = false },
							pycodestyle = { enabled = false },
							-- type checker
							pylsp_mypy = { enabled = true },
							-- auto-completion options
							jedi_completion = { fuzzy = true },
							-- import sorting
							pyls_isort = { enabled = true },
						},
					},
				},
			})
		end
	}

})

--format on save
vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		vim.lsp.buf.format {
		}
	end,
})
