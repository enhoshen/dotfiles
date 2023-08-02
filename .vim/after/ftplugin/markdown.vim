" Markdown after file

" Grip:
" open vertical split, run terminal emulator with
" shell command grip on current file
function! s:grip()
    let s:file = expand("%")
    execute 'vnew +term\ grip\ ' . s:file
endfunction
command -buffer -nargs=* Grip call s:grip()
