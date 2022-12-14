#!/bin/bash
# Copyright (c) 2022 GrosSlava

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





LFile=$(zenity --file-selection --title="select program to run")
case $? in
	1) exit 0;;
	-1) exit 0;;
esac


cd $(dirname $(readlink -f "$LFile"))

if test "${LFile##*.}" == "py" ; then
	python3 "$LFile"
elif test "${LFile##*.}" == "exe" ; then
	wine "$LFile"
else
	"$LFile"
fi

echo
read -p "Press any key to resume ..."
