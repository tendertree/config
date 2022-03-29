--lsp config
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
		server:setup(opts)
end)


local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup{}

nvim_lsp.tsserver.setup{
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("package.json")
}nvim_lsp.denols.setup {
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("deno.json"),

}
