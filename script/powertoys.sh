wsl_pull() {
  cp ${USER_PATH}/${USER_NAME}/${INSTALL_SUB_PATH}/${TARGET}/*.json ${SOURCE}
}
wsl_install() {
  cp ${SOURCE}/*.json ${USER_PATH}/${USER_NAME}/${INSTALL_SUB_PATH}/${TARGET}
}
