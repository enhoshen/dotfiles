#!/bin/bash
color="\033[36m"
colorrst="\033[0m"
echo -e "Usage:" $color "$ sh reload.sh [-e] [file]${colorrst}\n" \
    "${color}-e${colorrst}: print out the command;\n"\
    "${color}-f${colorrst}: the file path of the command list. default history file:./.myhistory;\n"\
    "${color}-c${colorrst}: the command number. If not provided the script prompt you to enter one.\n"
echo -e "To add new command to a file, just bring up the command and use ${color}$ echo \"command\" >> {file} ${colorrst}\n"  
# -e argument enable interpretation of backslash escapes for echo
_echo=0
file=.myhistory
IN=''
while getopts 'ef:c:command:' opt
do
    case "$opt" in
        e) _echo=1 ;;
        f) file="$OPTARG" ;;
        c) IN="$OPTARG" ;;
        command) IN="$OPTARG";;
        #? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
        ?) : ;;
    esac
done

echo $_echo $file $IN
readarray commands < $file
for i in "${!commands[@]}"
do
    echo -e $color ${i} $colorrst ${commands[i]}
done

if ! [[ ${IN} =~ ^[0-9]+$ ]];
then
    echo -n "choose command "
    read IN
else
    : #null command (like pass in python)
fi

if [[ $_echo == 1 ]];
then
    echo -e $color $IN $colorrst ${commands[IN]}
    echo -e ${commands[IN]} | xclip
else
    eval ${commands[IN]}
fi
