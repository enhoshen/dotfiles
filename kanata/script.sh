INSTALL_PATH=/mnt/g/portableprogram/kanata/
FILES=(config.json menus.json)
wsl_pull() {
  cp ${INSTALL_PATH}/*.kbd kanata/
}
wsl_install() {
  cp kanata/*.kbd ${INSTALL_PATH}/
}
