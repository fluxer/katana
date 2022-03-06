# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katana-extraapps
DISTVERSION = 4.21.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana extra applications
LICENSE = GPLv2 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kde-extraapps/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-extraapps-master

USES = compiler:c++11-lang pkgconfig cmake xorg perl5 gettext-tools libarchive \
	ghostscript desktop-file-utils shared-mime-info
USE_XORG = x11 xrender xtst xdamage xext xfixes
USE_PERL5 = build
USE_GETTEXT_TOOLS = build run
USE_GHOSTSCRIPT = run
USE_LDCONFIG = yes
# build and run depending on freerdp2 since the build system checks for its presence but in fact
# only the binaries are needed, speech-dispatcher is both build and runtime dependancy, qemu is
# runtime only
RUN_DEPENDS = xfreerdp:net/freerdp xsltproc:textproc/libxslt \
	speech-dispatcher:accessibility/speech-dispatcher qemu-system-i386:emulators/qemu
# zlib and oss are not part of any package
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs \
	libkonq.so:katana/katana-baseapps libplasmagenericshell.so:katana/katana-workspace \
	libpoppler-katie.so:katana/poppler-katie libdbusmenu-katie.so:katana/libdbusmenu-katie \
	libgmp.so:math/gmp libgpgme.so:security/gpgme libgcrypt.so:security/libgcrypt \
	libasound.so:audio/alsa-lib libspeechd.so:accessibility/speech-dispatcher \
	libtag.so:audio/taglib libffmpegthumbnailer.so:multimedia/ffmpegthumbnailer \
	libqalculate.so:math/libqalculate libcups.so:print/cups libspectre.so:print/libspectre \
	libfreetype.so:print/freetype2 libdjvulibre.so:graphics/djvulibre \
	libexiv2.so:graphics/exiv2 libsane.so:graphics/sane-backends \
	libepub.so:textproc/ebook-tools libmms.so:net/libmms libvncserver.so:net/libvncserver \
	libfreerdp2.so:net/freerdp libtorrent-rasterbar.so:net-p2p/libtorrent-rasterbar
BUILD_DEPENDS = ${LOCALBASE}/include/boost/property_tree/ini_parser.hpp:devel/boost-libs
CMAKE_ARGS = -Wno-dev -DBUILD_partitionmanager=FALSE
LDFLAGS += -Wl,--as-needed

.include <bsd.port.mk>
