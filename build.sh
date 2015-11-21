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
    if ! which sudo ;then
        echo "Sudo is not available"
        exit 1
    fi
    sudo="sudo"
fi

packs=("ariya-icons" "kdelibs" "kde-baseapps" "kde-workspace")

source "$(dirname $0)/fetch.sh"

rm -rf icons-build kdelibs-build baseapps-build workspace-build

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
        -DENABLE_TESTING=OFF \
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
        -DENABLE_TESTING=OFF \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix"
make
$sudo make install
cd ..

mkdir -p workspace-build && cd workspace-build
cmake ../kde-workspace \
        -DCMAKE_BUILD_TYPE="$release" \
        -DENABLE_TESTING=OFF \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX="$prefix" \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DWITH_Xmms=OFF
make
$sudo make install
cd ..
