# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = libdbusmenu-katie
DISTVERSION = 4.23.0.d20220512
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katie implementation of the DBusMenu protocol
LICENSE = LGPL20+
LICENSE_COMB = single

MASTER_SITES = https://osdn.net/projects/kde/news/
DISTFILES = rss
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/libdbusmenu-qt.git

USES = compiler:c++11-lang pkgconfig cmake
USE_LDCONFIG = yes
LIB_DEPENDS = libKtCore.so:katana/katie libKtDBus.so:katana/katie
CMAKE_ARGS = -Wno-dev

do-extract:
	@rm -vrf ${WRKSRC}
	@git clone --depth=1 git://git.osdn.net/gitroot/kde/libdbusmenu-qt.git ${WRKSRC}

.include <bsd.port.mk>
