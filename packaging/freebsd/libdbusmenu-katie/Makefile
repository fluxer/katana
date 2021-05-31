# $FreeBSD$

# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = libdbusmenu-katie
DISTVERSION = 4.20.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katie implementation of the DBusMenu protocol
LICENSE = LGPL20+
LICENSE_COMB = single

MASTER_SITES = https://github.com/fluxer/libdbusmenu-qt/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/libdbusmenu-qt-master

USES = compiler:c++11-lang pkgconfig cmake
LIB_DEPENDS = libKtCore.so:katana/katie libKtDBus.so:katana/katie
CMAKE_ARGS = -Wno-dev

.include <bsd.port.mk>
