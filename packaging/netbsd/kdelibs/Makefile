# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = kdelibs-4.20.0.d20201217
CATEGORIES = katana x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana core libraries
LICENSE = gnu-gpl-v2 AND gnu-lgpl-v2.1
HOMEPAGE = https://github.com/fluxer/kdelibs

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/kdelibs/archive/
DIST_SUBDIR = kdelibs
WRKSRC = ${WRKDIR}/kdelibs-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config perl:run sh:run chmod chown
REPLACE_PERL = kdeui/preparetips
REPLACE_PERL += kio/misc/fileshareset
# RPATH workaround for makekdewidgets
MAKE_ENV = LD_LIBRARY_PATH=${WRKDIR}/build/lib

post-extract:
	${MKDIR} ${WRKDIR}/build

DEPENDS = shared-mime-info-[0-9]*:../../databases/shared-mime-info
DEPENDS += xdg-utils-[0-9]*:../../misc/xdg-utils

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../devel/katie/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../textproc/enchant2/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/openexr/buildlink3.mk"
.include "../../graphics/libraw/buildlink3.mk"
.include "../../graphics/libwebp/buildlink3.mk"
.include "../../graphics/exiv2/buildlink3.mk"
.include "../../graphics/ilmbase/buildlink3.mk"
.include "../../graphics/jasper/buildlink3.mk"
.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../multimedia/mpv/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../x11/libXcursor/buildlink3.mk"
.include "../../x11/libXfixes/buildlink3.mk"
.include "../../x11/libXScrnSaver/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/xcb-util-renderutil/buildlink3.mk"
.include "../../x11/xcb-util-keysyms/buildlink3.mk"
.include "../../x11/xcb-util-image/buildlink3.mk"
.include "../../net/avahi/buildlink3.mk"
.include "../../sysutils/attr/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../archivers/xz/buildlink3.mk"
.include "../../archivers/bzip2/buildlink3.mk"
.include "../../katana/strigi/buildlink3.mk"
.include "../../katana/libdbusmenu-katie/buildlink3.mk"
.include "../../mk/krb5.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
