#!/bin/bash

set -e

version="$1"
packs=("ariya-icons" "kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps" "kde-l10n" "kde-docs")
cwd="$(pwd)"
if [ -z "$version" ];then
    echo "Pass a version to release"
    exit 1
fi

source "$(dirname $0)/fetch.sh"

for p in "${packs[@]}";do
    echo "Packing $p ($version)..."
    cd "$p"
    git archive --prefix="$p-$version/" HEAD | xz > "$cwd/$p-$version.tar.xz"
    cd "$cwd"
done