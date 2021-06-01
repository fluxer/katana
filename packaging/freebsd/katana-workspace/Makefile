# $FreeBSD$

# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katana-workspace
DISTVERSION = 4.20.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana workspace interface and basic tools
LICENSE = LGPL20 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kde-workspace/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-workspace-master

USES = compiler:c++11-lang pkgconfig cmake desktop-file-utils xorg perl5 samba gl shebangfix
USE_XORG = x11 xinerama xcursor xfixes xrender xtst xdamage xcomposite xres xdmcp xft xi xau \
	xscrnsaver sm xcb
USE_PERL5 = build
USE_SAMBA = build run
USE_GL = gl glesv2 glu
SHEBANG_FILES = kdm/confproc.pl
USE_RC_SUBR = kdm
USERS = kdm
GROUPS = kdm
# fortune and pam are not part of any package
RUN_DEPENDS = ${LOCALBASE}/share/icons/ariya/index.theme:katana/ariya-icons \
	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme \
	gdb:devel/gdb xterm:x11/xterm \
	${LOCALBASE}/share/fonts/dejavu/DejaVuSansMono.ttf:x11-fonts/dejavu \
	wrestool:graphics/icoutils ddjvu:graphics/djvulibre xrdb:x11/xrdb xmessage:x11/xmessage \
	xprop:x11/xprop setxkbmap:x11/setxkbmap xmodmap:x11/xmodmap xsetroot:x11/xsetroot \
	iceauth:x11/iceauth socat:net/socat iso-codes>=0:misc/iso-codes mtools:emulators/mtools \
	rar:archivers/rar unrar:archivers/unrar
# TODO: substitute for libusb?
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs \
	libkonq.so:katana/katana-baseapps libstreams.so:katana/strigi \
	libdbusmenu-katie.so:katana/libdbusmenu-katie \
	libxcb-image.so:x11/xcb-util-image libxcb-icccm.so:x11/xcb-util-wm \
	libxcb-render-util.so:x11/xcb-util-renderutil libxcb-keysyms.so:x11/xcb-util-keysyms \
	libpci.so:sysutils/pciutils libqalculate.so:math/libqalculate libdrm.so:graphics/libdrm \
	libpng.so:graphics/png libIlmImf.so:graphics/openexr libmtp.so:multimedia/libmtp \
	libgps.so:astro/gpsd libssh.so:security/libssh libjpeg.so:graphics/jpeg-turbo
CMAKE_ARGS = -Wno-dev

post-install:
	${INSTALL_DATA} ${WRKSRC}/kde.pamd ${STAGEDIR}${PREFIX}/etc/pam.d/kde
	${MKDIR} ${STAGEDIR}/var/lib/kdm

.include <bsd.port.mk>
