# $NetBSD$

# https://wiki.netbsd.org/pkgsrc/intro_to_packaging/
# https://www.netbsd.org/docs/pkgsrc/

DISTNAME = 1.30.0
PKGNAME = lightdm-1.30.0
CATEGORIES = katana x11
MAINTAINER = xakepa10@gmail.com
COMMENT = LightDM is a cross-desktop display manager
LICENSE = gnu-gpl-v3 AND gnu-lgpl-v2 AND gnu-lgpl-v3
HOMEPAGE = https://github.com/canonical/lightdm

MASTER_SITES = ${MASTER_SITE_GITHUB}/canonical/lightdm/archive/
DIST_SUBDIR = lightdm
WRKSRC = ${WRKDIR}/lightdm-${DISTNAME}
CONFIGURE_DIRS= ${WRKDIR}/lightdm-${DISTNAME}

GNU_CONFIGURE = yes
USE_LANGUAGES = c c++
USE_TOOLS = autoconf automake pkg-config intltool gmake sed
USE_LIBTOOL = YES

CONFIGURE_ARGS += --disable-tests
CONFIGURE_ARGS += --localstatedir=${VARBASE}

PKG_GROUPS = lightdm
PKG_USERS = lightdm:lightdm
PKG_GECOS.lightdm = LightDM
PKG_HOME.lightdm = ${VARBASE}/lib/lightdm-data

RCD_SCRIPTS = lightdm

pre-configure:
	cd ${WRKSRC} && NOCONFIGURE=1 ./autogen.sh

# non-existing PAM modules
post-install:
	${SED} -e '/pam_nologin/d' -e '/pam_env/d' -e '/pam_systemd/d' -i ${DESTDIR}${PREFIX}/etc/pam.d/*

.include "../../x11/xorgproto/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXdmcp/buildlink3.mk"
.include "../../x11/libxcb/buildlink3.mk"
.include "../../x11/libxklavier/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../mk/pam.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
