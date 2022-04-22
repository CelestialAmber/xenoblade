.include "macros.inc"

.section .text, "ax"  # 0x80039220 - 0x804F5900

.global func_80310110
func_80310110:
/* 80310110 002D96D0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80310114 002D96D4  7C 08 02 A6 */	mflr r0
/* 80310118 002D96D8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8031011C 002D96DC  88 03 00 00 */	lbz r0, 0(r3)
/* 80310120 002D96E0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80310124 002D96E4  7C 9F 23 78 */	mr r31, r4
/* 80310128 002D96E8  7C 00 07 75 */	extsb. r0, r0
/* 8031012C 002D96EC  93 C1 00 08 */	stw r30, 8(r1)
/* 80310130 002D96F0  7C 7E 1B 78 */	mr r30, r3
/* 80310134 002D96F4  41 82 00 28 */	beq lbl_8031015C
/* 80310138 002D96F8  88 04 00 00 */	lbz r0, 0(r4)
/* 8031013C 002D96FC  7C 00 07 75 */	extsb. r0, r0
/* 80310140 002D9700  41 82 00 1C */	beq lbl_8031015C
/* 80310144 002D9704  38 A0 00 04 */	li r5, 4
/* 80310148 002D9708  4B FB 28 09 */	bl func_802C2950
/* 8031014C 002D970C  2C 03 00 00 */	cmpwi r3, 0
/* 80310150 002D9710  41 82 00 0C */	beq lbl_8031015C
/* 80310154 002D9714  38 60 00 00 */	li r3, 0
/* 80310158 002D9718  48 00 00 90 */	b lbl_803101E8
lbl_8031015C:
/* 8031015C 002D971C  88 1E 00 04 */	lbz r0, 4(r30)
/* 80310160 002D9720  7C 00 07 75 */	extsb. r0, r0
/* 80310164 002D9724  41 82 00 28 */	beq lbl_8031018C
/* 80310168 002D9728  88 1F 00 04 */	lbz r0, 4(r31)
/* 8031016C 002D972C  7C 00 07 75 */	extsb. r0, r0
/* 80310170 002D9730  41 82 00 1C */	beq lbl_8031018C
/* 80310174 002D9734  38 7E 00 04 */	addi r3, r30, 4
/* 80310178 002D9738  38 9F 00 04 */	addi r4, r31, 4
/* 8031017C 002D973C  38 A0 00 02 */	li r5, 2
/* 80310180 002D9740  4B FB 27 D1 */	bl func_802C2950
/* 80310184 002D9744  2C 03 00 00 */	cmpwi r3, 0
/* 80310188 002D9748  41 82 00 0C */	beq lbl_80310194
lbl_8031018C:
/* 8031018C 002D974C  38 60 00 00 */	li r3, 0
/* 80310190 002D9750  48 00 00 58 */	b lbl_803101E8
lbl_80310194:
/* 80310194 002D9754  88 7E 00 06 */	lbz r3, 6(r30)
/* 80310198 002D9758  28 03 00 FF */	cmplwi r3, 0xff
/* 8031019C 002D975C  41 82 00 20 */	beq lbl_803101BC
/* 803101A0 002D9760  88 1F 00 06 */	lbz r0, 6(r31)
/* 803101A4 002D9764  28 00 00 FF */	cmplwi r0, 0xff
/* 803101A8 002D9768  41 82 00 14 */	beq lbl_803101BC
/* 803101AC 002D976C  7C 03 00 40 */	cmplw r3, r0
/* 803101B0 002D9770  41 82 00 0C */	beq lbl_803101BC
/* 803101B4 002D9774  38 60 00 00 */	li r3, 0
/* 803101B8 002D9778  48 00 00 30 */	b lbl_803101E8
lbl_803101BC:
/* 803101BC 002D977C  88 7E 00 07 */	lbz r3, 7(r30)
/* 803101C0 002D9780  28 03 00 FF */	cmplwi r3, 0xff
/* 803101C4 002D9784  41 82 00 20 */	beq lbl_803101E4
/* 803101C8 002D9788  88 1F 00 07 */	lbz r0, 7(r31)
/* 803101CC 002D978C  28 00 00 FF */	cmplwi r0, 0xff
/* 803101D0 002D9790  41 82 00 14 */	beq lbl_803101E4
/* 803101D4 002D9794  7C 03 00 40 */	cmplw r3, r0
/* 803101D8 002D9798  41 82 00 0C */	beq lbl_803101E4
/* 803101DC 002D979C  38 60 00 00 */	li r3, 0
/* 803101E0 002D97A0  48 00 00 08 */	b lbl_803101E8
lbl_803101E4:
/* 803101E4 002D97A4  38 60 00 01 */	li r3, 1
lbl_803101E8:
/* 803101E8 002D97A8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803101EC 002D97AC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803101F0 002D97B0  83 C1 00 08 */	lwz r30, 8(r1)
/* 803101F4 002D97B4  7C 08 03 A6 */	mtlr r0
/* 803101F8 002D97B8  38 21 00 10 */	addi r1, r1, 0x10
/* 803101FC 002D97BC  4E 80 00 20 */	blr 

.global func_80310200
func_80310200:
/* 80310200 002D97C0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80310204 002D97C4  7C 08 02 A6 */	mflr r0
/* 80310208 002D97C8  90 01 00 24 */	stw r0, 0x24(r1)
/* 8031020C 002D97CC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80310210 002D97D0  3B E0 00 00 */	li r31, 0
/* 80310214 002D97D4  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80310218 002D97D8  83 C2 BC 08 */	lwz r30, lbl_8066BF88@sda21(r2)
/* 8031021C 002D97DC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80310220 002D97E0  48 05 0D F1 */	bl func_80361010
/* 80310224 002D97E4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80310228 002D97E8  40 82 00 10 */	bne lbl_80310238
/* 8031022C 002D97EC  38 60 00 01 */	li r3, 1
/* 80310230 002D97F0  48 04 77 E1 */	bl func_80357A10
/* 80310234 002D97F4  48 00 00 0C */	b lbl_80310240
lbl_80310238:
/* 80310238 002D97F8  38 60 00 00 */	li r3, 0
/* 8031023C 002D97FC  48 04 77 D5 */	bl func_80357A10
lbl_80310240:
/* 80310240 002D9800  48 05 13 91 */	bl func_803615D0
/* 80310244 002D9804  7C 63 07 74 */	extsb r3, r3
/* 80310248 002D9808  38 03 FF FC */	addi r0, r3, -4
/* 8031024C 002D980C  28 00 00 01 */	cmplwi r0, 1
/* 80310250 002D9810  40 81 00 24 */	ble lbl_80310274
/* 80310254 002D9814  2C 03 00 02 */	cmpwi r3, 2
/* 80310258 002D9818  41 82 00 10 */	beq lbl_80310268
/* 8031025C 002D981C  3F A0 80 51 */	lis r29, lbl_8050E3A8@ha
/* 80310260 002D9820  3B BD E3 A8 */	addi r29, r29, lbl_8050E3A8@l
/* 80310264 002D9824  48 00 00 14 */	b lbl_80310278
lbl_80310268:
/* 80310268 002D9828  3F A0 80 51 */	lis r29, lbl_8050E3C4@ha
/* 8031026C 002D982C  3B BD E3 C4 */	addi r29, r29, lbl_8050E3C4@l
/* 80310270 002D9830  48 00 00 08 */	b lbl_80310278
lbl_80310274:
/* 80310274 002D9834  3B AD 98 18 */	addi r29, r13, lbl_80665998@sda21
lbl_80310278:
/* 80310278 002D9838  48 05 0D 99 */	bl func_80361010
/* 8031027C 002D983C  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 80310280 002D9840  28 00 00 06 */	cmplwi r0, 6
/* 80310284 002D9844  40 81 00 0C */	ble lbl_80310290
/* 80310288 002D9848  80 BD 00 04 */	lwz r5, 4(r29)
/* 8031028C 002D984C  48 00 00 10 */	b lbl_8031029C
lbl_80310290:
/* 80310290 002D9850  48 05 0D 81 */	bl func_80361010
/* 80310294 002D9854  54 60 15 BA */	rlwinm r0, r3, 2, 0x16, 0x1d
/* 80310298 002D9858  7C BD 00 2E */	lwzx r5, r29, r0
lbl_8031029C:
/* 8031029C 002D985C  93 E1 00 08 */	stw r31, 8(r1)
/* 803102A0 002D9860  38 61 00 0C */	addi r3, r1, 0xc
/* 803102A4 002D9864  38 81 00 08 */	addi r4, r1, 8
/* 803102A8 002D9868  93 C1 00 0C */	stw r30, 0xc(r1)
/* 803102AC 002D986C  48 04 6C 95 */	bl func_80356F40
/* 803102B0 002D9870  80 01 00 24 */	lwz r0, 0x24(r1)
/* 803102B4 002D9874  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 803102B8 002D9878  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 803102BC 002D987C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 803102C0 002D9880  7C 08 03 A6 */	mtlr r0
/* 803102C4 002D9884  38 21 00 20 */	addi r1, r1, 0x20
/* 803102C8 002D9888  4E 80 00 20 */	blr 
/* 803102CC 002D988C  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */