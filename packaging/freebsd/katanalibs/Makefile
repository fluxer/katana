# $FreeBSD$

# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katanalibs
DISTVERSION = 4.20.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana core libraries
LICENSE = LGPL20 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kdelibs/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kdelibs-master

USES = compiler:c++11-lang pkgconfig cmake ssl desktop-file-utils shared-mime-info xorg perl5 shebangfix
USE_XORG = x11 xtst xcursor xfixes xscrnsaver sm xcb
USE_PERL5 = build run
SHEBANG_FILES = kdeui/preparetips kio/misc/fileshareset
RUN_DEPENDS = xdg-open:devel/xdg-utils ${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme
# zlib and xz are not part of any package
# TODO: more avahi dependencies may be needed
LIB_DEPENDS = libKtCore.so:katana/katie libstreams.so:katana/strigi \
	libdbusmenu-katie.so:katana/libdbusmenu-katie \
	libxcb-keysyms.so:x11/xcb-util-keysyms libxcb-image.so:x11/xcb-util-image \
	libxcb-render-util.so:x11/xcb-util-renderutil libenchant-2.so:textproc/enchant2 \
	libIlmImf.so:graphics/openexr libraw_r.so:graphics/libraw libwebp.so:graphics/webp \
	libexiv2.so:graphics/exiv2 libjasper.so:graphics/jasper \
	libmpv.so:multimedia/mpv libdns_sd.so:net/avahi-libdns libbz2.so:archivers/bzip2 \
	libkrb5.so:security/krb5
CMAKE_ARGS = -Wno-dev

.include <bsd.port.mk>