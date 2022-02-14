cd $1
git init 
git add .
git commit -m 'first commit'
git remote add origin https://github.com/enhoshen/$1
git push -u origin master
