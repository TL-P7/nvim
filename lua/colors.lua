vim.cmd([[
"color-oceanic_material
"set background=light
"colorscheme oceanic_material
"let g:oceanic_material_transparent_background = 1
"let g:oceanic_material_background = 'deep'
"let g:oceanic_material_allow_bold = 1
"let g:oceanic_material_allow_italic = 1
"let g:oceanic_material_allow_underline = 1
"let g:oceanic_material_allow_undercurl = 1
"let g:oceanic_material_allow_reverse = 1

"color-gruvbox
let g:gruvbox_transparent_bg = 1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
set background=dark
colorscheme gruvbox

"vim-dashboard
"TODO

"vim-devicons
let g:airline_powerline_fonts=1

"vim-autoformat
let g:python3_host_prog='/usr/bin/python3'
let g:formatdef_clangformat_google = '"clang-format style google -"'
let g:formatters_cpp = ['clangformat_google']
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0
nnoremap <C-i> :Autoformat<CR>
]])
