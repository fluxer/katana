# $NetBSD$

BUILDLINK_TREE+=	libdbusmenu-katie

.if !defined(LIBDBUSMENU_KATIE_BUILDLINK3_MK)
LIBDBUSMENU_KATIE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libdbusmenu-katie+=	libdbusmenu-katie>=4.20.0.d20201217
BUILDLINK_PKGSRCDIR.libdbusmenu-katie?=	../../katana/libdbusmenu-katie
.endif	# LIBDBUSMENU_KATIE_BUILDLINK3_MK

BUILDLINK_TREE+=	-libdbusmenu-katie
