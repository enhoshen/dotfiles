#!/bin/bash
dir=${PWD}

echo " export DOTFILES=$dir" >> ~/.bashrc
echo ". \$DOTFILES/.bashrc" >> ~/.bashrc
echo ". \$DOTFILES/shell.sh" >> ~/.bashrc

echo " export DOTFILES=$dir" >> ~/.zshrc
echo ". \$DOTFILES/.zshrc"  >> ~/.zshrc
echo ". \$DOTFILES/shell.sh" >> ~/.zshrc


if [ $SHELL=="/bin/bash" ]; then
    . ~/.bashrc
fi

if [ $SHELL=="/bin/zsh" ] ; then
    . ~/.zshrc
fi

# vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
vim +PlugUpdate +qall

#nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# python
python -m pip install neovim
python -m pip install tmuxp 

# silver searcher
apt install silversearcher-ag

