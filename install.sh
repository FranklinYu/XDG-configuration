#!/bin/sh
ZIP=`mktemp --suffix='.zip'`
FOLDER=`mktemp --directory`
if ! wget https://github.com/franklinyu/debian-setup/archive/master.zi -O $ZIP
  then
  echo "\033[1;33mCannot download file from GitHub; check you Internet" \
    "connection.\033[0m"
  exit 1
fi
unzip -d $FOLDER $ZIP
rm $ZIP
if ! sh $FOLDER/debian-setup-master/suggested.sh ; then
  echo "\033[1;31mError occured in \`suggested.sh\`.\033[0m"
fi
rm --recursive $FOLDER
