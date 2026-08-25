# Import the PSFzf module
Import-Module PSFzf
# Configure default keybindings (Ctrl+T for files, Ctrl+R for history)
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r' 
Set-ExecutionPolicy -Scope CurrentUser Unrestricted
