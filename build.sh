#!/bin/bash

set -e

release="Release"
prefix="/usr/local"
if [ "$(uname -o)" = "GNU/Linux" ];then
    prefix="/usr"
fi

args_array=("$@")
for arg in "${args_array[@]}";do
    case "$arg" in
        release=*) release="${arg#*=}" ;;
        prefix=*) prefix="${arg#*=}" ;;
        *) echo "Invalid argument: $arg"
           exit 1 ;;
    esac
done

if [ "$prefix" != "/usr" ] && [ "$prefix" != "/usr/local" ];then
    echo ""
    echo "WARNING: you will have to setup PATH and LD_LIBRARY_PATH like this:"
    echo ""
    echo " export PATH=\"\${PATH}:$prefix/bin\""
    echo " export LD_LIBRARY_PATH=\"\${LD_LIBRARY_PATH}:$prefix/lib\""
    echo ""
    sleep 3;

    export PATH="${PATH}:$prefix/bin"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$prefix/lib"
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

for p in "${packs[@]}";do
    # rm -rf "$p-build"
    mkdir -p "$p-build" && cd "$p-build"
    cmake "../$p" \
            -DCMAKE_BUILD_TYPE="$release" \
            -DENABLE_TESTING=OFF \
            -DCMAKE_SKIP_INSTALL_RPATH=ON \
            -DCMAKE_INSTALL_PREFIX="$prefix" \
            -DSYSCONF_INSTALL_DIR=/etc \
            -DWITH_FAM=OFF \
            -DWITH_Xmms=OFF
    make
    $sudo make install
    cd ..
done
