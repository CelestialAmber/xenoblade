.include "macros.inc"

.section .text, "ax"  # 0x80039220 - 0x804F5900

.global func_803EE5C0
func_803EE5C0:
/* 803EE5C0 003B7B80  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803EE5C4 003B7B84  7C 08 02 A6 */	mflr r0
/* 803EE5C8 003B7B88  2C 07 00 00 */	cmpwi r7, 0
/* 803EE5CC 003B7B8C  90 01 00 14 */	stw r0, 0x14(r1)
/* 803EE5D0 003B7B90  93 E1 00 0C */	stw r31, 0xc(r1)
/* 803EE5D4 003B7B94  7C 9F 23 78 */	mr r31, r4
/* 803EE5D8 003B7B98  93 C1 00 08 */	stw r30, 8(r1)
/* 803EE5DC 003B7B9C  7C 7E 1B 78 */	mr r30, r3
/* 803EE5E0 003B7BA0  40 82 00 14 */	bne lbl_803EE5F4
/* 803EE5E4 003B7BA4  48 00 45 89 */	bl func_803F2B6C
/* 803EE5E8 003B7BA8  7C 60 00 34 */	cntlzw r0, r3
/* 803EE5EC 003B7BAC  54 00 D9 7E */	srwi r0, r0, 5
/* 803EE5F0 003B7BB0  48 00 00 28 */	b lbl_803EE618
lbl_803EE5F4:
/* 803EE5F4 003B7BB4  2C 07 00 01 */	cmpwi r7, 1
/* 803EE5F8 003B7BB8  40 82 00 14 */	bne lbl_803EE60C
/* 803EE5FC 003B7BBC  48 00 51 11 */	bl func_803F370C
/* 803EE600 003B7BC0  7C 60 00 34 */	cntlzw r0, r3
/* 803EE604 003B7BC4  54 00 D9 7E */	srwi r0, r0, 5
/* 803EE608 003B7BC8  48 00 00 10 */	b lbl_803EE618
lbl_803EE60C:
/* 803EE60C 003B7BCC  48 00 5D 65 */	bl func_803F4370
/* 803EE610 003B7BD0  7C 60 00 34 */	cntlzw r0, r3
/* 803EE614 003B7BD4  54 00 D9 7E */	srwi r0, r0, 5
lbl_803EE618:
/* 803EE618 003B7BD8  2C 00 00 00 */	cmpwi r0, 0
/* 803EE61C 003B7BDC  41 82 00 14 */	beq lbl_803EE630
/* 803EE620 003B7BE0  2C 1F 00 00 */	cmpwi r31, 0
/* 803EE624 003B7BE4  41 82 00 0C */	beq lbl_803EE630
/* 803EE628 003B7BE8  7F C3 F3 78 */	mr r3, r30
/* 803EE62C 003B7BEC  4B F5 EB B5 */	bl func_8034D1E0
lbl_803EE630:
/* 803EE630 003B7BF0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803EE634 003B7BF4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803EE638 003B7BF8  83 C1 00 08 */	lwz r30, 8(r1)
/* 803EE63C 003B7BFC  7C 08 03 A6 */	mtlr r0
/* 803EE640 003B7C00  38 21 00 10 */	addi r1, r1, 0x10
/* 803EE644 003B7C04  4E 80 00 20 */	blr 

.global func_803EE648
func_803EE648:
/* 803EE648 003B7C08  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803EE64C 003B7C0C  7C 08 02 A6 */	mflr r0
/* 803EE650 003B7C10  90 01 00 14 */	stw r0, 0x14(r1)
/* 803EE654 003B7C14  93 E1 00 0C */	stw r31, 0xc(r1)
/* 803EE658 003B7C18  7C 9F 23 78 */	mr r31, r4
/* 803EE65C 003B7C1C  93 C1 00 08 */	stw r30, 8(r1)
/* 803EE660 003B7C20  7C 7E 1B 78 */	mr r30, r3
/* 803EE664 003B7C24  48 00 37 B5 */	bl func_803F1E18
/* 803EE668 003B7C28  7C 60 00 34 */	cntlzw r0, r3
/* 803EE66C 003B7C2C  54 00 D9 7F */	rlwinm. r0, r0, 0x1b, 5, 0x1f
/* 803EE670 003B7C30  41 82 00 14 */	beq lbl_803EE684
/* 803EE674 003B7C34  2C 1F 00 00 */	cmpwi r31, 0
/* 803EE678 003B7C38  41 82 00 0C */	beq lbl_803EE684
/* 803EE67C 003B7C3C  7F C3 F3 78 */	mr r3, r30
/* 803EE680 003B7C40  4B F5 EB 61 */	bl func_8034D1E0
lbl_803EE684:
/* 803EE684 003B7C44  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803EE688 003B7C48  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803EE68C 003B7C4C  83 C1 00 08 */	lwz r30, 8(r1)
/* 803EE690 003B7C50  7C 08 03 A6 */	mtlr r0
/* 803EE694 003B7C54  38 21 00 10 */	addi r1, r1, 0x10
/* 803EE698 003B7C58  4E 80 00 20 */	blr 