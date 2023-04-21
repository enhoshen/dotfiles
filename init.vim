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
