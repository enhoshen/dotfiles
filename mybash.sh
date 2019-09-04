dir=${PWD}
echo ${dir}
ln -sf ${dir}/.vimrc ~/.vimrc
ln -sf ${dir}/.bash_aliases ~/.bash_aliases
ln -sf ${dir}/.vim ~/.vim
ln -sf ${dir}/.tmux.conf ~/.tmux.conf

case $TERM in cygwin) TERM=xterm-256color;; esac
