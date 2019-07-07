#!/bin/bash
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
    echo $i ${commands[i]}
done

echo "choose commands"
read IN

if [[ $_echo == 1 ]];
then
    echo ${commands[IN]}
else
    ${commands[IN]}
fi
