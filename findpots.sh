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

packs=("kdelibs" "kde-workspace" "kde-extraapps")

source "$(dirname $0)/fetch.sh"

echo -n > pots.txt
for p in ${packs[@]};do
    echo "Finding POTs in $p..."
    find "$p" -name Messages.sh -exec grep -h -o 'podir/.*.pot' {} + | sed 's|podir/||g' >> pots.txt
done

echo "All done"
