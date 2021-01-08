# $NetBSD$

BUILDLINK_TREE+=	attica-katie

.if !defined(ATTICA_KATIE_BUILDLINK3_MK)
ATTICA_KATIE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.attica-katie+=	attica-katie>=4.19.0.d20201217
BUILDLINK_PKGSRCDIR.attica-katie?=	../../katana/attica-katie
.endif	# ATTICA_KATIE_BUILDLINK3_MK

BUILDLINK_TREE+=	-attica-katie
