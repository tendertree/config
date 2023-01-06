--basic theme setting
local o = vim.o
o.termguicolors = true
o.guifont = 'Blexmono Nerd Font'
vim.cmd("colorscheme melange")
o.background = "light"
--startify setting
vim.g.startify_session_persistence = true
vim.g.startify_custom_header = {
	'                  ',
	'        <(- )___  ',
	'         ( ._> /  ',
	'          `---`   '
}

----- lsp setting
vim.fn.sign_define("LspDiagnosticsSignError",
	{ text = "", texthl = "GruvboxRed" })
vim.fn.sign_define("LspDiagnosticsSignWarning",
	{ text = "", texthl = "GruvboxYellow" })
vim.fn.sign_define("LspDiagnosticsSignInformation",
	{ text = "🛈", texthl = "GruvboxBlue" })
vim.fn.sign_define("LspDiagnosticsSignHint",
	{ text = "!", texthl = "GruvboxAqua" })
---lualine setting
require('lualine').setup {
	options = {
		theme = 'nord'
	}
}
