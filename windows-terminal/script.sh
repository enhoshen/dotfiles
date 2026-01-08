USER_PATH=/mnt/c/Users/
USER_NAME=enhos
SUB_PATH0=AppData/Local/Packages/Microsoft.WindowsTerminal_
ID=8wekyb3d8bbwe
SUB_PATH2=LocalState/
wsl_pull() {
  cp ${USER_PATH}/${USER_NAME}/${SUB_PATH0}${ID}${SUB_PATH2}/settings.json \
    windows-terminal/
}
wsl_install() {
  cp windows-terminal/settings.json \
    ${USER_PATH}/${USER_NAME}/${SUB_PATH0}${ID}${SUB_PATH2}/
}
