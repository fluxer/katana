# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = strigi-4.19.0.d20201217
CATEGORIES = katana x11
MAINTAINER = xakepa10@gmail.com
COMMENT = File indexing and file search framework adopted by Katana
LICENSE = gnu-lgpl-v2
HOMEPAGE = https://github.com/fluxer/strigi

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/strigi/archive/
DIST_SUBDIR = strigi
WRKSRC = ${WRKDIR}/strigi-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config

post-extract:
	${MKDIR} ${WRKDIR}/build

.include "../../converters/libiconv/buildlink3.mk"
.include "../../graphics/exiv2/buildlink3.mk"
.include "../../sysutils/attr/buildlink3.mk"
.include "../../sysutils/file/buildlink3.mk"
.include "../../multimedia/ffmpeg4/buildlink3.mk"
.include "../../archivers/bzip2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
