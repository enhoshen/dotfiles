#!/usr/bin/zsh
# get dotfiles project path TODO is there any simpler way
SETUPFILE=${PWD}/$0
DOTFILES=$(echo ${SETUPFILE} | sed -e "s;/setup/setup.sh;;")

# setup directory
mkdir -p ${HOME}/opt
mkdir -p ${HOME}/.local/bin
mkdir -p ${HOME}/.config
mkdir -p ${HOME}/.cache

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
vim +PlugUpdate +qall

# nvim
curl -L -o ${HOME}/opt/nvim.appimage \
    https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 755 ${HOME}/opt/nvim.appimage
$(cd ${HOME}/opt && ${HOME}/opt/nvim.appimage --appimage-extract && \
    mv squashfs-root nvim)
ln -vfs ${HOME}/opt/nvim/AppRun ${HOME}/bin/nvim

# python
python -m pip install neovim
python -m pip install tmuxp 

# Write scripts to rc files
if [[ ! $(grep "export DOTFILES" ${HOME}/.bashrc) ]]; then
    echo "export DOTFILES=${DOTFILES}" >> ~/.bashrc
    echo "source ${DOTFILES}/.bashrc" >> ~/.bashrc
    echo "source ${DOTFILES}/shell.sh" >> ~/.bashrc
fi

if [[ ! $(grep "export DOTFILES" ${HOME}/.zshrc) ]]; then
    echo "export DOTFILES=${DOTFILES}" >> ~/.zshrc
    echo "source ${DOTFILES}/.zshrc"  >> ~/.zshrc
    echo "source ${DOTFILES}/shell.sh" >> ~/.zshrc
fi

# fzf
# this will put "source .fzf.zsh" at the end of rc files.
# It has to be after completion system is setup, including
# those set by oh-my-zsh. So put it after "source dotfiles/.*rc"
# to make sure .fzf.* is sourced after
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
