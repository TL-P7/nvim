" Compile function
noremap <F11> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        set splitbelow
        :sp
        :res -5
        term gcc % -o %< && time ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++20 % -Wall -o %<"
        :sp
        :res -5
        :term ./%<
    elseif &filetype == 'cs'
        set splitbelow
        silent! exec "!mcs %"
        :sp
        :res -5
        :term mono %<.exe
    elseif &filetype == 'java'
        set splitbelow
        :sp
        :res -5
        term javac % && time java %<
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        exec "InstantMarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
        exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
        silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'racket'
        set splitbelow
        :sp
        :res -5
        term racket %
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    elseif &filetype == 'lua'
        set splitbelow
        :sp
        :term lua %
    endif
endfunc
