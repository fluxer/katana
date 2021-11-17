#!/bin/sh

set -e

if [ ! -f "$1" ];then
    echo "Pass path to ISO"
    exit 1
fi

isosrc="$1"
workdir="$HOME/iso"
mntdir="/mnt/iso"
isoout="$HOME/custom.iso"
imgout="$HOME/custom.img"
makeimg="no"

pkg install rsync cdrtools

mdconfig -a -t vnode -u 0 -f "$isosrc"
mkdir -vp "$mntdir"
mount -t cd9660 /dev/md0 "$mntdir"

mkdir -vp "$workdir"
rsync -va "$mntdir/" "$workdir/"
umount "$mntdir"
mdconfig -d -u 0

if [ "$makeimg" == "no" ];then
    echo '/dev/iso9660/CDROM    /       cd9660  ro      0       0' > "$workdir/etc/fstab"
    rm -vf "$workdir/etc/rc.conf.local"
else
    echo '/dev/ufs/USB          /       ufs     ro      1       1' > "$workdir/etc/fstab"
    echo 'root_rw_mount="NO"' > "$workdir/etc/rc.conf.local"
fi

# TODO: do not hardcode memory device size
if ! grep -q Custom "$workdir/etc/rc.local";then
    echo '
# Custom Live CD/DVD read-write support
if [ ! -d /tmp/rw ];then
    mkdir -vp /tmp/rw
    mdmfs -M -s 1024m md /tmp/rw

    for d in /etc /var /root;do
        mkdir -vp /tmp/rw/$d
        mount -t unionfs /tmp/rw/$d $d
    done
fi
' >> "$workdir/etc/rc.local"
fi

mv -vf "$workdir/etc/resolv.conf" "$workdir/etc/resolv.conf.backup"
cp -vf /etc/resolv.conf "$workdir/etc/resolv.conf"
jail -c path="$workdir" mount.devfs ip4.addr=192.0.2.100 interface=em0 command=/bin/sh
mv -vf "$workdir/etc/resolv.conf.backup" "$workdir/etc/resolv.conf"

if [ "$makeimg" == "no" ];then
    mkisofs -J -R -b boot/cdboot -no-emul-boot -o "$isoout" "$workdir"
else
    makefs -B little -o label=USB -o version=2 "$imgout.part" "$workdir"
    mkimg -v -s bsd -b "$workdir/boot/boot" -p freebsd-ufs:="$imgout.part" -o "$imgout.part2"
    rm -vf "$imgout.part"
    mkimg -v -s mbr -b "$workdir/boot/mbr" -p freebsd:="$imgout.part2" -o "$imgout"
    rm -vf "$imgout.part2"
fi

rm -vfr "$workdir"
