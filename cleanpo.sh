#!/bin/bash

set -e

cwd="$(pwd)"
if ! type -p find ;then
    echo "find is not in your PATH"
    exit 1
elif ! type -p grep ;then
    echo "grep is not in your PATH"
    exit 1
elif ! type -p sed ;then
    echo "sed is not in your PATH"
    exit 1
fi

packs=("kde-l10n")

source "$(dirname $0)/fetch.sh"

echo "Cleaning up translations $p..."
regex=""
for i in $(cat pots.txt);do
    regex="$regex -a ! -name ${i//.pot/.po}"
done
regex="${regex/ -a/}"
echo $regex

# do not remove for now!
find "kde-l10n" $regex -name '*.po' -exec echo {} +

echo "All done"
