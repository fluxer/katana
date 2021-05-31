# $FreeBSD$

# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katana-baseapps
DISTVERSION = 4.20.0.d20210531
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana core applications
LICENSE = LGPL20 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://github.com/fluxer/kde-baseapps/archive/
DISTFILES = master.tar.gz
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-baseapps-master

USES = compiler:c++11-lang pkgconfig cmake desktop-file-utils xorg perl5
USE_XORG = x11
USE_PERL5 = build
RUN_DEPENDS = sudo:security/sudo ctags:devel/ctags cppcheck:devel/cppcheck \
	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs
CMAKE_ARGS = -Wno-dev

.include <bsd.port.mk>
