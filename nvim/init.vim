" from vim to nvim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" highlight "
hi clear Search 
hi Search cterm=reverse gui=reverse

" Key map "
" terminal mode 
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>


" plugins
lua require("config")
lua require("utils")
"lua require("plugins").setup()

" lazy
lua require("config.lazy")
