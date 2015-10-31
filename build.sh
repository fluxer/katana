#!/bin/bash

set -e

release="Release"
if [ -n "$1" ];then
    case "$1" in
        Release|RelWithDebInfo|Debug|MinSizeRel) release="$1" ;;
        *) echo "Invalid release type: $1"
           exit 1 ;;
    esac
fi

prefix="/usr/local"
if [ "$(uname -o)" = "GNU/Linux" ];then
    prefix="/usr"
fi

sudo=""
if [ "$(id -u)" != "0" ];then
    if which sudo ;then
        sudo="sudo"
    elif which su ;then
        sudo="su -c"
    else
        echo "Neither su nor sudo are available"
        exit 1
    fi
fi

packs=("ariya-icons" "kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps" "kde-l10n")

source "$(dirname $0)/fetch.sh"

rm -rf icons-build kdelibs-build baseapps-build \
    workspace-build extraapps-build l10n-build

mkdir -p icons-build && cd icons-build
cmake ../ariya-icons \
        -DCMAKE_BUILD_TYPE="$release" \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
$sudo make install
cd ..

mkdir -p kdelibs-build && cd kdelibs-build
cmake ../kdelibs \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix" \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DWITH_FAM=OFF
make
$sudo make install
cd ..

mkdir -p baseapps-build && cd baseapps-build
cmake ../kde-baseapps \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
$sudo make install
cd ..

mkdir -p workspace-build && cd workspace-build
cmake ../kde-workspace \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix" \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DWITH_Xmms=OFF
make
$sudo make install
cd ..

mkdir -p extraapps-build && cd extraapps-build
cmake ../kde-extraapps \
        -DCMAKE_BUILD_TYPE="$release" \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
$sudo make install
cd ..

mkdir -p l10n-build && cd l10n-build
cmake ../kde-l10n \
        -DCMAKE_BUILD_TYPE="$release" \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
$sudo make install
cd ..
