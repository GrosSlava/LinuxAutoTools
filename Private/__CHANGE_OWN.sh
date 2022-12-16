#!/bin/bash
# Copyright (c) 2022 GrosSlava

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





LFile=$(zenity --file-selection --directory --title="chown")
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

LNewGroup=$(zenity --entry --title "chown" --text="Set new group" --entry-text "root" --width=300 --height=200)
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

LPassword=$(zenity --password)
case $? in
	1) exit 0;;
	-1) exit 0;;
esac


LOwner=$(whoami)
if test "$LNewGroup" == "root" ; then
	LOwner="root"
fi

echo $LPassword | sudo -S chown -R $LOwner:$LNewGroup "$LFile" &&
{
	$(zenity --info --text="'$LNewGroup' group successfully set")
	exit 0
}
$(zenity --error --text="smth went wrong")
