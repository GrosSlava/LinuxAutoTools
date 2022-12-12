#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





#.................Logo.......................#
echo "Predefined linux system setup"
echo "==================================================="
echo "==================================================="
echo
#............................................#


#.........Global configure input.............#
echo

read -p "Your main user group: " MainGroup

echo
#............................................#


#..........Install minimal tools.............#
echo
echo "---------------Start tools install-----------------"
echo "***************************************************"
echo

/bin/bash $SCRIPT_DIR/__InstallMinimalTools.sh

echo
echo "***************************************************"
echo "----------------End tools install------------------"
echo
#............................................#


#..............Clear old files...............#
echo
echo "-------------Start clearing old files--------------"
echo "***************************************************"
echo

/bin/bash $SCRIPT_DIR/__ClearSystem.sh

echo
echo "***************************************************"
echo "--------------End clearing old files---------------"
echo
#............................................#


#.............Configure system...............#
echo
echo "--------------Start system configure---------------"
echo "***************************************************"
echo

# disable hibernation
sudo systemctl mask suspend.target hibernate.target hybrid-sleep.target

# add user to VirtuaBox mode
sudo usermod -aG vboxsf $(whoami) || echo "!!!!!!!smth went wrong!!!!!!!!"

echo
echo "***************************************************"
echo "---------------End system configure----------------"
echo
#............................................#


#..............Download updates..............#
echo
echo "-------------------Start update--------------------"
echo "***************************************************"
echo

/bin/bash $SCRIPT_DIR/__UpdateSystem.sh

echo
echo "***************************************************"
echo "--------------------End update---------------------"
echo
#............................................#


#.....................Finish.................#
echo
echo "==================================================="
echo "==================================================="
echo

read -p "Reboot? [Y/N]" NeedToReboot
case $NeedToReboot in
	[Yy]* ) sudo reboot; exit 0;;
	[Nn]* ) exit 0;;
	* ) exit 0;;
esac
#............................................#

