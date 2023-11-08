--settings for copy and paste
vim.keymap.set('n', '<C-e>', '<Esc>ggVG')
vim.keymap.set('v', '<C-y>', '"+y')
vim.keymap.set('i', '<C-p>', '<Esc>"*pa')
vim.keymap.set('v', '<C-p>', '<Esc>"*p')
vim.keymap.set('n', '<C-p>', '"*p')

--nohl
vim.keymap.set('n', '<Esc>u', ':nohlsearch<CR>')

--fast source
vim.cmd([[
"settings for file&rc operating and selecting
nmap s <Nop>
nnoremap <C-s> :w<CR>
nnoremap <C-q> <Esc>:q<CR>
nnoremap zc :source ~/.config/nvim/init.lua<CR>
nnoremap zz :e ~/.config/nvim/init.lua<CR>
]])

--settings for buliding new tabes and splits
vim.keymap.set('n', '<C-m>', ':tabe<CR>')
vim.keymap.set('n', '<C-h>', ':-tabnext<CR>')
vim.keymap.set('n', '<C-l>', ':+tabnext<CR>')
vim.keymap.set('n', 'sr', ':set splitright<CR>:vsplit<CR>')
vim.keymap.set('n', 'sl', ':set nosplitright<CR>:vsplit<CR>')
vim.keymap.set('n', 'su', ':set nosplitbelow<CR>:split<CR>')
vim.keymap.set('n', 'sd', ':set splitbelow<CR>:split<CR>')
vim.keymap.set('', '<up>', ':res +5<CR>')
vim.keymap.set('', '<down>', ':res -5<CR>')
vim.keymap.set('', '<left>', ':vertical resize -5<CR>')
vim.keymap.set('', '<right>', ':vertical resize +5<CR>')


-- coc
vim.cmd([[

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-h> coc#refresh()

nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

nmap \ <Plug>(coc-codeaction-selected)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



"coc-explorer

nnoremap mt <Cmd>CocCommand explorer --preset simplify --width 30<CR>

" Use preset argument to open it
nnoremap mf <Cmd>CocCommand explorer --preset floating <CR>
nnoremap mb <Cmd>CocCommand explorer --preset buffer <CR>

" List all presets
nmap ml <Cmd>CocList explPresets<CR>


"coc-snippets
"Use :CocList snippets to open snippets list used by current buffer.
"Use :CocCommand snippets.openSnippetFiles to choose and open a snippet file that used by current document.
"Use :CocCommand snippets.editSnippets to edit user's ultisnips snippets of current document filetype.
"Use :CocCommand snippets.openOutput to open output channel of snippets.
 
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)

]])

--CompetiTest
vim.cmd([[
nmap <F9> :CompetiTest run<CR>
nmap ]a :CompetiTest add_testcase<CR>
nmap ]e :CompetiTest edit_testcase<CR>
nmap [e :CompetiTest edit_testcase
nmap ]r :CompetiTest receive testcases<CR>
nmap ]s :CompetiTest show_ui<CR>
nmap ]d :CompetiTest delete_testcase<CR>
nmap [d :CompetiTest delete_testcase
]])

