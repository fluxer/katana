# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katana-workspace
DISTVERSION = 4.21.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana workspace interface and basic tools
LICENSE = LGPL20 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kde-workspace/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-workspace-master

USES = compiler:c++11-lang pkgconfig cmake xorg samba gl desktop-file-utils \
	shared-mime-info shebangfix
USE_XORG = x11 xinerama xcursor xfixes xrender xtst xdamage xcomposite xres xft xi xau \
	xscrnsaver xrandr xext ice sm xcb xxf86vm
USE_SAMBA = build run
USE_GL = gl glu egl glesv2
USE_LDCONFIG = yes
SHEBANG_FILES = kcontrol/kfontinst/dbus/fontinst_x11
# libusb, fortune and pam are not part of any package
RUN_DEPENDS = ${LOCALBASE}/share/icons/ariya/index.theme:katana/ariya-icons \
	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme \
	gdb:devel/gdb Xorg:x11-servers/xorg-server \
	${LOCALBASE}/share/fonts/dejavu/DejaVuSansMono.ttf:x11-fonts/dejavu \
	wrestool:graphics/icoutils ddjvu:graphics/djvulibre xrdb:x11/xrdb xmessage:x11/xmessage \
	xprop:x11/xprop xrandr:x11/xrandr setxkbmap:x11/setxkbmap xmodmap:x11/xmodmap \
	xsetroot:x11/xsetroot iceauth:x11/iceauth socat:net/socat iso-codes>=0:misc/iso-codes \
	mtools:emulators/mtools rar:archivers/rar unrar:archivers/unrar \
	ck-list-sessions:sysutils/consolekit2 lspci:sysutils/pciutils
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs \
	libkonq.so:katana/katana-baseapps  libdbusmenu-katie.so:katana/libdbusmenu-katie \
	libfreetype.so:print/freetype2 libfontconfig.so:x11-fonts/fontconfig \
	libxcb-image.so:x11/xcb-util-image libxcb-icccm.so:x11/xcb-util-wm \
	libxcb-render-util.so:x11/xcb-util-renderutil libxcb-keysyms.so:x11/xcb-util-keysyms \
	libxkbfile.so:x11/libxkbfile libpci.so:devel/libpci libqalculate.so:math/libqalculate \
	libdrm.so:graphics/libdrm libpng.so:graphics/png libOpenEXR.so:graphics/openexr \
	libmtp.so:multimedia/libmtp libssh.so:security/libssh libgphoto2.so:graphics/libgphoto2 \
	liblightdm-gobject-1.so:x11/lightdm
CMAKE_ARGS = -Wno-dev
LDFLAGS += -Wl,--as-needed

post-install:
	${INSTALL_DATA} ${WRKSRC}/kde.pamd ${STAGEDIR}${PREFIX}/etc/pam.d/kde

.include <bsd.port.mk>
