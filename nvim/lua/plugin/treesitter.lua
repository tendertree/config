require'nvim-treesitter.configs'.setup {
 ensure_installed = "maintained",
   sync_install = false,
	incremental_selection = {enable = true,},
    highlight = {  enable = true,  additional_vim_regex_highlighting = false }
}

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["<leader>a"] = "@function.outer",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}

require('nvim-treesitter.configs').setup {
    textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
}
