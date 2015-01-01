#!/bin/bash

set -e

cwd="$(pwd)"
if ! type -p find ;then
    echo "find is not in your PATH"
    exit 1
elif [ ! -f pots.txt ];then
    echo "Running findpots.sh..."
    "$cwd/findpots.sh"
fi

packs=("kde-l10n")

source "$(dirname $0)/fetch.sh"

echo "Cleaning up translations $p..."
regex=""
for i in $(cat pots.txt);do
    regex="$regex -a ! -name ${i//.pot/.po}"
done
# echo $regex

# do not remove for now!
# find "kde-l10n" -name '*.po' $regex -delete

result=""
for f in $(find "kde-l10n" -name '*.po' $regex);do
    result+="$(basename $f)\n"
done
echo -e "$result" | uniq -u

echo "All done"
