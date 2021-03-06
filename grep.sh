#!/bin/bash

set -e

packs=("kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps")

for p in "${packs[@]}";do
    echo "Searching $p..."
    cd "$p"
    git grep $@ || true
    cd ..
done
