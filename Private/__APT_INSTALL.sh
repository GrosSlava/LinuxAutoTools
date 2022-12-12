#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





LFile=$(zenity --file-selection --title="apt install")
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

LPassword=$(zenity --password)
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

echo $LPassword | sudo -S apt install -y $LFile &&
{
	$(zenity --info --text="'$LFile' successfully installed")
	exit 0
}
$(zenity --error --text="'$LFile' installation error")
