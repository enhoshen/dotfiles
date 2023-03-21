DIR=$DOTFILES
echo "[INFO] dotfiles directory: ${DIR}"

# link dotfiles
ln -sf ${DIR}/.vimrc ~/.vimrc
mkdir ~/.config/nvim -p
ln -sf ${DIR}/init.vim ~/.config/nvim/init.vim
ln -sf ${DIR}/.bash_aliases ~/.bash_aliases
ln -sf ${DIR}/.vim ~/.vim
ln -sf ${DIR}/.tmux.conf ~/.tmux.conf


case $TERM in cygwin) TERM=xterm-256color;; esac


# alias
alias ll='ls -alF'
alias tmuxn='tmux new -s'
alias tmuxa='tmux a -d -t'
alias tmuxk='tmux kill-session -t'
alias tmuxl='tmuxp load'
function tmuxr(){
    echo $1
    if [[ $(tmux display-message -p '#S') == $1 ]] && [[ -n "$TMUX" ]]
    then
		echo session $1 already attached, detatch first 
	else
		tmux kill-session -t  $1
		tmuxp load $DIR/tmuxp/$1.yaml
	fi
}
function display(){
    if [ $1 ]
    then
        export DISPLAY=localhost:$1.0
        echo "DISPLAY changed to $DISPLAY"
    else
        echo $DISPLAY
    fi
    
}
alias reload=' sh $DIR/reload.sh'


# Apps #
# git
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
git config --global credential.helper store
git config --global user.name "enhoshen"
git config --global user.email "enhoshen@gmail.com"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -U -g ""'

# vim
alias vim='~/bin/vim'
alias nvim='~/nvim/nvim-linux64/bin/nvim'
