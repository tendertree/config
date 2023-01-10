require('lualine').setup {
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { { require('auto-session-library').current_session_name }, 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		--lualine_y = {'progress'},
		lualine_y = { 'getWords' },
		lualine_z = { 'location' }
	},
}