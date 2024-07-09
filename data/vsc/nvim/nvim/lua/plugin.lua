local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		"tendertree/nforcolemak-dh",
	},
	{ 'savq/melange-nvim' },
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require("configs.lualine")
		end
	},
}
)
