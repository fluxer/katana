# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katana-baseapps
DISTVERSION = 4.21.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana core applications
LICENSE = LGPL20 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kde-baseapps/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-baseapps-master

USES = compiler:c++11-lang pkgconfig cmake desktop-file-utils xorg shebangfix
USE_XORG = x11
USE_LDCONFIG = yes
SHEBANG_FILES = kate/part/syntax/data/generate-php.pl
RUN_DEPENDS = xauth:x11/xauth sudo:security/sudo ctags:devel/ctags cppcheck:devel/cppcheck \
	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme \
	lrz:comms/lrzsz xmllint:textproc/libxml2
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs
CMAKE_ARGS = -Wno-dev
LDFLAGS += -Wl,--as-needed

.include <bsd.port.mk>
