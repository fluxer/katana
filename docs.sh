#!/bin/bash

set -e

version="$1"
packs=("kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps")
cwd="$(pwd)"

if [ ! which doxygen ];then
    echo "Doxygen is not installed"
    exit 1
fi

source "$(dirname $0)/fetch.sh"

# set again
packs=("kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps")
for p in "${packs[@]}";do
    echo "Generating API docs for $p..."
    cd "$p"
    doxygen doxygen.conf
    cd "$cwd"
done
