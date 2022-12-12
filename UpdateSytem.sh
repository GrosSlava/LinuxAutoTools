#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/Modules/CheckPlatform.sh
source $SCRIPT_DIR/Modules/ToolsCommon.sh





getxterm
exec "$gxtpath" "$gxttitle" "Update system" "$gxtexec" /bin/bash "$SCRIPT_DIR/Private/__UpdateSystem.sh"