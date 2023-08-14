# reload tmuxp session 
function tmuxr(){
    if [[ ! $1 ]]; then
        echo "Usage: tmuxr <profile name>"
        echo "profile will be picked from $DOTFILES/tmuxp/*.yaml"
        echo "Available profiles: "
        for i in $(ls $DOTFILES/tmuxp/*yaml); do
            FILE=${i##*/}
            echo ${FILE%.yaml} 
        done
        return 1
    fi
    if [[ $(tmux display-message -p '#S') == $1 ]] && [[ -n "$TMUX" ]]; then
		echo session $1 already attached, detatch first 
	else
		tmux kill-session -t  $1
		tmuxp load ${DOTFILES}/tmuxp/$1.yaml
	fi
}

# change display to localhost:$1
function display(){
    if [[ $1 ]]; then
        export DISPLAY=localhost:$1.0
        echo "DISPLAY changed to $DISPLAY"
    else
        echo $DISPLAY
    fi
}

# create a git repo from existing folder given by $1
function git_setup_repo(){
    if [[ ! $1 ]] then;
        echo "Please provide project name in \$1"
        return 1
    fi
    if [[ $1 =~ "/"  ]] then;
        echo "Directory is not allowed"
        return 1
    fi
    (cd $1 && \
        git init; \
        git add .; \
        touch README.md; \
        git commit -m 'first commit'; \
        git remote add origin https://github.com/enhoshen/$1; \
        git push -u origin master;
    )
}

#  reload commands from .myhistory
# * Read in a file line by line of previously executed lengthy commands for you to chooose.
# `reload` alias is added in .bash_alias, and one option `-e` is provided if you only wish to
# print out the command. At default the read in file is the .myhistory file in the current 
# folder, you can specify the file by the end of the command.
# ```shell
# $ sh reload.sh file # read the file line by line for you to choose
# $ reload file       # reload alias
# $ reload            # read default history file .myhistory
# $ reload -e         # print out the command 
# ``` 
function reload (){
    #!/bin/bash
    COLOR="\033[36m"
    COLORRST="\033[0m"
    echo -e "Usage:" $COLOR "$ reload [-e] [file]${COLORRST}\n" \
        "${COLOR}-e${COLORRST}: print out the command;\n"\
        "${COLOR}-f${COLORRST}: the file path of the command list. default history file:./.myhistory;\n"\
        "${COLOR}-c${COLORRST}: the command number. If not provided the script prompt you to enter one.\n"
    echo -e "To add new command to a file, just bring up the command and use ${COLOR}$ echo \"command\" >> {file} ${COLORRST}\n"  
    # -e argument enable interpretation of backslash escapes for echo
    ECHO=0
    FILE=~/.config/.myhistory
    IN=''
    while getopts 'ef:c:command:' opt
    do
        case "$opt" in
            e) ECHO=1 ;;
            f) FILE="$OPTARG" ;;
            c) IN="$OPTARG" ;;
            command) IN="$OPTARG";;
            #? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
            ?) : ;;
        esac
    done
    if [[ ${SHELL##*/} == "zsh" ]]; then
        COMMANDS=("${(@f)$(< $FILE)}")
    elif [[ ${SHELL##*/} == "bash" ]]; then
        readarray COMMANDS < $FILE
    else
        if [[ ! $COMMANDS ]]; then
            return 1
        fi
    fi

    for i in $(seq ${#COMMANDS});
    do
        echo -e $COLOR ${i} $COLORRST ${COMMANDS[i]}
    done

    if ! [[ ${IN} =~ ^[0-9]+$ ]]; then
        echo -n "choose command "
        read IN
    else
        #null command (like pass in python)
        : 
    fi

    if [[ $ECHO == 1 ]]; then
        echo -e $COLOR $IN $COLORRST ${COMMANDS[IN]}
        echo -e ${COMMANDS[IN]} | xclip
    else
        ${COMMANDS[IN]}
    fi
}
color_table() {
    # from 
    # https://gist.github.com/vivkin/567896630dbc588ad470b8196c601ad1
    # generates an 8 bit color table (256 colors) for
    # reference purposes, using the \033[48;5;${val}m
    # ANSI CSI+SGR (see "ANSI Code" on Wikipedia)
    #
    echo -en "\n"
    for i in {0..15}; do
        printf "%4b" $i
    done
    
    printf "\n"
    for i in {0..15}; do
        echo -en "  \033[48;5;${i}m  \033[m"
    done
    
    #for i in 16 52 88 124 160 196 232; do
    for i in {0..6}; do
        let "i = i*36 +16"
        printf "\n"
        for j in {0..35}; do
            let "val = i+j"
            printf "% 4d" ${val}
        done
        printf "\n"
        for j in {0..35}; do
            let "val = i+j"
            echo -en "  \033[48;5;${val}m  \033[m"
        done
    done
    
    echo -e "\n"
}
