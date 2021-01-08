# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = attica-katie-4.19.0.d20201217
CATEGORIES = katana net
MAINTAINER = xakepa10@gmail.com
COMMENT = Katie implementation of the Open Collaboration Services API
LICENSE = gnu-lgpl-v2.1
HOMEPAGE = https://github.com/fluxer/attica

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/attica/archive/
DIST_SUBDIR = attica-katie
WRKSRC = ${WRKDIR}/attica-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config

post-extract:
	${MKDIR} ${WRKDIR}/build

.include "../../devel/katie/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
