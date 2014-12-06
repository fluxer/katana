#!/bin/bash

set -e

message="$1"
cwd="$(pwd)"
if [ -z "$message" ];then
    echo "Pass a path to Messages.sh"
    exit 1
elif [ "$(basename $message)" != "Messages.sh" ];then
    echo "Path passed is not Messages.sh"
    exit 1
elif ! type -p extractrc ;then
    echo "extractrc is not in your PATH"
    exit 1
elif ! type -p xgettext ;then
    echo "xgettext is not in your PATH"
    exit 1
fi

# the address is temporary
gargs="--from-code=UTF-8 -C -kde \
    -ci18n -ki18n:1 -ki18nc:1c,2 -ki18np:1,2 -ki18ncp:1c,2,3 -ktr2i18n:1 \
    -kI18N_NOOP:1 -kI18N_NOOP2:1c,2 -kaliasLocale -kki18n:1 -kki18nc:1c,2 \
    -kki18np:1,2 -kki18ncp:1c,2,3 --msgid-bugs-address=xakepa10@gmail.com"
export EXTRACTRC="perl $(type -p extractrc)" XGETTEXT="$(type -p xgettext) $gargs"
export podir="$cwd"

cd "$(dirname $message)"
source "Messages.sh"

rm -f rc.cpp

echo "All done, use msgmerge to merge the POT files."
echo "You can find them at: $podir"
