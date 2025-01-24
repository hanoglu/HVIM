-- Author: Yusuf Kagan Hanoglu
-- Date  : 24.01.2025

vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Lazy.nvim setup
require("lazy").setup("plugins")


vim.cmd('colorscheme nord')
vim.cmd('set timeoutlen=250')
vim.cmd('inoremap jk <esc>')
vim.cmd('tnoremap jk <C-\\><C-n>')
vim.cmd('tnoremap <esc> <C-\\><C-n>')
vim.cmd('vnoremap jk <esc>')
vim.cmd('cnoremap jk <C-\\><C-n> ')
vim.cmd('tnoremap jj <Up>')
vim.cmd('cnoremap jj <Up>')
vim.cmd('inoremap <C-h> <C-\\><C-o>db')
vim.cmd('cnoremap <C-h> <C-\\><C-o>db')
vim.cmd('inoremap <C-Del> <C-\\><C-o>dw')
vim.cmd('cnoremap <C-Del> <C-\\><C-o>dw')
vim.cmd('let $NOTES="~/Notlar/index.norg"')
vim.cmd('nmap <C-n> :e $NOTES<CR>')

vim.cmd('set nu')
vim.cmd('set ignorecase')


