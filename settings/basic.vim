"basic settings
syntax enable
syntax on
:lua vim.o.number = true
:lua vim.o.relativenumber = true
:lua vim.o.expandtab = true
:lua vim.o.showcmd = true
:lua vim.o.cursorline = false
:lua vim.o.autochdir = true
:lua vim.o.swapfile = false
:lua vim.o.wrap = true
:lua vim.o.wildmenu = true
:lua vim.opt.shortmess:append({c})
:lua vim.o.compatible = false
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
:lua vim.o.encoding = 'utf-8'
let &t_ut = ''

" 进入插入模式下的光标形状
let &t_SI.="\e[5 q"

" 进入替换模式下的光标形状
let &t_SR.="\e[3 q"

" 从插入模式或替换模式下退出，进入普通模式后的光标形状
let &t_EI.="\e[1 q"

" 进入vim时，设置普通模式下的光标形状
autocmd VimEnter * silent !echo -ne "\e[1 q"

" 离开vim后，恢复shell模式下的光标形状
autocmd VimLeave * silent !echo -ne "\e[5 q"
