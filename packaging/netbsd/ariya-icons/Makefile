# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = ariya-icons-4.19.0.d20201217
CATEGORIES = katana graphics
MAINTAINER = xakepa10@gmail.com
COMMENT = Ariya icon theme for use with Katana
LICENSE = gnu-lgpl-v3
HOMEPAGE = https://github.com/fluxer/ariya-icons

MASTER_SITES = https://github.com/fluxer/ariya-icons/archive/
DIST_SUBDIR = ariya-icons
WRKSRC = ${WRKDIR}/ariya-icons-master

USE_CMAKE = yes
ICON_THEMES = yes

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
