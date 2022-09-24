# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = ariya-icons
DISTVERSION = 4.22.0.d20220512
CATEGORIES = graphics x11-themes
MAINTAINER = xakepa10@gmail.com
COMMENT = Ariya icon theme for use with Katana
LICENSE = LGPL3+
LICENSE_COMB = single

MASTER_SITES = https://osdn.net/projects/kde/news/
DISTFILES = rss
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/ariya-icons.git

USES = compiler:c++11-lang pkgconfig cmake
INSTALLS_ICONS = yes
NO_ARCH = yes
INSTALL_TARGET = install

do-extract:
	@rm -vrf ${WRKSRC}
	@git clone --depth=1 git://git.osdn.net/gitroot/kde/ariya-icons.git ${WRKSRC}

.include <bsd.port.mk>
