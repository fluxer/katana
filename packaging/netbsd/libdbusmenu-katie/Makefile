# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = libdbusmenu-katie-4.19.0.d20201217
CATEGORIES = katana devel
MAINTAINER = xakepa10@gmail.com
COMMENT = Katie implementation of the DBusMenu protocol
LICENSE = gnu-lgpl-v2
HOMEPAGE = https://github.com/fluxer/libdbusmenu-qt

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/libdbusmenu-qt/archive/
DIST_SUBDIR = libdbusmenu-katie
WRKSRC = ${WRKDIR}/libdbusmenu-qt-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config

post-extract:
	${MKDIR} ${WRKDIR}/build

BUILD_DEPENDS = doxygen-[0-9]*:../../devel/doxygen

.include "../../devel/katie/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
