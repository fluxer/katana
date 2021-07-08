# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = ariya-icons
DISTVERSION = 4.20.0.d20210531
CATEGORIES = graphics x11-themes
MAINTAINER = xakepa10@gmail.com
COMMENT = Ariya icon theme for use with Katana
LICENSE = LGPL3+
LICENSE_COMB = single

MASTER_SITES = https://github.com/fluxer/ariya-icons/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/ariya-icons-master

USES = compiler:c++11-lang pkgconfig cmake
INSTALLS_ICONS = yes
NO_ARCH = yes
INSTALL_TARGET = install

.include <bsd.port.mk>
