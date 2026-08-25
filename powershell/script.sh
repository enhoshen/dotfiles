USER_PATH=/mnt/k/Users/
USER_NAME=Hohoshen
SUB_PATH=/Documents/WindowsPowerShell/
REPO_PATH=powershell/

TARGET=Microsoft.PowerShell_profile.ps1
wsl_pull() {
  cp ${USER_PATH}/${USER_NAME}/${SUB_PATH}/${TARGET} ${REPO_PATH}/
}
wsl_install() {
  cp ${REPO_PATH}/${TARGET} \
    ${USER_PATH}/${USER_NAME}/${SUB_PATH}/${TARGET}
}
