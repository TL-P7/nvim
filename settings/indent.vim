"setting for indent
:lua vim.o.smartindent = true
:lua vim.o.autoindent = true

if &filetype == 'c' || &filetype == 'cpp'
  set cindent
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
elseif &filetype == 'go' || &filetype == 'py' || &filetype == 'lua' || &filetype == 'vim'
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
else
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endif

set list
set listchars=tab:->,trail:-
set scrolloff=5
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2

