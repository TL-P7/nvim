"load for the first time
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
