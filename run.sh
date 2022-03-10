#!/bin/sh

echo ========Deploy FE script==========

echo Create new folder realease: 

read folder

echo Target branch:

read branch

echo Current realease symlink:

read link

cp -R ~/Desktop/Demo/realeases/realease_v4 ~/Desktop/Demo/realeases/$folder

cd ~/Desktop/Demo/realeases/$folder

git checkout $branch

git pull hungmt $branch || exit 0

yarn 

yarn build || exit 0

unlink ~/Desktop/Demo/current/$link

ln -s ~/Desktop/Demo/realeases/$folder ~/Desktop/Demo/current/$folder 

# cd ~/Desktop/Demo/current/$folder

# pm2 restart
