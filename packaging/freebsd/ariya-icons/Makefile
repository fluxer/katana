# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = ariya-icons
DISTVERSION = 4.24.0.d20230809
CATEGORIES = graphics x11-themes
MAINTAINER = xakepa10@gmail.com
COMMENT = Ariya icon theme for use with Katana
LICENSE = LGPL3+
LICENSE_COMB = single

MASTER_SITES = https://google.com/
DISTFILES = index.html
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/ariya-icons.git

USES = compiler:c++11-lang pkgconfig cmake
INSTALLS_ICONS = yes
NO_ARCH = yes
INSTALL_TARGET = install

do-extract:
	@rm -vrf ${WRKSRC}
	# @git clone --depth=1 https://scm.osdn.net/gitroot/kde/ariya-icons.git ${WRKSRC}
	@git clone --depth=1 https://bitbucket.org/smil3y/ariya-icons.git ${WRKSRC}
	# @git clone --depth=1 https://github.com/fluxer/ariya-icons.git ${WRKSRC}

.include <bsd.port.mk>
