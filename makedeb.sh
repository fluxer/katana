 #!/bin/sh
 
 set -e
 
 rm -rf obj-*-linux-gnu/
 
 sudo apt-get build-dep .
 
 dpkg-buildpackage -uc -nc -b
 
 rm -vf ../*dbgsym*.deb
 
 sudo dpkg -i ../*.deb
 
 mv -vf ../*.deb ../*.changes ../*.buildinfo "$HOME/katana-debian/"
 