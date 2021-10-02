# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = kde-extraapps-4.21.0.d20201217
CATEGORIES = katana x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana extra applications
LICENSE = gnu-gpl-v2 AND gnu-lgpl-v2.1
HOMEPAGE = https://github.com/fluxer/kde-extraapps

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/kde-extraapps/archive/
DIST_SUBDIR = kde-extraapps
WRKSRC = ${WRKDIR}/kde-extraapps-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
# Linux only
CMAKE_ARGS += -DBUILD_partitionmanager=FALSE
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config perl

post-extract:
	${MKDIR} ${WRKDIR}/build

DEPENDS = freerdp2-[0-9]*:../../net/freerdp2
DEPENDS += libxslt-[0-9]*:../../textproc/libxslt
DEPENDS += speech-dispatcher-[0-9]*:../../audio/speech-dispatcher
DEPENDS += ghostscript-[0-9]*:../../print/ghostscript
DEPENDS += qemu-[0-9]*:../../emulators/qemu

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../devel/katie/buildlink3.mk"
.include "../../katana/kdelibs/buildlink3.mk"
.include "../../katana/kde-baseapps/buildlink3.mk"
.include "../../katana/kde-workspace/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXfixes/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../devel/gettext-tools/buildlink3.mk"
.include "../../devel/gmp/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../security/gpgme/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../archivers/libarchive/buildlink3.mk"
.include "../../audio/alsa-lib/buildlink3.mk"
.include "../../audio/speech-dispatcher/buildlink3.mk"
.include "../../audio/taglib/buildlink3.mk"
.include "../../multimedia/ffmpegthumbnailer/buildlink3.mk"
.include "../../math/qalculate/buildlink3.mk"
.include "../../print/cups-base/buildlink3.mk"
.include "../../print/libspectre/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/djvulibre-lib/buildlink3.mk"
.include "../../graphics/exiv2/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/sane-backends/buildlink3.mk"
.include "../../textproc/ebook-tools/buildlink3.mk"
.include "../../net/libmms/buildlink3.mk"
.include "../../net/libtorrent-rasterbar/buildlink3.mk"
.include "../../net/libvncserver/buildlink3.mk"
.include "../../net/freerdp2/buildlink3.mk"
.include "../../katana/libdbusmenu-katie/buildlink3.mk"
.include "../../katana/poppler-katie/buildlink3.mk"
.include "../../mk/oss.buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
