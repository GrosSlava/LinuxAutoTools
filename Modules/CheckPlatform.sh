# Copyright (c) 2022 GrosSlava




ostype=`uname -s`
if test "$ostype" != "Linux" ; then
	echo "Linux not detected."
	exit 1
fi
