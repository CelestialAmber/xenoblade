.include "macros.inc"

.section .text, "ax"  # 0x80039220 - 0x804F5900

.global func_8030F470
func_8030F470:
/* 8030F470 002D8A30  3C C0 80 5D */	lis r6, lbl_805CC9B0@ha
/* 8030F474 002D8A34  38 C6 C9 B0 */	addi r6, r6, lbl_805CC9B0@l
/* 8030F478 002D8A38  90 C6 00 00 */	stw r6, 0(r6)
/* 8030F47C 002D8A3C  38 A6 00 08 */	addi r5, r6, 8
/* 8030F480 002D8A40  38 86 00 10 */	addi r4, r6, 0x10
/* 8030F484 002D8A44  38 66 00 18 */	addi r3, r6, 0x18
/* 8030F488 002D8A48  90 C6 00 04 */	stw r6, 4(r6)
/* 8030F48C 002D8A4C  90 A5 00 00 */	stw r5, 0(r5)
/* 8030F490 002D8A50  90 A5 00 04 */	stw r5, 4(r5)
/* 8030F494 002D8A54  90 84 00 00 */	stw r4, 0(r4)
/* 8030F498 002D8A58  90 84 00 04 */	stw r4, 4(r4)
/* 8030F49C 002D8A5C  90 63 00 00 */	stw r3, 0(r3)
/* 8030F4A0 002D8A60  90 63 00 04 */	stw r3, 4(r3)
/* 8030F4A4 002D8A64  4E 80 00 20 */	blr 
/* 8030F4A8 002D8A68  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 8030F4AC 002D8A6C  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_8030F4B0
func_8030F4B0:
/* 8030F4B0 002D8A70  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8030F4B4 002D8A74  7C 08 02 A6 */	mflr r0
/* 8030F4B8 002D8A78  90 01 00 14 */	stw r0, 0x14(r1)
/* 8030F4BC 002D8A7C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8030F4C0 002D8A80  7C 9F 23 78 */	mr r31, r4
/* 8030F4C4 002D8A84  93 C1 00 08 */	stw r30, 8(r1)
/* 8030F4C8 002D8A88  7C 7E 1B 78 */	mr r30, r3
/* 8030F4CC 002D8A8C  48 04 94 E5 */	bl OSDisableInterrupts
/* 8030F4D0 002D8A90  3C 80 80 5D */	lis r4, lbl_805CC9B0@ha
/* 8030F4D4 002D8A94  57 C0 18 38 */	slwi r0, r30, 3
/* 8030F4D8 002D8A98  38 84 C9 B0 */	addi r4, r4, lbl_805CC9B0@l
/* 8030F4DC 002D8A9C  7C A4 02 14 */	add r5, r4, r0
/* 8030F4E0 002D8AA0  80 85 00 04 */	lwz r4, 4(r5)
/* 8030F4E4 002D8AA4  93 E4 00 00 */	stw r31, 0(r4)
/* 8030F4E8 002D8AA8  80 05 00 04 */	lwz r0, 4(r5)
/* 8030F4EC 002D8AAC  90 1F 00 04 */	stw r0, 4(r31)
/* 8030F4F0 002D8AB0  90 BF 00 00 */	stw r5, 0(r31)
/* 8030F4F4 002D8AB4  93 E5 00 04 */	stw r31, 4(r5)
/* 8030F4F8 002D8AB8  48 04 94 F9 */	bl OSRestoreInterrupts
/* 8030F4FC 002D8ABC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8030F500 002D8AC0  38 60 00 01 */	li r3, 1
/* 8030F504 002D8AC4  83 C1 00 08 */	lwz r30, 8(r1)
/* 8030F508 002D8AC8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8030F50C 002D8ACC  7C 08 03 A6 */	mtlr r0
/* 8030F510 002D8AD0  38 21 00 10 */	addi r1, r1, 0x10
/* 8030F514 002D8AD4  4E 80 00 20 */	blr 
/* 8030F518 002D8AD8  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 8030F51C 002D8ADC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_8030F520
func_8030F520:
/* 8030F520 002D8AE0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8030F524 002D8AE4  7C 08 02 A6 */	mflr r0
/* 8030F528 002D8AE8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8030F52C 002D8AEC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8030F530 002D8AF0  48 04 94 81 */	bl OSDisableInterrupts
/* 8030F534 002D8AF4  3C 80 80 5D */	lis r4, lbl_805CC9B0@ha
/* 8030F538 002D8AF8  38 00 00 04 */	li r0, 4
/* 8030F53C 002D8AFC  3B E0 00 00 */	li r31, 0
/* 8030F540 002D8B00  38 84 C9 B0 */	addi r4, r4, lbl_805CC9B0@l
/* 8030F544 002D8B04  7C 09 03 A6 */	mtctr r0
lbl_8030F548:
/* 8030F548 002D8B08  80 04 00 00 */	lwz r0, 0(r4)
/* 8030F54C 002D8B0C  7C 00 20 40 */	cmplw r0, r4
/* 8030F550 002D8B10  41 82 00 48 */	beq lbl_8030F598
/* 8030F554 002D8B14  48 04 94 9D */	bl OSRestoreInterrupts
/* 8030F558 002D8B18  48 04 94 59 */	bl OSDisableInterrupts
/* 8030F55C 002D8B1C  3C 80 80 5D */	lis r4, lbl_805CC9B0@ha
/* 8030F560 002D8B20  57 E0 18 38 */	slwi r0, r31, 3
/* 8030F564 002D8B24  38 84 C9 B0 */	addi r4, r4, lbl_805CC9B0@l
/* 8030F568 002D8B28  7F E4 00 2E */	lwzx r31, r4, r0
/* 8030F56C 002D8B2C  7C A4 02 14 */	add r5, r4, r0
/* 8030F570 002D8B30  80 1F 00 00 */	lwz r0, 0(r31)
/* 8030F574 002D8B34  90 05 00 00 */	stw r0, 0(r5)
/* 8030F578 002D8B38  80 9F 00 00 */	lwz r4, 0(r31)
/* 8030F57C 002D8B3C  90 A4 00 04 */	stw r5, 4(r4)
/* 8030F580 002D8B40  48 04 94 71 */	bl OSRestoreInterrupts
/* 8030F584 002D8B44  38 00 00 00 */	li r0, 0
/* 8030F588 002D8B48  90 1F 00 00 */	stw r0, 0(r31)
/* 8030F58C 002D8B4C  7F E3 FB 78 */	mr r3, r31
/* 8030F590 002D8B50  90 1F 00 04 */	stw r0, 4(r31)
/* 8030F594 002D8B54  48 00 00 18 */	b lbl_8030F5AC
lbl_8030F598:
/* 8030F598 002D8B58  38 84 00 08 */	addi r4, r4, 8
/* 8030F59C 002D8B5C  3B FF 00 01 */	addi r31, r31, 1
/* 8030F5A0 002D8B60  42 00 FF A8 */	bdnz lbl_8030F548
/* 8030F5A4 002D8B64  48 04 94 4D */	bl OSRestoreInterrupts
/* 8030F5A8 002D8B68  38 60 00 00 */	li r3, 0
lbl_8030F5AC:
/* 8030F5AC 002D8B6C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8030F5B0 002D8B70  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8030F5B4 002D8B74  7C 08 03 A6 */	mtlr r0
/* 8030F5B8 002D8B78  38 21 00 10 */	addi r1, r1, 0x10
/* 8030F5BC 002D8B7C  4E 80 00 20 */	blr 

.global func_8030F5C0
func_8030F5C0:
/* 8030F5C0 002D8B80  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8030F5C4 002D8B84  7C 08 02 A6 */	mflr r0
/* 8030F5C8 002D8B88  90 01 00 14 */	stw r0, 0x14(r1)
/* 8030F5CC 002D8B8C  48 04 93 E5 */	bl OSDisableInterrupts
/* 8030F5D0 002D8B90  3C 80 80 5D */	lis r4, lbl_805CC9B0@ha
/* 8030F5D4 002D8B94  38 00 00 04 */	li r0, 4
/* 8030F5D8 002D8B98  38 84 C9 B0 */	addi r4, r4, lbl_805CC9B0@l
/* 8030F5DC 002D8B9C  7C 09 03 A6 */	mtctr r0
lbl_8030F5E0:
/* 8030F5E0 002D8BA0  80 04 00 00 */	lwz r0, 0(r4)
/* 8030F5E4 002D8BA4  7C 00 20 40 */	cmplw r0, r4
/* 8030F5E8 002D8BA8  41 82 00 10 */	beq lbl_8030F5F8
/* 8030F5EC 002D8BAC  48 04 94 05 */	bl OSRestoreInterrupts
/* 8030F5F0 002D8BB0  38 60 00 01 */	li r3, 1
/* 8030F5F4 002D8BB4  48 00 00 14 */	b lbl_8030F608
lbl_8030F5F8:
/* 8030F5F8 002D8BB8  38 84 00 08 */	addi r4, r4, 8
/* 8030F5FC 002D8BBC  42 00 FF E4 */	bdnz lbl_8030F5E0
/* 8030F600 002D8BC0  48 04 93 F1 */	bl OSRestoreInterrupts
/* 8030F604 002D8BC4  38 60 00 00 */	li r3, 0
lbl_8030F608:
/* 8030F608 002D8BC8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8030F60C 002D8BCC  7C 08 03 A6 */	mtlr r0
/* 8030F610 002D8BD0  38 21 00 10 */	addi r1, r1, 0x10
/* 8030F614 002D8BD4  4E 80 00 20 */	blr 
/* 8030F618 002D8BD8  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 8030F61C 002D8BDC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_8030F620
func_8030F620:
/* 8030F620 002D8BE0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8030F624 002D8BE4  7C 08 02 A6 */	mflr r0
/* 8030F628 002D8BE8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8030F62C 002D8BEC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8030F630 002D8BF0  48 04 93 81 */	bl OSDisableInterrupts
/* 8030F634 002D8BF4  3C 80 80 5D */	lis r4, lbl_805CC9B0@ha
/* 8030F638 002D8BF8  38 00 00 04 */	li r0, 4
/* 8030F63C 002D8BFC  38 84 C9 B0 */	addi r4, r4, lbl_805CC9B0@l
/* 8030F640 002D8C00  7C 09 03 A6 */	mtctr r0
/* 8030F644 002D8C04  60 00 00 00 */	nop 
lbl_8030F648:
/* 8030F648 002D8C08  83 E4 00 00 */	lwz r31, 0(r4)
/* 8030F64C 002D8C0C  7C 1F 20 40 */	cmplw r31, r4
/* 8030F650 002D8C10  41 82 00 10 */	beq lbl_8030F660
/* 8030F654 002D8C14  48 04 93 9D */	bl OSRestoreInterrupts
/* 8030F658 002D8C18  7F E3 FB 78 */	mr r3, r31
/* 8030F65C 002D8C1C  48 00 00 14 */	b lbl_8030F670
lbl_8030F660:
/* 8030F660 002D8C20  38 84 00 08 */	addi r4, r4, 8
/* 8030F664 002D8C24  42 00 FF E4 */	bdnz lbl_8030F648
/* 8030F668 002D8C28  48 04 93 89 */	bl OSRestoreInterrupts
/* 8030F66C 002D8C2C  38 60 00 00 */	li r3, 0
lbl_8030F670:
/* 8030F670 002D8C30  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8030F674 002D8C34  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8030F678 002D8C38  7C 08 03 A6 */	mtlr r0
/* 8030F67C 002D8C3C  38 21 00 10 */	addi r1, r1, 0x10
/* 8030F680 002D8C40  4E 80 00 20 */	blr 
/* 8030F684 002D8C44  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 8030F688 002D8C48  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 8030F68C 002D8C4C  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_8030F690
func_8030F690:
/* 8030F690 002D8C50  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8030F694 002D8C54  7C 08 02 A6 */	mflr r0
/* 8030F698 002D8C58  90 01 00 14 */	stw r0, 0x14(r1)
/* 8030F69C 002D8C5C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8030F6A0 002D8C60  7C 7F 1B 78 */	mr r31, r3
/* 8030F6A4 002D8C64  48 04 93 0D */	bl OSDisableInterrupts
/* 8030F6A8 002D8C68  80 9F 00 04 */	lwz r4, 4(r31)
/* 8030F6AC 002D8C6C  80 BF 00 00 */	lwz r5, 0(r31)
/* 8030F6B0 002D8C70  2C 04 00 00 */	cmpwi r4, 0
/* 8030F6B4 002D8C74  41 82 00 0C */	beq lbl_8030F6C0
/* 8030F6B8 002D8C78  2C 05 00 00 */	cmpwi r5, 0
/* 8030F6BC 002D8C7C  40 82 00 10 */	bne lbl_8030F6CC
lbl_8030F6C0:
/* 8030F6C0 002D8C80  48 04 93 31 */	bl OSRestoreInterrupts
/* 8030F6C4 002D8C84  38 60 00 00 */	li r3, 0
/* 8030F6C8 002D8C88  48 00 00 14 */	b lbl_8030F6DC
lbl_8030F6CC:
/* 8030F6CC 002D8C8C  90 A4 00 00 */	stw r5, 0(r4)
/* 8030F6D0 002D8C90  90 85 00 04 */	stw r4, 4(r5)
/* 8030F6D4 002D8C94  48 04 93 1D */	bl OSRestoreInterrupts
/* 8030F6D8 002D8C98  38 60 00 01 */	li r3, 1
lbl_8030F6DC:
/* 8030F6DC 002D8C9C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8030F6E0 002D8CA0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8030F6E4 002D8CA4  7C 08 03 A6 */	mtlr r0
/* 8030F6E8 002D8CA8  38 21 00 10 */	addi r1, r1, 0x10
/* 8030F6EC 002D8CAC  4E 80 00 20 */	blr
