#!/bin/bash


ostype=`uname -s`
if test "$ostype" != "Linux" ; then
	echo "Linux not detected."
	exit 1
fi

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`





LPackage=$(zenity --entry --title "apt remove" --width=300 --height=200)
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

LPassword=$(zenity --password)
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

echo $LPassword | sudo -S apt remove -y $LPackage &&
{
	$(zenity --info --text="'$LPackage' successfully deleted")
	exit 0
}
$(zenity --error --text="'$LPackage' deletion error")
