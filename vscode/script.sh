USER_PATH=/mnt/k/Users/
USER_NAME=Hohoshen
INSTALL_SUB_PATH=AppData/Roaming/Code/User
FILES=(keybindings.json settings.json snippets)
wsl_pull() {
  for i in ${FILES}; do
    cp ${USER_PATH}/${USER_NAME}/${INSTALL_SUB_PATH}/${i} vscode/ -r
  done
}
wsl_install() {
  for i in ${FILES}; do
    cp vscode/${i} ${USER_PATH}/${USER_NAME}/${INSTALL_SUB_PATH}/ -r
  done
}
