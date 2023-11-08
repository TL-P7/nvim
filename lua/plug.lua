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
require("lazy").setup({
    {
        "vim-airline/vim-airline"
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup(require('db'))
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
        "neoclide/coc.nvim"
    },

})
--[[

"vim-plug
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MunifTanjim/nui.nvim'
Plug 'mg979/vim-visual-multi'
Plug 'xeluxee/competitest.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-autoformat/vim-autoformat'
"Plug 'itchyny/vim-cursorword'
"Plug 'glepnir/oceanic-material'
Plug 'morhetz/gruvbox'
Plug 'nvimdev/dashboard-nvim'

call plug#end()
--]]
