dir=$MYWORKSPACE
echo ${dir}
ln -sf ${dir}/.vimrc ~/.vimrc
ln -sf ${dir}/.bash_aliases ~/.bash_aliases
ln -sf ${dir}/.vim ~/.vim
ln -sf ${dir}/.tmux.conf ~/.tmux.conf


case $TERM in cygwin) TERM=xterm-256color;; esac

export DISPLAY=localhost:11.0

#========== alias ==========

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
alias reload=' sh $MYWORKSPACE/reload.sh'

#========== python3 ==========

alias python='/opt/rh/rh-python36/root/bin/python3.6'
