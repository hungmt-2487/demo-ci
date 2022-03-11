#!/bin/sh

# Get current date
date=$(date +'%y.%m.%d')

# Get latest release version
latest_release=$(ls -t ~/releases | head -1)

# Get current symlink
current_symlink=$(ls -t ~/current | head -1)

echo Create new release tag: 

read release_tag

# echo Target branch:

# //staging or master
# read branch

# New release folder
# e.g Release_22.03.10_v22.03.09.10.00
new_release=Release_$date_$release_tag

# clone latest release to new release
cp -R ~/releases/$latest_release ~/releases/$new_release

cd ~/releases/$new_release

git checkout $branch

# fail => exit
git pull origin $branch || exit 0

# yarn install
yarn 

# fail => exit
yarn build || exit 0

# Create new symlink
ln -s ~/releases/$new_release ~/current/$new_release 

cd ~/current/$new_release

pm2 restart

# Remove old symlink
unlink ~/current/$current_symlink

cd ~/releases

# Keep latest 5 release version
ls -dt */ | tail -n +6 | xargs rm -rf
