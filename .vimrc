language en_US.utf8
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set ruler
filetype plugin on
syntax on
set nocursorline

" timeout
set timeoutlen=250
set ttimeoutlen=5


" relative line number display"
set number relativenumber

augroup numbertoggle
  autocmd!
  "autocmd BufEnter,FocusGained,InsertLeave,CursorMoved * set relativenumber"
  autocmd BufEnter,InsertLeave,CursorMoved * set relativenumber
  "autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber"
  autocmd BufLeave,InsertEnter   * set norelativenumber
augroup END

"cmder, conemu escape replace mode by a esc on startup"
autocmd VimEnter wincmd <esc>

"color scheme"
set hlsearch
highlight Pmenu ctermbg=gray
highlight PmenuSel ctermbg=red
highlight Visual ctermbg=5 term=reverse cterm=bold
highlight Search  term=bold,reverse cterm=bold,reverse gui=bold,reverse

"virtual edit beyond end of line"
set virtualedit=block

"vim pane zoom in"
noremap Zz <c-w>_ \| <c-w>\| 
noremap Zo <c-w>=

"backspace"
set backspace=indent,eol,start

"new file"
augroup templates
    au!
    autocmd BufNewFile *.* silent! execute
        \'0r ~/.vim/templates/skeleton.'.expand("<afile>:e")
    autocmd BufNewFile * silent! 
        \%substitute#\[:VIM_EVAL:\]\(.\{-}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END


"auto indent"
set autoindent
set pastetoggle=<F3>

"filetype"
let g:tex_flavor = "latex"


"fzf"
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

"tabline"
" (Based on 
" http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#MoreMsg#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .=  file  
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

"vim-plug"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'SirVer/ultisnips'
    "Plug 'neoclide/coc.nvim'
    "Plug 'neoclide/coc-snippets'
    Plug 'honza/vim-snippets'
    "Plug 'preservim/nerdtree'

" Initialize plugin system
call plug#end()
