#!/bin/bash

set -e

packs=("ariya-icons" "kdelibs" "kde-baseapps" "kde-workspace" "kde-extraapps" "kde-l10n")

source "$(dirname $0)/fetch.sh"

rm -rf libkdcraw-build icons-build kdelibs-build baseapps-build \
    workspace-build extraapps-build l10n-build

wget http://download.kde.org/stable/4.14.3/src/libkdcraw-4.14.3.tar.xz
tar -xf libkdcraw-4.14.3.tar.xz
mkdir -p libkdcraw-build && cd libkdcraw-build
cmake ../libkdcraw-4.14.3 \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ..

mkdir -p icons-build && cd icons-build
cmake ../ariya-icons \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ..

mkdir -p kdelibs-build && cd kdelibs-build
cmake ../kdelibs \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DWITH_FAM=OFF
make
make install
cd ..

mkdir -p baseapps-build && cd baseapps-build
cmake ../kde-baseapps \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ..

mkdir -p workspace-build && cd workspace-build
cmake ../kde-workspace \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DWITH_Xmms=OFF
make
make install
cd ..

mkdir -p extraapps-build && cd extraapps-build
cmake ../kde-extraapps \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ..

mkdir -p l10n-build && cd l10n-build
cmake ../kde-l10n \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ..
