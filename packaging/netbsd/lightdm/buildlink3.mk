# $NetBSD$

BUILDLINK_TREE+=	lightdm

.if !defined(LIGHTDM_BUILDLINK3_MK)
LIGHTDM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.lightdm+=	lightdm>=1.30.0
BUILDLINK_PKGSRCDIR.lightdm?=	../../katana/lightdm
.endif	# LIGHTDM_BUILDLINK3_MK

BUILDLINK_TREE+=	-lightdm
