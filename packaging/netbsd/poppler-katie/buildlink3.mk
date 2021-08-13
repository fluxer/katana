# $NetBSD$

BUILDLINK_TREE+=	poppler-katie

.if !defined(POPPLER_KATIE_BUILDLINK3_MK)
POPPLER_KATIE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.poppler-katie+=	poppler-katie>=4.21.0.d20201217
BUILDLINK_PKGSRCDIR.poppler-katie?=	../../katana/poppler-katie
.endif	# POPPLER_KATIE_BUILDLINK3_MK

BUILDLINK_TREE+=	-poppler-katie
