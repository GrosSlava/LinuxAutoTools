#!/bin/bash


ostype=`uname -s`
if test "$ostype" != "Linux" ; then
	echo "Linux not detected."
	exit 1
fi

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`





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

# download cleaners
sudo apt-get install -y autoremove autoclean

# download git
sudo apt-get install -y git git-lfs

# download developer tools
sudo apt-get install -y wget build-essential make python3 doxygen

# user tools
sudo apt-get install -y zenity

# download package systems
sudo apt-get install -y flatpak

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

# remove asian fonts
sudo apt-get remove fonts-kacst* fonts-khmeros* fonts-lklug-sinhala fonts-guru-extra fonts-nanum* fonts-noto-cjk fonts-takao* fonts-tibetan-machine fonts-lao fonts-sil-padauk fonts-sil-abyssinica fonts-tlwg-* fonts-lohit-* fonts-beng-extra fonts-gargi fonts-gubbi fonts-gujr-extra fonts-kalapi fonts-lohit-* fonts-samyak* fonts-navilu fonts-nakula fonts-orya-extra fonts-pagul fonts-sarai fonts-telu* fonts-wqy* fonts-smc* fonts-deva-extra
sudo dpkg-reconfigure fontconfig

# auto cleaners
sudo apt autoclean
sudo apt clean
sudo apt autoremove

# remove old snap packages
set -eu
LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
while read snapname revision; do
	sudo snap remove "$snapname" --revision="$revision"
done

# remove old programs packages
dpkg -l | awk '/^rc/ {print $2}' | xargs sudo dpkg --purge || echo "!!!!!!!smth went wrong!!!!!!!!"

echo
echo "***************************************************"
echo "--------------End clearing old files---------------"
echo
#............................................#


#..............Download updates..............#
echo
echo "-------------------Start update--------------------"
echo "***************************************************"
echo

sudo apt-get update

echo
echo "***************************************************"
echo "--------------------End update---------------------"
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

# mount all drives
for LDiskPath in /dev/sd[a-z] ; do
	LDiskName=$(basename $LDiskPath)
	LMountPath="/media/$USER/$LDiskName"
	[ -d $LMountPath ] || sudo mkdir -p $LMountPath || echo "!!!!!!!smth went wrong!!!!!!!!"
	[ -d $LMountPath ] && sudo chown -R  $(whoami):$MainGroup $LMountPath || echo "!!!!!!!smth went wrong!!!!!!!!"
	#sudo mkfs.ext4 $LDiskPath || echo "!!!!!!!smth went wrong!!!!!!!!"
	#sudo mount -a $LDiskPath $LMountPath || echo "!!!!!!!smth went wrong!!!!!!!!"
done

echo
echo "***************************************************"
echo "---------------End system configure----------------"
echo
#............................................#


#.....................Finish.................#
sudo apt-get -f install
sudo apt-get upgrade

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

