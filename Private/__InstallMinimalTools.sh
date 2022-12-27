#!/bin/bash
# Copyright (c) 2022 GrosSlava

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





# download cleaners
sudo apt-get install -y autoremove autoclean

# download git
sudo apt-get install -y git git-lfs
sudo git lfs install

# download developer tools
sudo apt-get install -y wget build-essential make python3 python3-pip python3-venv doxygen clang clang-format

# download wine
sudo apt-get install wine wine32 libwine

# user tools
sudo apt-get install -y zenity

# download package systems
sudo apt-get install -y flatpak
