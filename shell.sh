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
alias reload=' sh $DIR/reload.sh'

# to install utility functions
function install_utility(){
    source ${DIR}/utility.sh
}

# Apps #
# git
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
git config --global credential.helper store
git config --global user.name "enhoshen"
git config --global user.email "enhoshen@gmail.com"
git config --global core.editor "nvim"

# fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -U -g ""'

