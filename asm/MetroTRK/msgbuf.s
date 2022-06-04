.include "macros.inc"

.section .text, "ax"  # 0x80039220 - 0x804F5900

.global TRKInitializeMessageBuffers
TRKInitializeMessageBuffers:
/* 802CD484 00296A44  3C 60 80 58 */	lis r3, lbl_8057B8D8@ha
/* 802CD488 00296A48  38 00 00 00 */	li r0, 0
/* 802CD48C 00296A4C  38 83 B8 D8 */	addi r4, r3, lbl_8057B8D8@l
/* 802CD490 00296A50  90 03 B8 D8 */	stw r0, lbl_8057B8D8@l(r3)
/* 802CD494 00296A54  38 60 00 00 */	li r3, 0
/* 802CD498 00296A58  90 04 08 8C */	stw r0, 0x88c(r4)
/* 802CD49C 00296A5C  90 04 11 18 */	stw r0, 0x1118(r4)
/* 802CD4A0 00296A60  4E 80 00 20 */	blr 

.global TRKGetFreeBuffer
TRKGetFreeBuffer:
/* 802CD4A4 00296A64  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802CD4A8 00296A68  7C 08 02 A6 */	mflr r0
/* 802CD4AC 00296A6C  90 01 00 24 */	stw r0, 0x24(r1)
/* 802CD4B0 00296A70  38 00 00 00 */	li r0, 0
/* 802CD4B4 00296A74  BF 41 00 08 */	stmw r26, 8(r1)
/* 802CD4B8 00296A78  7C 7A 1B 78 */	mr r26, r3
/* 802CD4BC 00296A7C  7C 9B 23 78 */	mr r27, r4
/* 802CD4C0 00296A80  3B C0 03 00 */	li r30, 0x300
/* 802CD4C4 00296A84  3B A0 00 00 */	li r29, 0
/* 802CD4C8 00296A88  3B E0 00 01 */	li r31, 1
/* 802CD4CC 00296A8C  90 04 00 00 */	stw r0, 0(r4)
/* 802CD4D0 00296A90  48 00 00 3C */	b lbl_802CD50C
lbl_802CD4D4:
/* 802CD4D4 00296A94  7F A3 EB 78 */	mr r3, r29
/* 802CD4D8 00296A98  48 00 00 69 */	bl TRKGetBuffer
/* 802CD4DC 00296A9C  80 03 00 00 */	lwz r0, 0(r3)
/* 802CD4E0 00296AA0  7C 7C 1B 78 */	mr r28, r3
/* 802CD4E4 00296AA4  2C 00 00 00 */	cmpwi r0, 0
/* 802CD4E8 00296AA8  40 82 00 20 */	bne lbl_802CD508
/* 802CD4EC 00296AAC  38 80 00 01 */	li r4, 1
/* 802CD4F0 00296AB0  48 00 00 9D */	bl func_802CD58C
/* 802CD4F4 00296AB4  93 FC 00 00 */	stw r31, 0(r28)
/* 802CD4F8 00296AB8  3B C0 00 00 */	li r30, 0
/* 802CD4FC 00296ABC  93 9B 00 00 */	stw r28, 0(r27)
/* 802CD500 00296AC0  93 BA 00 00 */	stw r29, 0(r26)
/* 802CD504 00296AC4  3B A0 00 03 */	li r29, 3
lbl_802CD508:
/* 802CD508 00296AC8  3B BD 00 01 */	addi r29, r29, 1
lbl_802CD50C:
/* 802CD50C 00296ACC  2C 1D 00 03 */	cmpwi r29, 3
/* 802CD510 00296AD0  41 80 FF C4 */	blt lbl_802CD4D4
/* 802CD514 00296AD4  2C 1E 03 00 */	cmpwi r30, 0x300
/* 802CD518 00296AD8  40 82 00 10 */	bne lbl_802CD528
/* 802CD51C 00296ADC  3C 60 80 54 */	lis r3, lbl_8053FF18@ha
/* 802CD520 00296AE0  38 63 FF 18 */	addi r3, r3, lbl_8053FF18@l
/* 802CD524 00296AE4  48 08 79 CD */	bl OSReport
lbl_802CD528:
/* 802CD528 00296AE8  7F C3 F3 78 */	mr r3, r30
/* 802CD52C 00296AEC  BB 41 00 08 */	lmw r26, 8(r1)
/* 802CD530 00296AF0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802CD534 00296AF4  7C 08 03 A6 */	mtlr r0
/* 802CD538 00296AF8  38 21 00 20 */	addi r1, r1, 0x20
/* 802CD53C 00296AFC  4E 80 00 20 */	blr 

.global TRKGetBuffer
TRKGetBuffer:
/* 802CD540 00296B00  28 03 00 02 */	cmplwi r3, 2
/* 802CD544 00296B04  38 00 00 00 */	li r0, 0
/* 802CD548 00296B08  41 81 00 14 */	bgt lbl_802CD55C
/* 802CD54C 00296B0C  1C 03 08 8C */	mulli r0, r3, 0x88c
/* 802CD550 00296B10  3C 60 80 58 */	lis r3, lbl_8057B8D8@ha
/* 802CD554 00296B14  38 63 B8 D8 */	addi r3, r3, lbl_8057B8D8@l
/* 802CD558 00296B18  7C 03 02 14 */	add r0, r3, r0
lbl_802CD55C:
/* 802CD55C 00296B1C  7C 03 03 78 */	mr r3, r0
/* 802CD560 00296B20  4E 80 00 20 */	blr 

.global TRKReleaseBuffer
TRKReleaseBuffer:
/* 802CD564 00296B24  2C 03 FF FF */	cmpwi r3, -1
/* 802CD568 00296B28  4D 82 00 20 */	beqlr 
/* 802CD56C 00296B2C  28 03 00 02 */	cmplwi r3, 2
/* 802CD570 00296B30  4D 81 00 20 */	bgtlr 
/* 802CD574 00296B34  1C 03 08 8C */	mulli r0, r3, 0x88c
/* 802CD578 00296B38  3C 60 80 58 */	lis r3, lbl_8057B8D8@ha
/* 802CD57C 00296B3C  38 80 00 00 */	li r4, 0
/* 802CD580 00296B40  38 63 B8 D8 */	addi r3, r3, lbl_8057B8D8@l
/* 802CD584 00296B44  7C 83 01 2E */	stwx r4, r3, r0
/* 802CD588 00296B48  4E 80 00 20 */	blr 

.global func_802CD58C
func_802CD58C:
/* 802CD58C 00296B4C  2C 04 00 00 */	cmpwi r4, 0
/* 802CD590 00296B50  38 00 00 00 */	li r0, 0
/* 802CD594 00296B54  90 03 00 04 */	stw r0, 4(r3)
/* 802CD598 00296B58  90 03 00 08 */	stw r0, 8(r3)
/* 802CD59C 00296B5C  4C 82 00 20 */	bnelr 
/* 802CD5A0 00296B60  38 80 00 00 */	li r4, 0
/* 802CD5A4 00296B64  38 A0 08 80 */	li r5, 0x880
/* 802CD5A8 00296B68  38 63 00 0C */	addi r3, r3, 0xc
/* 802CD5AC 00296B6C  4B FF E7 0C */	b TRK_memset
/* 802CD5B0 00296B70  4E 80 00 20 */	blr 

.global TRKSetBufferPosition
TRKSetBufferPosition:
/* 802CD5B4 00296B74  28 04 08 80 */	cmplwi r4, 0x880
/* 802CD5B8 00296B78  38 A0 00 00 */	li r5, 0
/* 802CD5BC 00296B7C  40 81 00 0C */	ble lbl_802CD5C8
/* 802CD5C0 00296B80  38 A0 03 01 */	li r5, 0x301
/* 802CD5C4 00296B84  48 00 00 18 */	b lbl_802CD5DC
lbl_802CD5C8:
/* 802CD5C8 00296B88  80 03 00 04 */	lwz r0, 4(r3)
/* 802CD5CC 00296B8C  90 83 00 08 */	stw r4, 8(r3)
/* 802CD5D0 00296B90  7C 04 00 40 */	cmplw r4, r0
/* 802CD5D4 00296B94  40 81 00 08 */	ble lbl_802CD5DC
/* 802CD5D8 00296B98  90 83 00 04 */	stw r4, 4(r3)
lbl_802CD5DC:
/* 802CD5DC 00296B9C  7C A3 2B 78 */	mr r3, r5
/* 802CD5E0 00296BA0  4E 80 00 20 */	blr 

.global func_802CD5E4
func_802CD5E4:
/* 802CD5E4 00296BA4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802CD5E8 00296BA8  7C 08 02 A6 */	mflr r0
/* 802CD5EC 00296BAC  2C 05 00 00 */	cmpwi r5, 0
/* 802CD5F0 00296BB0  90 01 00 24 */	stw r0, 0x24(r1)
/* 802CD5F4 00296BB4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 802CD5F8 00296BB8  3B E0 00 00 */	li r31, 0
/* 802CD5FC 00296BBC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 802CD600 00296BC0  7C BE 2B 78 */	mr r30, r5
/* 802CD604 00296BC4  93 A1 00 14 */	stw r29, 0x14(r1)
/* 802CD608 00296BC8  7C 7D 1B 78 */	mr r29, r3
/* 802CD60C 00296BCC  40 82 00 0C */	bne lbl_802CD618
/* 802CD610 00296BD0  38 60 00 00 */	li r3, 0
/* 802CD614 00296BD4  48 00 00 58 */	b lbl_802CD66C
lbl_802CD618:
/* 802CD618 00296BD8  80 03 00 08 */	lwz r0, 8(r3)
/* 802CD61C 00296BDC  20 C0 08 80 */	subfic r6, r0, 0x880
/* 802CD620 00296BE0  7C 06 28 40 */	cmplw r6, r5
/* 802CD624 00296BE4  40 80 00 0C */	bge lbl_802CD630
/* 802CD628 00296BE8  3B E0 03 01 */	li r31, 0x301
/* 802CD62C 00296BEC  7C DE 33 78 */	mr r30, r6
lbl_802CD630:
/* 802CD630 00296BF0  28 1E 00 01 */	cmplwi r30, 1
/* 802CD634 00296BF4  40 82 00 14 */	bne lbl_802CD648
/* 802CD638 00296BF8  7C 63 02 14 */	add r3, r3, r0
/* 802CD63C 00296BFC  88 04 00 00 */	lbz r0, 0(r4)
/* 802CD640 00296C00  98 03 00 0C */	stb r0, 0xc(r3)
/* 802CD644 00296C04  48 00 00 14 */	b lbl_802CD658
lbl_802CD648:
/* 802CD648 00296C08  7C 63 02 14 */	add r3, r3, r0
/* 802CD64C 00296C0C  7F C5 F3 78 */	mr r5, r30
/* 802CD650 00296C10  38 63 00 0C */	addi r3, r3, 0xc
/* 802CD654 00296C14  4B FF E5 29 */	bl TRK_memcpy
lbl_802CD658:
/* 802CD658 00296C18  80 1D 00 08 */	lwz r0, 8(r29)
/* 802CD65C 00296C1C  7F E3 FB 78 */	mr r3, r31
/* 802CD660 00296C20  7C 00 F2 14 */	add r0, r0, r30
/* 802CD664 00296C24  90 1D 00 08 */	stw r0, 8(r29)
/* 802CD668 00296C28  90 1D 00 04 */	stw r0, 4(r29)
lbl_802CD66C:
/* 802CD66C 00296C2C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802CD670 00296C30  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 802CD674 00296C34  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802CD678 00296C38  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802CD67C 00296C3C  7C 08 03 A6 */	mtlr r0
/* 802CD680 00296C40  38 21 00 20 */	addi r1, r1, 0x20
/* 802CD684 00296C44  4E 80 00 20 */	blr 

.global func_802CD688
func_802CD688:
/* 802CD688 00296C48  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802CD68C 00296C4C  7C 08 02 A6 */	mflr r0
/* 802CD690 00296C50  2C 05 00 00 */	cmpwi r5, 0
/* 802CD694 00296C54  90 01 00 24 */	stw r0, 0x24(r1)
/* 802CD698 00296C58  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 802CD69C 00296C5C  3B E0 00 00 */	li r31, 0
/* 802CD6A0 00296C60  93 C1 00 18 */	stw r30, 0x18(r1)
/* 802CD6A4 00296C64  7C BE 2B 78 */	mr r30, r5
/* 802CD6A8 00296C68  93 A1 00 14 */	stw r29, 0x14(r1)
/* 802CD6AC 00296C6C  7C 7D 1B 78 */	mr r29, r3
/* 802CD6B0 00296C70  40 82 00 0C */	bne lbl_802CD6BC
/* 802CD6B4 00296C74  38 60 00 00 */	li r3, 0
/* 802CD6B8 00296C78  48 00 00 44 */	b lbl_802CD6FC
lbl_802CD6BC:
/* 802CD6BC 00296C7C  80 C3 00 08 */	lwz r6, 8(r3)
/* 802CD6C0 00296C80  80 03 00 04 */	lwz r0, 4(r3)
/* 802CD6C4 00296C84  7C 06 00 50 */	subf r0, r6, r0
/* 802CD6C8 00296C88  7C 05 00 40 */	cmplw r5, r0
/* 802CD6CC 00296C8C  40 81 00 0C */	ble lbl_802CD6D8
/* 802CD6D0 00296C90  3B E0 03 02 */	li r31, 0x302
/* 802CD6D4 00296C94  7C 1E 03 78 */	mr r30, r0
lbl_802CD6D8:
/* 802CD6D8 00296C98  7C DD 32 14 */	add r6, r29, r6
/* 802CD6DC 00296C9C  7C 83 23 78 */	mr r3, r4
/* 802CD6E0 00296CA0  7F C5 F3 78 */	mr r5, r30
/* 802CD6E4 00296CA4  38 86 00 0C */	addi r4, r6, 0xc
/* 802CD6E8 00296CA8  4B FF E4 95 */	bl TRK_memcpy
/* 802CD6EC 00296CAC  80 1D 00 08 */	lwz r0, 8(r29)
/* 802CD6F0 00296CB0  7F E3 FB 78 */	mr r3, r31
/* 802CD6F4 00296CB4  7C 00 F2 14 */	add r0, r0, r30
/* 802CD6F8 00296CB8  90 1D 00 08 */	stw r0, 8(r29)
lbl_802CD6FC:
/* 802CD6FC 00296CBC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802CD700 00296CC0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 802CD704 00296CC4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802CD708 00296CC8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802CD70C 00296CCC  7C 08 03 A6 */	mtlr r0
/* 802CD710 00296CD0  38 21 00 20 */	addi r1, r1, 0x20
/* 802CD714 00296CD4  4E 80 00 20 */	blr 

.global func_802CD718
func_802CD718:
/* 802CD718 00296CD8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802CD71C 00296CDC  7C 08 02 A6 */	mflr r0
/* 802CD720 00296CE0  90 01 00 24 */	stw r0, 0x24(r1)
/* 802CD724 00296CE4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 802CD728 00296CE8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 802CD72C 00296CEC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 802CD730 00296CF0  7C 7D 1B 78 */	mr r29, r3
/* 802CD734 00296CF4  80 0D B4 00 */	lwz r0, lbl_80667580@sda21(r13)
/* 802CD738 00296CF8  90 81 00 08 */	stw r4, 8(r1)
/* 802CD73C 00296CFC  2C 00 00 00 */	cmpwi r0, 0
/* 802CD740 00296D00  41 82 00 0C */	beq lbl_802CD74C
/* 802CD744 00296D04  38 81 00 08 */	addi r4, r1, 8
/* 802CD748 00296D08  48 00 00 28 */	b lbl_802CD770
lbl_802CD74C:
/* 802CD74C 00296D0C  88 E1 00 0B */	lbz r7, 0xb(r1)
/* 802CD750 00296D10  38 81 00 0C */	addi r4, r1, 0xc
/* 802CD754 00296D14  88 C1 00 0A */	lbz r6, 0xa(r1)
/* 802CD758 00296D18  88 A1 00 09 */	lbz r5, 9(r1)
/* 802CD75C 00296D1C  88 01 00 08 */	lbz r0, 8(r1)
/* 802CD760 00296D20  98 E1 00 0C */	stb r7, 0xc(r1)
/* 802CD764 00296D24  98 C1 00 0D */	stb r6, 0xd(r1)
/* 802CD768 00296D28  98 A1 00 0E */	stb r5, 0xe(r1)
/* 802CD76C 00296D2C  98 01 00 0F */	stb r0, 0xf(r1)
lbl_802CD770:
/* 802CD770 00296D30  80 A3 00 08 */	lwz r5, 8(r3)
/* 802CD774 00296D34  3B E0 00 04 */	li r31, 4
/* 802CD778 00296D38  3B C0 00 00 */	li r30, 0
/* 802CD77C 00296D3C  20 05 08 80 */	subfic r0, r5, 0x880
/* 802CD780 00296D40  28 00 00 04 */	cmplwi r0, 4
/* 802CD784 00296D44  40 80 00 0C */	bge lbl_802CD790
/* 802CD788 00296D48  3B C0 03 01 */	li r30, 0x301
/* 802CD78C 00296D4C  7C 1F 03 78 */	mr r31, r0
lbl_802CD790:
/* 802CD790 00296D50  28 1F 00 01 */	cmplwi r31, 1
/* 802CD794 00296D54  40 82 00 14 */	bne lbl_802CD7A8
/* 802CD798 00296D58  7C 63 2A 14 */	add r3, r3, r5
/* 802CD79C 00296D5C  88 04 00 00 */	lbz r0, 0(r4)
/* 802CD7A0 00296D60  98 03 00 0C */	stb r0, 0xc(r3)
/* 802CD7A4 00296D64  48 00 00 14 */	b lbl_802CD7B8
lbl_802CD7A8:
/* 802CD7A8 00296D68  7C 63 2A 14 */	add r3, r3, r5
/* 802CD7AC 00296D6C  7F E5 FB 78 */	mr r5, r31
/* 802CD7B0 00296D70  38 63 00 0C */	addi r3, r3, 0xc
/* 802CD7B4 00296D74  4B FF E3 C9 */	bl TRK_memcpy
lbl_802CD7B8:
/* 802CD7B8 00296D78  80 1D 00 08 */	lwz r0, 8(r29)
/* 802CD7BC 00296D7C  7F C3 F3 78 */	mr r3, r30
/* 802CD7C0 00296D80  7C 00 FA 14 */	add r0, r0, r31
/* 802CD7C4 00296D84  90 1D 00 08 */	stw r0, 8(r29)
/* 802CD7C8 00296D88  90 1D 00 04 */	stw r0, 4(r29)
/* 802CD7CC 00296D8C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 802CD7D0 00296D90  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802CD7D4 00296D94  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802CD7D8 00296D98  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802CD7DC 00296D9C  7C 08 03 A6 */	mtlr r0
/* 802CD7E0 00296DA0  38 21 00 20 */	addi r1, r1, 0x20
/* 802CD7E4 00296DA4  4E 80 00 20 */	blr 

.global func_802CD7E8
func_802CD7E8:
/* 802CD7E8 00296DA8  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 802CD7EC 00296DAC  7C 08 02 A6 */	mflr r0
/* 802CD7F0 00296DB0  90 01 00 34 */	stw r0, 0x34(r1)
/* 802CD7F4 00296DB4  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 802CD7F8 00296DB8  7C 7F 1B 78 */	mr r31, r3
/* 802CD7FC 00296DBC  93 C1 00 28 */	stw r30, 0x28(r1)
/* 802CD800 00296DC0  93 A1 00 24 */	stw r29, 0x24(r1)
/* 802CD804 00296DC4  80 0D B4 00 */	lwz r0, lbl_80667580@sda21(r13)
/* 802CD808 00296DC8  90 A1 00 08 */	stw r5, 8(r1)
/* 802CD80C 00296DCC  2C 00 00 00 */	cmpwi r0, 0
/* 802CD810 00296DD0  90 C1 00 0C */	stw r6, 0xc(r1)
/* 802CD814 00296DD4  41 82 00 0C */	beq lbl_802CD820
/* 802CD818 00296DD8  38 81 00 08 */	addi r4, r1, 8
/* 802CD81C 00296DDC  48 00 00 48 */	b lbl_802CD864
lbl_802CD820:
/* 802CD820 00296DE0  89 61 00 0F */	lbz r11, 0xf(r1)
/* 802CD824 00296DE4  38 81 00 10 */	addi r4, r1, 0x10
/* 802CD828 00296DE8  89 41 00 0E */	lbz r10, 0xe(r1)
/* 802CD82C 00296DEC  89 21 00 0D */	lbz r9, 0xd(r1)
/* 802CD830 00296DF0  89 01 00 0C */	lbz r8, 0xc(r1)
/* 802CD834 00296DF4  88 E1 00 0B */	lbz r7, 0xb(r1)
/* 802CD838 00296DF8  88 C1 00 0A */	lbz r6, 0xa(r1)
/* 802CD83C 00296DFC  88 A1 00 09 */	lbz r5, 9(r1)
/* 802CD840 00296E00  88 01 00 08 */	lbz r0, 8(r1)
/* 802CD844 00296E04  99 61 00 10 */	stb r11, 0x10(r1)
/* 802CD848 00296E08  99 41 00 11 */	stb r10, 0x11(r1)
/* 802CD84C 00296E0C  99 21 00 12 */	stb r9, 0x12(r1)
/* 802CD850 00296E10  99 01 00 13 */	stb r8, 0x13(r1)
/* 802CD854 00296E14  98 E1 00 14 */	stb r7, 0x14(r1)
/* 802CD858 00296E18  98 C1 00 15 */	stb r6, 0x15(r1)
/* 802CD85C 00296E1C  98 A1 00 16 */	stb r5, 0x16(r1)
/* 802CD860 00296E20  98 01 00 17 */	stb r0, 0x17(r1)
lbl_802CD864:
/* 802CD864 00296E24  80 A3 00 08 */	lwz r5, 8(r3)
/* 802CD868 00296E28  3B C0 00 08 */	li r30, 8
/* 802CD86C 00296E2C  3B A0 00 00 */	li r29, 0
/* 802CD870 00296E30  20 05 08 80 */	subfic r0, r5, 0x880
/* 802CD874 00296E34  28 00 00 08 */	cmplwi r0, 8
/* 802CD878 00296E38  40 80 00 0C */	bge lbl_802CD884
/* 802CD87C 00296E3C  3B A0 03 01 */	li r29, 0x301
/* 802CD880 00296E40  7C 1E 03 78 */	mr r30, r0
lbl_802CD884:
/* 802CD884 00296E44  28 1E 00 01 */	cmplwi r30, 1
/* 802CD888 00296E48  40 82 00 14 */	bne lbl_802CD89C
/* 802CD88C 00296E4C  7C 63 2A 14 */	add r3, r3, r5
/* 802CD890 00296E50  88 04 00 00 */	lbz r0, 0(r4)
/* 802CD894 00296E54  98 03 00 0C */	stb r0, 0xc(r3)
/* 802CD898 00296E58  48 00 00 14 */	b lbl_802CD8AC
lbl_802CD89C:
/* 802CD89C 00296E5C  7C 63 2A 14 */	add r3, r3, r5
/* 802CD8A0 00296E60  7F C5 F3 78 */	mr r5, r30
/* 802CD8A4 00296E64  38 63 00 0C */	addi r3, r3, 0xc
/* 802CD8A8 00296E68  4B FF E2 D5 */	bl TRK_memcpy
lbl_802CD8AC:
/* 802CD8AC 00296E6C  80 1F 00 08 */	lwz r0, 8(r31)
/* 802CD8B0 00296E70  7F A3 EB 78 */	mr r3, r29
/* 802CD8B4 00296E74  7C 00 F2 14 */	add r0, r0, r30
/* 802CD8B8 00296E78  90 1F 00 08 */	stw r0, 8(r31)
/* 802CD8BC 00296E7C  90 1F 00 04 */	stw r0, 4(r31)
/* 802CD8C0 00296E80  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 802CD8C4 00296E84  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 802CD8C8 00296E88  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 802CD8CC 00296E8C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 802CD8D0 00296E90  7C 08 03 A6 */	mtlr r0
/* 802CD8D4 00296E94  38 21 00 30 */	addi r1, r1, 0x30
/* 802CD8D8 00296E98  4E 80 00 20 */	blr 

.global TRKAppendBuffer_ui8
TRKAppendBuffer_ui8:
/* 802CD8DC 00296E9C  39 20 00 00 */	li r9, 0
/* 802CD8E0 00296EA0  38 E0 00 00 */	li r7, 0
/* 802CD8E4 00296EA4  48 00 00 44 */	b lbl_802CD928
lbl_802CD8E8:
/* 802CD8E8 00296EA8  80 E3 00 08 */	lwz r7, 8(r3)
/* 802CD8EC 00296EAC  89 04 00 00 */	lbz r8, 0(r4)
/* 802CD8F0 00296EB0  28 07 08 80 */	cmplwi r7, 0x880
/* 802CD8F4 00296EB4  41 80 00 0C */	blt lbl_802CD900
/* 802CD8F8 00296EB8  38 E0 03 01 */	li r7, 0x301
/* 802CD8FC 00296EBC  48 00 00 24 */	b lbl_802CD920
lbl_802CD900:
/* 802CD900 00296EC0  7C C3 3A 14 */	add r6, r3, r7
/* 802CD904 00296EC4  38 07 00 01 */	addi r0, r7, 1
/* 802CD908 00296EC8  99 06 00 0C */	stb r8, 0xc(r6)
/* 802CD90C 00296ECC  38 E0 00 00 */	li r7, 0
/* 802CD910 00296ED0  80 C3 00 04 */	lwz r6, 4(r3)
/* 802CD914 00296ED4  90 03 00 08 */	stw r0, 8(r3)
/* 802CD918 00296ED8  38 06 00 01 */	addi r0, r6, 1
/* 802CD91C 00296EDC  90 03 00 04 */	stw r0, 4(r3)
lbl_802CD920:
/* 802CD920 00296EE0  39 29 00 01 */	addi r9, r9, 1
/* 802CD924 00296EE4  38 84 00 01 */	addi r4, r4, 1
lbl_802CD928:
/* 802CD928 00296EE8  2C 07 00 00 */	cmpwi r7, 0
/* 802CD92C 00296EEC  40 82 00 0C */	bne lbl_802CD938
/* 802CD930 00296EF0  7C 09 28 00 */	cmpw r9, r5
/* 802CD934 00296EF4  41 80 FF B4 */	blt lbl_802CD8E8
lbl_802CD938:
/* 802CD938 00296EF8  7C E3 3B 78 */	mr r3, r7
/* 802CD93C 00296EFC  4E 80 00 20 */	blr 

.global func_802CD940
func_802CD940:
/* 802CD940 00296F00  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 802CD944 00296F04  7C 08 02 A6 */	mflr r0
/* 802CD948 00296F08  90 01 00 34 */	stw r0, 0x34(r1)
/* 802CD94C 00296F0C  BF 41 00 18 */	stmw r26, 0x18(r1)
/* 802CD950 00296F10  7C 7D 1B 78 */	mr r29, r3
/* 802CD954 00296F14  7C 9B 23 78 */	mr r27, r4
/* 802CD958 00296F18  7C BE 2B 78 */	mr r30, r5
/* 802CD95C 00296F1C  3B E0 00 00 */	li r31, 0
/* 802CD960 00296F20  3B 40 00 00 */	li r26, 0
/* 802CD964 00296F24  48 00 00 A4 */	b lbl_802CDA08
lbl_802CD968:
/* 802CD968 00296F28  80 0D B4 00 */	lwz r0, lbl_80667580@sda21(r13)
/* 802CD96C 00296F2C  80 7B 00 00 */	lwz r3, 0(r27)
/* 802CD970 00296F30  2C 00 00 00 */	cmpwi r0, 0
/* 802CD974 00296F34  90 61 00 0C */	stw r3, 0xc(r1)
/* 802CD978 00296F38  41 82 00 0C */	beq lbl_802CD984
/* 802CD97C 00296F3C  38 81 00 0C */	addi r4, r1, 0xc
/* 802CD980 00296F40  48 00 00 28 */	b lbl_802CD9A8
lbl_802CD984:
/* 802CD984 00296F44  88 C1 00 0F */	lbz r6, 0xf(r1)
/* 802CD988 00296F48  38 81 00 08 */	addi r4, r1, 8
/* 802CD98C 00296F4C  88 A1 00 0E */	lbz r5, 0xe(r1)
/* 802CD990 00296F50  88 61 00 0D */	lbz r3, 0xd(r1)
/* 802CD994 00296F54  88 01 00 0C */	lbz r0, 0xc(r1)
/* 802CD998 00296F58  98 C1 00 08 */	stb r6, 8(r1)
/* 802CD99C 00296F5C  98 A1 00 09 */	stb r5, 9(r1)
/* 802CD9A0 00296F60  98 61 00 0A */	stb r3, 0xa(r1)
/* 802CD9A4 00296F64  98 01 00 0B */	stb r0, 0xb(r1)
lbl_802CD9A8:
/* 802CD9A8 00296F68  80 7D 00 08 */	lwz r3, 8(r29)
/* 802CD9AC 00296F6C  3B 80 00 04 */	li r28, 4
/* 802CD9B0 00296F70  3B 40 00 00 */	li r26, 0
/* 802CD9B4 00296F74  20 03 08 80 */	subfic r0, r3, 0x880
/* 802CD9B8 00296F78  28 00 00 04 */	cmplwi r0, 4
/* 802CD9BC 00296F7C  40 80 00 0C */	bge lbl_802CD9C8
/* 802CD9C0 00296F80  3B 40 03 01 */	li r26, 0x301
/* 802CD9C4 00296F84  7C 1C 03 78 */	mr r28, r0
lbl_802CD9C8:
/* 802CD9C8 00296F88  28 1C 00 01 */	cmplwi r28, 1
/* 802CD9CC 00296F8C  40 82 00 14 */	bne lbl_802CD9E0
/* 802CD9D0 00296F90  7C 7D 1A 14 */	add r3, r29, r3
/* 802CD9D4 00296F94  88 04 00 00 */	lbz r0, 0(r4)
/* 802CD9D8 00296F98  98 03 00 0C */	stb r0, 0xc(r3)
/* 802CD9DC 00296F9C  48 00 00 14 */	b lbl_802CD9F0
lbl_802CD9E0:
/* 802CD9E0 00296FA0  7C 7D 1A 14 */	add r3, r29, r3
/* 802CD9E4 00296FA4  7F 85 E3 78 */	mr r5, r28
/* 802CD9E8 00296FA8  38 63 00 0C */	addi r3, r3, 0xc
/* 802CD9EC 00296FAC  4B FF E1 91 */	bl TRK_memcpy
lbl_802CD9F0:
/* 802CD9F0 00296FB0  80 1D 00 08 */	lwz r0, 8(r29)
/* 802CD9F4 00296FB4  3B 7B 00 04 */	addi r27, r27, 4
/* 802CD9F8 00296FB8  3B FF 00 01 */	addi r31, r31, 1
/* 802CD9FC 00296FBC  7C 00 E2 14 */	add r0, r0, r28
/* 802CDA00 00296FC0  90 1D 00 08 */	stw r0, 8(r29)
/* 802CDA04 00296FC4  90 1D 00 04 */	stw r0, 4(r29)
lbl_802CDA08:
/* 802CDA08 00296FC8  2C 1A 00 00 */	cmpwi r26, 0
/* 802CDA0C 00296FCC  40 82 00 0C */	bne lbl_802CDA18
/* 802CDA10 00296FD0  7C 1F F0 00 */	cmpw r31, r30
/* 802CDA14 00296FD4  41 80 FF 54 */	blt lbl_802CD968
lbl_802CDA18:
/* 802CDA18 00296FD8  7F 43 D3 78 */	mr r3, r26
/* 802CDA1C 00296FDC  BB 41 00 18 */	lmw r26, 0x18(r1)
/* 802CDA20 00296FE0  80 01 00 34 */	lwz r0, 0x34(r1)
/* 802CDA24 00296FE4  7C 08 03 A6 */	mtlr r0
/* 802CDA28 00296FE8  38 21 00 30 */	addi r1, r1, 0x30
/* 802CDA2C 00296FEC  4E 80 00 20 */	blr 

.global func_802CDA30
func_802CDA30:
/* 802CDA30 00296FF0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 802CDA34 00296FF4  7C 08 02 A6 */	mflr r0
/* 802CDA38 00296FF8  90 01 00 34 */	stw r0, 0x34(r1)
/* 802CDA3C 00296FFC  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 802CDA40 00297000  7C 7B 1B 78 */	mr r27, r3
/* 802CDA44 00297004  7C 9D 23 78 */	mr r29, r4
/* 802CDA48 00297008  80 0D B4 00 */	lwz r0, lbl_80667580@sda21(r13)
/* 802CDA4C 0029700C  2C 00 00 00 */	cmpwi r0, 0
/* 802CDA50 00297010  41 82 00 0C */	beq lbl_802CDA5C
/* 802CDA54 00297014  7F BE EB 78 */	mr r30, r29
/* 802CDA58 00297018  48 00 00 08 */	b lbl_802CDA60
lbl_802CDA5C:
/* 802CDA5C 0029701C  3B C1 00 08 */	addi r30, r1, 8
lbl_802CDA60:
/* 802CDA60 00297020  80 83 00 08 */	lwz r4, 8(r3)
/* 802CDA64 00297024  3B 80 00 08 */	li r28, 8
/* 802CDA68 00297028  80 03 00 04 */	lwz r0, 4(r3)
/* 802CDA6C 0029702C  3B E0 00 00 */	li r31, 0
/* 802CDA70 00297030  7C 04 00 50 */	subf r0, r4, r0
/* 802CDA74 00297034  28 00 00 08 */	cmplwi r0, 8
/* 802CDA78 00297038  40 80 00 0C */	bge lbl_802CDA84
/* 802CDA7C 0029703C  3B E0 03 02 */	li r31, 0x302
/* 802CDA80 00297040  7C 1C 03 78 */	mr r28, r0
lbl_802CDA84:
/* 802CDA84 00297044  7C 9B 22 14 */	add r4, r27, r4
/* 802CDA88 00297048  7F C3 F3 78 */	mr r3, r30
/* 802CDA8C 0029704C  7F 85 E3 78 */	mr r5, r28
/* 802CDA90 00297050  38 84 00 0C */	addi r4, r4, 0xc
/* 802CDA94 00297054  4B FF E0 E9 */	bl TRK_memcpy
/* 802CDA98 00297058  80 1B 00 08 */	lwz r0, 8(r27)
/* 802CDA9C 0029705C  7C 00 E2 14 */	add r0, r0, r28
/* 802CDAA0 00297060  90 1B 00 08 */	stw r0, 8(r27)
/* 802CDAA4 00297064  80 0D B4 00 */	lwz r0, lbl_80667580@sda21(r13)
/* 802CDAA8 00297068  2C 00 00 00 */	cmpwi r0, 0
/* 802CDAAC 0029706C  40 82 00 4C */	bne lbl_802CDAF8
/* 802CDAB0 00297070  2C 1F 00 00 */	cmpwi r31, 0
/* 802CDAB4 00297074  40 82 00 44 */	bne lbl_802CDAF8
/* 802CDAB8 00297078  88 1E 00 07 */	lbz r0, 7(r30)
/* 802CDABC 0029707C  98 1D 00 00 */	stb r0, 0(r29)
/* 802CDAC0 00297080  88 1E 00 06 */	lbz r0, 6(r30)
/* 802CDAC4 00297084  98 1D 00 01 */	stb r0, 1(r29)
/* 802CDAC8 00297088  88 1E 00 05 */	lbz r0, 5(r30)
/* 802CDACC 0029708C  98 1D 00 02 */	stb r0, 2(r29)
/* 802CDAD0 00297090  88 1E 00 04 */	lbz r0, 4(r30)
/* 802CDAD4 00297094  98 1D 00 03 */	stb r0, 3(r29)
/* 802CDAD8 00297098  88 1E 00 03 */	lbz r0, 3(r30)
/* 802CDADC 0029709C  98 1D 00 04 */	stb r0, 4(r29)
/* 802CDAE0 002970A0  88 1E 00 02 */	lbz r0, 2(r30)
/* 802CDAE4 002970A4  98 1D 00 05 */	stb r0, 5(r29)
/* 802CDAE8 002970A8  88 1E 00 01 */	lbz r0, 1(r30)
/* 802CDAEC 002970AC  98 1D 00 06 */	stb r0, 6(r29)
/* 802CDAF0 002970B0  88 1E 00 00 */	lbz r0, 0(r30)
/* 802CDAF4 002970B4  98 1D 00 07 */	stb r0, 7(r29)
lbl_802CDAF8:
/* 802CDAF8 002970B8  7F E3 FB 78 */	mr r3, r31
/* 802CDAFC 002970BC  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 802CDB00 002970C0  80 01 00 34 */	lwz r0, 0x34(r1)
/* 802CDB04 002970C4  7C 08 03 A6 */	mtlr r0
/* 802CDB08 002970C8  38 21 00 30 */	addi r1, r1, 0x30
/* 802CDB0C 002970CC  4E 80 00 20 */	blr 

.global func_802CDB10
func_802CDB10:
/* 802CDB10 002970D0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802CDB14 002970D4  7C 08 02 A6 */	mflr r0
/* 802CDB18 002970D8  90 01 00 24 */	stw r0, 0x24(r1)
/* 802CDB1C 002970DC  BF 41 00 08 */	stmw r26, 8(r1)
/* 802CDB20 002970E0  7C 7A 1B 78 */	mr r26, r3
/* 802CDB24 002970E4  7C 9B 23 78 */	mr r27, r4
/* 802CDB28 002970E8  7C BC 2B 78 */	mr r28, r5
/* 802CDB2C 002970EC  3B A0 00 00 */	li r29, 0
/* 802CDB30 002970F0  3B C0 00 00 */	li r30, 0
/* 802CDB34 002970F4  48 00 00 4C */	b lbl_802CDB80
lbl_802CDB38:
/* 802CDB38 002970F8  80 7A 00 08 */	lwz r3, 8(r26)
/* 802CDB3C 002970FC  3B E0 00 01 */	li r31, 1
/* 802CDB40 00297100  80 1A 00 04 */	lwz r0, 4(r26)
/* 802CDB44 00297104  3B C0 00 00 */	li r30, 0
/* 802CDB48 00297108  7C 03 00 50 */	subf r0, r3, r0
/* 802CDB4C 0029710C  28 00 00 01 */	cmplwi r0, 1
/* 802CDB50 00297110  40 80 00 0C */	bge lbl_802CDB5C
/* 802CDB54 00297114  3B C0 03 02 */	li r30, 0x302
/* 802CDB58 00297118  7C 1F 03 78 */	mr r31, r0
lbl_802CDB5C:
/* 802CDB5C 0029711C  7C 9A 1A 14 */	add r4, r26, r3
/* 802CDB60 00297120  7F E5 FB 78 */	mr r5, r31
/* 802CDB64 00297124  7C 7B EA 14 */	add r3, r27, r29
/* 802CDB68 00297128  38 84 00 0C */	addi r4, r4, 0xc
/* 802CDB6C 0029712C  4B FF E0 11 */	bl TRK_memcpy
/* 802CDB70 00297130  80 1A 00 08 */	lwz r0, 8(r26)
/* 802CDB74 00297134  3B BD 00 01 */	addi r29, r29, 1
/* 802CDB78 00297138  7C 00 FA 14 */	add r0, r0, r31
/* 802CDB7C 0029713C  90 1A 00 08 */	stw r0, 8(r26)
lbl_802CDB80:
/* 802CDB80 00297140  2C 1E 00 00 */	cmpwi r30, 0
/* 802CDB84 00297144  40 82 00 0C */	bne lbl_802CDB90
/* 802CDB88 00297148  7C 1D E0 00 */	cmpw r29, r28
/* 802CDB8C 0029714C  41 80 FF AC */	blt lbl_802CDB38
lbl_802CDB90:
/* 802CDB90 00297150  7F C3 F3 78 */	mr r3, r30
/* 802CDB94 00297154  BB 41 00 08 */	lmw r26, 8(r1)
/* 802CDB98 00297158  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802CDB9C 0029715C  7C 08 03 A6 */	mtlr r0
/* 802CDBA0 00297160  38 21 00 20 */	addi r1, r1, 0x20
/* 802CDBA4 00297164  4E 80 00 20 */	blr 

.global func_802CDBA8
func_802CDBA8:
/* 802CDBA8 00297168  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 802CDBAC 0029716C  7C 08 02 A6 */	mflr r0
/* 802CDBB0 00297170  90 01 00 34 */	stw r0, 0x34(r1)
/* 802CDBB4 00297174  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 802CDBB8 00297178  7C 7B 1B 78 */	mr r27, r3
/* 802CDBBC 0029717C  7C 9F 23 78 */	mr r31, r4
/* 802CDBC0 00297180  7C BC 2B 78 */	mr r28, r5
/* 802CDBC4 00297184  3B A0 00 00 */	li r29, 0
/* 802CDBC8 00297188  3B C0 00 00 */	li r30, 0
/* 802CDBCC 0029718C  48 00 00 9C */	b lbl_802CDC68
lbl_802CDBD0:
/* 802CDBD0 00297190  80 0D B4 00 */	lwz r0, lbl_80667580@sda21(r13)
/* 802CDBD4 00297194  2C 00 00 00 */	cmpwi r0, 0
/* 802CDBD8 00297198  41 82 00 0C */	beq lbl_802CDBE4
/* 802CDBDC 0029719C  7F FA FB 78 */	mr r26, r31
/* 802CDBE0 002971A0  48 00 00 08 */	b lbl_802CDBE8
lbl_802CDBE4:
/* 802CDBE4 002971A4  3B 41 00 08 */	addi r26, r1, 8
lbl_802CDBE8:
/* 802CDBE8 002971A8  80 7B 00 08 */	lwz r3, 8(r27)
/* 802CDBEC 002971AC  3B 20 00 04 */	li r25, 4
/* 802CDBF0 002971B0  80 1B 00 04 */	lwz r0, 4(r27)
/* 802CDBF4 002971B4  3B C0 00 00 */	li r30, 0
/* 802CDBF8 002971B8  7C 03 00 50 */	subf r0, r3, r0
/* 802CDBFC 002971BC  28 00 00 04 */	cmplwi r0, 4
/* 802CDC00 002971C0  40 80 00 0C */	bge lbl_802CDC0C
/* 802CDC04 002971C4  3B C0 03 02 */	li r30, 0x302
/* 802CDC08 002971C8  7C 19 03 78 */	mr r25, r0
lbl_802CDC0C:
/* 802CDC0C 002971CC  7C 9B 1A 14 */	add r4, r27, r3
/* 802CDC10 002971D0  7F 43 D3 78 */	mr r3, r26
/* 802CDC14 002971D4  7F 25 CB 78 */	mr r5, r25
/* 802CDC18 002971D8  38 84 00 0C */	addi r4, r4, 0xc
/* 802CDC1C 002971DC  4B FF DF 61 */	bl TRK_memcpy
/* 802CDC20 002971E0  80 1B 00 08 */	lwz r0, 8(r27)
/* 802CDC24 002971E4  7C 00 CA 14 */	add r0, r0, r25
/* 802CDC28 002971E8  90 1B 00 08 */	stw r0, 8(r27)
/* 802CDC2C 002971EC  80 0D B4 00 */	lwz r0, lbl_80667580@sda21(r13)
/* 802CDC30 002971F0  2C 00 00 00 */	cmpwi r0, 0
/* 802CDC34 002971F4  40 82 00 2C */	bne lbl_802CDC60
/* 802CDC38 002971F8  2C 1E 00 00 */	cmpwi r30, 0
/* 802CDC3C 002971FC  40 82 00 24 */	bne lbl_802CDC60
/* 802CDC40 00297200  88 1A 00 03 */	lbz r0, 3(r26)
/* 802CDC44 00297204  98 1F 00 00 */	stb r0, 0(r31)
/* 802CDC48 00297208  88 1A 00 02 */	lbz r0, 2(r26)
/* 802CDC4C 0029720C  98 1F 00 01 */	stb r0, 1(r31)
/* 802CDC50 00297210  88 1A 00 01 */	lbz r0, 1(r26)
/* 802CDC54 00297214  98 1F 00 02 */	stb r0, 2(r31)
/* 802CDC58 00297218  88 1A 00 00 */	lbz r0, 0(r26)
/* 802CDC5C 0029721C  98 1F 00 03 */	stb r0, 3(r31)
lbl_802CDC60:
/* 802CDC60 00297220  3B FF 00 04 */	addi r31, r31, 4
/* 802CDC64 00297224  3B BD 00 01 */	addi r29, r29, 1
lbl_802CDC68:
/* 802CDC68 00297228  2C 1E 00 00 */	cmpwi r30, 0
/* 802CDC6C 0029722C  40 82 00 0C */	bne lbl_802CDC78
/* 802CDC70 00297230  7C 1D E0 00 */	cmpw r29, r28
/* 802CDC74 00297234  41 80 FF 5C */	blt lbl_802CDBD0
lbl_802CDC78:
/* 802CDC78 00297238  7F C3 F3 78 */	mr r3, r30
/* 802CDC7C 0029723C  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 802CDC80 00297240  80 01 00 34 */	lwz r0, 0x34(r1)
/* 802CDC84 00297244  7C 08 03 A6 */	mtlr r0
/* 802CDC88 00297248  38 21 00 30 */	addi r1, r1, 0x30
/* 802CDC8C 0029724C  4E 80 00 20 */	blr