#!/bin/bash

set -e

date="$1"
packs=("ariya-icons" "kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps" "kde-l10n")
cwd="$(pwd)"
if [ -z "$date" ];then
    echo "Pass a date, e.g. 2015-01-04"
    exit 1
fi

source "$(dirname $0)/fetch.sh"

changes=""
for p in "${packs[@]}";do
    echo "Generating changes for $p..."
    cd "$p"
    changes+="\nChanges to $p since $date:"
    pchanges="$(git log --since=$date --format='  * %s')"
    if [ -z "$pchanges" ];then
        pchanges="  * none"
    fi
    changes+="\n$pchanges\n"
    cd "$cwd"
done
echo -e "$changes" > changelog.txt
