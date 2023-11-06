"coc-explorer

"common command
nnoremap mt <Cmd>CocCommand explorer --preset simplify --width 30<CR>

" Use preset argument to open it
nnoremap mf <Cmd>CocCommand explorer --preset floating <CR>
nnoremap mb <Cmd>CocCommand explorer --preset buffer <CR>

" List all presets
nmap ml <Cmd>CocList explPresets<CR>

let g:coc_explorer_global_presets = {
\   'nvim': {
\     'root-uri': '~/.config/nvim',
\     'width': 30,
\   },
\    'code': {
\      'root-uri': '~/Documents/code',
\      'width': 30,
\    },
\   'cocConfig': {
\     'root-uri': '~/.config/coc',
\     'width': 30,
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

