#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/Private/CheckPlatform.sh
source $SCRIPT_DIR/Private/ToolsCommon.sh





getxterm
exec "$gxtpath" "$gxttitle" "APT_GET_INSTALL" "$gxtexec" /bin/bash "$SCRIPT_DIR/Private/__APT_GET_INSTALL.sh"
