#!/bin/bash
# Copyright (c) 2022 GrosSlava

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/Modules/CheckPlatform.sh
source $SCRIPT_DIR/Modules/ToolsCommon.sh





getxterm
exec "$gxtpath" "$gxttitle" "Generate UE project files" "$gxtexec" /bin/bash "$SCRIPT_DIR/Private/__GenerateUEProjectFiles.sh"
