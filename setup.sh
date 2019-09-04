#!/bin/bash
dir=${PWD}

ln -sf ${dir}/mybash.sh ~/mybash.sh
echo ". ~/mybash.sh" >> ~/.bashrc
echo ". ~/.bash_aliases" >> ~/.bashrc
. ~/.bashrc
