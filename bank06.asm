;lots of useful notes on the code / format:
;https://github.com/loveemu/vgm-disasm/blob/master/snes/Capcom/Super%20Ghouls%20'N%20Ghosts.s
;https://wiki.superfamicom.org/capcom-music-format

org $068000

	arch spc700 ;APU code/data

	;format: byte amount to copy | apuram destination address | data to send

{ ;0300 - 03CA
	dw $0933, $0300

base $0300 : spc_0300:
	clrp
	mov  x, #$CF
	mov  sp, x
	call spc_0B11
	mov  a, #$F0
	mov  !CONTROL, a
	mov  a, #$00
	mov  !CPUIO1, a
	mov  !CPUIO2, a
	mov  !CPUIO3, a
	inc  a
	mov  $CB, a
	mov  !CPUIO0, a
	mov  a, #$40
	mov  !T0DIV, a
	mov  a, #$01
	mov  !CONTROL, a
	mov  $C9, #$20
.032A:
	mov  a, !T0OUT
	beq  .032A

	dec  $C9
	bne  .032A

	mov  y, #$6C
	mov  a, #$00
	call spc_0BF2
.033A:
	call spc_03CB
	mov  a, $CE
	mov  y, #$5C
	call spc_0BF2
	mov  a, !T0OUT
	clrc
	adc  a, $CA
	mov  $CA, a
	beq  .033A

	dec  $CA
	mov  a, #$03
	mov  x, #$3A
	push a
	push x
	mov  $CD, #$80
	mov  $CC, #$07
	mov  x, #$0F
	clrc
	adc  $C9, #$80
	bmi  .039B

	bbs6 $C9, .ret

	mov  y, #$00
	mov  a, $D2
	addw ya, $D4
	movw $D2, ya
	mov  ($D1), ($D0)
-:
	mov  a, $10+x
	or   a, $00+x
	beq  +

	call spc_0656
+:
	asl  $D1
	lsr  $CD
	dec  x
	dec  x
	dec  $CC
	bpl  -

	mov  a, $D8
	beq  .ret

	mov  y, #$00
	mov  a, $DA
	addw ya, $DB
	bcc  +

	mov  $D8, #$00
	mov  y, #$FF
	mov  a, #$FF
+:
	movw $DB, ya
.ret:
	ret

.039B:
	mov  $D1, #$00
	dec  x
.039F:
	mov  a, $D0
	beq  .03CA

	and  a, $CD
	beq  +

	push x
	mov  x, $CC
	setp
	mov  a, $18+x
	mov  $C0, a
	mov  a, $20+x
	mov  $C1, a
	mov  y, #$00
	mov  a, $08+x
	addw ya, $C0
	mov  $08+x, a
	mov  $10+x, y
	clrp
	pop  x
	call spc_0656
+:
	lsr  $CD
	dec  x
	dec  x
	dec  $CC
	bpl  .039F

.03CA:
	ret
}

{ ;03CB - 0508
spc_03CB:
	mov  a, !CPUIO0 ;get sfx number
	beq  .03E2

	mov  !CPUIO3, a
	inc  $CB
	call .03E3
	mov  a, #$31
	mov  !CONTROL, a
	mov  a, $CB
	mov  !CPUIO0, a
.03E2:
	ret

;-----

.03E3:
	cmp  a, #$F0
	bcc  .03EA

	jmp  .04E9
.03EA:
	cmp  a, spc_0E00
	bcc  .03F5

	setc
	sbc  a, spc_0E00
	bra  .03EA

.03F5:
	asl  a
	mov  x, a
	mov  a, spc_0E00_0E02+1+x
	mov  $C0, a
	mov  a, spc_0E00_0E02+0+x
	mov  $C1, a
	or   a, $C0
	beq  spc_03CB_03E2 ;if word offset is 0, do nothing

	mov  y, #$00
	mov  a, ($C0)+y
	bne  .0453

	call spc_055D
	mov  y, #$01
	mov  a, #$99
	movw $D4, ya
	mov  $D2, #$00
	mov  $D7, #$E8
	mov  a, $0E01
	asl  a
	mov  $D6, a
	mov  x, #$0F
.0422:
	mov  y, #$00
	incw $C0
	mov  a, ($C0)+y
	mov  $C3, a
	incw $C0
	mov  a, ($C0)+y
	mov  $C2, a
	mov  a, ($C2)+y
	cmp  a, #$17
	beq  .044E

	mov  a, $C3
	mov  $10+x, a
	mov  a, $C2
	mov  $00+x, a
	mov  a, #$B8
	mov  $02D0+x, a
	setp
	mov  a, #$00
	mov  $30+x, a
	mov  $40+x, a
	dec  a
	mov  $50+x, a
	clrp
.044E:
	dec  x
	dec  x
	bpl  .0422

	ret

.0453:
	mov  $C4, a
	mov  $CD, #$80
	mov  $CC, #$07
	mov  x, #$0E
.045D:
	mov  y, #$00
	incw $C0
	mov  a, ($C0)+y
	mov  $C3, a
	incw $C0
	mov  a, ($C0)+y
	mov  $C2, a
	mov  a, ($C2)+y
	cmp a, #$17
	beq .spc_04DE

	mov  y, $CC
	mov  a, $C4
	cmp  a, $0100+y
	bcc .spc_04DE

	or   ($CE), ($CD)
	or   ($D0), ($CD)
	push a
	mov  a, $C3
	push a
	mov  a, $C2
	push a
	call spc_0523
	pop  a
	mov  $00+x, a
	pop  a
	mov  $10+x, a
	mov  y, $CC
	pop  a
	mov  $0100+y, a
	mov  a, #$99
	mov  $0118+y, a
	mov  a, #$01
	mov  $0120+y, a
	mov  a, #$00
	mov  $0108+y, a
	mov  a, !CPUIO1
	bmi  +

	eor  a, #$FF
	inc  a
	and  a, #$7F
+:
	asl  a
	bne  +

	dec  a
+:
	bcs  .spc_04BF

	mov  $C8, #$00
	mov  y, !CPUIO2
	beq  .spc_04CB

	bra  .spc_04C7

.spc_04BF:
	mov  $C8, #$20
	mov  y, !CPUIO2
	bne  .spc_04CB

.spc_04C7:
	set4 $C8
	eor  a, #$FF
.spc_04CB:
	mov  $0150+x, a
	mov  a, $C8
	mov  $0200+x, a
	mov  a, !CPUIO3
	mov  $0140+x, a
	mov  a, #$B0
	mov  $02D0+x, a
.spc_04DE:
	lsr  $CD
	dec  x
	dec  x
	dec  $CC
	bmi  .04F4

	jmp  .045D

.04E9:
	and  a, #$0F
	cmp  a, #$0B
	bcs  .04F4

	asl  a
	mov  x, a
	jmp  (.04F5+x)
.04F4:
	ret

.04F5:
	dw spc_0509, spc_0509_050C, spc_055D, spc_057F, spc_057F_0583
	dw spc_05C8, spc_05C8_05CC, spc_0603, spc_0606, spc_0609
}

{ ;0509 - 0522
spc_0509:
	call spc_055D
.050C:
	or   $CE, $D0
	mov  $CC, #$07
	mov  x, #$0E
-:
	bbc7 $D0, +

	call spc_0523
+:
	dec  x
	dec  x
	dec  $CC
	asl  $D0
	bne  -

	ret
}

{ ;0523 - 055C
spc_0523:
	mov  a, x
	clrc
	adc  a, #$B0
	mov  $C2, #$00
	mov  $C3, #$00
	mov  $C5, #$10
	call .0551
	mov  a, x
	clrc
	adc  a, #$F0
	mov  $C2, #$00
	mov  $C3, #$02
	mov  $C5, #$10
	call  .0551
	mov  a, $CC
	clrc
	adc  a, #$20
	mov  $C2, #00
	mov  $C3, #01
	mov  $C5, #08
.0551:
	mov  y, a
	mov  a, #$00
	mov  ($C2)+y, a
	mov  a, y
	setc
	sbc  a, $C5
	bcs  .0551

	ret
}

{ ;055D - 057E
spc_055D:
	call spc_05F3
	mov  a, $D0
	eor  a, #$FF
	or   a, $CE
	mov  $CE, a
	mov  a, #$00
	mov  x, #$BF
-:
	mov  (x), a
	dec  x
	dec  x
	cmp  x, #$FF
	bne  -

	mov  x, #$FF
-:
	mov  $0200+x, a
	dec  x
	dec  x
	cmp  x, #$FF
	bne  -

	ret
}

{ ;057F - 05C7
spc_057F:
	set6 $C9
	bra  +

.0583:
	clr6 $C9
+:
	mov  $CD, #$80
	mov  $CC, #$07
	mov  x, #$0F
-:
	mov  a, $D0
	and  a, $CD
	bne  .05BF

	mov  a, $10+x
	or   a, $00+x
	beq  .05BF

	bbc6 $C9, +

	mov  a, #$00
	mov  y, #$00
	call spc_0BE8
	inc  y
	call spc_0BF2
	bra  .05BF

+:
	mov  a, $50+x
	beq  .05BF

	call spc_0A8F
	mov  a, $02C0+x
	mov  y, #$05
	call spc_0BE8
	mov  a, $CD
	mov  y, #$4C
	call spc_0BF2
.05BF:
	lsr  $CD
	dec  x
	dec  x
	dec  $CC
	bpl  -

	ret
}

{ ;05C8 - 0602
spc_05C8:
	mov  x, #$01
	bra  +

.05CC:
	mov  x, #$FF
+:
	mov  y, !CPUIO1
	beq  spc_05F3

	cmp  x, $D9
	beq  .05E5

	mov  a, $D8
	beq  .05E6

	mov  $D9, x
	mov  $DA, y
	mov  a, $DC
	eor  a, #$FF
	mov  $DC, a
.05E5:
	ret

.05E6:
	dec  $D8
	mov  $D9, x
	mov  $DA, y
	mov  $DB, #$00
	mov  $DC, #$00
	ret
}

{ ;05F3 - 0602
spc_05F3:
	mov  $D8, #$00
	mov  $D9, #$00
	mov  $DA, #$00
	mov  $DB, #$FF
	mov  $DC, #$FF
	ret
}

{ ;0603 - 0605
spc_0603:
	clr5 $C9
	ret
}

{ ;0606 - 0608
spc_0606:
	set5 $C9
	ret
}

{ ;0609 - 0655
spc_0609:
	mov  a, #$AA
	mov  !CPUIO0, a
	mov  a, #$BB
	mov  !CPUIO1, a
-:
	mov  a, !CPUIO0
	cmp  a, #$CC
	bne  -

	bra  .063C

.061C:
	mov  y, !CPUIO0
	bne  .061C

.0621:
	cmp  y, !CPUIO0
	bne  .0635

	mov  a, !CPUIO1
	mov  !CPUIO0, y
	mov  ($C0)+y, a
	inc  y
	bne  .0621

	inc  $C1
	bra  .0621

.0635:
	bpl  .0621
	cmp  y, !CPUIO0
	bpl  .0621

.063C:
	mov  a, !CPUIO2
	mov  y, !CPUIO3
	movw $C0, ya
	mov  y, !CPUIO0
	mov  a, !CPUIO1
	mov  !CPUIO0, y
	bne  .061C

	mov  !CPUIO1, a
	inc  a
	mov  $CB, a
	ret
}


spc_0656: ;0656 - 07D1
	mov  a, $30+x
	beq spc_069B

	bbc7 $C9, +

	mov  y, $CC
	mov  a, $0110+y
	mov  $C4, a
	bra  spc_0669

+:
	mov  ($C4), ($D3)
spc_0669:
	mov  a, $20+x
	bmi  spc_0689

	mov  a, $50+x
	beq  spc_0689

	setc
	sbc  a, $C4
	beq  +

	bcs  spc_0687

+:
	bbs7 $D1, +

	mov  a, $02C0+x
	and  a, #$7F
	mov  y, #$05
	call spc_0BE8
+:
	mov  a, #$00
spc_0687:
	mov  $50+x, a
spc_0689:
	mov  a, $30+x
	setc
	sbc  a, $C4
	mov  $30+x, a
	beq  spc_069B

	bcc  spc_069B

	cmp  a, #$C1
	bcs  spc_069B

	jmp  spc_09FC

spc_069B:
	call spc_09E9
	cmp  a, #$20
	bcs  spc_06A7

	call spc_07D2
	bra  spc_069B

spc_06A7:
	push a
	xcn  a
	lsr  a
	and  a, #$07
	dec  a
	mov  y, a
	mov  a, $20+x
	and  a, #$30
	bne  spc_06B9
	mov  a, spc_07B4+y
	bra  spc_06CB

spc_06B9:
	and  a, #$10
	bne  spc_06C2

	mov  a, spc_07AD+y
	bra  spc_06CB

spc_06C2:
	mov  a, $20+x
	and  a, #$EF
	mov  $20+x, a
	mov  a, spc_07BB+y
spc_06CB:
	clrc
	adc  a, $30+x
	mov  $30+x, a
	pop  a
	and  a, #$1F
	bne  spc_06D8

	mov  $50+x, a
	ret

spc_06D8:
	push a
	mov  a, $20+x
	and  a, #$0F
	mov  y, a
	pop  a
	clrc
	adc  a, spc_07C2+y
	bbc7 $C9, spc_06EB

	clrc
	adc  a, #$E8
	bra  spc_06EE

spc_06EB:
	clrc
	adc  a, $D7
spc_06EE:
	clrc
	adc  a, $60+x
	mov  $C1, a
	mov  $C0, #$00
	mov  y, #$00
	mov  a, $70+x
	bpl  +

	dec  y
+:
	addw ya, $C0
	cmp  y, #$55
	bcc  +

	mov  y, #$54
+:
	movw $C2, ya
	mov  a, $0200+x
	mov  $C4, a
	clr0 $C4
	mov  a, $0250+x
	beq  +

	mov  a, $0280+x
	beq  +

	cmp  a, $C3
	bne  spc_0720

+:
	mov  a, $C2
	bra  spc_0731

spc_0720:
	bcs  spc_0726

	set1 $c4
	bra  +

spc_0726:
	clr1 $C4
+:
	inc  $C4
	mov  a, $0280+x
	mov  y, a
	mov  a, $0290+x
spc_0731:
	push a
	mov  a, $C4
	mov  $0200+x, a
	mov  a, $C3
	mov  $0280+x, a
	mov  a, $C2
	mov  $0290+x, a
	pop  a
	mov  $0270+x, a
	mov  a, y
	mov  $0260+x, a
	mov  a, $20+x
	bmi  spc_0768

	mov  a, $0200+x
	mov  y, a
	and  a, #$08
	beq  +

	mov  a, y
	and  a, #$3F
	mov  $0200+x, a
	mov  a, #$00
	mov  $0240+x, a
+:
	mov  a, y
	and  a, #$04
	beq  spc_0768

	call spc_0964
spc_0768:
	bbs7 $D1, spc_0794

	call spc_0A8F
	call spc_0ACC
	mov  a, $20+x
	bmi  spc_0794

	mov  a, $CE
	and  a, $CD
	beq  +

	eor  ($CE), ($CD)
	mov  a, #$00
	mov  y, #$5C
	call spc_0BF2
+:
	mov  a, $02C0+x
	mov  y, #$05
	call spc_0BE8
	mov  a, $CD
	mov  y, #$4C
	call spc_0BF2
spc_0794:
	mov  a, $20+x
	mov  y, a
	and  a, #$7F
	mov  $C3, a
	mov  a, y
	and  a, #$40
	asl  a
	or   a, $C3
	mov  $20+x, a
	bmi  .ret

	mov  y, $40+x
	mov  a, $30+x
	mul  ya
	mov  $50+x, y
.ret:
	ret

spc_07AD:
	db $02, $04, $08, $10, $20, $40, $80
spc_07B4:
	db $03, $06, $0C, $18, $30, $60, $C0
spc_07BB:
	db $00, $09, $12, $24, $48, $90, $00
spc_07C2:
	db $00, $0C, $18, $24, $30, $3C, $48, $54
	db $18, $24, $30, $3C, $48, $54, $60, $6C


spc_07D2: ;07D2 - 0825
	asl  a
	mov  y, a
	mov  a, spc_07E6+1+y
	push a
	mov  a, spc_07E6+y
	push a
	cmp  y, #$08
	bcc  .ret

	mov  $C2, y
	call spc_09E9
.ret:
	ret

spc_07E6:
	dw spc_0826, spc_082A, spc_082E, spc_0834, spc_092D, spc_083B, spc_085B, spc_085E
	dw spc_086E, spc_08B6, spc_08C1, spc_08CA, spc_08CD, spc_08D0, spc_08D5, spc_08D9
	dw spc_08DD, spc_08E1, spc_08D5, spc_08D9, spc_08DD, spc_08E1, spc_0917, spc_0938
	dw spc_0959, spc_0981, spc_0998, spc_09BE, spc_09C2, spc_09C3, spc_09D6, spc_09DA


spc_0826: ;0826 - 083A
	;00 - toggle triplet
	mov  a, #$20
	bra  +

spc_082A:
	mov  a, #$40
	bra  +

spc_082E:
	mov  a, #$10
	or   a, $20+x
	bra  ++

spc_0834:
	;03 - toggle 2 octave up
	mov  a, #$08
+:
	eor  a, $20+x
++:
	mov  $20+x, a
	ret


spc_083B: ;083B - 085A
	push a
	call spc_09E9
	pop  y
	bbc7 $C9, +

	push y
	push a
	mov  y, $CC
	pop  a
	mov  $0118+y, a
	pop  a
	mov  $0120+y, a
	mov  a, #$00
	mov  $0108+y, a
	ret

+:
	movw $D4, ya
	mov  $D2, #$00
	ret


spc_085B: ;085B - 085D
	mov  $40+x, a
	ret


spc_085E: ;085E - 086D
	mov  $02E0+x, a
	bbc7 $C9, +

	mov  a, #$FE
	jmp  spc_098E
+:
	mov  a, $D6
	jmp  spc_098E


spc_086E: ;086E - 08B5
	bbs7 $C9, +

	inc  a
	mov  y, $CC
	mov  $0128+y, a
	bbs7 $D1, .ret

	dec  a
+:
	mov  y, #$06
	mul  ya
	movw $C0, ya
	clrc
	adc  $C0, #$80
	adc  $C1, #$58
	mov  y, #$01
	mov  a, ($C0)+y
	mov  $02C0+x, a
	push x
	mov  a, $CC
	xcn  a
	or   a, #$04
	mov  x, a
	mov  y, #$00
-:
	mov  a, ($C0)+y
	mov  !DSPADDR, x
	mov  !DSPDATA, a
	inc  x
	inc  y
	cmp  y, #$03
	bne  -

	pop  x
	inc  y
	mov  a, ($C0)+y
	mov  $02A0+x, a
	inc  y
	mov  a, ($C0)+y
	mov  $02B0+x, a
	call spc_09CD
.ret:
	ret


spc_08B6: ;08B6 - 08C0
	mov  $C3, a
	mov  a, $20+x
	and  a, #$F8
	or   a, $C3
	mov  $20+x, a
	ret


spc_08C1: ;08C1 - 08C9
	bbs7 $C9, .ret

	clrc
	adc  a, #$E8
	mov  $D7, a
.ret:
	ret


spc_08CA: ;08CA - 08CC
	mov  $60+x, a
	ret


spc_08CD: ;08CD - 08CF
	mov  $70+x, a
	ret


spc_08D0: ;08D0 - 08D4
	asl  a
	mov  $0250+x, a
	ret


spc_08D5: ;08D5 - 092C
	mov  y, #$80
	bra  +

spc_08D9:
	mov  y, #$90
	bra  +

spc_08DD:
	mov  y, #$A0
	bra  +

spc_08E1:
	mov  y, #$B0
+:
	mov  $C3, a
	mov  $C0, y
	mov  a, x
	clrc
	adc  a, $C0
	mov  y, a
	mov  $C1, #$00
	mov  $C0, #$00
	cmp  $C2, #$24
	bcs  spc_0908

	mov  a, ($C0)+y
	beq  spc_0902

	dec  a
	mov  ($C0)+y, a
	beq  spc_0921

	bra  +

spc_0902:
	mov  a, $C3
	mov  ($C0)+y, a
	bra  +

spc_0908:
	mov  a, ($C0)+y
	dec  a
	bne  spc_0921

	mov  ($C0)+y, a
	mov  a, $C3
	call spc_092D
+:
	call spc_09E9
spc_0917:
	push a
	call spc_09E9
	mov  $00+x, a
	pop  a
	mov  $10+x, a
	ret

spc_0921:
	mov  a, #$02
	clrc
	adc  a, $00+x
	mov  $00+x, a
	bcc  .ret

	inc  $10+x
.ret:
	ret


spc_092D: ;092D - 0937
	mov  $C3, a
	mov  a, $20+x
	and  a, #$97
	or   a, $C3
	mov  $20+x, a
	ret


spc_0938: ;0938 - 0958
	pop  a
	pop  a
	mov  a, #$00
	mov  $10+x, a
	mov  $00+x, a
	bbc7 $C9, +

	mov  a, $CD
	eor  a, #$FF
	and  a, $D0
	mov  $D0, a
	mov  a, #$00
	mov  y, $CC
	mov  $0100+y, a
+:
	bbs7 $D1, .ret

	or   ($CE), ($CD)
.ret:
	ret


spc_0959: ;0959 - 0980
	;18 - pan
	mov  y, a
	bmi  +

	eor  a, #$FF
	inc  a
	and  a, #$7F
+:
	mov  $0130+x, a


spc_0964: ;0964 - 0980
	mov   a, $0130+x
	asl   a
	bne   +

	dec   a
+:
	mov   $0150+x, a
	mov   a, #$00
	adc   a, #$00
	asl   a
	xcn   a
	mov   $C8, a
	mov   a, $0200+x
	and   a, #$CF
	or    a, $C8
	mov   $0200+x, a
	ret


spc_0981: ;0981 - 0997
	bbs7 $C9, +

	mov  y, a
	mov  a, $0E01
	asl  a
	mul  ya
	mov  a, y
	asl  a
	mov  $D6, a
spc_098E:
	mov  y, a
	mov  a, $02E0+x
	mul  ya
	mov  a, y
	mov  $02F0+x, a
+:
	ret


spc_0998: ;0998 - 09BD
	push a
	call spc_09E9
	pop  y
	cmp  y, #$03
	beq  spc_09AF

	push a
	mov  a, y
	xcn  a
	mov  $C4, x
	clrc
	adc  a, $C4
	mov  y, a
	pop  a
	mov  $0210+y, a
	ret

spc_09AF:
	xcn  a
	lsr  a
	mov  $C3, a
	mov  a, $0200+x
	and  a, #$F7
	or   a, $C3
	mov  $0200+x, a
	ret


spc_09BE: ;09BE - 09C1
	call spc_09E9
	ret


spc_09C2: ;09C2 - 09C2
	ret


spc_09C3: ;09C3 - 09D5
	and  a, #$1F
	or   a, #$A0
	mov  $02D0+x, a
	bbs7 $D1, spc_09D5


spc_09CD: ;09CD - 09D5
	mov  a, $02D0+x
	mov  y, #$07
	call spc_0BE8
spc_09D5:
	ret


spc_09D6: ;09D6 - 09D9
	mov  $0140+x, a
	ret


spc_09DA: ;09DA - 09E8
	asl  a
	asl  a
	mov  $C3, a
	mov  a, $0200+x
	and  a, #$FB
	or   a, $C3
	mov  $0200+x, a
	ret


spc_09E9: ;09E9 - 09FB
	;get music command?
	mov  a, $00+x
	mov  $C0, a
	mov  a, $10+x
	mov  $C1, a
	mov  y, #$00
	mov  a, ($C0)+y
	inc  $00+x
	bne  +

	inc  $10+x
+:
	ret


spc_09FC: ;09FC - 0A8E, can branch to 0ADA
	mov  a, $0230+x
	clrc
	adc  a, $0240+x
	mov  $0240+x, a
	bcc +

	mov  a, $0200+x
	clrc
	adc  a, #$40
	mov  $0200+x, a
+:
	setp
	mov  a, $40+x
	clrc
	adc  a, $50+x
	mov  $50+x, a
	clrp
	bcc  spc_0A3D

	mov  a, $0200+x
	push a
	setc
	sbc  a, #$10
	and  a, #$30
	mov  $C4, a
	bbc7 $C9, +

	bbs4 $C4, +

	mov  a, #$00
	mov  $0140+x, a
	mov  $0150+x, a
+:
	pop  a
	and  a, #$CF
	or   a, $C4
	mov  $0200+x, a
spc_0A3D:
	mov  a, $0200+x
	mov  $C4, a
	bbc0 $C4, spc_0A80

	mov  $C1, #$00
	mov  a, $0250+x
	mov  $C0, a
	mov  a, $0280+x
	mov  $C3, a
	mov  a, $0290+x
	mov  $C2, a
	mov  a, $0260+x
	mov  y, a
	mov  a, $0270+x
	bbs1 $C4, spc_0A6B

	subw ya, $C0
	bcc  spc_0A71

	cmpw ya, $C2
	bcc  spc_0A71

	bra  spc_0A79

spc_0A6B:
	addw ya, $C0
	cmpw ya, $C2
	bcc  spc_0A79

spc_0A71:
	mov  a, $C4
	dec  a
	mov  $0200+x, a
	movw ya, $C2
spc_0A79:
	mov  $0270+x, a
	mov  a, y
	mov  $0260+x, a
spc_0A80:
	bbs7 $D1, .ret

	call spc_0A8F
	bbs0 $C4, spc_0ACC

	mov  a, $0210+x
	bne  spc_0ADA

.ret:
	ret


spc_0A8F: ;0A8F - 0B10, continues to 0B4B or 0BCC
	mov  a, $0220+x
	beq  spc_0AAD

	asl  a
	mov  y, a
	mov  a, $0200+x
	asl  a
	asl  a
	mov  a, $0240+x
	bcc  +

	eor  a, #$FF
+:
	mul  ya
	mov  a, y
	eor  a, #$FF
	mov  y, a
	mov  a, $02F0+x
	mul  ya
	bra  +

spc_0AAD:
	mov  a, $02F0+x
	mov  y, a
+:
	bbs7 $C9, spc_0ABC

	mov  a, $DC
	bbc7 $D9, spc_0ABB

	eor  a, #$FF
spc_0ABB:
	mul  ya
spc_0ABC:
	mov  a, $0200+x
	mov  $C7, a
	mov  a, $0150+x
	bbc4 $C7, +

	eor  a, #$FF
+:
	jmp  spc_0BCC

spc_0ACC: ;0ACC - 0B10, continues to 0B4B
	mov  a, $0210+x
	bne  spc_0ADA

	mov  a, $0260+x
	mov  y, a
	mov  a, $0270+x
	bra  spc_0B0E

spc_0ADA:
	asl  a
	mov  y, #$0C
	mul  ya
	movw $C0, ya
	mov  a, $0200+x
	push p
	asl  a
	asl  a
	mov  a, $0240+x
	bcc  +

	eor  a, #$FF
+:
	push a
	mov  y, $C0
	mul  ya
	mov  $C0, y
	pop  a
	mov  y, $C1
	mul  ya
	mov  $C1, #$00
	addw ya, $C0
	movw $C0, ya
	mov  a, $0260+x
	mov  y, a
	mov  a, $0270+x
	pop  p
	bmi  +

	addw ya, $C0
	bra  spc_0B0E

+:
	subw ya, $C0
spc_0B0E:
	jmp  spc_0B4B


spc_0B11: ;0B11 - 0B4A
	mov  a, #$00
	mov  x, a
-:
	mov  (x+), a
	cmp  x, #$E0
	bne  -

	mov  x, a
-:
	mov  $0100+x, a
	inc  x
	cmp  x, #$80
	bne  -

	mov  x, a
-:
	mov  $0200+x, a
	inc  x
	bne  -

-:
	mov  a, spc_0BF9+x
	mov  y, a
	mov  a, spc_0C05+x
	call spc_0BF2
	inc  x
	cmp  x, #$0C
	bne  -

	mov  x, #$00
	mov  y, #$0F
-:
	mov  a, spc_0C11+x
	call spc_0BF2
	inc  x
	mov  a, y
	clrc
	adc  a, #$10
	mov  y, a
	bpl  -

	ret


spc_0B4B: ;0B4B - 0BCB, continues to 0BF2
	dec  y
	mov  $C1, y
	mov  $C0, a
	mov  a, y
	mov  y, #$00
	setc
	sbc  a, #$34
	bcs  spc_0B61

	mov  a, $C1
	setc
	sbc  a, #$13
	bcs  spc_0B65

	dec  y
	asl  a
spc_0B61:
	addw ya, $C0
	movw $C0, ya
spc_0B65:
	push x
	mov  a, $C1
	asl  a
	mov  y, #$00
	mov  x, #$18
	div  ya, x
	mov  x, a
	mov  a, $0C1A+y
	mov  $C3, a
	mov  a, $0C19+y
	mov  $C2, a
	mov  a, $0C1C+y
	push a
	mov  a, $0C1B+y
	pop  y
	subw ya, $C2
	mov  y, $C0
	mul  ya
	mov  a, y
	mov  y, #$00
	addw ya, $C2
	mov  $C1, y
	asl  a
	rol  $C1
-:
	cmp  x, #$06
	beq  spc_0B9A

	lsr  $C1
	ror  a
	inc  x
	bra  -

spc_0B9A:
	mov  $C0, a
	pop  x
	mov  a, $02B0+x
	mov  y, $C1
	mul  ya
	movw $C2, ya
	mov  a, $02B0+x
	mov  y, $C0
	mul  ya
	push y
	mov  a, $02A0+x
	mov  y, $C0
	mul  ya
	addw ya, $C2
	movw $C2, ya
	mov  a, $02A0+x
	mov  y, $C1
	mul  ya
	mov  y, a
	pop  a
	addw ya, $C2
	and  a, #$F0
	push y
	mov  y, #$02
	call spc_0BE8
	pop  a
	inc  y
	bra  spc_0BF2


spc_0BCC: ;0BCC - 0BD6, contines to 0BF2
	bbc5 $C9, spc_0BD2

	mov  a, y
	bra  spc_0BDC

spc_0BD2:
	push y
	mul  ya
	mov  a, y
	pop  y
	bbc5 $C7, spc_0BDC

	push a
	mov  a, y
	pop  y
spc_0BDC:
	mov  $C7, y
	mov  y, #$00
	call spc_0BE8
	mov  a, $C7
	inc  y
	bra  spc_0BF2

{ ;0BE8 - 0BF8
spc_0BE8:
	push a
	mov  $C6, y
	mov  a, $CC
	xcn  a
	or   a, $C6
	mov  y, a
	pop  a
}

spc_0BF2: ;0BF2 - 0BF8
	mov  !DSPADDR, y
	mov  !DSPDATA, a
	ret


spc_0BF9: ;0BF9 - 0C32
	db $4D, $0D, $2C, $3C, $6C, $7D, $6D, $5D, $0C, $1C, $2D, $3D
spc_0C05:
	db $00, $00, $00, $00, $20, $00, $0D, $58, $7F, $7F, $00, $00
spc_0C11:
	db $7F, $00, $00, $00, $00, $00, $00, $00
spc_0C19:
	dw $085F, $08DE, $0965, $09F4, $0A8C, $0B2C, $0BD6
	dw $0C8B, $0D4A, $0E14, $0EEA, $0FCD, $10BE

	base off

	;-----

	dw $49CE, $0E00

base $0E00 : spc_0E00:
	db $6A, $4C

.0E02:
	;word offsets, big endian

	;music
	db $00, $00, $0E, $D6, $13, $94, $17, $C5, $1B, $58, $1E, $AE, $22, $75, $00, $00
	db $26, $3B, $28, $F1, $2A, $F9, $2D, $0B, $2F, $50, $31, $A2, $33, $D4, $00, $00
	db $36, $2F, $36, $AB, $37, $37, $37, $CD, $38, $7F, $39, $DD, $3B, $61, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

	;sound
	db $43, $B1, $43, $DB, $44, $0E, $44, $33, $44, $68, $44, $90, $44, $C4, $44, $FD
	db $45, $2F, $45, $60, $45, $8F, $45, $C8, $46, $03, $46, $39, $46, $69, $46, $A6
	db $46, $F4, $47, $26, $47, $77, $47, $AB, $48, $2E, $48, $65, $48, $91
	db .menu_movement>>8, .menu_movement ;0x37
	db $48, $FF, $49, $38, $49, $6A, $49, $E1, $4A, $2D, $4A, $48, $4A, $9C, $4A, $E2
	db $4B, $2B, $4B, $6A, $4B, $C5, $4B, $FB, $4C, $69, $4C, $A1, $4C, $DF, $4D, $21
	db $4D, $7D, $4D, $C0, $4E, $03, $4E, $66, $4E, $AF, $4E, $F0, $4F, $25, $4F, $64
	db $4F, $AD, $4F, $DD, $50, $3A, $50, $74, $50, $C2, $51, $11, $51, $7A, $51, $DF
	db $52, $42, $52, $9B, $52, $D1, $53, $00, $53, $69, $53, $DC, $54, $37, $54, $60
	db $54, $AB, $54, $EE
	db .capcom_jingle>>8, .capcom_jingle ;0x??
	db $55, $90, $55, $DD, $56, $65, $56, $B9, $57, $01, $57, $4A, $57, $82


	incbin "audio/06893B.bin":$00D6..$3ACA

.menu_movement: ;0x37 (0x48CA)
	db $0F
	dw be(..48DB), be(..48DC), be(..48DD), be(..48DE), be(..48DF), be(..48E0), be(..48E1), be(..48FE)

..48DB:
	%end_track()

..48DC:
	%end_track()

..48DD:
	%end_track()

..48DE:
	%end_track()

..48DF:
	%end_track()

..48E0:
	%end_track()

..48E1:
	db $05, $02, $AA
	db $06, $32
	db $1D, $0A
	db $07, $46
	db $09, $07
	db $1A, $01, $7F
	db $1A, $02, $7F
	db $08, $03
	db $03
	db $79
	db $07, $19
	db $59
	db $07, $0A
	db $59
	db $40
	db $17

..48FE:
	db $17

	incbin "audio/06893B.bin":$3AFF..$472E

.capcom_jingle: ;0x?? (0x552E)
	db $00
	dw be(..553F), be(..556D), be(..558A), be(..558B), be(..558C), be(..558D), be(..558E), be(..558F)

..553F:
	%tempo($00FA)
	%volume($44)
	%duration($BE)
	%release($10)
	%instrument($12)
	%octave($02)
	%toggle_triplet()
	%note(00, 3)
	%pan($BA)
	%note(27, 3)
	%toggle_triplet()
	%note(30, 2)
	%pan($E7)
	%toggle_2_octave_up()
	%note(10, 2)
	%note(13, 2)
	%pan($19)
	%toggle_triplet()
	%note(17, 3)
	%note(08, 3)
	%pan($46)
	%note(10, 3)
	%note(13, 3)
	%lfo($01, $2D)
	%lfo($02, $19)
	%pan($6E)
	%toggle_triplet()
	%note(20, 6)
	%note(00, 6)
	%end_track()

..556D:
	%pan($92)
	%duration($BE)
	%release($10)
	%lfo($03, $01)
	%lfo($01, $46)
	%lfo($02, $19)
	%volume($42)
	%instrument($12)
	%octave($02)
	db $02
	db $01
	%note(20, 6)
	db $02
	db $01
	%note(20, 3)
	%note(00, 6)
	%end_track()

..558A:
	%end_track()

..558B:
	%end_track()

..558C:
	%end_track()

..558D:
	%end_track()

..558E:
	%end_track()

..558F:
	%end_track()

	incbin "audio/06893B.bin":$4790..$0

	base off

	;-----

	dw $0060, $5800

	db $40, $59, $76, $59, $88, $59, $A3, $59, $E8, $5C, $E8, $5C, $84, $63, $CC, $63
	db $F0, $63, $38, $64, $5C, $64, $5C, $64, $C2, $73, $C2, $73, $AC, $7D, $0F, $7E
	db $21, $7E, $DA, $88, $FD, $8F, $53, $91, $40, $A1, $81, $A5, $A5, $A5, $91, $AA
	db $B5, $AA, $39, $AE, $8A, $AE, $99, $B1, $BD, $B1, $4A, $B5, $AF, $C2, $98, $CA
	db $98, $D3, $94, $DD, $E5, $DD, $97, $E3, $A6, $EF, $C1, $EF, $12, $F0, $D8, $F0
	db $FC, $F0, $FC, $F0, $D5, $FC, $27, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

	;-----

	dw $0090, $5880

	db $00, $FF, $E0, $B8, $02, $00, $01, $FF, $EC, $B8, $1F, $00, $02, $FF, $F3, $B8
	db $07, $A8, $03, $FF, $E0, $B8, $04, $00, $04, $FF, $E0, $B8, $04, $00, $05, $FF
	db $E0, $B8, $07, $A8, $06, $FF, $E0, $B8, $07, $A8, $07, $FF, $F3, $B8, $02, $00
	db $08, $FF, $E0, $B8, $14, $40, $09, $FF, $E0, $B8, $09, $00, $0A, $FF, $F1, $B8
	db $04, $00, $0B, $FF, $E0, $B8, $04, $00, $0C, $FF, $E0, $B8, $09, $00, $0D, $FF
	db $E0, $B8, $04, $00, $0E, $FF, $E0, $B8, $03, $C0, $0F, $FF, $E0, $B8, $02, $80
	db $10, $FF, $E0, $B8, $09, $00, $11, $FF, $E0, $B8, $03, $C0, $12, $FF, $EF, $B8
	db $09, $00, $13, $FF, $EE, $B8, $04, $00, $14, $FF, $E0, $B8, $05, $59, $15, $FF
	db $EC, $B8, $07, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF


	;-----

	dw $A630, $5940 : incbin "audio/06D405.bin":$0..$2BFB ;passes over into next bank. possibly samples

	arch 65816
