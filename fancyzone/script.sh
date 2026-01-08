USER_PATH=/mnt/c/Users/
USER_NAME=enhos
INSTALL_SUB_PATH=AppData/Local/Microsoft/PowerToys/FancyZones/
wsl_pull() {
  cp ${USER_PATH}/${USER_NAME}/${INSTALL_SUB_PATH}*.json fancyzone/
}
wsl_install() {
  cp fancyzone/*.json ${USER_PATH}/${USER_NAME}/${INSTALL_SUB_PATH}/
}
