#!/bin/bash
dir=${PWD}
echo ${dir}
echo "ln -sf ${dir}/.vimrc ~/.vimrc" >> ~/.bashrc
echo "ln -sf ${dir}/.bash_aliases ~/.bash_aliases" >> ~/.bashrc
echo ". ~/.bash_aliases" >> ~/.bashrc
. ~/.bashrc
