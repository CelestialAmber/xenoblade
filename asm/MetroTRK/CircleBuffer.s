.include "macros.inc"

.section .text, "ax"  # 0x80039220 - 0x804F5900

.global CBGetBytesAvailableForRead
CBGetBytesAvailableForRead:
/* 802CB7E0 00294DA0  80 63 00 10 */	lwz r3, 0x10(r3)
/* 802CB7E4 00294DA4  4E 80 00 20 */	blr 

.global CircleBufferInitialize
CircleBufferInitialize:
/* 802CB7E8 00294DA8  38 00 00 00 */	li r0, 0
/* 802CB7EC 00294DAC  90 83 00 08 */	stw r4, 8(r3)
/* 802CB7F0 00294DB0  90 A3 00 0C */	stw r5, 0xc(r3)
/* 802CB7F4 00294DB4  90 83 00 00 */	stw r4, 0(r3)
/* 802CB7F8 00294DB8  90 83 00 04 */	stw r4, 4(r3)
/* 802CB7FC 00294DBC  90 03 00 10 */	stw r0, 0x10(r3)
/* 802CB800 00294DC0  90 A3 00 14 */	stw r5, 0x14(r3)
/* 802CB804 00294DC4  38 63 00 18 */	addi r3, r3, 0x18
/* 802CB808 00294DC8  4B FF FF 9C */	b MWInitializeCriticalSection

.global CircleBufferReadBytes
CircleBufferReadBytes:
/* 802CB80C 00294DCC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802CB810 00294DD0  7C 08 02 A6 */	mflr r0
/* 802CB814 00294DD4  90 01 00 24 */	stw r0, 0x24(r1)
/* 802CB818 00294DD8  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 802CB81C 00294DDC  7C BF 2B 78 */	mr r31, r5
/* 802CB820 00294DE0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 802CB824 00294DE4  7C 7E 1B 78 */	mr r30, r3
/* 802CB828 00294DE8  93 A1 00 14 */	stw r29, 0x14(r1)
/* 802CB82C 00294DEC  93 81 00 10 */	stw r28, 0x10(r1)
/* 802CB830 00294DF0  7C 9C 23 78 */	mr r28, r4
/* 802CB834 00294DF4  80 03 00 14 */	lwz r0, 0x14(r3)
/* 802CB838 00294DF8  7C 05 00 40 */	cmplw r5, r0
/* 802CB83C 00294DFC  40 81 00 0C */	ble lbl_802CB848
/* 802CB840 00294E00  38 60 FF FF */	li r3, -1
/* 802CB844 00294E04  48 00 00 B0 */	b lbl_802CB8F4
lbl_802CB848:
/* 802CB848 00294E08  38 63 00 18 */	addi r3, r3, 0x18
/* 802CB84C 00294E0C  4B FF FF 5D */	bl MWEnterCriticalSection
/* 802CB850 00294E10  80 7E 00 04 */	lwz r3, 4(r30)
/* 802CB854 00294E14  80 9E 00 08 */	lwz r4, 8(r30)
/* 802CB858 00294E18  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 802CB85C 00294E1C  7C 84 18 50 */	subf r4, r4, r3
/* 802CB860 00294E20  7F A4 00 50 */	subf r29, r4, r0
/* 802CB864 00294E24  7C 1D F8 40 */	cmplw r29, r31
/* 802CB868 00294E28  41 80 00 20 */	blt lbl_802CB888
/* 802CB86C 00294E2C  7F 84 E3 78 */	mr r4, r28
/* 802CB870 00294E30  7F E5 FB 78 */	mr r5, r31
/* 802CB874 00294E34  4B D3 87 8D */	bl memcpy
/* 802CB878 00294E38  80 1E 00 04 */	lwz r0, 4(r30)
/* 802CB87C 00294E3C  7C 00 FA 14 */	add r0, r0, r31
/* 802CB880 00294E40  90 1E 00 04 */	stw r0, 4(r30)
/* 802CB884 00294E44  48 00 00 30 */	b lbl_802CB8B4
lbl_802CB888:
/* 802CB888 00294E48  7F 84 E3 78 */	mr r4, r28
/* 802CB88C 00294E4C  7F A5 EB 78 */	mr r5, r29
/* 802CB890 00294E50  4B D3 87 71 */	bl memcpy
/* 802CB894 00294E54  80 7E 00 08 */	lwz r3, 8(r30)
/* 802CB898 00294E58  7C 9C EA 14 */	add r4, r28, r29
/* 802CB89C 00294E5C  7C BD F8 50 */	subf r5, r29, r31
/* 802CB8A0 00294E60  4B D3 87 61 */	bl memcpy
/* 802CB8A4 00294E64  80 1E 00 08 */	lwz r0, 8(r30)
/* 802CB8A8 00294E68  7C 00 FA 14 */	add r0, r0, r31
/* 802CB8AC 00294E6C  7C 1D 00 50 */	subf r0, r29, r0
/* 802CB8B0 00294E70  90 1E 00 04 */	stw r0, 4(r30)
lbl_802CB8B4:
/* 802CB8B4 00294E74  80 9E 00 08 */	lwz r4, 8(r30)
/* 802CB8B8 00294E78  80 1E 00 04 */	lwz r0, 4(r30)
/* 802CB8BC 00294E7C  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 802CB8C0 00294E80  7C 04 00 50 */	subf r0, r4, r0
/* 802CB8C4 00294E84  7C 03 00 40 */	cmplw r3, r0
/* 802CB8C8 00294E88  40 82 00 08 */	bne lbl_802CB8D0
/* 802CB8CC 00294E8C  90 9E 00 04 */	stw r4, 4(r30)
lbl_802CB8D0:
/* 802CB8D0 00294E90  80 9E 00 14 */	lwz r4, 0x14(r30)
/* 802CB8D4 00294E94  38 7E 00 18 */	addi r3, r30, 0x18
/* 802CB8D8 00294E98  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 802CB8DC 00294E9C  7C 9F 20 50 */	subf r4, r31, r4
/* 802CB8E0 00294EA0  90 9E 00 14 */	stw r4, 0x14(r30)
/* 802CB8E4 00294EA4  7C 00 FA 14 */	add r0, r0, r31
/* 802CB8E8 00294EA8  90 1E 00 10 */	stw r0, 0x10(r30)
/* 802CB8EC 00294EAC  4B FF FE ED */	bl MWExitCriticalSection
/* 802CB8F0 00294EB0  38 60 00 00 */	li r3, 0
lbl_802CB8F4:
/* 802CB8F4 00294EB4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802CB8F8 00294EB8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 802CB8FC 00294EBC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802CB900 00294EC0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802CB904 00294EC4  83 81 00 10 */	lwz r28, 0x10(r1)
/* 802CB908 00294EC8  7C 08 03 A6 */	mtlr r0
/* 802CB90C 00294ECC  38 21 00 20 */	addi r1, r1, 0x20
/* 802CB910 00294ED0  4E 80 00 20 */	blr 

.global CircleBufferWriteBytes
CircleBufferWriteBytes:
/* 802CB914 00294ED4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802CB918 00294ED8  7C 08 02 A6 */	mflr r0
/* 802CB91C 00294EDC  90 01 00 24 */	stw r0, 0x24(r1)
/* 802CB920 00294EE0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 802CB924 00294EE4  7C BF 2B 78 */	mr r31, r5
/* 802CB928 00294EE8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 802CB92C 00294EEC  7C 7E 1B 78 */	mr r30, r3
/* 802CB930 00294EF0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 802CB934 00294EF4  93 81 00 10 */	stw r28, 0x10(r1)
/* 802CB938 00294EF8  7C 9C 23 78 */	mr r28, r4
/* 802CB93C 00294EFC  80 03 00 10 */	lwz r0, 0x10(r3)
/* 802CB940 00294F00  7C 05 00 40 */	cmplw r5, r0
/* 802CB944 00294F04  40 81 00 0C */	ble lbl_802CB950
/* 802CB948 00294F08  38 60 FF FF */	li r3, -1
/* 802CB94C 00294F0C  48 00 00 B0 */	b lbl_802CB9FC
lbl_802CB950:
/* 802CB950 00294F10  38 63 00 18 */	addi r3, r3, 0x18
/* 802CB954 00294F14  4B FF FE 55 */	bl MWEnterCriticalSection
/* 802CB958 00294F18  80 9E 00 00 */	lwz r4, 0(r30)
/* 802CB95C 00294F1C  80 7E 00 08 */	lwz r3, 8(r30)
/* 802CB960 00294F20  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 802CB964 00294F24  7C 63 20 50 */	subf r3, r3, r4
/* 802CB968 00294F28  7F A3 00 50 */	subf r29, r3, r0
/* 802CB96C 00294F2C  7C 1F E8 40 */	cmplw r31, r29
/* 802CB970 00294F30  40 80 00 20 */	bge lbl_802CB990
/* 802CB974 00294F34  7F 83 E3 78 */	mr r3, r28
/* 802CB978 00294F38  7F E5 FB 78 */	mr r5, r31
/* 802CB97C 00294F3C  4B D3 86 85 */	bl memcpy
/* 802CB980 00294F40  80 1E 00 00 */	lwz r0, 0(r30)
/* 802CB984 00294F44  7C 00 FA 14 */	add r0, r0, r31
/* 802CB988 00294F48  90 1E 00 00 */	stw r0, 0(r30)
/* 802CB98C 00294F4C  48 00 00 30 */	b lbl_802CB9BC
lbl_802CB990:
/* 802CB990 00294F50  7F 83 E3 78 */	mr r3, r28
/* 802CB994 00294F54  7F A5 EB 78 */	mr r5, r29
/* 802CB998 00294F58  4B D3 86 69 */	bl memcpy
/* 802CB99C 00294F5C  80 9E 00 08 */	lwz r4, 8(r30)
/* 802CB9A0 00294F60  7C 7C EA 14 */	add r3, r28, r29
/* 802CB9A4 00294F64  7C BD F8 50 */	subf r5, r29, r31
/* 802CB9A8 00294F68  4B D3 86 59 */	bl memcpy
/* 802CB9AC 00294F6C  80 1E 00 08 */	lwz r0, 8(r30)
/* 802CB9B0 00294F70  7C 00 FA 14 */	add r0, r0, r31
/* 802CB9B4 00294F74  7C 1D 00 50 */	subf r0, r29, r0
/* 802CB9B8 00294F78  90 1E 00 00 */	stw r0, 0(r30)
lbl_802CB9BC:
/* 802CB9BC 00294F7C  80 9E 00 08 */	lwz r4, 8(r30)
/* 802CB9C0 00294F80  80 1E 00 00 */	lwz r0, 0(r30)
/* 802CB9C4 00294F84  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 802CB9C8 00294F88  7C 04 00 50 */	subf r0, r4, r0
/* 802CB9CC 00294F8C  7C 03 00 40 */	cmplw r3, r0
/* 802CB9D0 00294F90  40 82 00 08 */	bne lbl_802CB9D8
/* 802CB9D4 00294F94  90 9E 00 00 */	stw r4, 0(r30)
lbl_802CB9D8:
/* 802CB9D8 00294F98  80 9E 00 14 */	lwz r4, 0x14(r30)
/* 802CB9DC 00294F9C  38 7E 00 18 */	addi r3, r30, 0x18
/* 802CB9E0 00294FA0  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 802CB9E4 00294FA4  7C 84 FA 14 */	add r4, r4, r31
/* 802CB9E8 00294FA8  90 9E 00 14 */	stw r4, 0x14(r30)
/* 802CB9EC 00294FAC  7C 1F 00 50 */	subf r0, r31, r0
/* 802CB9F0 00294FB0  90 1E 00 10 */	stw r0, 0x10(r30)
/* 802CB9F4 00294FB4  4B FF FD E5 */	bl MWExitCriticalSection
/* 802CB9F8 00294FB8  38 60 00 00 */	li r3, 0
lbl_802CB9FC:
/* 802CB9FC 00294FBC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802CBA00 00294FC0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 802CBA04 00294FC4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802CBA08 00294FC8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802CBA0C 00294FCC  83 81 00 10 */	lwz r28, 0x10(r1)
/* 802CBA10 00294FD0  7C 08 03 A6 */	mtlr r0
/* 802CBA14 00294FD4  38 21 00 20 */	addi r1, r1, 0x20
/* 802CBA18 00294FD8  4E 80 00 20 */	blr 