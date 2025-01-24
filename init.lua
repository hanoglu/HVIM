-- Author: Yusuf Kagan Hanoglu
-- Date  : 24.01.2025

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

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


