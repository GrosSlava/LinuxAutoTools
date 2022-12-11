#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/Private/CheckPlatform.sh
source $SCRIPT_DIR/Private/ToolsCommon.sh





getxterm
exec "$gxtpath" "$gxttitle" "Linux setup tool" "$gxtexec" /bin/bash "$SCRIPT_DIR/Private/SetupLinux_Root.sh"
