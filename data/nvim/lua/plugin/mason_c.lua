require("mason").setup()
require("mason-lspconfig").setup {}
local navbuddy = require("nvim-navbuddy")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").tsserver.setup { capabilities = capabilities, on_attach = function(client, bufnr)
	navbuddy.attach(client, bufnr)
end
}
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
--python config
lspconfig = require("lspconfig")
lspconfig.pylsp.setup {
	on_attach = custom_attach,
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
	flags = {
		debounce_text_changes = 200,
	},
	capabilities = capabilities,
}
