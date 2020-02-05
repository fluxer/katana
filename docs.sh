#!/bin/bash

set -e

version="$1"
packs=("kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps")
cwd="$(pwd)"

if ! type -p doxygen;then
    echo "Doxygen is not installed"
    exit 1
fi

source "$(dirname $0)/fetch.sh"

rm -rf kde-docs/*
echo "Generating API docs for ${packs[@]}..."
doxygen doxygen.conf
