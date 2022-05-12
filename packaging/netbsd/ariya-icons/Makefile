# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = ariya-icons-4.22.0.d20220512
CATEGORIES = katana graphics
MAINTAINER = xakepa10@gmail.com
COMMENT = Ariya icon theme for use with Katana
LICENSE = gnu-lgpl-v3
HOMEPAGE = https://github.com/fluxer/ariya-icons

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/ariya-icons/archive/
DIST_SUBDIR = ariya-icons
WRKSRC = ${WRKDIR}/ariya-icons-${DISTNAME}

USE_CMAKE = yes
ICON_THEMES = yes

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
