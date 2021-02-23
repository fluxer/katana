# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = kde-workspace-4.20.0.d20201217
CATEGORIES = katana x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana workspace interface and basic tools
LICENSE = gnu-gpl-v2 AND gnu-lgpl-v2.1
HOMEPAGE = https://github.com/fluxer/kde-workspace

MASTER_SITES = ${MASTER_SITE_GITHUB}/fluxer/kde-workspace/archive/
DIST_SUBDIR = kde-workspace
WRKSRC = ${WRKDIR}/kde-workspace-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/build
CMAKE_ARG_PATH= ${WRKSRC}

USE_CMAKE = yes
# static only on Linux
CMAKE_ARGS = -DWITH_PCIUTILS=FALSE
USE_LANGUAGES = c c++11
USE_TOOLS = pkg-config perl
REPLACE_PERL = kdm/confproc.pl
REPLACE_PERL += kioslave/fish/fish.pl
REPLACE_PERL += kioslave/info/kde-info2html

PKG_GROUPS = kdm
PKG_USERS = kdm:kdm
PKG_GECOS.kdm = Katana Display Manager
PKG_HOME.kdm = ${VARBASE}/lib/kdm

RCD_SCRIPTS = kdm

post-extract:
	${MKDIR} ${WRKDIR}/build

post-install:
	${RM} -f ${DESTDIR}${PREFIX}/share/config/kdm/*.bak

SUBST_CLASSES = pciutils
SUBST_STAGE.pciutils = pre-configure
SUBST_FILES.pciutils = kinfocenter/Modules/pci/kpci.cpp
SUBST_MESSAGE.pciutils = Adjusting pci header inclusion
SUBST_SED.pciutils = -e 's,<pci/pci.h>,<pciutils/pci.h>,g'

DEPENDS = ariya-icons-[0-9]*:../../katana/ariya-icons
DEPENDS += gdb-[0-9]*:../../devel/gdb
DEPENDS += xterm-[0-9]*:../../x11/xterm
DEPENDS += dejavu-ttf-[0-9]*:../../fonts/dejavu-ttf
# see above
# DEPENDS += pciutils-[0-9]*:../../sysutils/pciutils
DEPENDS += icoutils-[0-9]*:../../graphics/icoutils
DEPENDS += djvulibre-tools-[0-9]*:../../graphics/djvulibre-tools
DEPENDS += xrdb-[0-9]*:../../x11/xrdb
DEPENDS += xmessage-[0-9]*:../../x11/xmessage
DEPENDS += xprop-[0-9]*:../../x11/xprop
DEPENDS += setxkbmap-[0-9]*:../../x11/setxkbmap
DEPENDS += xmodmap-[0-9]*:../../x11/xmodmap
DEPENDS += socat-[0-9]*:../../net/socat
DEPENDS += iso-codes-[0-9]*:../../textproc/iso-codes

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../devel/katie/buildlink3.mk"
.include "../../katana/kdelibs/buildlink3.mk"
.include "../../katana/kde-baseapps/buildlink3.mk"
.include "../../sysutils/pciutils/buildlink3.mk"
.include "../../math/qalculate/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXcursor/buildlink3.mk"
.include "../../x11/libXfixes/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.include "../../x11/libXres/buildlink3.mk"
.include "../../x11/libXdmcp/buildlink3.mk"
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libXau/buildlink3.mk"
.include "../../x11/libXScrnSaver/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libxcb/buildlink3.mk"
.include "../../x11/libxklavier/buildlink3.mk"
.include "../../x11/libxcb/buildlink3.mk"
.include "../../x11/xcb-util-wm/buildlink3.mk"
.include "../../x11/xcb-util-renderutil/buildlink3.mk"
.include "../../x11/xcb-util-keysyms/buildlink3.mk"
.include "../../x11/libdrm/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/openexr/buildlink3.mk"
.include "../../graphics/exiv2/buildlink3.mk"
.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../devel/libmtp/buildlink3.mk"
.include "../../geography/gpsd/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../katana/libdbusmenu-katie/buildlink3.mk"
.include "../../katana/attica-katie/buildlink3.mk"
# TODO:
# .include "../../katana/libpolkit-katie/buildlink3.mk"
# TODO: fail to build on Linux
# .include "../../security/libssh/buildlink3.mk"
# .include "../../net/samba/buildlink3.mk"
.include "../../mk/libusb.buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../mk/pam.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
