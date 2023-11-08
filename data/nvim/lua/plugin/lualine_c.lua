require('lualine').setup {
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			'branch',
			'diff',
			{
				'diagnostics',
				symbols = { error = '😡 ', warn = '🧐 ', info = '🤓 ', hint = '🤖 ' }
			}, },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress', 'getWords' },
		lualine_z = { 'location', {
			'datetime',
			style = '%H:%M'
		}
		}
	},
}
