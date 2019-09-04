#!/bin/bash
dir=${PWD}

echo " export MYWORKSPACE=$dir" >> ~/.bashrc
echo ". $dir/mybash.sh" >> ~/.bashrc
echo ". ~/.bash_aliases" >> ~/.bashrc
. ~/.bashrc
