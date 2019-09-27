#!/bin/bash
echo -e "Usage: $ sh reload.sh [-e] [file] \n -e: print out the command; default history file:.myhistory;"
echo -e "To add new command to a file, just bring up the command use $ echo \"command\" >> {file} \n"  
# -e argument enable interpretation of backslash escapes for echo
_echo=0
file=.myhistory
for i in "$@"
do
    case $i in
        -e)
        _echo=1
        ;;
        *)
            if [ $i!='' ];
            then
                file=$i      
            fi
        ;;
    esac
done

readarray commands < $file
for i in "${!commands[@]}"
do
    echo ${i} ${commands[i]}
done

echo -n "choose commands "
read IN

if [[ $_echo == 1 ]];
then
    echo ${commands[IN]}
else
    eval ${commands[IN]}
fi
