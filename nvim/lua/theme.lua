--basic theme setting
local o = vim.o
o.termguicolors = true
o.guifont = 'Blexmono Nerd Font'
vim.cmd("colorscheme melange")
--vim.cmd("colo seoul256-light")
o.background = "light"
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
local lush = require('lush')
local harbour = require('melange.hl_groups')
local bg = vim.opt.background:get()
local palette = require('melange/palettes/' .. bg)
local a = palette.a
local b = palette.b
local spec = lush.extends({ harbour }).with(function()
	return {
		-- Use the existing Comment group in harbour, but adjust the gui attribute
		--	Comment { fg = harbour.Comment.fg, bg = harbour.Comment.bg, gui = "none" },
		--String { fg = b.blue, gui = "bold" },
		Comment { fg = a.com },
		String { fg = b.blue },
		-- While we're here, we might decide that the default Function group is too bright
	}
end)
lush(spec)
-- lua line
require('lualine').setup {
	options = {
		theme = 'nord'
	}
}
