#!/bin/bash

set -e

packs=("kdelibs" "kde-workspace" "kde-extraapps")

for p in "${packs[@]}";do
    echo "Searching $p..."
    cd "$p"
    git grep $@ ":(exclude)*.svg" || true
    cd ..
done
