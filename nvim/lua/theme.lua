--basic theme setting
local o = vim.o
o.termguicolors = true
o.guifont = 'Blexmono Nerd Font'
vim.cmd('colorscheme everforest')
vim.g["everforest_background"] = 'medium'
o.background = "light"

require 'lualine'.setup {
	options = {
		theme = 'everforest'
	}
}

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
		theme = 'everforest'
	}
}
-- Color settings
--local Group = colorbuddy.Color
--
-- Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
-- Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base10)
-- Group.new('Visual', colors.none, colors.base03, styles.reverse)
