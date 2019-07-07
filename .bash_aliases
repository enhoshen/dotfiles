alias ll='ls -alF'
alias tmuxn='tmux new -s'
alias tmuxa='tmux a -d -t'
alias tmuxk='tmux kill-session -t'
alias tmuxl='tmuxp load'
function tmuxr(){
    echo $1
    tmux kill-session -t  $1
    tmuxp load $1.json
}
alias dc_sh='term=x10term dc_shell'
alias reload=' sh ~/myconf/reload.sh'
