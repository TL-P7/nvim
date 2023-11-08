--basic settings
vim.o.syntax = true
vim.o.syntax = enable
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.showcmd = true
vim.o.cursorline = false
vim.o.autochdir = true
vim.o.swapfile = false
vim.o.wrap = true
vim.o.wildmenu = true
vim.opt.shortmess:append({c})
vim.o.compatible = false
vim.o.encoding = 'utf-8'
vim.api.nvim_command("filetype on")
vim.api.nvim_command("filetype indent on")
vim.api.nvim_command("filetype plugin on")
vim.api.nvim_command("filetype plugin indent on")
vim.o.t_ut = ''

vim.cmd([[
" 进入插入模式下的光标形状
let &t_SI.="\e[5 q"

" 进入替换模式下的光标形状
let &t_SR.="\e[3 q"

" 从插入模式或替换模式下退出，进入普通模式后的光标形状
let &t_EI.="\e[1 q"
]])
