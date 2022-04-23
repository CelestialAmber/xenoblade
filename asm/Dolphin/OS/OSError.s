.include "macros.inc"

.section .text, "ax"  # 0x80039220 - 0x804F5900

.global OSReport
OSReport:
/* 80354EF0 0031E4B0  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 80354EF4 0031E4B4  7C 08 02 A6 */	mflr r0
/* 80354EF8 0031E4B8  90 01 00 84 */	stw r0, 0x84(r1)
/* 80354EFC 0031E4BC  40 86 00 24 */	bne cr1, lbl_80354F20
/* 80354F00 0031E4C0  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 80354F04 0031E4C4  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 80354F08 0031E4C8  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 80354F0C 0031E4CC  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 80354F10 0031E4D0  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 80354F14 0031E4D4  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 80354F18 0031E4D8  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 80354F1C 0031E4DC  D9 01 00 60 */	stfd f8, 0x60(r1)
lbl_80354F20:
/* 80354F20 0031E4E0  39 61 00 88 */	addi r11, r1, 0x88
/* 80354F24 0031E4E4  38 01 00 08 */	addi r0, r1, 8
/* 80354F28 0031E4E8  3D 80 01 00 */	lis r12, 0x100
/* 80354F2C 0031E4EC  90 81 00 0C */	stw r4, 0xc(r1)
/* 80354F30 0031E4F0  38 81 00 68 */	addi r4, r1, 0x68
/* 80354F34 0031E4F4  90 61 00 08 */	stw r3, 8(r1)
/* 80354F38 0031E4F8  90 A1 00 10 */	stw r5, 0x10(r1)
/* 80354F3C 0031E4FC  90 C1 00 14 */	stw r6, 0x14(r1)
/* 80354F40 0031E500  90 E1 00 18 */	stw r7, 0x18(r1)
/* 80354F44 0031E504  91 01 00 1C */	stw r8, 0x1c(r1)
/* 80354F48 0031E508  91 21 00 20 */	stw r9, 0x20(r1)
/* 80354F4C 0031E50C  91 41 00 24 */	stw r10, 0x24(r1)
/* 80354F50 0031E510  91 81 00 68 */	stw r12, 0x68(r1)
/* 80354F54 0031E514  91 61 00 6C */	stw r11, 0x6c(r1)
/* 80354F58 0031E518  90 01 00 70 */	stw r0, 0x70(r1)
/* 80354F5C 0031E51C  4B F6 BE 61 */	bl vprintf
/* 80354F60 0031E520  80 01 00 84 */	lwz r0, 0x84(r1)
/* 80354F64 0031E524  7C 08 03 A6 */	mtlr r0
/* 80354F68 0031E528  38 21 00 80 */	addi r1, r1, 0x80
/* 80354F6C 0031E52C  4E 80 00 20 */	blr 

.global func_80354F70
func_80354F70:
/* 80354F70 0031E530  4B F6 BE 4C */	b vprintf
/* 80354F74 0031E534  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 80354F78 0031E538  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 80354F7C 0031E53C  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_80354F80
func_80354F80:
/* 80354F80 0031E540  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80354F84 0031E544  7C 08 02 A6 */	mflr r0
/* 80354F88 0031E548  90 01 00 24 */	stw r0, 0x24(r1)
/* 80354F8C 0031E54C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80354F90 0031E550  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80354F94 0031E554  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80354F98 0031E558  7C 7D 1B 78 */	mr r29, r3
/* 80354F9C 0031E55C  93 81 00 10 */	stw r28, 0x10(r1)
/* 80354FA0 0031E560  7C 9C 23 78 */	mr r28, r4
/* 80354FA4 0031E564  48 00 3A 0D */	bl OSDisableInterrupts
/* 80354FA8 0031E568  3C 80 80 5D */	lis r4, lbl_805D43B0@ha
/* 80354FAC 0031E56C  57 A0 13 BA */	rlwinm r0, r29, 2, 0xe, 0x1d
/* 80354FB0 0031E570  38 84 43 B0 */	addi r4, r4, lbl_805D43B0@l
/* 80354FB4 0031E574  28 1D 00 10 */	cmplwi r29, 0x10
/* 80354FB8 0031E578  7F C4 00 2E */	lwzx r30, r4, r0
/* 80354FBC 0031E57C  7C 7D 1B 78 */	mr r29, r3
/* 80354FC0 0031E580  7F 84 01 2E */	stwx r28, r4, r0
/* 80354FC4 0031E584  40 82 02 1C */	bne lbl_803551E0
/* 80354FC8 0031E588  4B F8 5B 89 */	bl PPCMfmsr
/* 80354FCC 0031E58C  7C 7F 1B 78 */	mr r31, r3
/* 80354FD0 0031E590  60 63 20 00 */	ori r3, r3, 0x2000
/* 80354FD4 0031E594  4B F8 5B 8D */	bl PPCMtmsr
/* 80354FD8 0031E598  4B F8 5C 79 */	bl PPCMffpscr
/* 80354FDC 0031E59C  2C 1C 00 00 */	cmpwi r28, 0
/* 80354FE0 0031E5A0  41 82 01 9C */	beq lbl_8035517C
/* 80354FE4 0031E5A4  3C A0 80 00 */	lis r5, 0x800000DC@ha
/* 80354FE8 0031E5A8  3C 80 60 06 */	lis r4, 0x6005F8FF@ha
/* 80354FEC 0031E5AC  81 25 00 DC */	lwz r9, 0x800000DC@l(r5)
/* 80354FF0 0031E5B0  38 A4 F8 FF */	addi r5, r4, 0x6005F8FF@l
/* 80354FF4 0031E5B4  39 00 FF FF */	li r8, -1
/* 80354FF8 0031E5B8  38 E0 00 04 */	li r7, 4
/* 80354FFC 0031E5BC  38 00 00 02 */	li r0, 2
/* 80355000 0031E5C0  48 00 01 60 */	b lbl_80355160
/* 80355004 0031E5C4  60 00 00 00 */	nop 
lbl_80355008:
/* 80355008 0031E5C8  80 89 01 9C */	lwz r4, 0x19c(r9)
/* 8035500C 0031E5CC  60 84 09 00 */	ori r4, r4, 0x900
/* 80355010 0031E5D0  90 89 01 9C */	stw r4, 0x19c(r9)
/* 80355014 0031E5D4  A0 C9 01 A2 */	lhz r6, 0x1a2(r9)
/* 80355018 0031E5D8  54 C4 07 FF */	clrlwi. r4, r6, 0x1f
/* 8035501C 0031E5DC  40 82 01 28 */	bne lbl_80355144
/* 80355020 0031E5E0  60 C4 00 01 */	ori r4, r6, 1
/* 80355024 0031E5E4  B0 89 01 A2 */	sth r4, 0x1a2(r9)
/* 80355028 0031E5E8  38 89 00 90 */	addi r4, r9, 0x90
/* 8035502C 0031E5EC  38 C9 01 C8 */	addi r6, r9, 0x1c8
/* 80355030 0031E5F0  7C 09 03 A6 */	mtctr r0
lbl_80355034:
/* 80355034 0031E5F4  91 04 00 04 */	stw r8, 4(r4)
/* 80355038 0031E5F8  91 04 00 00 */	stw r8, 0(r4)
/* 8035503C 0031E5FC  91 06 00 04 */	stw r8, 4(r6)
/* 80355040 0031E600  91 06 00 00 */	stw r8, 0(r6)
/* 80355044 0031E604  91 04 00 0C */	stw r8, 0xc(r4)
/* 80355048 0031E608  91 04 00 08 */	stw r8, 8(r4)
/* 8035504C 0031E60C  91 06 00 0C */	stw r8, 0xc(r6)
/* 80355050 0031E610  91 06 00 08 */	stw r8, 8(r6)
/* 80355054 0031E614  91 04 00 14 */	stw r8, 0x14(r4)
/* 80355058 0031E618  91 04 00 10 */	stw r8, 0x10(r4)
/* 8035505C 0031E61C  91 06 00 14 */	stw r8, 0x14(r6)
/* 80355060 0031E620  91 06 00 10 */	stw r8, 0x10(r6)
/* 80355064 0031E624  91 04 00 1C */	stw r8, 0x1c(r4)
/* 80355068 0031E628  91 04 00 18 */	stw r8, 0x18(r4)
/* 8035506C 0031E62C  91 06 00 1C */	stw r8, 0x1c(r6)
/* 80355070 0031E630  91 06 00 18 */	stw r8, 0x18(r6)
/* 80355074 0031E634  91 04 00 24 */	stw r8, 0x24(r4)
/* 80355078 0031E638  91 04 00 20 */	stw r8, 0x20(r4)
/* 8035507C 0031E63C  91 06 00 24 */	stw r8, 0x24(r6)
/* 80355080 0031E640  91 06 00 20 */	stw r8, 0x20(r6)
/* 80355084 0031E644  91 04 00 2C */	stw r8, 0x2c(r4)
/* 80355088 0031E648  91 04 00 28 */	stw r8, 0x28(r4)
/* 8035508C 0031E64C  91 06 00 2C */	stw r8, 0x2c(r6)
/* 80355090 0031E650  91 06 00 28 */	stw r8, 0x28(r6)
/* 80355094 0031E654  91 04 00 34 */	stw r8, 0x34(r4)
/* 80355098 0031E658  91 04 00 30 */	stw r8, 0x30(r4)
/* 8035509C 0031E65C  91 06 00 34 */	stw r8, 0x34(r6)
/* 803550A0 0031E660  91 06 00 30 */	stw r8, 0x30(r6)
/* 803550A4 0031E664  91 04 00 3C */	stw r8, 0x3c(r4)
/* 803550A8 0031E668  91 04 00 38 */	stw r8, 0x38(r4)
/* 803550AC 0031E66C  91 06 00 3C */	stw r8, 0x3c(r6)
/* 803550B0 0031E670  91 06 00 38 */	stw r8, 0x38(r6)
/* 803550B4 0031E674  91 04 00 44 */	stw r8, 0x44(r4)
/* 803550B8 0031E678  91 04 00 40 */	stw r8, 0x40(r4)
/* 803550BC 0031E67C  91 06 00 44 */	stw r8, 0x44(r6)
/* 803550C0 0031E680  91 06 00 40 */	stw r8, 0x40(r6)
/* 803550C4 0031E684  91 04 00 4C */	stw r8, 0x4c(r4)
/* 803550C8 0031E688  91 04 00 48 */	stw r8, 0x48(r4)
/* 803550CC 0031E68C  91 06 00 4C */	stw r8, 0x4c(r6)
/* 803550D0 0031E690  91 06 00 48 */	stw r8, 0x48(r6)
/* 803550D4 0031E694  91 04 00 54 */	stw r8, 0x54(r4)
/* 803550D8 0031E698  91 04 00 50 */	stw r8, 0x50(r4)
/* 803550DC 0031E69C  91 06 00 54 */	stw r8, 0x54(r6)
/* 803550E0 0031E6A0  91 06 00 50 */	stw r8, 0x50(r6)
/* 803550E4 0031E6A4  91 04 00 5C */	stw r8, 0x5c(r4)
/* 803550E8 0031E6A8  91 04 00 58 */	stw r8, 0x58(r4)
/* 803550EC 0031E6AC  91 06 00 5C */	stw r8, 0x5c(r6)
/* 803550F0 0031E6B0  91 06 00 58 */	stw r8, 0x58(r6)
/* 803550F4 0031E6B4  91 04 00 64 */	stw r8, 0x64(r4)
/* 803550F8 0031E6B8  91 04 00 60 */	stw r8, 0x60(r4)
/* 803550FC 0031E6BC  91 06 00 64 */	stw r8, 0x64(r6)
/* 80355100 0031E6C0  91 06 00 60 */	stw r8, 0x60(r6)
/* 80355104 0031E6C4  91 04 00 6C */	stw r8, 0x6c(r4)
/* 80355108 0031E6C8  91 04 00 68 */	stw r8, 0x68(r4)
/* 8035510C 0031E6CC  91 06 00 6C */	stw r8, 0x6c(r6)
/* 80355110 0031E6D0  91 06 00 68 */	stw r8, 0x68(r6)
/* 80355114 0031E6D4  91 04 00 74 */	stw r8, 0x74(r4)
/* 80355118 0031E6D8  91 04 00 70 */	stw r8, 0x70(r4)
/* 8035511C 0031E6DC  91 06 00 74 */	stw r8, 0x74(r6)
/* 80355120 0031E6E0  91 06 00 70 */	stw r8, 0x70(r6)
/* 80355124 0031E6E4  91 04 00 7C */	stw r8, 0x7c(r4)
/* 80355128 0031E6E8  91 04 00 78 */	stw r8, 0x78(r4)
/* 8035512C 0031E6EC  38 84 00 80 */	addi r4, r4, 0x80
/* 80355130 0031E6F0  91 06 00 7C */	stw r8, 0x7c(r6)
/* 80355134 0031E6F4  91 06 00 78 */	stw r8, 0x78(r6)
/* 80355138 0031E6F8  38 C6 00 80 */	addi r6, r6, 0x80
/* 8035513C 0031E6FC  42 00 FE F8 */	bdnz lbl_80355034
/* 80355140 0031E700  90 E9 01 94 */	stw r7, 0x194(r9)
lbl_80355144:
/* 80355144 0031E704  80 8D 99 E8 */	lwz r4, lbl_80665B68@sda21(r13)
/* 80355148 0031E708  80 C9 01 94 */	lwz r6, 0x194(r9)
/* 8035514C 0031E70C  54 84 06 38 */	rlwinm r4, r4, 0, 0x18, 0x1c
/* 80355150 0031E710  7C C4 23 78 */	or r4, r6, r4
/* 80355154 0031E714  7C 84 28 38 */	and r4, r4, r5
/* 80355158 0031E718  90 89 01 94 */	stw r4, 0x194(r9)
/* 8035515C 0031E71C  81 29 02 FC */	lwz r9, 0x2fc(r9)
lbl_80355160:
/* 80355160 0031E720  2C 09 00 00 */	cmpwi r9, 0
/* 80355164 0031E724  40 82 FE A4 */	bne lbl_80355008
/* 80355168 0031E728  80 0D 99 E8 */	lwz r0, lbl_80665B68@sda21(r13)
/* 8035516C 0031E72C  63 FF 09 00 */	ori r31, r31, 0x900
/* 80355170 0031E730  54 00 06 38 */	rlwinm r0, r0, 0, 0x18, 0x1c
/* 80355174 0031E734  7C 64 03 78 */	or r4, r3, r0
/* 80355178 0031E738  48 00 00 50 */	b lbl_803551C8
lbl_8035517C:
/* 8035517C 0031E73C  3C A0 80 00 */	lis r5, 0x800000DC@ha
/* 80355180 0031E740  3C 80 60 06 */	lis r4, 0x6005F8FF@ha
/* 80355184 0031E744  80 C5 00 DC */	lwz r6, 0x800000DC@l(r5)
/* 80355188 0031E748  38 84 F8 FF */	addi r4, r4, 0x6005F8FF@l
/* 8035518C 0031E74C  38 A0 F6 FF */	li r5, -2305
/* 80355190 0031E750  48 00 00 24 */	b lbl_803551B4
lbl_80355194:
/* 80355194 0031E754  80 06 01 9C */	lwz r0, 0x19c(r6)
/* 80355198 0031E758  7C 00 28 38 */	and r0, r0, r5
/* 8035519C 0031E75C  90 06 01 9C */	stw r0, 0x19c(r6)
/* 803551A0 0031E760  80 06 01 94 */	lwz r0, 0x194(r6)
/* 803551A4 0031E764  54 00 07 6E */	rlwinm r0, r0, 0, 0x1d, 0x17
/* 803551A8 0031E768  7C 00 20 38 */	and r0, r0, r4
/* 803551AC 0031E76C  90 06 01 94 */	stw r0, 0x194(r6)
/* 803551B0 0031E770  80 C6 02 FC */	lwz r6, 0x2fc(r6)
lbl_803551B4:
/* 803551B4 0031E774  2C 06 00 00 */	cmpwi r6, 0
/* 803551B8 0031E778  40 82 FF DC */	bne lbl_80355194
/* 803551BC 0031E77C  38 00 F6 FF */	li r0, -2305
/* 803551C0 0031E780  54 64 07 6E */	rlwinm r4, r3, 0, 0x1d, 0x17
/* 803551C4 0031E784  7F FF 00 38 */	and r31, r31, r0
lbl_803551C8:
/* 803551C8 0031E788  3C 60 60 06 */	lis r3, 0x6005F8FF@ha
/* 803551CC 0031E78C  38 03 F8 FF */	addi r0, r3, 0x6005F8FF@l
/* 803551D0 0031E790  7C 83 00 38 */	and r3, r4, r0
/* 803551D4 0031E794  4B F8 5A 9D */	bl PPCMtfpscr
/* 803551D8 0031E798  7F E3 FB 78 */	mr r3, r31
/* 803551DC 0031E79C  4B F8 59 85 */	bl PPCMtmsr
lbl_803551E0:
/* 803551E0 0031E7A0  7F A3 EB 78 */	mr r3, r29
/* 803551E4 0031E7A4  48 00 38 0D */	bl OSRestoreInterrupts
/* 803551E8 0031E7A8  7F C3 F3 78 */	mr r3, r30
/* 803551EC 0031E7AC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 803551F0 0031E7B0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 803551F4 0031E7B4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 803551F8 0031E7B8  83 81 00 10 */	lwz r28, 0x10(r1)
/* 803551FC 0031E7BC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80355200 0031E7C0  7C 08 03 A6 */	mtlr r0
/* 80355204 0031E7C4  38 21 00 20 */	addi r1, r1, 0x20
/* 80355208 0031E7C8  4E 80 00 20 */	blr 
/* 8035520C 0031E7CC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global lbl_80355210
lbl_80355210:
/* 80355210 0031E7D0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80355214 0031E7D4  7C 08 02 A6 */	mflr r0
/* 80355218 0031E7D8  90 01 00 34 */	stw r0, 0x34(r1)
/* 8035521C 0031E7DC  39 61 00 30 */	addi r11, r1, 0x30
/* 80355220 0031E7E0  4B F6 4F 25 */	bl _savegpr_23
/* 80355224 0031E7E4  3F E0 80 55 */	lis r31, lbl_80551C50@ha
/* 80355228 0031E7E8  7C 79 1B 78 */	mr r25, r3
/* 8035522C 0031E7EC  7C 9A 23 78 */	mr r26, r4
/* 80355230 0031E7F0  7C BB 2B 78 */	mr r27, r5
/* 80355234 0031E7F4  7C DC 33 78 */	mr r28, r6
/* 80355238 0031E7F8  3B FF 1C 50 */	addi r31, r31, lbl_80551C50@l
/* 8035523C 0031E7FC  48 00 77 25 */	bl OSGetTime
/* 80355240 0031E800  80 BA 01 9C */	lwz r5, 0x19c(r26)
/* 80355244 0031E804  7C 9D 23 78 */	mr r29, r4
/* 80355248 0031E808  7C 7E 1B 78 */	mr r30, r3
/* 8035524C 0031E80C  54 A0 07 BD */	rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 80355250 0031E810  40 82 00 18 */	bne lbl_80355268
/* 80355254 0031E814  7F 24 CB 78 */	mr r4, r25
/* 80355258 0031E818  38 7F 00 5C */	addi r3, r31, 0x5c
/* 8035525C 0031E81C  4C C6 31 82 */	crclr 6
/* 80355260 0031E820  4B FF FC 91 */	bl OSReport
/* 80355264 0031E824  48 00 01 60 */	b lbl_803553C4
lbl_80355268:
/* 80355268 0031E828  28 19 00 06 */	cmplwi r25, 6
/* 8035526C 0031E82C  40 82 00 EC */	bne lbl_80355358
/* 80355270 0031E830  54 A0 02 D7 */	rlwinm. r0, r5, 0, 0xb, 0xb
/* 80355274 0031E834  41 82 00 E4 */	beq lbl_80355358
/* 80355278 0031E838  3C 60 80 5D */	lis r3, lbl_805D43B0@ha
/* 8035527C 0031E83C  38 63 43 B0 */	addi r3, r3, lbl_805D43B0@l
/* 80355280 0031E840  80 03 00 40 */	lwz r0, 0x40(r3)
/* 80355284 0031E844  2C 00 00 00 */	cmpwi r0, 0
/* 80355288 0031E848  41 82 00 D0 */	beq lbl_80355358
/* 8035528C 0031E84C  3B 20 00 10 */	li r25, 0x10
/* 80355290 0031E850  4B F8 58 C1 */	bl PPCMfmsr
/* 80355294 0031E854  7C 77 1B 78 */	mr r23, r3
/* 80355298 0031E858  60 63 20 00 */	ori r3, r3, 0x2000
/* 8035529C 0031E85C  4B F8 58 C5 */	bl PPCMtmsr
/* 803552A0 0031E860  3C 60 80 00 */	lis r3, 0x800000D8@ha
/* 803552A4 0031E864  80 63 00 D8 */	lwz r3, 0x800000D8@l(r3)
/* 803552A8 0031E868  2C 03 00 00 */	cmpwi r3, 0
/* 803552AC 0031E86C  41 82 00 08 */	beq lbl_803552B4
/* 803552B0 0031E870  4B FF F5 C1 */	bl func_80354870
lbl_803552B4:
/* 803552B4 0031E874  4B F8 59 9D */	bl PPCMffpscr
/* 803552B8 0031E878  3F 00 60 06 */	lis r24, 0x6005F8FF@ha
/* 803552BC 0031E87C  38 18 F8 FF */	addi r0, r24, 0x6005F8FF@l
/* 803552C0 0031E880  7C 63 00 38 */	and r3, r3, r0
/* 803552C4 0031E884  4B F8 59 AD */	bl PPCMtfpscr
/* 803552C8 0031E888  7E E3 BB 78 */	mr r3, r23
/* 803552CC 0031E88C  4B F8 58 95 */	bl PPCMtmsr
/* 803552D0 0031E890  3E E0 80 00 */	lis r23, 0x800000D8@ha
/* 803552D4 0031E894  80 17 00 D8 */	lwz r0, 0x800000D8@l(r23)
/* 803552D8 0031E898  7C 00 D0 40 */	cmplw r0, r26
/* 803552DC 0031E89C  40 82 00 60 */	bne lbl_8035533C
/* 803552E0 0031E8A0  48 00 63 11 */	bl OSDisableScheduler
/* 803552E4 0031E8A4  7F 44 D3 78 */	mr r4, r26
/* 803552E8 0031E8A8  7F 65 DB 78 */	mr r5, r27
/* 803552EC 0031E8AC  7F 86 E3 78 */	mr r6, r28
/* 803552F0 0031E8B0  38 60 00 10 */	li r3, 0x10
/* 803552F4 0031E8B4  4C C6 31 82 */	crclr 6
/* 803552F8 0031E8B8  3C E0 80 5D */	lis r7, lbl_805D43B0@ha
/* 803552FC 0031E8BC  38 E7 43 B0 */	addi r7, r7, lbl_805D43B0@l
/* 80355300 0031E8C0  81 87 00 40 */	lwz r12, 0x40(r7)
/* 80355304 0031E8C4  7D 89 03 A6 */	mtctr r12
/* 80355308 0031E8C8  4E 80 04 21 */	bctrl 
/* 8035530C 0031E8CC  80 9A 01 9C */	lwz r4, 0x19c(r26)
/* 80355310 0031E8D0  38 60 00 00 */	li r3, 0
/* 80355314 0031E8D4  38 18 F8 FF */	addi r0, r24, -1793
/* 80355318 0031E8D8  54 84 04 E2 */	rlwinm r4, r4, 0, 0x13, 0x11
/* 8035531C 0031E8DC  90 9A 01 9C */	stw r4, 0x19c(r26)
/* 80355320 0031E8E0  90 77 00 D8 */	stw r3, 0xd8(r23)
/* 80355324 0031E8E4  80 7A 01 94 */	lwz r3, 0x194(r26)
/* 80355328 0031E8E8  7C 60 00 38 */	and r0, r3, r0
/* 8035532C 0031E8EC  90 1A 01 94 */	stw r0, 0x194(r26)
/* 80355330 0031E8F0  48 00 63 01 */	bl OSEnableScheduler
/* 80355334 0031E8F4  48 00 68 1D */	bl func_8035BB50
/* 80355338 0031E8F8  48 00 00 18 */	b lbl_80355350
lbl_8035533C:
/* 8035533C 0031E8FC  80 7A 01 9C */	lwz r3, 0x19c(r26)
/* 80355340 0031E900  38 00 00 00 */	li r0, 0
/* 80355344 0031E904  54 63 04 E2 */	rlwinm r3, r3, 0, 0x13, 0x11
/* 80355348 0031E908  90 7A 01 9C */	stw r3, 0x19c(r26)
/* 8035534C 0031E90C  90 17 00 D8 */	stw r0, 0xd8(r23)
lbl_80355350:
/* 80355350 0031E910  7F 43 D3 78 */	mr r3, r26
/* 80355354 0031E914  4B FF F6 1D */	bl func_80354970
lbl_80355358:
/* 80355358 0031E918  3F 00 80 5D */	lis r24, lbl_805D43B0@ha
/* 8035535C 0031E91C  57 37 15 BA */	rlwinm r23, r25, 2, 0x16, 0x1d
/* 80355360 0031E920  3B 18 43 B0 */	addi r24, r24, lbl_805D43B0@l
/* 80355364 0031E924  7C 18 B8 2E */	lwzx r0, r24, r23
/* 80355368 0031E928  2C 00 00 00 */	cmpwi r0, 0
/* 8035536C 0031E92C  41 82 00 38 */	beq lbl_803553A4
/* 80355370 0031E930  48 00 62 81 */	bl OSDisableScheduler
/* 80355374 0031E934  7F 23 CB 78 */	mr r3, r25
/* 80355378 0031E938  7F 44 D3 78 */	mr r4, r26
/* 8035537C 0031E93C  7F 65 DB 78 */	mr r5, r27
/* 80355380 0031E940  7F 86 E3 78 */	mr r6, r28
/* 80355384 0031E944  4C C6 31 82 */	crclr 6
/* 80355388 0031E948  7D 98 B8 2E */	lwzx r12, r24, r23
/* 8035538C 0031E94C  7D 89 03 A6 */	mtctr r12
/* 80355390 0031E950  4E 80 04 21 */	bctrl 
/* 80355394 0031E954  48 00 62 9D */	bl OSEnableScheduler
/* 80355398 0031E958  48 00 67 B9 */	bl func_8035BB50
/* 8035539C 0031E95C  7F 43 D3 78 */	mr r3, r26
/* 803553A0 0031E960  4B FF F5 D1 */	bl func_80354970
lbl_803553A4:
/* 803553A4 0031E964  28 19 00 08 */	cmplwi r25, 8
/* 803553A8 0031E968  40 82 00 0C */	bne lbl_803553B4
/* 803553AC 0031E96C  7F 43 D3 78 */	mr r3, r26
/* 803553B0 0031E970  4B FF F5 C1 */	bl func_80354970
lbl_803553B4:
/* 803553B4 0031E974  7F 24 CB 78 */	mr r4, r25
/* 803553B8 0031E978  38 7F 00 7C */	addi r3, r31, 0x7c
/* 803553BC 0031E97C  4C C6 31 82 */	crclr 6
/* 803553C0 0031E980  4B FF FB 31 */	bl OSReport
lbl_803553C4:
/* 803553C4 0031E984  38 6D 99 EC */	addi r3, r13, lbl_80665B6C@sda21
/* 803553C8 0031E988  4C C6 31 82 */	crclr 6
/* 803553CC 0031E98C  4B FF FB 25 */	bl OSReport
/* 803553D0 0031E990  7F 43 D3 78 */	mr r3, r26
/* 803553D4 0031E994  4B FF F7 DD */	bl func_80354BB0
/* 803553D8 0031E998  7F 64 DB 78 */	mr r4, r27
/* 803553DC 0031E99C  7F 85 E3 78 */	mr r5, r28
/* 803553E0 0031E9A0  38 7F 00 94 */	addi r3, r31, 0x94
/* 803553E4 0031E9A4  4C C6 31 82 */	crclr 6
/* 803553E8 0031E9A8  4B FF FB 09 */	bl OSReport
/* 803553EC 0031E9AC  7F A6 EB 78 */	mr r6, r29
/* 803553F0 0031E9B0  7F C5 F3 78 */	mr r5, r30
/* 803553F4 0031E9B4  38 7F 00 C8 */	addi r3, r31, 0xc8
/* 803553F8 0031E9B8  4C C6 31 82 */	crclr 6
/* 803553FC 0031E9BC  4B FF FA F5 */	bl OSReport
/* 80355400 0031E9C0  2C 19 00 02 */	cmpwi r25, 2
/* 80355404 0031E9C4  41 82 00 28 */	beq lbl_8035542C
/* 80355408 0031E9C8  2C 19 00 03 */	cmpwi r25, 3
/* 8035540C 0031E9CC  41 82 00 38 */	beq lbl_80355444
/* 80355410 0031E9D0  2C 19 00 05 */	cmpwi r25, 5
/* 80355414 0031E9D4  41 82 00 44 */	beq lbl_80355458
/* 80355418 0031E9D8  2C 19 00 06 */	cmpwi r25, 6
/* 8035541C 0031E9DC  41 82 00 54 */	beq lbl_80355470
/* 80355420 0031E9E0  2C 19 00 0F */	cmpwi r25, 0xf
/* 80355424 0031E9E4  41 82 00 64 */	beq lbl_80355488
/* 80355428 0031E9E8  48 00 00 AC */	b lbl_803554D4
lbl_8035542C:
/* 8035542C 0031E9EC  80 9A 01 98 */	lwz r4, 0x198(r26)
/* 80355430 0031E9F0  7F 85 E3 78 */	mr r5, r28
/* 80355434 0031E9F4  38 7F 00 D8 */	addi r3, r31, 0xd8
/* 80355438 0031E9F8  4C C6 31 82 */	crclr 6
/* 8035543C 0031E9FC  4B FF FA B5 */	bl OSReport
/* 80355440 0031EA00  48 00 00 94 */	b lbl_803554D4
lbl_80355444:
/* 80355444 0031EA04  80 9A 01 98 */	lwz r4, 0x198(r26)
/* 80355448 0031EA08  38 7F 01 38 */	addi r3, r31, 0x138
/* 8035544C 0031EA0C  4C C6 31 82 */	crclr 6
/* 80355450 0031EA10  4B FF FA A1 */	bl OSReport
/* 80355454 0031EA14  48 00 00 80 */	b lbl_803554D4
lbl_80355458:
/* 80355458 0031EA18  80 9A 01 98 */	lwz r4, 0x198(r26)
/* 8035545C 0031EA1C  7F 85 E3 78 */	mr r5, r28
/* 80355460 0031EA20  38 7F 01 84 */	addi r3, r31, 0x184
/* 80355464 0031EA24  4C C6 31 82 */	crclr 6
/* 80355468 0031EA28  4B FF FA 89 */	bl OSReport
/* 8035546C 0031EA2C  48 00 00 68 */	b lbl_803554D4
lbl_80355470:
/* 80355470 0031EA30  80 9A 01 98 */	lwz r4, 0x198(r26)
/* 80355474 0031EA34  7F 85 E3 78 */	mr r5, r28
/* 80355478 0031EA38  38 7F 01 E8 */	addi r3, r31, 0x1e8
/* 8035547C 0031EA3C  4C C6 31 82 */	crclr 6
/* 80355480 0031EA40  4B FF FA 71 */	bl OSReport
/* 80355484 0031EA44  48 00 00 50 */	b lbl_803554D4
lbl_80355488:
/* 80355488 0031EA48  38 6D 99 EC */	addi r3, r13, lbl_80665B6C@sda21
/* 8035548C 0031EA4C  4C C6 31 82 */	crclr 6
/* 80355490 0031EA50  4B FF FA 61 */	bl OSReport
/* 80355494 0031EA54  3F 20 CC 00 */	lis r25, 0xCC005030@ha
/* 80355498 0031EA58  38 7F 02 48 */	addi r3, r31, 0x248
/* 8035549C 0031EA5C  A0 99 50 30 */	lhz r4, 0xCC005030@l(r25)
/* 803554A0 0031EA60  A0 B9 50 32 */	lhz r5, 0x5032(r25)
/* 803554A4 0031EA64  4C C6 31 82 */	crclr 6
/* 803554A8 0031EA68  4B FF FA 49 */	bl OSReport
/* 803554AC 0031EA6C  A0 99 50 20 */	lhz r4, 0x5020(r25)
/* 803554B0 0031EA70  38 7F 02 68 */	addi r3, r31, 0x268
/* 803554B4 0031EA74  A0 B9 50 22 */	lhz r5, 0x5022(r25)
/* 803554B8 0031EA78  4C C6 31 82 */	crclr 6
/* 803554BC 0031EA7C  4B FF FA 35 */	bl OSReport
/* 803554C0 0031EA80  3C 80 CD 00 */	lis r4, 0xCD006014@ha
/* 803554C4 0031EA84  38 7F 02 88 */	addi r3, r31, 0x288
/* 803554C8 0031EA88  80 84 60 14 */	lwz r4, 0xCD006014@l(r4)
/* 803554CC 0031EA8C  4C C6 31 82 */	crclr 6
/* 803554D0 0031EA90  4B FF FA 21 */	bl OSReport
lbl_803554D4:
/* 803554D4 0031EA94  A8 8D B9 14 */	lha r4, lbl_80667A94@sda21(r13)
/* 803554D8 0031EA98  38 7F 02 A4 */	addi r3, r31, 0x2a4
/* 803554DC 0031EA9C  80 AD B9 10 */	lwz r5, lbl_80667A90@sda21(r13)
/* 803554E0 0031EAA0  80 ED B9 18 */	lwz r7, lbl_80667A98@sda21(r13)
/* 803554E4 0031EAA4  81 0D B9 1C */	lwz r8, lbl_80667A9C@sda21(r13)
/* 803554E8 0031EAA8  4C C6 31 82 */	crclr 6
/* 803554EC 0031EAAC  4B FF FA 05 */	bl OSReport
/* 803554F0 0031EAB0  4B F8 56 E1 */	bl PPCHalt
/* 803554F4 0031EAB4  39 61 00 30 */	addi r11, r1, 0x30
/* 803554F8 0031EAB8  4B F6 4C 99 */	bl func_802BA190
/* 803554FC 0031EABC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80355500 0031EAC0  7C 08 03 A6 */	mtlr r0
/* 80355504 0031EAC4  38 21 00 30 */	addi r1, r1, 0x30
/* 80355508 0031EAC8  4E 80 00 20 */	blr 
/* 8035550C 0031EACC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */