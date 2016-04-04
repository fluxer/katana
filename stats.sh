#!/bin/bash

set -e

cwd="$(pwd)"
if ! type -p find ;then
    echo "cloc is not in your PATH"
    exit 1
fi

packs=("kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps")

source "$(dirname $0)/fetch.sh"

cloc ${packs[@]}
