let s:is_wsl = system("grep WSL /proc/version")
function wsl#set_netrw_handle()
    if s:is_wsl != ""
        let g:netrw_browsex_viewer="cmd.exe /C start"
    endif
endfunction

function wsl#setup()
    call wsl#set_netrw_handle()
endfunction
