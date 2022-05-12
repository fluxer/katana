# $NetBSD$

BUILDLINK_TREE+=	kde-baseapps

.if !defined(KDE_BASEAPPS_BUILDLINK3_MK)
KDE_BASEAPPS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kde-baseapps+=	kde-baseapps>=4.22.0.d20220512
BUILDLINK_PKGSRCDIR.kde-baseapps?=	../../katana/kde-baseapps
.endif	# KDE_BASEAPPS_BUILDLINK3_MK

BUILDLINK_TREE+=	-kde-baseapps
