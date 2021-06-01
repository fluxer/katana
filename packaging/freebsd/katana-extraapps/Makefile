# $FreeBSD$

# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katana-extraapps
DISTVERSION = 4.20.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana extra applications
LICENSE = GPLv2 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kde-extraapps/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-extraapps-master

USES = compiler:c++11-lang pkgconfig cmake desktop-file-utils xorg perl5 gettext-tools libarchive
USE_XORG = x11 xrender xtst xdamage xext xfixes
USE_PERL5 = build
USE_GETTEXT_TOOLS = build run
# build and run depending on freerdp2 since the build system checks for its presence but in fact
# only the binaries are needed
RUN_DEPENDS = xfreerdp:net/freerdp
# zlib and oss are not part of any package
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs \
	libkonq.so:katana/katana-baseapps libplasmagenericshell.so:katana/katana-workspace \
	libpoppler-katie.so:katana/poppler-katie libdbusmenu-katie.so:katana/libdbusmenu-katie \
	libgmp.so:math/gmp libgpgme.so:security/gpgme libgcrypt.so:security/libgcrypt \
	libasound.so:audio/alsa-lib libFLAC.so:audio/flac \
	libspeechd.so:accessibility/speech-dispatcher libtag.so:audio/taglib \
	libffmpegthumbnailer.so:multimedia/ffmpegthumbnailer libqalculate.so:math/libqalculate \
	libcups.so:print/cups libspectre.so:print/libspectre libfreetype.so:print/freetype2 \
	libdjvulibre.so:graphics/djvulibre libexiv2.so:graphics/exiv2 libpng.so:graphics/png \
	libsane.so:graphics/sane-backends libtiff.so:graphics/tiff \
	libepub.so:textproc/ebook-tools libhunspell-1.7.so:textproc/hunspell libmms.so:net/libmms \
	libvncserver.so:net/libvncserver libfreerdp2.so:net/freerdp libibus-1.0.so:textproc/ibus \
	libscim-1.0.so:textproc/scim libjpeg.so:graphics/jpeg-turbo
BUILD_DEPENDS = ${LOCALBASE}/include/boost/property_tree/ini_parser.hpp:devel/boost-libs
CMAKE_ARGS = -Wno-dev -DBUILD_partitionmanager=FALSE

.include <bsd.port.mk>
