# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katanalibs
DISTVERSION = 4.22.0.d20220512
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana core libraries
LICENSE = LGPL20 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kdelibs/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kdelibs-master

USES = compiler:c++11-lang pkgconfig cmake xorg ssl gettext-runtime desktop-file-utils \
	shared-mime-info shebangfix
USE_XORG = x11 xtst xcursor xfixes xscrnsaver xext sm
USE_LDCONFIG = yes
SHEBANG_FILES = kdeui/preparetips
RUN_DEPENDS = xdg-open:devel/xdg-utils \
	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme \
	ck-list-sessions:sysutils/consolekit2
# zlib and xz are not part of any package
LIB_DEPENDS = libKtCore.so:katana/katie libdbusmenu-katie.so:katana/libdbusmenu-katie \
	libenchant-2.so:textproc/enchant2 libwebp.so:graphics/webp \
	libMagick++-6.so:graphics/ImageMagick6 libexiv2.so:graphics/exiv2 \
	libmpv.so:multimedia/mpv libavahi-client.so:net/avahi-app libbz2.so:archivers/bzip2 \
	libcurl.so:ftp/curl libavcodec.so:multimedia/ffmpeg libtag.so:audio/taglib \
	libepub.so:textproc/ebook-tools libpoppler-cpp.so:graphics/poppler \
	libspectre.so:print/libspectre libmicrohttpd.so:www/libmicrohttpd
CMAKE_ARGS = -Wno-dev
LDFLAGS += -Wl,--as-needed

.include <bsd.port.mk>
