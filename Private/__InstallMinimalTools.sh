#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





# download cleaners
sudo apt-get install -y autoremove autoclean

# download git
sudo apt-get install -y git git-lfs

# download developer tools
sudo apt-get install -y wget build-essential make python3 pip doxygen

# user tools
sudo apt-get install -y zenity

# download package systems
sudo apt-get install -y flatpak