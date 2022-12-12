#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





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
