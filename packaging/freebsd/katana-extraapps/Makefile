# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katana-extraapps
DISTVERSION = 4.23.0.d20220512
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana extra applications
LICENSE = GPLv2 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://osdn.net/projects/kde/news/
DISTFILES = rss
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-extraapps.git

USES = compiler:c++11-lang pkgconfig cmake xorg gettext-tools libarchive desktop-file-utils
USE_XORG = x11 xrender xtst xdamage xext xfixes
USE_GETTEXT_TOOLS = build run
USE_LIBARCHIVE = build
USE_LDCONFIG = yes
# build and run depending on freerdp2 since the build system checks for its presence but in fact
# only the binaries are needed. qemu is runtime only
# NOTE: lrzsz (which katana-workspace depends on) conflicts with lrzip
RUN_DEPENDS = xfreerdp:net/freerdp qemu-system-i386:emulators/qemu
# oss is not part of any package
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs \
	libplasmagenericshell.so:katana/katana-workspace libdeflate.so:archivers/libdeflate \
	libgmp.so:math/gmp libasound.so:audio/alsa-lib libtag.so:audio/taglib \
	libffmpegthumbnailer.so:multimedia/ffmpegthumbnailer libqalculate.so:math/libqalculate \
	libspectre.so:print/libspectre libfreetype.so:print/freetype2 \
	libdjvulibre.so:graphics/djvulibre libepub.so:textproc/ebook-tools \
	libvncserver.so:net/libvncserver libfreerdp2.so:net/freerdp \
	libtorrent-rasterbar.so:net-p2p/libtorrent-rasterbar libpoppler-cpp.so:graphics/poppler
CMAKE_ARGS = -Wno-dev -DBUILD_partitionmanager=FALSE
LDFLAGS += -Wl,--as-needed

do-extract:
	@rm -vrf ${WRKSRC}
	@git clone --depth=1 https://scm.osdn.net/gitroot/kde/kde-extraapps.git ${WRKSRC}

.include <bsd.port.mk>
