# $FreeBSD$

# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = kde-extraapps
DISTVERSION = 4.20.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana extra applications
LICENSE = GPLv2 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kde-extraapps/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-extraapps-master

USES = compiler:c++11-lang pkgconfig cmake desktop-file-utils xorg perl5
USE_XORG = x11 xrender xtst xdamage xext xfixes
USE_PERL5 = build
RUN_DEPENDS = xfreerdp:net/freerdp
# TODO: missing dependencies
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/kdelibs \
	libkonq.so:katana/kde-baseapps libplasmagenericshell.so:katana/kde-workspace \
	libpoppler-katie.so:katana/poppler-katie libdbusmenu-katie.so:katana/libdbusmenu-katie
CMAKE_ARGS = -Wno-dev -DBUILD_partitionmanager=FALSE

.include <bsd.port.mk>
