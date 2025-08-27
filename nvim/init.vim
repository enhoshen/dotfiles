" from vim to nvim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" highlight "
hi clear Search 
hi Search cterm=reverse gui=reverse

" lazy
lua require("config.lazy")

" configs
lua require("config")

" commands
lua require("commands")

" Set my own vim script priority higher, so vimscript from .vim
" such as after/ftplugin works
set runtimepath^=~/.vim runtimepath+=~/.vim/after

" temporary stuff
" lua require("parser.systemrdl")
