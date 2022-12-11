#!/bin/bash


ostype=`uname -s`
if test "$ostype" != "Linux" ; then
	echo "Linux not detected."
	exit 1
fi

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`





LFile=$(zenity --file-selection --title="select program to run")
case $? in
	1) exit 0;;
	-1) exit 0;;
esac


cd $(dirname $(readlink -f "$LFile"))

if test "${LFile##*.}" == "py" ; then
	python3 $LFile
else
	$LFile
fi

echo
read -p "Press any key to resume ..."
