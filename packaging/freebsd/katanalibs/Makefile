# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katanalibs
DISTVERSION = 4.21.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana core libraries
LICENSE = LGPL20 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kdelibs/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kdelibs-master

USES = compiler:c++11-lang pkgconfig cmake ssl xorg gettext-runtime desktop-file-utils \
	shared-mime-info shebangfix
USE_XORG = x11 xtst xcursor xfixes xscrnsaver xext sm
USE_LDCONFIG = yes
SHEBANG_FILES = kdeui/preparetips
RUN_DEPENDS = xdg-open:devel/xdg-utils \
	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme
# zlib and xz are not part of any package
# TODO: more avahi dependencies may be needed
LIB_DEPENDS = libKtCore.so:katana/katie libstreams.so:katana/strigi \
	libdbusmenu-katie.so:katana/libdbusmenu-katie libenchant-2.so:textproc/enchant2 \
	libwebp.so:graphics/webp libMagick++-6.so:graphics/ImageMagick6 \
	libexiv2.so:graphics/exiv2 libmpv.so:multimedia/mpv libdns_sd.so:net/avahi-libdns \
	libbz2.so:archivers/bzip2 libkrb5.so:security/krb5
CMAKE_ARGS = -Wno-dev
LDFLAGS += -Wl,--as-needed

.include <bsd.port.mk>
