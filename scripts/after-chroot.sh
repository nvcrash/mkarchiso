#/bin/sh

SHDIR=.
prev=""
for a in $@ ; do
    if [ "$prev" == ""]; then
	PREV=$a
    elif [ "$prev" == "-d" -o "$prev" == "--script-directory"]; then
	SHDIR=$a
	PREV=""
    elif [ "$prev" == "-s" -o "$prev" == "--shell"]; then
	SHELL=$a
	PREV=""
    elif [ "$prev" == "-i" -o "$prev" == "--install-update"]; then
	INSTALL_UPDATE=$a
	PREV=""
    fi
done



#first step init (keyring/ package database)
$SHBINDIR/init.sh

#install / update
$SHBINDIR/install-update.sh
