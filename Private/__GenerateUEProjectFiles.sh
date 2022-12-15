#!/bin/bash


SCRIPT_PATH=`realpath "$0"`
SCRIPT_DIR=`dirname "$SCRIPT_PATH"`

source $SCRIPT_DIR/../Modules/CheckPlatform.sh





LProjectFile=$(zenity --file-selection --title="select UE project")
case $? in
	1) exit 0;;
	-1) exit 0;;
esac

LUERoot=$(zenity --file-selection --directory --title="select UE Engine root")
case $? in
	1) exit 0;;
	-1) exit 0;;
esac


cd $(dirname $(readlink -f "$LProjectFile"))

"$LUERoot/GenerateProjectFiles.sh" -project "$LProjectFile" -game -engine
"$LUERoot/Engine/Build/BatchFiles/Linux/RunMono.sh" "$LUERoot/Engine/Binaries/DotNET/UnrealBuildTool.exe" Development Linux -Project "$LProjectFile" -TargetType=Editor -Progress

echo
read -p "Press any key to resume ..."
