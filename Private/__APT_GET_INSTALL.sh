#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





LPackage=$(zenity --entry --title "apt-get install" --width=300 --height=200)
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

LPassword=$(zenity --password)
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

echo $LPassword | sudo -S apt-get install -y $LPackage &&
{
	$(zenity --info --text="'$LPackage' successfully installed")
	exit 0
}
$(zenity --error --text="'$LPackage' installation error")
