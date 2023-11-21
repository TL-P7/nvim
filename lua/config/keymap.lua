vim.g.mapleader = ' '
local M = {

}
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
nnoremap zc :source ~/.config/nvim/init.lua<CR>
nnoremap zz :e ~/.config/nvim/init.lua<CR>
]])

--settings for buliding new tabes and splits
vim.keymap.set('n', '<C-m>', ':tabe<CR>')
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-q>", ":Bdelete<CR>")
vim.keymap.set("n", "<leader>q", ":Bdelete<CR>:q<CR>")
--vim.keymap.set('n', '<C-h>', ':-tabnext<CR>')
--vim.keymap.set('n', '<C-l>', ':+tabnext<CR>')
vim.keymap.set('n', 'sr', ':set splitright<CR>:vsplit<CR>')
vim.keymap.set('n', 'sl', ':set nosplitright<CR>:vsplit<CR>')
vim.keymap.set('n', 'su', ':set nosplitbelow<CR>:split<CR>')
vim.keymap.set('n', 'sd', ':set splitbelow<CR>:split<CR>')
vim.keymap.set('', '<up>', ':res +2<CR>')
vim.keymap.set('', '<down>', ':res -2<CR>')
vim.keymap.set('', '<left>', ':vertical resize -2<CR>')
vim.keymap.set('', '<right>', ':vertical resize +2<CR>')


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

function! s:cocActionsOpenFromSelected(type) abort
execute 'CocCommand actions.open ' . a:type
endfunction

xmap <leader>s  <Plug>(coc-codeaction-selected)
nmap <leader>sw  <Plug>(coc-codeaction-selected)w

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
call CocActionAsync('highlight')
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction


"coc-explorer

nnoremap <leader>mt <Cmd>CocCommand explorer --preset simplify --width 30<CR>

" Use preset argument to open it
nnoremap <leader>mf <Cmd>CocCommand explorer --preset floating <CR>
nnoremap <leader>mb <Cmd>CocCommand explorer --preset buffer <CR>

" List all presets
nmap <leader>ml <Cmd>CocList explPresets<CR>


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

--Dashboard
vim.keymap.set('n', '<leader>d', '<Cmd>Dashboard<CR>')


--indent
vim.keymap.set('n', '<C-f>', '=G')

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--disable HJKL
vim.keymap.set('n', 'H', '<Nop>')
vim.keymap.set('n', 'J', '<Nop>')
vim.keymap.set('n', 'K', '<Nop>')
vim.keymap.set('n', 'L', '<Nop>')

--rereferred Shift+Enter
vim.keymap.set('n', '<S-CR>', '<CR>')

