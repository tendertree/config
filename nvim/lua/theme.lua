--basic theme setting
local o = vim.o
o.termguicolors = true
o.guifont = 'Blexmono Nerd Font'
--loag coloar setting 
require("colorbuddy").colorscheme("gruvbox")
--startify setting
vim.g.startify_session_persistence = true
vim.g.startify_custom_header = {
     '                  ',
     '        <(- )___  ',
     '         ( ._> /  ',
     '          `---`   '
}
--lualine setting 
local lualine = require('lualine')
      lualine.theme = 'gruvbox'
      lualine.separator = '|'
      lualine.sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location'  },
      }
      lualine.inactive_sections = {
        lualine_a = {  },
        lualine_b = {  },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {  },
        lualine_z = {   }
      }
      lualine.extensions = {'fzf'}
      lualine.status()
      
      

