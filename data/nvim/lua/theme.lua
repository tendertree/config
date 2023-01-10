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


--theme change

time = os.date("*t")
if (time.hour % 24 <= 21)
then
	vim.cmd("colorscheme melange")
	o.background = "light"
	local lush = require('lush')
	local harbour = require('melange.hl_groups')
	local bg = vim.opt.background:get()
	local palette = require('melange/palettes/' .. bg)
	local a = palette.a
	local b = palette.b
	local spec = lush.extends({ harbour }).with(function()
		return {
			Comment { fg = a.com },
			String { fg = b.blue },
		}
	end)
	lush(spec)

else
	vim.cmd("colorscheme iceberg")
	o.background = "dark"
end

require('lualine').setup {
	options = {
		theme = 'nord'
	}
}
