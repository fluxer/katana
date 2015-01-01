#!/bin/bash

set -e

if [ -n "$1" ];then
    case "$1" in
        Release|RelWithDebInfo|Debug|MinSizeRel) release="$1" ;;
        *) echo "Invalid release type: $1"
           exit 1 ;;
    esac
else
    release="Release"
fi

if [ "$(uname -o)" = "GNU/Linux" ];then
    prefix="/usr"
else
    prefix="/usr/local"
fi

packs=("ariya-icons" "kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps" "kde-l10n")

source "$(dirname $0)/fetch.sh"

rm -rf libkdcraw-build icons-build kdelibs-build baseapps-build \
    workspace-build extraapps-build l10n-build

mkdir -p icons-build && cd icons-build
cmake ../ariya-icons \
        -DCMAKE_BUILD_TYPE="$release" \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
make install
cd ..

mkdir -p kdelibs-build && cd kdelibs-build
cmake ../kdelibs \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix" \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DWITH_FAM=OFF
make
make install
cd ..

# most distributions make libkdcraw depend on kdelibs, since katana libraries
# are incompatible with them we should not create a mess - having kdelibs and
# our libraries installed at the same time can cause serious troubles, if
# this is not the case comment out the build instructions for libkdcraw
wget -c http://download.kde.org/stable/4.14.3/src/libkdcraw-4.14.3.tar.xz
tar -xf libkdcraw-4.14.3.tar.xz
mkdir -p libkdcraw-build && cd libkdcraw-build
cmake ../libkdcraw-4.14.3 \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
make install
cd ..

mkdir -p baseapps-build && cd baseapps-build
cmake ../kde-baseapps \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
make install
cd ..

mkdir -p workspace-build && cd workspace-build
cmake ../kde-workspace \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix" \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DWITH_Xmms=OFF
make
make install
cd ..

mkdir -p extraapps-build && cd extraapps-build
cmake ../kde-extraapps \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
make install
cd ..

mkdir -p l10n-build && cd l10n-build
cmake ../kde-l10n \
        -DCMAKE_BUILD_TYPE="$release" \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
make install
cd ..
