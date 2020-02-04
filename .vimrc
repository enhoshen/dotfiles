language en_US.utf8
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set term=xterm
filetype plugin on
syntax on
imap zz <esc>:update<CR>
nmap zz :update<CR>
nmap zzz :wq<CR> 
nmap <CR><CR> o<Esc>
nmap <CR> o

"relative line number display"
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,CursorMoved * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"cmder, conemu escape replace mode by a esc on startup"
autocmd VimEnter wincmd <esc>

"color scheme"
highlight Pmenu ctermbg=gray
highlight PmenuSel ctermbg=red
highlight Visual ctermbg=5 term=reverse cterm=bold
highlight Search  term=bold,reverse cterm=bold,reverse gui=bold,reverse

"virtual edit beyond end of line"
set virtualedit=block

"vim pane zoom in"
noremap Zz <c-w>_ \| <c-w>\| 
noremap Zo <c-w>=
