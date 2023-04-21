# Setup
```shell
git clone https://github.com/enhoshen/dotfiles.git
source dotfiles/setup/<platform>.setup.sh
source dotfiles/setup/setup.sh
```

## scripts
### `shell.sh`
`setup.sh` put command in `.bashrc`/`.zshrc` so that they source `dotfiles/shell.sh`. It dynamic links configuration folder/files in the home directory to the ones in this project.

A `install_utility` function is declared, calling it will source `utility.sh` so functions declared inside can be used in the current shell.
