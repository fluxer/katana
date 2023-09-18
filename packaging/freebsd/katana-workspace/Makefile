# https://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/

PORTNAME = katana-workspace
DISTVERSION = 4.24.0.d20230809
CATEGORIES = devel x11
MAINTAINER = xakepa10@gmail.com
COMMENT = Katana workspace interface, base applications and tools
LICENSE = LGPL20 LGPL21
LICENSE_COMB = multi

MASTER_SITES = https://google.com/
DISTFILES = index.html
DIST_SUBDIR = ${PORTNAME}
WRKSRC = ${WRKDIR}/kde-workspace.git

USES = compiler:c++11-lang pkgconfig cmake xorg gl shebangfix desktop-file-utils \
	shared-mime-info
USE_XORG = x11 xcursor xfixes xrender xtst xdamage xcomposite xres xft xi xau xrandr xext ice sm \
	xcb
USE_GL = gl glu egl
USE_LDCONFIG = yes
SHEBANG_FILES = kate/part/syntax/data/generate-php.pl
# libusb and cdcontrol are not part of any package
RUN_DEPENDS = ${LOCALBASE}/share/icons/ariya/index.theme:katana/ariya-icons \
	${LOCALBASE}/share/icons/hicolor/index.theme:misc/hicolor-icon-theme \
	${LOCALBASE}/share/fonts/dejavu/DejaVuSansMono.ttf:x11-fonts/dejavu \
	Xorg:x11-servers/xorg-server wrestool:graphics/icoutils xrdb:x11/xrdb \
	xmessage:x11/xmessage xauth:x11/xauth xprop:x11/xprop xrandr:x11/xrandr \
	setxkbmap:x11/setxkbmap xsetroot:x11/xsetroot iceauth:x11/iceauth \
	lspci:sysutils/pciutils lightdm:x11/lightdm qrencode:graphics/libqrencode \
	sudo:security/sudo ctags:devel/ctags cppcheck:devel/cppcheck lrz:comms/lrzsz \
	lsof:sysutils/lsof accountsservice>=0:sysutils/accountsservice
LIB_DEPENDS = libKtCore.so:katana/katie libkdecore.so:katana/katanalibs \
	libfreetype.so:print/freetype2 libfontconfig.so:x11-fonts/fontconfig \
	libxcb-render-util.so:x11/xcb-util-renderutil libxcb-keysyms.so:x11/xcb-util-keysyms \
	libxkbfile.so:x11/libxkbfile libpci.so:devel/libpci libdrm.so:graphics/libdrm \
	libmtp.so:multimedia/libmtp libssh.so:security/libssh libdjvulibre.so:graphics/djvulibre \
	libgphoto2.so:graphics/libgphoto2 liblightdm-gobject-1.so:x11/lightdm \
	libepub.so:textproc/ebook-tools libgit2.so:devel/libgit2
CMAKE_ARGS = -Wno-dev
LDFLAGS += -Wl,--as-needed

do-extract:
	@rm -vrf ${WRKSRC}
	# @git clone --depth=1 https://scm.osdn.net/gitroot/kde/kde-workspace.git ${WRKSRC}
	@git clone --depth=1 https://bitbucket.org/smil3y/kde-workspace.git ${WRKSRC}
	# @git clone --depth=1 https://github.com/fluxer/kde-workspace.git ${WRKSRC}

.include <bsd.port.mk>
