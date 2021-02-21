# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = qca-katie-4.20.0.d20201217
CATEGORIES = katana devel
MAINTAINER = xakepa10@gmail.com
COMMENT = Katie implementation of cryptographic architecture
LICENSE = gnu-lgpl-v2
HOMEPAGE = https://github.com/fluxer/qca

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/qca/archive/
DIST_SUBDIR = qca-katie
WRKSRC = ${WRKDIR}/qca-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
CMAKE_ARGS = -DKATIE_BUILD=ON -DBUILD_TESTS=OFF
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config

post-extract:
	${MKDIR} ${WRKDIR}/build

.include "../../devel/katie/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
