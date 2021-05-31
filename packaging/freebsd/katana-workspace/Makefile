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

USES = compiler:c++11-lang pkgconfig cmake desktop-file-utils xorg perl5 samba gl
USE_XORG = x11 xinerama xcursor xfixes xrender xtst xdamage xcomposite xres xdmcp xft xi xau \
	xscrnsaver sm xcb
USE_PERL5 = build
USE_SAMBA = build run
USE_GL = gl glesv2 glu
RUN_DEPENDS = ${LOCALBASE}/share/icons/ariya/index.theme:katana/ariya-icons \
	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme
# TODO: missing dependencies
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs \
	libkonq.so:katana/katana-baseapps libstreams.so:katana/strigi \
	libdbusmenu-katie.so:katana/libdbusmenu-katie \
	libxcb-image.so:x11/xcb-util-image libxcb-icccm.so:xcb-util-wm \
	libxcb-render-util.so:x11/xcb-util-renderutil libxcb-keysyms.so:x11/xcb-util-keysyms
CMAKE_ARGS = -Wno-dev

.include <bsd.port.mk>
