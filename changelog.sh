#!/bin/bash

set -e

date="${1:-2015-03-02}"
packs=("ariya-icons" "kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps" "kde-l10n")
cwd="$(pwd)"
if [ -z "$date" ];then
    echo "Pass a date"
    exit 1
fi

source "$(dirname $0)/fetch.sh"

changes=""
for p in "${packs[@]}";do
    echo "Generating changes for $p as of $date..."
    cd "$p"
    changes+="\nChanges to $p since $date:"
    pchanges="$(git log --no-merges --since=$date --format='  * %s' | sort -u)"
    if [ -z "$pchanges" ];then
        pchanges="  * none"
    fi
    changes+="\n$pchanges\n"
    cd "$cwd"
done
echo -e "$changes" > changelog.txt
