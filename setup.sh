#!/bin/bash
dir=${PWD}

echo " export MYWORKSPACE=$dir" >> ~/.bashrc
echo ". \$MYWORKSPACE/shell.sh" >> ~/.bashrc
echo ". \$MYWORKSPACE/.bashrc" >> ~/.bashrc

echo " export MYWORKSPACE=$dir" >> ~/.zshrc
echo ". \$MYWORKSPACE/shell.sh" >> ~/.zshrc
echo ". \$MYWORKSPACE/.zshrc"  >> ~/.zshrc


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
