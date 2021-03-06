#!/bin/bash

set -e

pot="$1"
packs=("kde-l10n")
cwd="$(pwd)"
if [ -z "$pot" ];then
    echo "Pass a path to .pot"
    exit 1
elif ! type -p msgmerge ;then
    echo "msgmerge is not in your PATH"
    exit 1
elif ! type -p msgattrib ;then
    echo "msgattrib is not in your PATH"
    exit 1
fi

source "$(dirname $0)/fetch.sh"

name="$(basename $pot | sed 's|.pot|.po|g')"
for p in $(find kde-l10n/ -name "$name");do
    echo "Updating $p..."
    msgmerge --update --no-fuzzy-matching "$p" "$pot"
    echo "Cleaning up $p..."
    msgattrib --no-obsolete "$p" -o "$p"
done

echo "All done."
