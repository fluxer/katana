#!/bin/bash

set -e

version="$1"
packs=("kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps" "kde-l10n")
cwd="$(pwd)"

source "$(dirname $0)/fetch.sh"

packs=("kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps")

for p in "${packs[@]}";do
    echo "Updating translations of $p..."
    for m in $(find "$p" -name Messages.sh);do
        echo "Extracting POTs of via $m..."
        "$cwd/extractpot.sh" "$m"
    done
done

for p in pots/*.pot;do
    "$cwd/potmerge.sh" "$p"
done

echo "Cleaning up..."
find kde-l10n/ -name '*~' -delete

echo "All done."
