"settings for buliding new tabes and splits
nnoremap <C-m> :tabe<CR>
nnoremap <C-h> :-tabnext<CR>
nnoremap <C-l> :+tabnext<CR>
nnoremap sr :set splitright<CR>:vsplit<CR>
nnoremap sl :set nosplitright<CR>:vsplit<CR>
nnoremap su :set nosplitbelow<CR>:split<CR>
nnoremap sd :set splitbelow<CR>:split<CR>
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>
