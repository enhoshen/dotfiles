" Vim compiler file
" Compiler: Compile python test file with pytest

let current_compiler = "grip"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

function! s:grip()
    let s:file = expand("%")
    " open vertical split, run terminal emulator with
    " shell command grip on current file
    execute 'vnew +term\ grip\ ' . s:file
endfunction
command -buffer -nargs=* Grip call s:grip()
