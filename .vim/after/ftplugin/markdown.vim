" Markdown after file

" Grip:
" open vertical split, run terminal emulator with
" shell command grip on current file
function! s:grip(port="")
    let s:file = expand("%")
    " We need to use :execute to concat arguments so s:file is expanded.
    " To execute command after :vnew, [+cmd] is used, the arguments for the
    " command needs to be seperated with escaped spaces.
    " and .. in :execute will concat strings without spaces, combining
    " all this is the way to call a shell command with arguments after opening
    " a vertical split.
    execute 'vnew +term\ grip\' s:file .. '\' a:port
endfunction

" pass arguments from a command to function using <f-args>
command -buffer -nargs=* Grip call s:grip(<f-args>)
