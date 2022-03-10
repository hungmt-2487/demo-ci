#!/bin/sh

echo ========Deploy FE script==========

echo Create new realease tag: 

read realease_tag

echo Target branch:

//staging or master
read branch

echo Current realease symlink:

read link

//clone old-realease-folder to new folder
cp -R ~/realease/old-realease-folder ~/realease/$realease_tag

cd ~/realease/$realease_tag

git checkout $branch

//fail => exit
git pull origin $branch || exit 0

yarn 

//fail => exit
yarn build || exit 0

//romove old symlink
unlink ~/current/$link

//create new symlink
ln -s ~/realease/$realease_tag ~/current/$realease_tag 

//cd to symlink
# cd ~/current/$realease_tag

# pm2 restart
