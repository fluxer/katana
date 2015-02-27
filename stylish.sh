#!/bin/bash

set -e

cwd="$(pwd)"

if ! type -p astyle ;then
    echo "astyle is not installed"
    exit 1
fi

packs=("kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps")

source "$(dirname $0)/fetch.sh"

for p in "${packs[@]}";do
    echo "Adjusting formatting of $p..."
    cd "$cwd/$p"
    # git reset --hard HEAD
    astyle --style=1tbs --convert-tabs --indent=spaces=4 --verbose \
    $(find -type f -name '*.c' -o -name '*.cc' -o -name '*.cpp' \
        -o -name '*.h' -o -name '*.hh' -o -name '*.hpp')
    cd "$cwd"
    git clean -f
done
