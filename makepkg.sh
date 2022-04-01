#!/bin/sh

set -e

export DISTDIR="$HOME/distdir"

make distclean
make makesum
make repackage
sudo make reinstall

mv -vf work/pkg/*.pkg "$HOME/katana-freebsd/"
