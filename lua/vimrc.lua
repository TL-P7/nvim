vim.cmd([[
"settings for file&rc operating and selecting
nmap s <Nop>
nnoremap <C-s> :w<CR>
nnoremap <C-q> <Esc>:q<CR>
nnoremap zc :source ~/.config/nvim/init.lua<CR>
nnoremap zz :e ~/.config/nvim/init.lua<CR>
]])
