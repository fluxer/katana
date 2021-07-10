# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = poppler-katie
DISTVERSION = 4.20.0.d20210531
CATEGORIES = devel
MAINTAINER = xakepa10@gmail.com
COMMENT = Katie bindings for poppler
LICENSE = GPLv2 GPLv3
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/poppler/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/poppler-master

USES = compiler:c++11-lang pkgconfig cmake jpeg
# zlib is not part of any package
# building against openjpeg15 because if both openjpeg and openjpeg2 are installed the header from
# openjpeg15 will be found first by the compiler (openjpeg15 header is installed in the local base
# headers directory, openjpeg2 in a sub-directory of the local base headers directory)
LIB_DEPENDS = libKtCore.so:katana/katie libnss3.so:security/nss \
	libfontconfig.so:x11-fonts/fontconfig libfreetype.so:print/freetype2 \
	libpng16.so:graphics/png libtiff.so:graphics/tiff libopenjpeg.so:graphics/openjpeg15 \
	liblcms2.so:graphics/lcms2 libcurl.so:ftp/curl
CMAKE_ARGS = -Wno-dev -DENABLE_LIBOPENJPEG=openjpeg1 -DENABLE_UTILS=OFF -DBUILD_TESTS=OFF \
	-DBUILD_QT4_TESTS=OFF
LDFLAGS += -Wl,--as-needed
# workaround to make it possible to link to libraries that are not specified as full paths
LDFLAGS += -L${LOCALBASE}/lib

.include <bsd.port.mk>
