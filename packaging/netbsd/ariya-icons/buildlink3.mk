# $NetBSD$

BUILDLINK_TREE+=	ariya-icons

.if !defined(ARIYA_ICONS_BUILDLINK3_MK)
ARIYA_ICONS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ariya-icons+=	ariya-icons>=4.22.0.d20220512
BUILDLINK_PKGSRCDIR.ariya-icons?=	../../katana/ariya-icons
.endif	# ARIYA_ICONS_BUILDLINK3_MK

BUILDLINK_TREE+=	-ariya-icons
