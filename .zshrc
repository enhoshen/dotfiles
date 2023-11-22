# oh-my-zsh
ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT=true
plugins=(git zsh-syntax-highlighting)
autoload -U compinit && compinit
source ${ZSH}/oh-my-zsh.sh

# prompt
export TERM='xterm-256color'
export PS1='[%F{082}%n %F{051}%(5~|%-4~/.../%1~|%4~) %F{076}$(git_prompt_info)%f]%F{011} %# %f'
export RPS1='(%?|%t)'
setopt NO_CHECK_JOBS
setopt NO_HUP

# key bindings #
bindkey -e ^E vi-cmd-mode # Ctrl-E enter normal mode, mnemonic: escape
