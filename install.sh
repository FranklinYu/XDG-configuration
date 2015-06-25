#!/bin/sh
ZIP=`mktemp --suffix='.zip'`
FOLDER=`mktemp -d`
if ! wget https://github.com/franklinyu/debian-setup/archive/master.zip -O $ZIP; then
  echo "\033[1;33mCannot download file from GitHub; check you Internet connection.\033[0m"
  exit 1
fi
unzip -d $FOLDER $ZIP
rm $ZIP
sh $FOLDER/suggested.sh
rm -r $FOLDER