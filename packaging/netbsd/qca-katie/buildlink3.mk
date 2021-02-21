# $NetBSD$

BUILDLINK_TREE+=	qca-katie

.if !defined(QCA_KATIE_BUILDLINK3_MK)
QCA_KATIE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.qca-katie+=	qca-katie>=4.20.0.d20201217
BUILDLINK_PKGSRCDIR.qca-katie?=	../../katana/qca-katie
.endif	# QCA_KATIE_BUILDLINK3_MK

BUILDLINK_TREE+=	-qca-katie
