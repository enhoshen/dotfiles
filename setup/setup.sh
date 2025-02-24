#!/usr/bin/zsh
set +e

# get dotfiles project path TODO is there any simpler way
SETUPFILE=$0
DOTFILES=$(echo ${SETUPFILE} | sed -e "s;/setup/setup.sh;;")

# setup directory
mkdir -p ${HOME}/opt
mkdir -p ${HOME}/.local/bin
mkdir -p ${HOME}/.vim
mkdir -p ${HOME}/.config
mkdir -p ${HOME}/.cache
ln -sf ${DOTFILES}/.vim ~/.vim

# oh-my-zsh
if [[ ! -d ${HOME}/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# vim plugin
if [[ ! -a ${HOME}/.vim/autoload/plug.vim ]]; then
    curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &
    vim +PlugInstall +qall
    vim +PlugUpdate +qall
fi

# nvim
if [[ ! $(which nvim > /dev/null) ]]; then
    # <= v0.9
    #curl -L -o ${HOME}/opt/nvim.appimage \
    #    https://github.com/neovim/neovim/releases/latest/download/nvim.appimage &
    wget -O ${HOME}/opt/nvim.appimage \
        https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
    chmod 755 ${HOME}/opt/nvim.appimage
    $(cd ${HOME}/opt && ${HOME}/opt/nvim.appimage --appimage-extract && \
        mv -f ${HOME}/opt/squashfs-root ${HOME}/opt/nvim)
    # <= v0.9
    #ln -vfs ${HOME}/opt/nvim/AppRun ${HOME}/.local/bin/nvim
    ln -vfs ${HOME}/opt/nvim/usr/bin/nvim ${HOME}/.local/bin/nvim
    ${HOME}/.local/bin/nvim +PackerInstall +qall
    ${HOME}/.local/bin/nvim +PackerUpdate +qall
fi

# python
python -m pip install neovim --user || echo "failed installing python package neovim" &
python -m pip install tmuxp --user || echo "failed installing python package tmuxp" &

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
if [[ ! (-a ${HOME}/.fzf.bash && -a ${HOME}/.fzf.zsh)  ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
