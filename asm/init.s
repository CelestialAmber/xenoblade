.include "macros.inc"

.section .init, "ax"  # 0x80004000 - 0x800066E0

.global func_80004000
func_80004000:
/* 80004000 00000100  28 85 00 00 */	cmplwi cr1, r5, 0
/* 80004004 00000104  4D 86 00 20 */	beqlr cr1
/* 80004008 00000108  7C 84 18 40 */	cmplw cr1, r4, r3
/* 8000400C 0000010C  41 84 01 6C */	blt cr1, lbl_80004178
/* 80004010 00000110  4D 86 00 20 */	beqlr cr1
/* 80004014 00000114  38 C0 00 80 */	li r6, 0x80
/* 80004018 00000118  7E 85 30 40 */	cmplw cr5, r5, r6
/* 8000401C 0000011C  41 94 00 A4 */	blt cr5, lbl_800040C0
/* 80004020 00000120  54 89 07 7E */	clrlwi r9, r4, 0x1d
/* 80004024 00000124  54 6A 07 7E */	clrlwi r10, r3, 0x1d
/* 80004028 00000128  7D 0A 18 50 */	subf r8, r10, r3
/* 8000402C 0000012C  7C 00 22 2C */	dcbt 0, r4
/* 80004030 00000130  7D 4B 4A 79 */	xor. r11, r10, r9
/* 80004034 00000134  40 82 01 28 */	bne lbl_8000415C
/* 80004038 00000138  71 4A 00 07 */	andi. r10, r10, 7
/* 8000403C 0000013C  41 A2 00 2C */	beq+ lbl_80004068
/* 80004040 00000140  38 C0 00 08 */	li r6, 8
/* 80004044 00000144  7D 29 30 50 */	subf r9, r9, r6
/* 80004048 00000148  39 03 00 00 */	addi r8, r3, 0
/* 8000404C 0000014C  7D 29 03 A6 */	mtctr r9
/* 80004050 00000150  7C A9 28 50 */	subf r5, r9, r5
lbl_80004054:
/* 80004054 00000154  89 24 00 00 */	lbz r9, 0(r4)
/* 80004058 00000158  38 84 00 01 */	addi r4, r4, 1
/* 8000405C 0000015C  99 28 00 00 */	stb r9, 0(r8)
/* 80004060 00000160  39 08 00 01 */	addi r8, r8, 1
/* 80004064 00000164  42 00 FF F0 */	bdnz lbl_80004054
lbl_80004068:
/* 80004068 00000168  54 A6 D9 7E */	srwi r6, r5, 5
/* 8000406C 0000016C  7C C9 03 A6 */	mtctr r6
lbl_80004070:
/* 80004070 00000170  C8 24 00 00 */	lfd f1, 0(r4)
/* 80004074 00000174  C8 44 00 08 */	lfd f2, 8(r4)
/* 80004078 00000178  C8 64 00 10 */	lfd f3, 0x10(r4)
/* 8000407C 0000017C  C8 84 00 18 */	lfd f4, 0x18(r4)
/* 80004080 00000180  38 84 00 20 */	addi r4, r4, 0x20
/* 80004084 00000184  D8 28 00 00 */	stfd f1, 0(r8)
/* 80004088 00000188  D8 48 00 08 */	stfd f2, 8(r8)
/* 8000408C 0000018C  D8 68 00 10 */	stfd f3, 0x10(r8)
/* 80004090 00000190  D8 88 00 18 */	stfd f4, 0x18(r8)
/* 80004094 00000194  39 08 00 20 */	addi r8, r8, 0x20
/* 80004098 00000198  42 00 FF D8 */	bdnz lbl_80004070
/* 8000409C 0000019C  70 A6 00 1F */	andi. r6, r5, 0x1f
/* 800040A0 000001A0  4D 82 00 20 */	beqlr 
/* 800040A4 000001A4  38 84 FF FF */	addi r4, r4, -1
/* 800040A8 000001A8  7C C9 03 A6 */	mtctr r6
/* 800040AC 000001AC  39 08 FF FF */	addi r8, r8, -1
lbl_800040B0:
/* 800040B0 000001B0  8D 24 00 01 */	lbzu r9, 1(r4)
/* 800040B4 000001B4  9D 28 00 01 */	stbu r9, 1(r8)
/* 800040B8 000001B8  42 00 FF F8 */	bdnz lbl_800040B0
/* 800040BC 000001BC  4E 80 00 20 */	blr 
lbl_800040C0:
/* 800040C0 000001C0  38 C0 00 14 */	li r6, 0x14
/* 800040C4 000001C4  7E 85 30 40 */	cmplw cr5, r5, r6
/* 800040C8 000001C8  40 95 00 94 */	ble cr5, lbl_8000415C
/* 800040CC 000001CC  54 89 07 BE */	clrlwi r9, r4, 0x1e
/* 800040D0 000001D0  54 6A 07 BE */	clrlwi r10, r3, 0x1e
/* 800040D4 000001D4  7D 4B 4A 79 */	xor. r11, r10, r9
/* 800040D8 000001D8  40 82 00 84 */	bne lbl_8000415C
/* 800040DC 000001DC  38 C0 00 04 */	li r6, 4
/* 800040E0 000001E0  7D 29 30 50 */	subf r9, r9, r6
/* 800040E4 000001E4  39 03 00 00 */	addi r8, r3, 0
/* 800040E8 000001E8  7C A9 28 50 */	subf r5, r9, r5
/* 800040EC 000001EC  7D 29 03 A6 */	mtctr r9
lbl_800040F0:
/* 800040F0 000001F0  89 24 00 00 */	lbz r9, 0(r4)
/* 800040F4 000001F4  38 84 00 01 */	addi r4, r4, 1
/* 800040F8 000001F8  99 28 00 00 */	stb r9, 0(r8)
/* 800040FC 000001FC  39 08 00 01 */	addi r8, r8, 1
/* 80004100 00000200  42 00 FF F0 */	bdnz lbl_800040F0
/* 80004104 00000204  54 A6 E1 3E */	srwi r6, r5, 4
/* 80004108 00000208  7C C9 03 A6 */	mtctr r6
lbl_8000410C:
/* 8000410C 0000020C  81 24 00 00 */	lwz r9, 0(r4)
/* 80004110 00000210  81 44 00 04 */	lwz r10, 4(r4)
/* 80004114 00000214  81 64 00 08 */	lwz r11, 8(r4)
/* 80004118 00000218  81 84 00 0C */	lwz r12, 0xc(r4)
/* 8000411C 0000021C  38 84 00 10 */	addi r4, r4, 0x10
/* 80004120 00000220  91 28 00 00 */	stw r9, 0(r8)
/* 80004124 00000224  91 48 00 04 */	stw r10, 4(r8)
/* 80004128 00000228  91 68 00 08 */	stw r11, 8(r8)
/* 8000412C 0000022C  91 88 00 0C */	stw r12, 0xc(r8)
/* 80004130 00000230  39 08 00 10 */	addi r8, r8, 0x10
/* 80004134 00000234  42 00 FF D8 */	bdnz lbl_8000410C
/* 80004138 00000238  70 A6 00 0F */	andi. r6, r5, 0xf
/* 8000413C 0000023C  4D 82 00 20 */	beqlr 
/* 80004140 00000240  38 84 FF FF */	addi r4, r4, -1
/* 80004144 00000244  7C C9 03 A6 */	mtctr r6
/* 80004148 00000248  39 08 FF FF */	addi r8, r8, -1
lbl_8000414C:
/* 8000414C 0000024C  8D 24 00 01 */	lbzu r9, 1(r4)
/* 80004150 00000250  9D 28 00 01 */	stbu r9, 1(r8)
/* 80004154 00000254  42 00 FF F8 */	bdnz lbl_8000414C
/* 80004158 00000258  4E 80 00 20 */	blr 
lbl_8000415C:
/* 8000415C 0000025C  38 E4 FF FF */	addi r7, r4, -1
/* 80004160 00000260  39 03 FF FF */	addi r8, r3, -1
/* 80004164 00000264  7C A9 03 A6 */	mtctr r5
lbl_80004168:
/* 80004168 00000268  8D 27 00 01 */	lbzu r9, 1(r7)
/* 8000416C 0000026C  9D 28 00 01 */	stbu r9, 1(r8)
/* 80004170 00000270  42 00 FF F8 */	bdnz lbl_80004168
/* 80004174 00000274  4E 80 00 20 */	blr 
lbl_80004178:
/* 80004178 00000278  7C 84 2A 14 */	add r4, r4, r5
/* 8000417C 0000027C  7D 83 2A 14 */	add r12, r3, r5
/* 80004180 00000280  38 C0 00 80 */	li r6, 0x80
/* 80004184 00000284  7E 85 30 40 */	cmplw cr5, r5, r6
/* 80004188 00000288  41 94 00 7C */	blt cr5, lbl_80004204
/* 8000418C 0000028C  54 89 07 7E */	clrlwi r9, r4, 0x1d
/* 80004190 00000290  55 8A 07 7E */	clrlwi r10, r12, 0x1d
/* 80004194 00000294  7D 4B 4A 79 */	xor. r11, r10, r9
/* 80004198 00000298  40 82 00 F0 */	bne lbl_80004288
/* 8000419C 0000029C  71 4A 00 07 */	andi. r10, r10, 7
/* 800041A0 000002A0  41 A2 00 14 */	beq+ lbl_800041B4
/* 800041A4 000002A4  7D 49 03 A6 */	mtctr r10
lbl_800041A8:
/* 800041A8 000002A8  8D 24 FF FF */	lbzu r9, -1(r4)
/* 800041AC 000002AC  9D 2C FF FF */	stbu r9, -1(r12)
/* 800041B0 000002B0  42 00 FF F8 */	bdnz lbl_800041A8
lbl_800041B4:
/* 800041B4 000002B4  7C AA 28 50 */	subf r5, r10, r5
/* 800041B8 000002B8  54 A6 D9 7E */	srwi r6, r5, 5
/* 800041BC 000002BC  7C C9 03 A6 */	mtctr r6
lbl_800041C0:
/* 800041C0 000002C0  C8 24 FF F8 */	lfd f1, -8(r4)
/* 800041C4 000002C4  C8 44 FF F0 */	lfd f2, -0x10(r4)
/* 800041C8 000002C8  C8 64 FF E8 */	lfd f3, -0x18(r4)
/* 800041CC 000002CC  C8 84 FF E0 */	lfd f4, -0x20(r4)
/* 800041D0 000002D0  38 84 FF E0 */	addi r4, r4, -32
/* 800041D4 000002D4  D8 2C FF F8 */	stfd f1, -8(r12)
/* 800041D8 000002D8  D8 4C FF F0 */	stfd f2, -0x10(r12)
/* 800041DC 000002DC  D8 6C FF E8 */	stfd f3, -0x18(r12)
/* 800041E0 000002E0  DC 8C FF E0 */	stfdu f4, -0x20(r12)
/* 800041E4 000002E4  42 00 FF DC */	bdnz lbl_800041C0
/* 800041E8 000002E8  70 A6 00 1F */	andi. r6, r5, 0x1f
/* 800041EC 000002EC  4D 82 00 20 */	beqlr 
/* 800041F0 000002F0  7C C9 03 A6 */	mtctr r6
lbl_800041F4:
/* 800041F4 000002F4  8D 24 FF FF */	lbzu r9, -1(r4)
/* 800041F8 000002F8  9D 2C FF FF */	stbu r9, -1(r12)
/* 800041FC 000002FC  42 00 FF F8 */	bdnz lbl_800041F4
/* 80004200 00000300  4E 80 00 20 */	blr 
lbl_80004204:
/* 80004204 00000304  38 C0 00 14 */	li r6, 0x14
/* 80004208 00000308  7E 85 30 40 */	cmplw cr5, r5, r6
/* 8000420C 0000030C  40 95 00 7C */	ble cr5, lbl_80004288
/* 80004210 00000310  54 89 07 BE */	clrlwi r9, r4, 0x1e
/* 80004214 00000314  55 8A 07 BE */	clrlwi r10, r12, 0x1e
/* 80004218 00000318  7D 4B 4A 79 */	xor. r11, r10, r9
/* 8000421C 0000031C  40 82 00 6C */	bne lbl_80004288
/* 80004220 00000320  71 4A 00 07 */	andi. r10, r10, 7
/* 80004224 00000324  41 A2 00 14 */	beq+ lbl_80004238
/* 80004228 00000328  7D 49 03 A6 */	mtctr r10
lbl_8000422C:
/* 8000422C 0000032C  8D 24 FF FF */	lbzu r9, -1(r4)
/* 80004230 00000330  9D 2C FF FF */	stbu r9, -1(r12)
/* 80004234 00000334  42 00 FF F8 */	bdnz lbl_8000422C
lbl_80004238:
/* 80004238 00000338  7C AA 28 50 */	subf r5, r10, r5
/* 8000423C 0000033C  54 A6 E1 3E */	srwi r6, r5, 4
/* 80004240 00000340  7C C9 03 A6 */	mtctr r6
lbl_80004244:
/* 80004244 00000344  81 24 FF FC */	lwz r9, -4(r4)
/* 80004248 00000348  81 44 FF F8 */	lwz r10, -8(r4)
/* 8000424C 0000034C  81 64 FF F4 */	lwz r11, -0xc(r4)
/* 80004250 00000350  81 04 FF F0 */	lwz r8, -0x10(r4)
/* 80004254 00000354  38 84 FF F0 */	addi r4, r4, -16
/* 80004258 00000358  91 2C FF FC */	stw r9, -4(r12)
/* 8000425C 0000035C  91 4C FF F8 */	stw r10, -8(r12)
/* 80004260 00000360  91 6C FF F4 */	stw r11, -0xc(r12)
/* 80004264 00000364  95 0C FF F0 */	stwu r8, -0x10(r12)
/* 80004268 00000368  42 00 FF DC */	bdnz lbl_80004244
/* 8000426C 0000036C  70 A6 00 0F */	andi. r6, r5, 0xf
/* 80004270 00000370  4D 82 00 20 */	beqlr 
/* 80004274 00000374  7C C9 03 A6 */	mtctr r6
lbl_80004278:
/* 80004278 00000378  8D 24 FF FF */	lbzu r9, -1(r4)
/* 8000427C 0000037C  9D 2C FF FF */	stbu r9, -1(r12)
/* 80004280 00000380  42 00 FF F8 */	bdnz lbl_80004278
/* 80004284 00000384  4E 80 00 20 */	blr 
lbl_80004288:
/* 80004288 00000388  7C A9 03 A6 */	mtctr r5
lbl_8000428C:
/* 8000428C 0000038C  8D 24 FF FF */	lbzu r9, -1(r4)
/* 80004290 00000390  9D 2C FF FF */	stbu r9, -1(r12)
/* 80004294 00000394  42 00 FF F8 */	bdnz lbl_8000428C
/* 80004298 00000398  4E 80 00 20 */	blr 

.global func_8000429C
func_8000429C:
/* 8000429C 0000039C  28 05 00 20 */	cmplwi r5, 0x20
/* 800042A0 000003A0  54 87 06 3E */	clrlwi r7, r4, 0x18
/* 800042A4 000003A4  38 C3 FF FF */	addi r6, r3, -1
/* 800042A8 000003A8  41 80 00 90 */	blt lbl_80004338
/* 800042AC 000003AC  7C C0 30 F8 */	nor r0, r6, r6
/* 800042B0 000003B0  54 00 07 BF */	clrlwi. r0, r0, 0x1e
/* 800042B4 000003B4  41 82 00 14 */	beq lbl_800042C8
/* 800042B8 000003B8  7C A0 28 50 */	subf r5, r0, r5
lbl_800042BC:
/* 800042BC 000003BC  34 00 FF FF */	addic. r0, r0, -1
/* 800042C0 000003C0  9C E6 00 01 */	stbu r7, 1(r6)
/* 800042C4 000003C4  40 82 FF F8 */	bne lbl_800042BC
lbl_800042C8:
/* 800042C8 000003C8  2C 07 00 00 */	cmpwi r7, 0
/* 800042CC 000003CC  41 82 00 1C */	beq lbl_800042E8
/* 800042D0 000003D0  54 E4 40 2E */	slwi r4, r7, 8
/* 800042D4 000003D4  54 E3 C0 0E */	slwi r3, r7, 0x18
/* 800042D8 000003D8  54 E0 80 1E */	slwi r0, r7, 0x10
/* 800042DC 000003DC  7C E4 23 78 */	or r4, r7, r4
/* 800042E0 000003E0  7C 60 03 78 */	or r0, r3, r0
/* 800042E4 000003E4  7C 87 03 78 */	or r7, r4, r0
lbl_800042E8:
/* 800042E8 000003E8  54 A0 D9 7F */	rlwinm. r0, r5, 0x1b, 5, 0x1f
/* 800042EC 000003EC  38 66 FF FD */	addi r3, r6, -3
/* 800042F0 000003F0  41 82 00 2C */	beq lbl_8000431C
lbl_800042F4:
/* 800042F4 000003F4  90 E3 00 04 */	stw r7, 4(r3)
/* 800042F8 000003F8  34 00 FF FF */	addic. r0, r0, -1
/* 800042FC 000003FC  90 E3 00 08 */	stw r7, 8(r3)
/* 80004300 00000400  90 E3 00 0C */	stw r7, 0xc(r3)
/* 80004304 00000404  90 E3 00 10 */	stw r7, 0x10(r3)
/* 80004308 00000408  90 E3 00 14 */	stw r7, 0x14(r3)
/* 8000430C 0000040C  90 E3 00 18 */	stw r7, 0x18(r3)
/* 80004310 00000410  90 E3 00 1C */	stw r7, 0x1c(r3)
/* 80004314 00000414  94 E3 00 20 */	stwu r7, 0x20(r3)
/* 80004318 00000418  40 82 FF DC */	bne lbl_800042F4
lbl_8000431C:
/* 8000431C 0000041C  54 A0 F7 7F */	rlwinm. r0, r5, 0x1e, 0x1d, 0x1f
/* 80004320 00000420  41 82 00 10 */	beq lbl_80004330
lbl_80004324:
/* 80004324 00000424  34 00 FF FF */	addic. r0, r0, -1
/* 80004328 00000428  94 E3 00 04 */	stwu r7, 4(r3)
/* 8000432C 0000042C  40 82 FF F8 */	bne lbl_80004324
lbl_80004330:
/* 80004330 00000430  38 C3 00 03 */	addi r6, r3, 3
/* 80004334 00000434  54 A5 07 BE */	clrlwi r5, r5, 0x1e
lbl_80004338:
/* 80004338 00000438  2C 05 00 00 */	cmpwi r5, 0
/* 8000433C 0000043C  4D 82 00 20 */	beqlr 
lbl_80004340:
/* 80004340 00000440  34 A5 FF FF */	addic. r5, r5, -1
/* 80004344 00000444  9C E6 00 01 */	stbu r7, 1(r6)
/* 80004348 00000448  40 82 FF F8 */	bne lbl_80004340
/* 8000434C 0000044C  4E 80 00 20 */	blr 

.global func_80004350
func_80004350:
/* 80004350 00000450  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80004354 00000454  7C 08 02 A6 */	mflr r0
/* 80004358 00000458  90 01 00 14 */	stw r0, 0x14(r1)
/* 8000435C 0000045C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80004360 00000460  7C 7F 1B 78 */	mr r31, r3
/* 80004364 00000464  4B FF FF 39 */	bl func_8000429C
/* 80004368 00000468  7F E3 FB 78 */	mr r3, r31
/* 8000436C 0000046C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80004370 00000470  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80004374 00000474  7C 08 03 A6 */	mtlr r0
/* 80004378 00000478  38 21 00 10 */	addi r1, r1, 0x10
/* 8000437C 0000047C  4E 80 00 20 */	blr 

.global lbl_80004380

lbl_80004380:

	# ROM: 0x480
	.4byte 0x4D657472
	.4byte 0x6F776572
	.4byte 0x6B732054
	.4byte 0x61726765
	.4byte 0x74205265
	.4byte 0x73696465
	.4byte 0x6E74204B
	.4byte 0x65726E65
	.4byte 0x6C20666F
	.4byte 0x7220506F
	.4byte 0x77657250


.global lbl_800043AC

lbl_800043AC:

	# ROM: 0x4AC
	.4byte 0x43000000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x482C7D94
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C5A02A6
	.4byte 0x7C0017AC
	.4byte 0x7C5302A6
	.4byte 0x7C0013AC
	.4byte 0x7C5142A6
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600200
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600300
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600400
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600500
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600600
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600700
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600800
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600900
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600C00
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600D00
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600E00
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x48000054
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600F20
	.4byte 0x4C000064


.global lbl_800052D4

lbl_800052D4:

	# ROM: 0x13D4
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38600F00
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C400026
	.4byte 0x7C5243A6
	.4byte 0x7C4000A6
	.4byte 0x74420002
	.4byte 0x4182001C
	.4byte 0x7C4000A6
	.4byte 0x6C420002
	.4byte 0x7C0004AC
	.4byte 0x7C400124
	.4byte 0x7C0004AC
	.4byte 0x7C5143A6


.global lbl_800053B0

lbl_800053B0:

	# ROM: 0x14B0
	.4byte 0x7C5242A6
	.4byte 0x7C4FF120
	.4byte 0x7C5142A6
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601000
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C400026
	.4byte 0x7C5243A6
	.4byte 0x7C4000A6
	.4byte 0x74420002
	.4byte 0x4182001C
	.4byte 0x7C4000A6
	.4byte 0x6C420002
	.4byte 0x7C0004AC
	.4byte 0x7C400124
	.4byte 0x7C0004AC
	.4byte 0x7C5143A6


.global lbl_800054B0

lbl_800054B0:

	# ROM: 0x15B0
	.4byte 0x7C5242A6
	.4byte 0x7C4FF120
	.4byte 0x7C5142A6
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601100
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C400026
	.4byte 0x7C5243A6
	.4byte 0x7C4000A6
	.4byte 0x74420002
	.4byte 0x4182001C
	.4byte 0x7C4000A6
	.4byte 0x6C420002
	.4byte 0x7C0004AC
	.4byte 0x7C400124
	.4byte 0x7C0004AC
	.4byte 0x7C5143A6


.global lbl_800055B0

lbl_800055B0:

	# ROM: 0x16B0
	.4byte 0x7C5242A6
	.4byte 0x7C4FF120
	.4byte 0x7C5142A6
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601200
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601300
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601400
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601600
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601700
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601C00
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601D00
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601E00
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x7C5143A6
	.4byte 0x7C7243A6
	.4byte 0x7C9343A6
	.4byte 0x7C5A02A6
	.4byte 0x7C9B02A6
	.4byte 0x7C6000A6
	.4byte 0x60630030
	.4byte 0x7C7B03A6
	.4byte 0x3C60802C
	.4byte 0x6063F5CC
	.4byte 0x7C7A03A6
	.4byte 0x38601F00
	.4byte 0x4C000064
	.4byte 0
	.4byte 0
	.4byte 0


.global func_800062C0
func_800062C0:
/* 800062C0 000023C0  3C 60 80 00 */	lis r3, 0x800030E4@ha
/* 800062C4 000023C4  A0 03 30 E4 */	lhz r0, 0x800030E4@l(r3)
/* 800062C8 000023C8  70 00 0E EF */	andi. r0, r0, 0xeef
/* 800062CC 000023CC  2C 00 0E EF */	cmpwi r0, 0xeef
/* 800062D0 000023D0  4C 82 00 20 */	bnelr 
/* 800062D4 000023D4  38 60 00 00 */	li r3, 0
/* 800062D8 000023D8  38 80 00 00 */	li r4, 0
/* 800062DC 000023DC  38 A0 00 00 */	li r5, 0
/* 800062E0 000023E0  48 35 45 00 */	b lbl_8035A7E0
/* 800062E4 000023E4  4E 80 00 20 */	blr 
/* 800062E8 000023E8  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800062EC 000023EC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_800062F0
func_800062F0:
/* 800062F0 000023F0  38 00 00 01 */	li r0, 1
/* 800062F4 000023F4  98 0D B9 80 */	stb r0, -0x4680(r13)
/* 800062F8 000023F8  4E 80 00 20 */	blr 
/* 800062FC 000023FC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_80006300
func_80006300:
/* 80006300 00002400  88 6D B9 80 */	lbz r3, -0x4680(r13)
/* 80006304 00002404  4E 80 00 20 */	blr 
/* 80006308 00002408  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 8000630C 0000240C  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global __start
__start:
/* 80006310 00002410  48 00 01 71 */	bl func_80006480
/* 80006314 00002414  48 00 02 AD */	bl func_800065C0
/* 80006318 00002418  38 00 FF FF */	li r0, -1
/* 8000631C 0000241C  94 21 FF F8 */	stwu r1, -8(r1)
/* 80006320 00002420  90 01 00 04 */	stw r0, 4(r1)
/* 80006324 00002424  90 01 00 00 */	stw r0, 0(r1)
/* 80006328 00002428  48 00 01 E9 */	bl func_80006510
/* 8000632C 0000242C  38 00 00 00 */	li r0, 0
/* 80006330 00002430  3C C0 80 00 */	lis r6, 0x80000044@ha
/* 80006334 00002434  38 C6 00 44 */	addi r6, r6, 0x80000044@l
/* 80006338 00002438  90 06 00 00 */	stw r0, 0(r6)
/* 8000633C 0000243C  3C C0 80 00 */	lis r6, 0x800000F4@ha
/* 80006340 00002440  38 C6 00 F4 */	addi r6, r6, 0x800000F4@l
/* 80006344 00002444  80 C6 00 00 */	lwz r6, 0(r6)
/* 80006348 00002448  28 06 00 00 */	cmplwi r6, 0
/* 8000634C 0000244C  41 82 00 0C */	beq lbl_80006358
/* 80006350 00002450  80 E6 00 0C */	lwz r7, 0xc(r6)
/* 80006354 00002454  48 00 00 24 */	b lbl_80006378
lbl_80006358:
/* 80006358 00002458  3C A0 80 00 */	lis r5, 0x80000034@ha
/* 8000635C 0000245C  38 A5 00 34 */	addi r5, r5, 0x80000034@l
/* 80006360 00002460  80 A5 00 00 */	lwz r5, 0(r5)
/* 80006364 00002464  28 05 00 00 */	cmplwi r5, 0
/* 80006368 00002468  41 82 00 4C */	beq lbl_800063B4
/* 8000636C 0000246C  3C E0 80 00 */	lis r7, 0x800030E8@ha
/* 80006370 00002470  38 E7 30 E8 */	addi r7, r7, 0x800030E8@l
/* 80006374 00002474  80 E7 00 00 */	lwz r7, 0(r7)
lbl_80006378:
/* 80006378 00002478  38 A0 00 00 */	li r5, 0
/* 8000637C 0000247C  28 07 00 02 */	cmplwi r7, 2
/* 80006380 00002480  41 82 00 24 */	beq lbl_800063A4
/* 80006384 00002484  28 07 00 03 */	cmplwi r7, 3
/* 80006388 00002488  38 A0 00 01 */	li r5, 1
/* 8000638C 0000248C  41 82 00 18 */	beq lbl_800063A4
/* 80006390 00002490  28 07 00 04 */	cmplwi r7, 4
/* 80006394 00002494  40 82 00 20 */	bne lbl_800063B4
/* 80006398 00002498  38 A0 00 02 */	li r5, 2
/* 8000639C 0000249C  4B FF FF 55 */	bl func_800062F0
/* 800063A0 000024A0  48 00 00 14 */	b lbl_800063B4
lbl_800063A4:
/* 800063A4 000024A4  3C C0 80 2D */	lis r6, lbl_802CBF00@ha
/* 800063A8 000024A8  38 C6 BF 00 */	addi r6, r6, lbl_802CBF00@l
/* 800063AC 000024AC  7C C8 03 A6 */	mtlr r6
/* 800063B0 000024B0  4E 80 00 21 */	blrl 
lbl_800063B4:
/* 800063B4 000024B4  3C C0 80 00 */	lis r6, 0x800000F4@ha
/* 800063B8 000024B8  38 C6 00 F4 */	addi r6, r6, 0x800000F4@l
/* 800063BC 000024BC  80 A6 00 00 */	lwz r5, 0(r6)
/* 800063C0 000024C0  28 05 00 00 */	cmplwi r5, 0
/* 800063C4 000024C4  41 A2 00 60 */	beq+ lbl_80006424
/* 800063C8 000024C8  80 C5 00 08 */	lwz r6, 8(r5)
/* 800063CC 000024CC  28 06 00 00 */	cmplwi r6, 0
/* 800063D0 000024D0  41 A2 00 54 */	beq+ lbl_80006424
/* 800063D4 000024D4  7C C5 32 14 */	add r6, r5, r6
/* 800063D8 000024D8  81 C6 00 00 */	lwz r14, 0(r6)
/* 800063DC 000024DC  28 0E 00 00 */	cmplwi r14, 0
/* 800063E0 000024E0  41 82 00 44 */	beq lbl_80006424
/* 800063E4 000024E4  39 E6 00 04 */	addi r15, r6, 4
/* 800063E8 000024E8  7D C9 03 A6 */	mtctr r14
lbl_800063EC:
/* 800063EC 000024EC  38 C6 00 04 */	addi r6, r6, 4
/* 800063F0 000024F0  80 E6 00 00 */	lwz r7, 0(r6)
/* 800063F4 000024F4  7C E7 2A 14 */	add r7, r7, r5
/* 800063F8 000024F8  90 E6 00 00 */	stw r7, 0(r6)
/* 800063FC 000024FC  42 00 FF F0 */	bdnz lbl_800063EC
/* 80006400 00002500  3C A0 80 00 */	lis r5, 0x80000034@ha
/* 80006404 00002504  38 A5 00 34 */	addi r5, r5, 0x80000034@l
/* 80006408 00002508  55 E7 00 34 */	rlwinm r7, r15, 0, 0, 0x1a
/* 8000640C 0000250C  90 E5 00 00 */	stw r7, 0(r5)
/* 80006410 00002510  3C A0 80 00 */	lis r5, 0x80003110@ha
/* 80006414 00002514  38 A5 31 10 */	addi r5, r5, 0x80003110@l
/* 80006418 00002518  55 E7 00 34 */	rlwinm r7, r15, 0, 0, 0x1a
/* 8000641C 0000251C  90 E5 00 00 */	stw r7, 0(r5)
/* 80006420 00002520  48 00 00 0C */	b lbl_8000642C
lbl_80006424:
/* 80006424 00002524  39 C0 00 00 */	li r14, 0
/* 80006428 00002528  39 E0 00 00 */	li r15, 0
lbl_8000642C:
/* 8000642C 0000252C  48 30 2C E5 */	bl func_80309110
/* 80006430 00002530  48 34 BF 11 */	bl func_80352340
/* 80006434 00002534  3C 80 80 00 */	lis r4, 0x800030E6@ha
/* 80006438 00002538  38 84 30 E6 */	addi r4, r4, 0x800030E6@l
/* 8000643C 0000253C  A0 64 00 00 */	lhz r3, 0(r4)
/* 80006440 00002540  70 65 80 00 */	andi. r5, r3, 0x8000
/* 80006444 00002544  41 82 00 10 */	beq lbl_80006454
/* 80006448 00002548  70 63 7F FF */	andi. r3, r3, 0x7fff
/* 8000644C 0000254C  28 03 00 01 */	cmplwi r3, 1
/* 80006450 00002550  40 82 00 08 */	bne lbl_80006458
lbl_80006454:
/* 80006454 00002554  4B FF FE 6D */	bl func_800062C0
lbl_80006458:
/* 80006458 00002558  4B FF FE A9 */	bl func_80006300
/* 8000645C 0000255C  28 03 00 01 */	cmplwi r3, 1
/* 80006460 00002560  40 82 00 08 */	bne lbl_80006468
/* 80006464 00002564  48 2C 5B 35 */	bl func_802CBF98
lbl_80006468:
/* 80006468 00002568  48 35 8E E9 */	bl func_8035F350
/* 8000646C 0000256C  7D C3 73 78 */	mr r3, r14
/* 80006470 00002570  7D E4 7B 78 */	mr r4, r15
/* 80006474 00002574  48 03 3B 21 */	bl func_80039F94
/* 80006478 00002578  48 35 8F 48 */	b func_8035F3C0
/* 8000647C 0000257C  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_80006480
func_80006480:
/* 80006480 00002580  38 00 00 00 */	li r0, 0
/* 80006484 00002584  38 60 00 00 */	li r3, 0
/* 80006488 00002588  38 80 00 00 */	li r4, 0
/* 8000648C 0000258C  38 A0 00 00 */	li r5, 0
/* 80006490 00002590  38 C0 00 00 */	li r6, 0
/* 80006494 00002594  38 E0 00 00 */	li r7, 0
/* 80006498 00002598  39 00 00 00 */	li r8, 0
/* 8000649C 0000259C  39 20 00 00 */	li r9, 0
/* 800064A0 000025A0  39 40 00 00 */	li r10, 0
/* 800064A4 000025A4  39 60 00 00 */	li r11, 0
/* 800064A8 000025A8  39 80 00 00 */	li r12, 0
/* 800064AC 000025AC  39 C0 00 00 */	li r14, 0
/* 800064B0 000025B0  39 E0 00 00 */	li r15, 0
/* 800064B4 000025B4  3A 00 00 00 */	li r16, 0
/* 800064B8 000025B8  3A 20 00 00 */	li r17, 0
/* 800064BC 000025BC  3A 40 00 00 */	li r18, 0
/* 800064C0 000025C0  3A 60 00 00 */	li r19, 0
/* 800064C4 000025C4  3A 80 00 00 */	li r20, 0
/* 800064C8 000025C8  3A A0 00 00 */	li r21, 0
/* 800064CC 000025CC  3A C0 00 00 */	li r22, 0
/* 800064D0 000025D0  3A E0 00 00 */	li r23, 0
/* 800064D4 000025D4  3B 00 00 00 */	li r24, 0
/* 800064D8 000025D8  3B 20 00 00 */	li r25, 0
/* 800064DC 000025DC  3B 40 00 00 */	li r26, 0
/* 800064E0 000025E0  3B 60 00 00 */	li r27, 0
/* 800064E4 000025E4  3B 80 00 00 */	li r28, 0
/* 800064E8 000025E8  3B A0 00 00 */	li r29, 0
/* 800064EC 000025EC  3B C0 00 00 */	li r30, 0
/* 800064F0 000025F0  3B E0 00 00 */	li r31, 0
/* 800064F4 000025F4  3C 20 80 67 */	lis r1, 0x8067DD00@h
/* 800064F8 000025F8  60 21 DD 00 */	ori r1, r1, 0x8067DD00@l
/* 800064FC 000025FC  3C 40 80 67 */	lis r2, 0x80670380@h
/* 80006500 00002600  60 42 03 80 */	ori r2, r2, 0x80670380@l
/* 80006504 00002604  3D A0 80 66 */	lis r13, lbl_8066C180@h
/* 80006508 00002608  61 AD C1 80 */	ori r13, r13, lbl_8066C180@l
/* 8000650C 0000260C  4E 80 00 20 */	blr 

.global func_80006510
func_80006510:
/* 80006510 00002610  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80006514 00002614  7C 08 02 A6 */	mflr r0
/* 80006518 00002618  90 01 00 24 */	stw r0, 0x24(r1)
/* 8000651C 0000261C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80006520 00002620  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80006524 00002624  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80006528 00002628  3F A0 80 00 */	lis r29, lbl_80006624@ha
/* 8000652C 0000262C  3B BD 66 24 */	addi r29, r29, lbl_80006624@l
lbl_80006530:
/* 80006530 00002630  83 DD 00 08 */	lwz r30, 8(r29)
/* 80006534 00002634  2C 1E 00 00 */	cmpwi r30, 0
/* 80006538 00002638  41 82 00 38 */	beq lbl_80006570
/* 8000653C 0000263C  80 9D 00 00 */	lwz r4, 0(r29)
/* 80006540 00002640  83 FD 00 04 */	lwz r31, 4(r29)
/* 80006544 00002644  41 82 00 24 */	beq lbl_80006568
/* 80006548 00002648  7C 1F 20 40 */	cmplw r31, r4
/* 8000654C 0000264C  41 82 00 1C */	beq lbl_80006568
/* 80006550 00002650  7F E3 FB 78 */	mr r3, r31
/* 80006554 00002654  7F C5 F3 78 */	mr r5, r30
/* 80006558 00002658  4B FF DA A9 */	bl func_80004000
/* 8000655C 0000265C  7F E3 FB 78 */	mr r3, r31
/* 80006560 00002660  7F C4 F3 78 */	mr r4, r30
/* 80006564 00002664  48 00 00 8D */	bl func_800065F0
lbl_80006568:
/* 80006568 00002668  3B BD 00 0C */	addi r29, r29, 0xc
/* 8000656C 0000266C  4B FF FF C4 */	b lbl_80006530
lbl_80006570:
/* 80006570 00002670  3F A0 80 00 */	lis r29, lbl_800066A8@ha
/* 80006574 00002674  3B BD 66 A8 */	addi r29, r29, lbl_800066A8@l
lbl_80006578:
/* 80006578 00002678  80 BD 00 04 */	lwz r5, 4(r29)
/* 8000657C 0000267C  2C 05 00 00 */	cmpwi r5, 0
/* 80006580 00002680  41 82 00 1C */	beq lbl_8000659C
/* 80006584 00002684  80 7D 00 00 */	lwz r3, 0(r29)
/* 80006588 00002688  41 82 00 0C */	beq lbl_80006594
/* 8000658C 0000268C  38 80 00 00 */	li r4, 0
/* 80006590 00002690  4B FF DD C1 */	bl func_80004350
lbl_80006594:
/* 80006594 00002694  3B BD 00 08 */	addi r29, r29, 8
/* 80006598 00002698  4B FF FF E0 */	b lbl_80006578
lbl_8000659C:
/* 8000659C 0000269C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800065A0 000026A0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800065A4 000026A4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800065A8 000026A8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800065AC 000026AC  7C 08 03 A6 */	mtlr r0
/* 800065B0 000026B0  38 21 00 20 */	addi r1, r1, 0x20
/* 800065B4 000026B4  4E 80 00 20 */	blr 
/* 800065B8 000026B8  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800065BC 000026BC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_800065C0
func_800065C0:
/* 800065C0 000026C0  7C 00 00 A6 */	mfmsr r0
/* 800065C4 000026C4  60 00 20 00 */	ori r0, r0, 0x2000
/* 800065C8 000026C8  7C 00 01 24 */	mtmsr r0
/* 800065CC 000026CC  7F E8 02 A6 */	mflr r31
/* 800065D0 000026D0  48 34 C6 C1 */	bl func_80352C90
/* 800065D4 000026D4  48 34 B2 AD */	bl func_80351880
/* 800065D8 000026D8  48 34 DE F9 */	bl func_803544D0
/* 800065DC 000026DC  7F E8 03 A6 */	mtlr r31
/* 800065E0 000026E0  4E 80 00 20 */	blr 
/* 800065E4 000026E4  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800065E8 000026E8  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */
/* 800065EC 000026EC  00 00 00 00 */	.4byte 0x00000000  /* unknown instruction */

.global func_800065F0
func_800065F0:
/* 800065F0 000026F0  3C A0 FF FF */	lis r5, 0xFFFFFFF1@h
/* 800065F4 000026F4  60 A5 FF F1 */	ori r5, r5, 0xFFFFFFF1@l
/* 800065F8 000026F8  7C A5 18 38 */	and r5, r5, r3
/* 800065FC 000026FC  7C 65 18 50 */	subf r3, r5, r3
/* 80006600 00002700  7C 84 1A 14 */	add r4, r4, r3
lbl_80006604:
/* 80006604 00002704  7C 00 28 6C */	dcbst 0, r5
/* 80006608 00002708  7C 00 04 AC */	sync 0
/* 8000660C 0000270C  7C 00 2F AC */	icbi 0, r5
/* 80006610 00002710  30 A5 00 08 */	addic r5, r5, 8
/* 80006614 00002714  34 84 FF F8 */	addic. r4, r4, -8
/* 80006618 00002718  40 80 FF EC */	bge lbl_80006604
/* 8000661C 0000271C  4C 00 01 2C */	isync 
/* 80006620 00002720  4E 80 00 20 */	blr 

.global lbl_80006624
lbl_80006624:
	# ROM: 0x2724
	.4byte 0x80004000  ;# ptr
	.4byte 0x80004000  ;# ptr
	.4byte 0x000026C8
	.4byte 0x800066E0  ;# ptr
	.4byte 0x800066E0  ;# ptr
	.4byte 0x0001A938
	.4byte 0x80021020  ;# ptr
	.4byte 0x80021020  ;# ptr
	.4byte 0x00018200
	.4byte 0x80039220  ;# ptr
	.4byte 0x80039220  ;# ptr
	.4byte 0x004BC6CC
	.4byte 0x804F5900
	.4byte 0x804F5900
	.4byte 0x000001F4
	.4byte 0x804F5B00
	.4byte 0x804F5B00
	.4byte 0x0000000C
	.4byte 0x804F5B20
	.4byte 0x804F5B20
	.4byte 0x000326A8
	.4byte 0x805281E0
	.4byte 0x805281E0
	.4byte 0x0004BA74
	.4byte 0x80664180
	.4byte 0x80664180
	.4byte 0x00002480
	.4byte 0x80668380
	.4byte 0x80668380
	.4byte 0x00005958
	.4byte 0
	.4byte 0
	.4byte 0


.global lbl_800066A8
lbl_800066A8:
	# ROM: 0x27A8
	.4byte 0x80573C80
	.4byte 0x000F04FC
	.4byte 0x80666600
	.4byte 0x00001D70
	.4byte 0x8066DCE0
	.4byte 0x0000001C
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0