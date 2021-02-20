# $NetBSD$

BUILDLINK_TREE+=	kde-extraapps

.if !defined(KDE_EXTRAAPPS_BUILDLINK3_MK)
KDE_EXTRAAPPS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kde-extraapps+=	kde-extraapps>=4.20.0.d20201217
BUILDLINK_PKGSRCDIR.kde-extraapps?=	../../katana/kde-extraapps
.endif	# KDE_EXTRAAPPS_BUILDLINK3_MK

BUILDLINK_TREE+=	-kde-extraapps
