#!/bin/bash

set -e

rm -rf libkdcraw kdelibs kde-baseapps kde-workspace kde-extraapps
rm -rf libkdcraw-build kdelibs-build baseapps-build workspace-build extraapps-build

wget http://download.kde.org/stable/4.14.3/src/libkdcraw-4.14.3.tar.xz
tar -xf libkdcraw-4.14.3.tar.xz
mkdir libkdcraw-build && cd libkdcraw-build
cmake ../libkdcraw-4.14.3 \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ..

git clone --depth=1 https://github.com/fluxer/kdelibs
mkdir kdelibs-build && cd kdelibs-build
cmake ../kdelibs \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DHTML_INSTALL_DIR=/share/doc/kde/html \
        -DWITH_FAM=OFF
make
make install
cd ..

git clone --depth=1 https://github.com/fluxer/kde-baseapps
mkdir baseapps-build && cd baseapps-build
cmake ../kde-baseapps \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ..

git clone --depth=1 https://github.com/fluxer/kde-workspace
mkdir workspace-build && cd workspace-build
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

git clone --depth=1 https://github.com/fluxer/kde-extraapps
mkdir extraapps-build && cd extraapps-build
cmake ../kde-extraapps \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE4_BUILD_TESTS=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ..