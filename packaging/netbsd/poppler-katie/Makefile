# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = poppler-katie-4.20.0.d20201217
CATEGORIES = katana devel
MAINTAINER = xakepa10@gmail.com
COMMENT = Katie bindings for poppler
LICENSE = gnu-lgpl-v2
HOMEPAGE = https://github.com/fluxer/poppler

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/poppler/archive/
DIST_SUBDIR = poppler-katie
WRKSRC = ${WRKDIR}/poppler-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
CMAKE_ARGS = -DENABLE_UTILS=OFF -DBUILD_TESTS=OFF -DBUILD_QT4_TESTS=OFF
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config

post-extract:
	${MKDIR} ${WRKDIR}/build

.include "../../devel/katie/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../devel/nss/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../graphics/openjpeg/buildlink3.mk"
.include "../../graphics/lcms2/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
