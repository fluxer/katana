#!/bin/sh

set -e

make distclean
make makesum
make repackage
make reinstall

mv -vf work/pkg/*.pkg "$HOME/katana-freebsd/"
