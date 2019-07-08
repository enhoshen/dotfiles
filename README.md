## Setup
* dynamic link `.*` files in this project in the home directory
## gitsetup script
* Initialize a git repo named the argument
```shell
sh gitsetup.sh MYHARDWARE
```
## Reload scripty
* Read in a file line by line of previously executed lengthy commands for you to chooose.
`reload` alias is added in .bash_alias, and one option `-e` is provided if you only wish to
print out the command. At default the read in file is the .myhistory file in the current 
folder, you can specify the file by the end of the command.
```shell
$ sh reload.sh file # read the file line by line for you to choose
$ reload file       # reload alias
$ reload            # read default history file .myhistory
$ reload -e         # print out the command 
``` 
