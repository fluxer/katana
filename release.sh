#!/bin/bash

# NOTE: bump version in following files before release:
#
# - doxygen.conf
# - kdelibs/CMakeLists.txt
# - kdelibs/KDELibs4Config.cmake
# - kdelibs/cmake/modules/KDE4Defaults.cmake
# - kde-workspace/CMakeLists.txt
# - kde-extraapps/CMakeLists.txt
# - kde-extraapps/*/CMakeLists.txt
# - kde-l10n/CMakeLists.txt if required

set -e

version="$1"
packs=("ariya-icons" "kdelibs" "kde-workspace" "kde-extraapps" "kde-l10n")
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
