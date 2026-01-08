INSTALL_PATH=/mnt/g/portableprogram/kanata/
FILES=(config.json menus.json)
wsl_pull() {
  cp ${INSTALL_PATH}/kanata.kbd kanata/
}
wsl_install() {
  cp kanata/kanata.kbd ${INSTALL_PATH}/
}
