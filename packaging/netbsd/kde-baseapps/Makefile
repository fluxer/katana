# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = kde-baseapps-4.19.0.d20201217
CATEGORIES = katana x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana core applications
LICENSE = gnu-gpl-v2 AND gnu-lgpl-v2.1
HOMEPAGE = https://github.com/fluxer/kde-baseapps

MASTER_SITES = https://github.com/fluxer/kde-baseapps/archive/
DIST_SUBDIR = kde-baseapps
WRKSRC = ${WRKDIR}/kde-baseapps-master
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config perl
REPLACE_PERL = kate/part/syntax/data/generate-php.pl

post-extract:
	${MKDIR} ${WRKDIR}/build

DEPENDS += sudo-[0-9]*:../../security/sudo
DEPENDS += exctags-[0-9]*:../../devel/exctags
DEPENDS += cppcheck-[0-9]*:../../devel/cppcheck

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../devel/katie/buildlink3.mk"
.include "../../katana/kdelibs/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
