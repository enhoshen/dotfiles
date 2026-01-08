USER_PATH=/mnt/k/Users/
USER_NAME=Hohoshen
INSTALL_SUB_PATH=AppData/Roaming/kando/
FILES=(config.json menus.json)
wsl_pull() {
  for i in ${FILES}; do
    cp ${USER_PATH}/${USER_NAME}/${INSTALL_SUB_PATH}/${i} kando/ -r
  done
}
wsl_install() {
  for i in ${FILES}; do
    cp kando/${i} ${USER_PATH}/${USER_NAME}/${INSTALL_SUB_PATH}/ -r
  done
}
