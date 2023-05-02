--basic theme setting
local o = vim.o
o.termguicolors = true
o.guifont = 'Blexmono Nerd Font'
--startify setting
vim.g.startify_session_persistence = true
vim.g.startify_custom_header = {
	'                  ',
	'        <(- )___  ',
	'         ( ._> /  ',
	'          `---`   '
}
--- font setting
----- lsp setting
vim.fn.sign_define("LspDiagnosticsSignError",
	{ text = "", texthl = "GruvboxRed" })
vim.fn.sign_define("LspDiagnosticsSignWarning",
	{ text = "", texthl = "GruvboxYellow" })
vim.fn.sign_define("LspDiagnosticsSignInformation",
	{ text = "🛈", texthl = "GruvboxBlue" })
vim.fn.sign_define("LspDiagnosticsSignHint",
	{ text = "!", texthl = "GruvboxAqua" })

-- theme change italic disable
-- lua line

--load lush

--theme change

local time = os.date("*t")
if (time.hour % 24 <= 21 and time.hour % 24 >= 8)
then
	vim.cmd.colorscheme 'melange'
	o.background = "light"
	vim.api.nvim_set_hl(0, 'Comment', { fg = '#a8a491' })
	vim.api.nvim_set_hl(0, 'String', { fg = '#465AA4' })
	vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#acbfb0' })
else
	vim.cmd("colorscheme iceberg")
	o.background = "dark"
end

require('lualine').setup {
	options = {
		theme = 'nord'
	}
}
