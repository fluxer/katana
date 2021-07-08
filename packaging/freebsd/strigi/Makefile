# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = strigi
DISTVERSION = 4.20.0.d20210531
CATEGORIES = devel
MAINTAINER = xakepa10@gmail.com
COMMENT = File indexing and file search framework adopted by Katana
LICENSE = LGPL20+
LICENSE_COMB = single

MASTER_SITES = https://github.com/fluxer/strigi/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/strigi-master

USES = compiler:c++11-lang pkgconfig cmake iconv
LDFLAGS += -L${LOCALBASE}/lib ${ICONV_LIB}
RUN_DEPENDS = pdftotext:graphics/poppler-utils
# libmagic and libz are not part of any package
LIB_DEPENDS = libexiv2.so:graphics/exiv2 libavcodec.so:multimedia/ffmpeg \
	libavformat.so:multimedia/ffmpeg libbz2.so:archivers/bzip2 \
	libxml2.so:textproc/libxml2
CMAKE_ARGS = -Wno-dev

.include <bsd.port.mk>
