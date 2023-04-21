# update package manager
sudo apt update

# install packages
sudo apt install --assume-yes \
    zsh \
    python3 \
    pip \
    silversearcher-ag \

# change shell
chsh -s /usr/bin/zsh

# link python
ln -v -s /usr/bin/python3 /usr/bin/python

# generate locale
sudo locale-gen en_US en_US.UTF-8
sudo dpkg-reconfigure locales
