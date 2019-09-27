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
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"cmder, conemu escape replace mode by a esc on startup"
autocmd VimEnter wincmd <esc>

"color scheme"
highlight Pmenu ctermbg=gray
highlight PmenuSel ctermbg=red
highlight Visual ctermbg=6
