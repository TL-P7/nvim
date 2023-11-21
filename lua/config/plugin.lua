--initialize lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
  require('plugins.lsp'),
  require('plugins.ui'),
  require('plugins.visual-multi'),
  require('plugins.color'),
  require('plugins.competitest'),
  require('plugins.filebrowser'),
  require("plugins.editor"),
})

require('my_plugins.compileRun')

--[[
"vim-plug
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MunifTanjim/nui.nvim'
Plug 'mg979/vim-visual-multi'
Plug 'xeluxee/competitest.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'nvimdev/dashboard-nvim'

call plug#end()
--]]
