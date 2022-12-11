#!/bin/bash


ostype=`uname -s`
if test "$ostype" != "Linux" ; then
	echo "Linux not detected."
	exit 1
fi

SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`


source $SCRIPT_DIR/Private/ToolsCommon.sh





getxterm
exec "$gxtpath" "$gxttitle" "APT_INSTALL" "$gxtexec" /bin/bash "$SCRIPT_DIR/Private/__RUN_PROGRAM.sh"
