#!/bin/bash

set -e

packs=("ariya-icons" "kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps" "kde-l10n")
cwd="$(pwd)"

if ! type -p git ;then
    echo "Git is not installed"
    exit 1
fi

for p in "${packs[@]}";do
    if [ -d "$p/.git" ];then
        echo "Updating sources of $p..."
        cd "$cwd/$p"
        git pull
        cd "$cwd"
    else
        echo "Fetching sources of $p..."
        git clone --depth=1 "https://github.com/fluxer/$p"
    fi
done
