#!/bin/bash
# Copyright (c) 2022 GrosSlava

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





sudo apt-get update
sudo apt-get -f install
sudo apt-get upgrade

sudo python3 -m pip install --upgrade pip
