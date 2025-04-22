echo "[INFO] dotfiles directory: ${DOTFILES}"

# link dotfiles
ln -sf ${DOTFILES}/.vimrc ~/.vimrc
ln -sf ${DOTFILES}/nvim ~/.config/nvim
ln -sf ${DOTFILES}/.bash_aliases ~/.bash_aliases
ln -sf ${DOTFILES}/.vim ~/.vim
ln -sf ${DOTFILES}/.tmux.conf ~/.tmux.conf

case $TERM in cygwin) TERM=xterm-256color ;; esac

# alias
alias ll='ls -alF'
alias tmuxn='tmux new -s'
alias tmuxa='tmux a -d -t'
alias tmuxk='tmux kill-session -t'
alias tmuxl='tmuxp load'

# to install utility functions
function install_utility() {
  source ${DOTFILES}/utility.sh
}

# Apps #
# git
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
git config --global credential.helper store
git config --global user.name "enhoshen"
git config --global user.email "enhoshen@gmail.com"
git config --global core.editor "nvim"

# man #
# this means run the ex command Man!
# see nvim --help (shell)
# and :help Man! (in nvim)
export MANPAGER='nvim +Man!'

# fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -U -g ""'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# binary overide
for i in $(ls ${DOTFILES}/bin/); do
  ln -sf ${DOTFILES}/bin/$i ~/.local/bin/$i
  chmod +x ${DOTFILES}/bin/$i
done
