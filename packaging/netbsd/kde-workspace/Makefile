# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = master
PKGNAME = kde-workspace-4.21.0.d20201217
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
USE_LANGUAGES = c c++
USE_TOOLS = pkg-config sh:run

post-extract:
	${MKDIR} ${WRKDIR}/build

SUBST_CLASSES = pciutils
SUBST_STAGE.pciutils = pre-configure
SUBST_FILES.pciutils = kinfocenter/Modules/pci/kpci.cpp
SUBST_MESSAGE.pciutils = Adjusting pci header inclusion
SUBST_SED.pciutils = -e 's,<pci/pci.h>,<pciutils/pci.h>,g'

DEPENDS = ariya-icons-[0-9]*:../../katana/ariya-icons
DEPENDS += gdb-[0-9]*:../../devel/gdb
DEPENDS += dejavu-ttf-[0-9]*:../../fonts/dejavu-ttf
# see above
# DEPENDS += pciutils-[0-9]*:../../sysutils/pciutils
DEPENDS += usbids-[0-9]*:../../misc/usbids
DEPENDS += icoutils-[0-9]*:../../graphics/icoutils
DEPENDS += djvulibre-tools-[0-9]*:../../graphics/djvulibre-tools
DEPENDS += xrdb-[0-9]*:../../x11/xrdb
DEPENDS += xmessage-[0-9]*:../../x11/xmessage
DEPENDS += xprop-[0-9]*:../../x11/xprop
DEPENDS += xrandr-[0-9]*:../../x11/xrandr
DEPENDS += setxkbmap-[0-9]*:../../x11/setxkbmap
DEPENDS += xmodmap-[0-9]*:../../x11/xmodmap
DEPENDS += xsetroot-[0-9]*:../../x11/xsetroot
DEPENDS += iceauth-[0-9]*:../../x11/iceauth
DEPENDS += iso-codes-[0-9]*:../../textproc/iso-codes
DEPENDS += mtools-[0-9]*:../../sysutils/mtools
DEPENDS += rar-[0-9]*:../../archivers/rar
DEPENDS += unrar-[0-9]*:../../archivers/unrar
DEPENDS += consolekit-[0-9]*:../../sysutils/consolekit
DEPENDS += qrencode-[0-9]*:../../converters/qrencode
DEPENDS += xscreensaver-[0-9]*:../../x11/xscreensaver

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
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libXau/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libxkbfile/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libICE/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libXxf86vm/buildlink3.mk"
.include "../../x11/libxcb/buildlink3.mk"
.include "../../x11/xcb-util-renderutil/buildlink3.mk"
.include "../../x11/xcb-util-keysyms/buildlink3.mk"
.include "../../x11/libdrm/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/openexr/buildlink3.mk"
.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../geography/geoclue/buildlink3.mk"
.include "../../devel/libgphoto2/buildlink3.mk"
.include "../../devel/libmtp/buildlink3.mk"
.include "../../katana/libdbusmenu-katie/buildlink3.mk"
# TODO: fails to build on Linux
# .include "../../security/libssh/buildlink3.mk"
.include "../../net/samba/buildlink3.mk"
.include "../../mk/libusb.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
