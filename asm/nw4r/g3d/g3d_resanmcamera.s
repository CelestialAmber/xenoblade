.include "macros.inc"

.section .text, "ax"  # 0x80039220 - 0x804F5900

.global func_803E0AB0
func_803E0AB0:
/* 803E0AB0 003AA070  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 803E0AB4 003AA074  7C 08 02 A6 */	mflr r0
/* 803E0AB8 003AA078  90 01 00 44 */	stw r0, 0x44(r1)
/* 803E0ABC 003AA07C  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 803E0AC0 003AA080  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 803E0AC4 003AA084  39 61 00 30 */	addi r11, r1, 0x30
/* 803E0AC8 003AA088  4B ED 96 7D */	bl _savegpr_23
/* 803E0ACC 003AA08C  83 E3 00 00 */	lwz r31, 0(r3)
/* 803E0AD0 003AA090  FF E0 08 90 */	fmr f31, f1
/* 803E0AD4 003AA094  7C 9A 23 78 */	mr r26, r4
/* 803E0AD8 003AA098  83 DF 00 18 */	lwz r30, 0x18(r31)
/* 803E0ADC 003AA09C  57 C3 07 BE */	clrlwi r3, r30, 0x1e
/* 803E0AE0 003AA0A0  57 C0 03 9D */	rlwinm. r0, r30, 0, 0xe, 0xe
/* 803E0AE4 003AA0A4  90 64 00 00 */	stw r3, 0(r4)
/* 803E0AE8 003AA0A8  57 D9 77 FE */	rlwinm r25, r30, 0xe, 0x1f, 0x1f
/* 803E0AEC 003AA0AC  57 D8 6F FE */	rlwinm r24, r30, 0xd, 0x1f, 0x1f
/* 803E0AF0 003AA0B0  57 D7 67 FE */	rlwinm r23, r30, 0xc, 0x1f, 0x1f
/* 803E0AF4 003AA0B4  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 803E0AF8 003AA0B8  57 DD 5F FE */	rlwinm r29, r30, 0xb, 0x1f, 0x1f
/* 803E0AFC 003AA0BC  57 DC 57 FE */	rlwinm r28, r30, 0xa, 0x1f, 0x1f
/* 803E0B00 003AA0C0  57 DB 07 FE */	clrlwi r27, r30, 0x1f
/* 803E0B04 003AA0C4  90 04 00 04 */	stw r0, 4(r4)
/* 803E0B08 003AA0C8  41 82 00 0C */	beq lbl_803E0B14
/* 803E0B0C 003AA0CC  C0 3F 00 20 */	lfs f1, 0x20(r31)
/* 803E0B10 003AA0D0  48 00 00 14 */	b lbl_803E0B24
lbl_803E0B14:
/* 803E0B14 003AA0D4  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 803E0B18 003AA0D8  7C 7F 02 14 */	add r3, r31, r0
/* 803E0B1C 003AA0DC  38 63 00 20 */	addi r3, r3, 0x20
/* 803E0B20 003AA0E0  4B FF CF 89 */	bl func_803DDAA8
lbl_803E0B24:
/* 803E0B24 003AA0E4  2C 19 00 00 */	cmpwi r25, 0
/* 803E0B28 003AA0E8  D0 3A 00 08 */	stfs f1, 8(r26)
/* 803E0B2C 003AA0EC  41 82 00 0C */	beq lbl_803E0B38
/* 803E0B30 003AA0F0  C0 3F 00 24 */	lfs f1, 0x24(r31)
/* 803E0B34 003AA0F4  48 00 00 18 */	b lbl_803E0B4C
lbl_803E0B38:
/* 803E0B38 003AA0F8  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 803E0B3C 003AA0FC  FC 20 F8 90 */	fmr f1, f31
/* 803E0B40 003AA100  7C 7F 02 14 */	add r3, r31, r0
/* 803E0B44 003AA104  38 63 00 24 */	addi r3, r3, 0x24
/* 803E0B48 003AA108  4B FF CF 61 */	bl func_803DDAA8
lbl_803E0B4C:
/* 803E0B4C 003AA10C  2C 18 00 00 */	cmpwi r24, 0
/* 803E0B50 003AA110  D0 3A 00 0C */	stfs f1, 0xc(r26)
/* 803E0B54 003AA114  41 82 00 0C */	beq lbl_803E0B60
/* 803E0B58 003AA118  C0 3F 00 28 */	lfs f1, 0x28(r31)
/* 803E0B5C 003AA11C  48 00 00 18 */	b lbl_803E0B74
lbl_803E0B60:
/* 803E0B60 003AA120  80 1F 00 28 */	lwz r0, 0x28(r31)
/* 803E0B64 003AA124  FC 20 F8 90 */	fmr f1, f31
/* 803E0B68 003AA128  7C 7F 02 14 */	add r3, r31, r0
/* 803E0B6C 003AA12C  38 63 00 28 */	addi r3, r3, 0x28
/* 803E0B70 003AA130  4B FF CF 39 */	bl func_803DDAA8
lbl_803E0B74:
/* 803E0B74 003AA134  2C 17 00 00 */	cmpwi r23, 0
/* 803E0B78 003AA138  D0 3A 00 10 */	stfs f1, 0x10(r26)
/* 803E0B7C 003AA13C  41 82 00 0C */	beq lbl_803E0B88
/* 803E0B80 003AA140  C0 3F 00 2C */	lfs f1, 0x2c(r31)
/* 803E0B84 003AA144  48 00 00 18 */	b lbl_803E0B9C
lbl_803E0B88:
/* 803E0B88 003AA148  80 1F 00 2C */	lwz r0, 0x2c(r31)
/* 803E0B8C 003AA14C  FC 20 F8 90 */	fmr f1, f31
/* 803E0B90 003AA150  7C 7F 02 14 */	add r3, r31, r0
/* 803E0B94 003AA154  38 63 00 2C */	addi r3, r3, 0x2c
/* 803E0B98 003AA158  4B FF CF 11 */	bl func_803DDAA8
lbl_803E0B9C:
/* 803E0B9C 003AA15C  2C 1D 00 00 */	cmpwi r29, 0
/* 803E0BA0 003AA160  D0 3A 00 14 */	stfs f1, 0x14(r26)
/* 803E0BA4 003AA164  41 82 00 0C */	beq lbl_803E0BB0
/* 803E0BA8 003AA168  C0 3F 00 30 */	lfs f1, 0x30(r31)
/* 803E0BAC 003AA16C  48 00 00 18 */	b lbl_803E0BC4
lbl_803E0BB0:
/* 803E0BB0 003AA170  80 1F 00 30 */	lwz r0, 0x30(r31)
/* 803E0BB4 003AA174  FC 20 F8 90 */	fmr f1, f31
/* 803E0BB8 003AA178  7C 7F 02 14 */	add r3, r31, r0
/* 803E0BBC 003AA17C  38 63 00 30 */	addi r3, r3, 0x30
/* 803E0BC0 003AA180  4B FF CE E9 */	bl func_803DDAA8
lbl_803E0BC4:
/* 803E0BC4 003AA184  2C 1C 00 00 */	cmpwi r28, 0
/* 803E0BC8 003AA188  D0 3A 00 18 */	stfs f1, 0x18(r26)
/* 803E0BCC 003AA18C  41 82 00 0C */	beq lbl_803E0BD8
/* 803E0BD0 003AA190  C0 3F 00 34 */	lfs f1, 0x34(r31)
/* 803E0BD4 003AA194  48 00 00 18 */	b lbl_803E0BEC
lbl_803E0BD8:
/* 803E0BD8 003AA198  80 1F 00 34 */	lwz r0, 0x34(r31)
/* 803E0BDC 003AA19C  FC 20 F8 90 */	fmr f1, f31
/* 803E0BE0 003AA1A0  7C 7F 02 14 */	add r3, r31, r0
/* 803E0BE4 003AA1A4  38 63 00 34 */	addi r3, r3, 0x34
/* 803E0BE8 003AA1A8  4B FF CE C1 */	bl func_803DDAA8
lbl_803E0BEC:
/* 803E0BEC 003AA1AC  2C 1B 00 01 */	cmpwi r27, 1
/* 803E0BF0 003AA1B0  D0 3A 00 1C */	stfs f1, 0x1c(r26)
/* 803E0BF4 003AA1B4  41 82 00 98 */	beq lbl_803E0C8C
/* 803E0BF8 003AA1B8  40 80 01 40 */	bge lbl_803E0D38
/* 803E0BFC 003AA1BC  2C 1B 00 00 */	cmpwi r27, 0
/* 803E0C00 003AA1C0  40 80 00 08 */	bge lbl_803E0C08
/* 803E0C04 003AA1C4  48 00 01 34 */	b lbl_803E0D38
lbl_803E0C08:
/* 803E0C08 003AA1C8  57 C0 00 85 */	rlwinm. r0, r30, 0, 2, 2
/* 803E0C0C 003AA1CC  57 D7 17 FE */	rlwinm r23, r30, 2, 0x1f, 0x1f
/* 803E0C10 003AA1D0  57 D8 0F FE */	srwi r24, r30, 0x1f
/* 803E0C14 003AA1D4  41 82 00 0C */	beq lbl_803E0C20
/* 803E0C18 003AA1D8  C0 3F 00 38 */	lfs f1, 0x38(r31)
/* 803E0C1C 003AA1DC  48 00 00 18 */	b lbl_803E0C34
lbl_803E0C20:
/* 803E0C20 003AA1E0  80 1F 00 38 */	lwz r0, 0x38(r31)
/* 803E0C24 003AA1E4  FC 20 F8 90 */	fmr f1, f31
/* 803E0C28 003AA1E8  7C 7F 02 14 */	add r3, r31, r0
/* 803E0C2C 003AA1EC  38 63 00 38 */	addi r3, r3, 0x38
/* 803E0C30 003AA1F0  4B FF CE 79 */	bl func_803DDAA8
lbl_803E0C34:
/* 803E0C34 003AA1F4  2C 17 00 00 */	cmpwi r23, 0
/* 803E0C38 003AA1F8  D0 3A 00 20 */	stfs f1, 0x20(r26)
/* 803E0C3C 003AA1FC  41 82 00 0C */	beq lbl_803E0C48
/* 803E0C40 003AA200  C0 3F 00 3C */	lfs f1, 0x3c(r31)
/* 803E0C44 003AA204  48 00 00 18 */	b lbl_803E0C5C
lbl_803E0C48:
/* 803E0C48 003AA208  80 1F 00 3C */	lwz r0, 0x3c(r31)
/* 803E0C4C 003AA20C  FC 20 F8 90 */	fmr f1, f31
/* 803E0C50 003AA210  7C 7F 02 14 */	add r3, r31, r0
/* 803E0C54 003AA214  38 63 00 3C */	addi r3, r3, 0x3c
/* 803E0C58 003AA218  4B FF CE 51 */	bl func_803DDAA8
lbl_803E0C5C:
/* 803E0C5C 003AA21C  2C 18 00 00 */	cmpwi r24, 0
/* 803E0C60 003AA220  D0 3A 00 24 */	stfs f1, 0x24(r26)
/* 803E0C64 003AA224  41 82 00 0C */	beq lbl_803E0C70
/* 803E0C68 003AA228  C0 3F 00 40 */	lfs f1, 0x40(r31)
/* 803E0C6C 003AA22C  48 00 00 18 */	b lbl_803E0C84
lbl_803E0C70:
/* 803E0C70 003AA230  80 1F 00 40 */	lwz r0, 0x40(r31)
/* 803E0C74 003AA234  FC 20 F8 90 */	fmr f1, f31
/* 803E0C78 003AA238  7C 7F 02 14 */	add r3, r31, r0
/* 803E0C7C 003AA23C  38 63 00 40 */	addi r3, r3, 0x40
/* 803E0C80 003AA240  4B FF CE 29 */	bl func_803DDAA8
lbl_803E0C84:
/* 803E0C84 003AA244  D0 3A 00 28 */	stfs f1, 0x28(r26)
/* 803E0C88 003AA248  48 00 00 B0 */	b lbl_803E0D38
lbl_803E0C8C:
/* 803E0C8C 003AA24C  57 C0 01 8D */	rlwinm. r0, r30, 0, 6, 6
/* 803E0C90 003AA250  57 D7 37 FE */	rlwinm r23, r30, 6, 0x1f, 0x1f
/* 803E0C94 003AA254  57 D8 2F FE */	rlwinm r24, r30, 5, 0x1f, 0x1f
/* 803E0C98 003AA258  57 D9 27 FE */	rlwinm r25, r30, 4, 0x1f, 0x1f
/* 803E0C9C 003AA25C  41 82 00 0C */	beq lbl_803E0CA8
/* 803E0CA0 003AA260  C0 3F 00 44 */	lfs f1, 0x44(r31)
/* 803E0CA4 003AA264  48 00 00 18 */	b lbl_803E0CBC
lbl_803E0CA8:
/* 803E0CA8 003AA268  80 1F 00 44 */	lwz r0, 0x44(r31)
/* 803E0CAC 003AA26C  FC 20 F8 90 */	fmr f1, f31
/* 803E0CB0 003AA270  7C 7F 02 14 */	add r3, r31, r0
/* 803E0CB4 003AA274  38 63 00 44 */	addi r3, r3, 0x44
/* 803E0CB8 003AA278  4B FF CD F1 */	bl func_803DDAA8
lbl_803E0CBC:
/* 803E0CBC 003AA27C  2C 17 00 00 */	cmpwi r23, 0
/* 803E0CC0 003AA280  D0 3A 00 20 */	stfs f1, 0x20(r26)
/* 803E0CC4 003AA284  41 82 00 0C */	beq lbl_803E0CD0
/* 803E0CC8 003AA288  C0 3F 00 48 */	lfs f1, 0x48(r31)
/* 803E0CCC 003AA28C  48 00 00 18 */	b lbl_803E0CE4
lbl_803E0CD0:
/* 803E0CD0 003AA290  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 803E0CD4 003AA294  FC 20 F8 90 */	fmr f1, f31
/* 803E0CD8 003AA298  7C 7F 02 14 */	add r3, r31, r0
/* 803E0CDC 003AA29C  38 63 00 48 */	addi r3, r3, 0x48
/* 803E0CE0 003AA2A0  4B FF CD C9 */	bl func_803DDAA8
lbl_803E0CE4:
/* 803E0CE4 003AA2A4  2C 18 00 00 */	cmpwi r24, 0
/* 803E0CE8 003AA2A8  D0 3A 00 24 */	stfs f1, 0x24(r26)
/* 803E0CEC 003AA2AC  41 82 00 0C */	beq lbl_803E0CF8
/* 803E0CF0 003AA2B0  C0 3F 00 4C */	lfs f1, 0x4c(r31)
/* 803E0CF4 003AA2B4  48 00 00 18 */	b lbl_803E0D0C
lbl_803E0CF8:
/* 803E0CF8 003AA2B8  80 1F 00 4C */	lwz r0, 0x4c(r31)
/* 803E0CFC 003AA2BC  FC 20 F8 90 */	fmr f1, f31
/* 803E0D00 003AA2C0  7C 7F 02 14 */	add r3, r31, r0
/* 803E0D04 003AA2C4  38 63 00 4C */	addi r3, r3, 0x4c
/* 803E0D08 003AA2C8  4B FF CD A1 */	bl func_803DDAA8
lbl_803E0D0C:
/* 803E0D0C 003AA2CC  2C 19 00 00 */	cmpwi r25, 0
/* 803E0D10 003AA2D0  D0 3A 00 28 */	stfs f1, 0x28(r26)
/* 803E0D14 003AA2D4  41 82 00 0C */	beq lbl_803E0D20
/* 803E0D18 003AA2D8  C0 3F 00 50 */	lfs f1, 0x50(r31)
/* 803E0D1C 003AA2DC  48 00 00 18 */	b lbl_803E0D34
lbl_803E0D20:
/* 803E0D20 003AA2E0  80 1F 00 50 */	lwz r0, 0x50(r31)
/* 803E0D24 003AA2E4  FC 20 F8 90 */	fmr f1, f31
/* 803E0D28 003AA2E8  7C 7F 02 14 */	add r3, r31, r0
/* 803E0D2C 003AA2EC  38 63 00 50 */	addi r3, r3, 0x50
/* 803E0D30 003AA2F0  4B FF CD 79 */	bl func_803DDAA8
lbl_803E0D34:
/* 803E0D34 003AA2F4  D0 3A 00 2C */	stfs f1, 0x2c(r26)
lbl_803E0D38:
/* 803E0D38 003AA2F8  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 803E0D3C 003AA2FC  2C 00 00 01 */	cmpwi r0, 1
/* 803E0D40 003AA300  41 82 00 40 */	beq lbl_803E0D80
/* 803E0D44 003AA304  40 80 00 64 */	bge lbl_803E0DA8
/* 803E0D48 003AA308  2C 00 00 00 */	cmpwi r0, 0
/* 803E0D4C 003AA30C  40 80 00 08 */	bge lbl_803E0D54
/* 803E0D50 003AA310  48 00 00 58 */	b lbl_803E0DA8
lbl_803E0D54:
/* 803E0D54 003AA314  57 C0 02 11 */	rlwinm. r0, r30, 0, 8, 8
/* 803E0D58 003AA318  41 82 00 0C */	beq lbl_803E0D64
/* 803E0D5C 003AA31C  C0 3F 00 54 */	lfs f1, 0x54(r31)
/* 803E0D60 003AA320  48 00 00 18 */	b lbl_803E0D78
lbl_803E0D64:
/* 803E0D64 003AA324  80 1F 00 54 */	lwz r0, 0x54(r31)
/* 803E0D68 003AA328  FC 20 F8 90 */	fmr f1, f31
/* 803E0D6C 003AA32C  7C 7F 02 14 */	add r3, r31, r0
/* 803E0D70 003AA330  38 63 00 54 */	addi r3, r3, 0x54
/* 803E0D74 003AA334  4B FF CD 35 */	bl func_803DDAA8
lbl_803E0D78:
/* 803E0D78 003AA338  D0 3A 00 30 */	stfs f1, 0x30(r26)
/* 803E0D7C 003AA33C  48 00 00 2C */	b lbl_803E0DA8
lbl_803E0D80:
/* 803E0D80 003AA340  57 C0 01 CF */	rlwinm. r0, r30, 0, 7, 7
/* 803E0D84 003AA344  41 82 00 0C */	beq lbl_803E0D90
/* 803E0D88 003AA348  C0 3F 00 58 */	lfs f1, 0x58(r31)
/* 803E0D8C 003AA34C  48 00 00 18 */	b lbl_803E0DA4
lbl_803E0D90:
/* 803E0D90 003AA350  80 1F 00 58 */	lwz r0, 0x58(r31)
/* 803E0D94 003AA354  FC 20 F8 90 */	fmr f1, f31
/* 803E0D98 003AA358  7C 7F 02 14 */	add r3, r31, r0
/* 803E0D9C 003AA35C  38 63 00 58 */	addi r3, r3, 0x58
/* 803E0DA0 003AA360  4B FF CD 09 */	bl func_803DDAA8
lbl_803E0DA4:
/* 803E0DA4 003AA364  D0 3A 00 30 */	stfs f1, 0x30(r26)
lbl_803E0DA8:
/* 803E0DA8 003AA368  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 803E0DAC 003AA36C  39 61 00 30 */	addi r11, r1, 0x30
/* 803E0DB0 003AA370  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 803E0DB4 003AA374  4B ED 93 DD */	bl func_802BA190
/* 803E0DB8 003AA378  80 01 00 44 */	lwz r0, 0x44(r1)
/* 803E0DBC 003AA37C  7C 08 03 A6 */	mtlr r0
/* 803E0DC0 003AA380  38 21 00 40 */	addi r1, r1, 0x40
/* 803E0DC4 003AA384  4E 80 00 20 */	blr 