;lots of useful notes on the code / format:
;https://github.com/loveemu/vgm-disasm/blob/master/snes/Capcom/Super%20Ghouls%20'N%20Ghosts.s
;https://wiki.superfamicom.org/capcom-music-format

org $068000

    arch spc700 ;APU code/data

    ;format: byte amount to copy | apuram destination address | data to send

{ ;0300 - 03CA
if !version == 0 || !version == 1
    dw $0933, $0300
elseif !version == 2
    dw $092B, $0300
endif

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
if !version == 0 || !version == 1
    mov  $D7, #$E8
elseif !version == 2
    mov  $D7, #$00
endif
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

if !version == 2
    incsrc "music/spc_code.asm"
endif

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
if !version == 0 || !version == 1
    bbc7 $C9, spc_06EB

    clrc
    adc  a, #$E8
    bra  spc_06EE

spc_06EB:
elseif !version == 2
    bbs7 $C9, spc_06EE
endif
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
if !version == 0 || !version == 1
    cmp  y, #$55
    bcc  +

    mov  y, #$54
elseif !version == 2
    cmp  y, #$61
    bcc  +

    mov  y, #$60
endif
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
    adc  $C0, #spc_5880
    adc  $C1, #spc_5880>>8
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

if !version == 0 || !version == 1
    clrc
    adc  a, #$E8
endif
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

if !version == 0 || !version == 1
    incsrc "music/spc_code.asm"
endif

base off

;-----

if !version == 0 || !version == 1
    dw $49CE, $0E00
elseif !version == 2
    dw $4A9F, $0E00
endif

base $0E00 : spc_0E00:
    db $6A, $4C

.0E02:
    ;music
    dw be($0000), be(.stage1), be(.stage2), be(.stage5), be(.stage4), be(.stage3), be(.stage6), be($0000)
    dw be(.stage8), be(.stage1_boss), be(.stage2_boss), be(.stage3_boss), be(.stage4_boss), be(.stage5_boss), be(.stage6_boss), be($0000)
    dw be(.stage_clear), be(.game_over), be(.map), be(.continue), be(.talk_princess), be(.game_start), be(.ending), be($0000)
    dw be($0000), be($0000), be($0000), be($0000), be($0000), be($0000), be($0000), be($0000)

    ;sound
    dw be(.lance), be(.bowgun), be(.knife), be(.scythe)
    dw be(.torch), be(.unk25), be(.hydra_fireball), be(.lance2)
    dw be(.bowgun2), be(.knife2), be(.unk2A), be(.arthur_jump)
    dw be(.arthur_land), be(.arthur_steel_armor), be(.arthur_upgraded_armor), be(.arthur_break_armor)
    dw be(.item_pickup), be(.arthur_death), be(.water_crash_begin), be(.water_crash_end)
    dw be(.earthquake), be(.projectile), be(.pause), be(.menu_movement)
    dw be(.hit), be(.impact), be(.bracelet), be(.enemy_death)
    dw be(.empty3C), be(.raft_pulley), be(.vortex), be(.ghost_spawn)
    dw be(.guillotine), be(.unk41), be(.unk42), be(.ice)
    dw be(.bars), be(.grow), be(.flying_knight), be(.shatter)
    dw be(.gate_open), be(.rosebud_grow), be(.ship_creak), be(.fireworks)
    dw be(.cockatrice_spew), be(.skulls), be(.rosebud_explode), be(.ghost_destroy)
    dw be(.mimic_shake), be(.mimic_jump), be(.magic_charge), be(.magic_release)
    dw be(.magic_seek), be(.magic_tornado), be(.magic_shield), be(.magic_lightning)
    dw be(.astaroth_laser), be(.astaroth_flame), be(.transform), be(.rotating_platform)
    dw be(.rotating_platform_end), be(.lightning), be(.unk5E), be(.axe2_triblade2)
    dw be(.projectile2), be(.1up), be(.capcom_jingle)
    dw be(.menu_select), be(.death_crawler_spin), be(.hydra_transform), be(.hydra_transform2)
    dw be(.axe_triblade_claw), be(.avalanche), be(.collision)

;-----

.stage1: incsrc "music/stage1.asm"
.stage2: incsrc "music/stage2.asm"
.stage5: incsrc "music/stage5.asm"
.stage4: incsrc "music/stage4.asm"
.stage3: incsrc "music/stage3.asm"
.stage6: incsrc "music/stage6.asm"
.stage8: incsrc "music/stage8.asm"
.stage1_boss: incsrc "music/stage1_boss.asm"
.stage2_boss: incsrc "music/stage2_boss.asm"
.stage3_boss: incsrc "music/stage3_boss.asm"
.stage4_boss: incsrc "music/stage4_boss.asm"
.stage5_boss: incsrc "music/stage5_boss.asm"
.stage6_boss: incsrc "music/stage6_boss.asm"
.stage_clear: incsrc "music/stage_clear.asm"
.game_over: incsrc "music/game_over.asm"
.map: incsrc "music/map.asm"
.continue: incsrc "music/continue.asm"
.talk_princess: incsrc "music/talk_princess.asm"
.game_start: incsrc "music/game_start.asm"
.ending: incsrc "music/ending.asm"

;-----

;todo: maybe match names with "music / sfx IDs" section in chou.asm

.lance:                 incsrc "sfx/lance.asm"
.bowgun:                incsrc "sfx/bowgun.asm"
.knife:                 incsrc "sfx/knife.asm"
.scythe:                incsrc "sfx/scythe.asm"
.torch:                 incsrc "sfx/torch.asm"
.unk25:                 incsrc "sfx/unk25.asm"
.hydra_fireball:        incsrc "sfx/hydra_fireball.asm" ;torch2 sfx in prototype
.lance2:                incsrc "sfx/lance2.asm"
.bowgun2:               incsrc "sfx/bowgun2.asm"
.knife2:                incsrc "sfx/knife2.asm"
.unk2A:                 incsrc "sfx/unk2A.asm" ;another proto sound?
.arthur_jump:           incsrc "sfx/arthur_jump.asm"
.arthur_land:           incsrc "sfx/arthur_land.asm"
.arthur_steel_armor:    incsrc "sfx/arthur_steel_armor.asm"
.arthur_upgraded_armor: incsrc "sfx/arthur_upgraded_armor.asm"
.arthur_break_armor:    incsrc "sfx/arthur_break_armor.asm"
.item_pickup:           incsrc "sfx/item_pickup.asm"
.arthur_death:          incsrc "sfx/arthur_death.asm"
.water_crash_begin:     incsrc "sfx/water_crash_begin.asm"
.water_crash_end:       incsrc "sfx/water_crash_end.asm"
.earthquake:            incsrc "sfx/earthquake.asm"
.projectile:            incsrc "sfx/projectile.asm" ;siren, storm cesaris, death crawler
.pause:                 incsrc "sfx/pause.asm"
.menu_movement:         incsrc "sfx/menu_movement.asm"
.hit:                   incsrc "sfx/hit.asm"
.impact:                incsrc "sfx/impact.asm" ;stomp / shake
.bracelet:              incsrc "sfx/bracelet.asm"
.enemy_death:           incsrc "sfx/enemy_death.asm"
.empty3C:               incsrc "sfx/empty3C.asm"
.raft_pulley:           incsrc "sfx/raft_pulley.asm"
.vortex:                incsrc "sfx/vortex.asm"
.ghost_spawn:           incsrc "sfx/ghost_spawn.asm"
.guillotine:            incsrc "sfx/guillotine.asm"
.unk41:                 incsrc "sfx/unk41.asm"
.unk42:                 incsrc "sfx/unk42.asm"
.ice:                   incsrc "sfx/ice.asm"
.bars:                  incsrc "sfx/bars.asm"
.grow:                  incsrc "sfx/grow.asm"
.flying_knight:         incsrc "sfx/flying_knight.asm"
.shatter:               incsrc "sfx/shatter.asm"
.gate_open:             incsrc "sfx/gate_open.asm"
.rosebud_grow:          incsrc "sfx/rosebud_grow.asm"
.ship_creak:            incsrc "sfx/ship_creak.asm"
.fireworks:             incsrc "sfx/fireworks.asm"
.cockatrice_spew:       incsrc "sfx/cockatrice_spew.asm"
.skulls:                incsrc "sfx/skulls.asm"
.rosebud_explode:       incsrc "sfx/rosebud_explode.asm"
.ghost_destroy:         incsrc "sfx/ghost_destroy.asm"
.mimic_shake:           incsrc "sfx/mimic_shake.asm"
.mimic_jump:            incsrc "sfx/mimic_jump.asm"
.magic_charge:          incsrc "sfx/magic_charge.asm"
.magic_release:         incsrc "sfx/magic_release.asm"
.magic_seek:            incsrc "sfx/magic_seek.asm"
.magic_tornado:         incsrc "sfx/magic_tornado.asm"
.magic_shield:          incsrc "sfx/magic_shield.asm"
.magic_lightning:       incsrc "sfx/magic_lightning.asm"
.astaroth_laser:        incsrc "sfx/astaroth_laser.asm" ;also used by nebiroth
.astaroth_flame:        incsrc "sfx/astaroth_flame.asm" ;also used by nebiroth
.transform:             incsrc "sfx/transform.asm"
.rotating_platform:     incsrc "sfx/rotating_platform.asm"
.rotating_platform_end: incsrc "sfx/rotating_platform_end.asm"
.lightning:             incsrc "sfx/lightning.asm"
.unk5E:                 incsrc "sfx/unk5E.asm"
.axe2_triblade2:        incsrc "sfx/axe2_triblade2.asm"
.projectile2:           incsrc "sfx/projectile2.asm" ;arremer, veil allocen projectile, samael platform, some weird menu thing
.1up:                   incsrc "sfx/1up.asm"
.capcom_jingle:         incsrc "sfx/capcom_jingle.asm"
.menu_select:           incsrc "sfx/menu_select.asm"
.death_crawler_spin:    incsrc "sfx/death_crawler_spin.asm"
.hydra_transform:       incsrc "sfx/hydra_transform.asm"
.hydra_transform2:      incsrc "sfx/hydra_transform2.asm"
.axe_triblade_claw:     incsrc "sfx/axe_triblade_claw.asm"
.avalanche:             incsrc "sfx/avalanche.asm"
.collision:             incsrc "sfx/collision.asm"

base off

;-----

if !version == 0 || !version == 1
    dw $0060, $5800

    ;looks like offsets, not sure when these are being used?
    dw $5940, $5976, $5988, $59A3, $5CE8, $5CE8, $6384, $63CC
    dw $63F0, $6438, $645C, $645C, $73C2, $73C2, $7DAC, $7E0F
    dw $7E21, $88DA, $8FFD, $9153, $A140, $A581, $A5A5, $AA91
    dw $AAB5, $AE39, $AE8A, $B199, $B1BD, $B54A, $C2AF, $CA98
    dw $D398, $DD94, $DDE5, $E397, $EFA6, $EFC1, $F012, $F0D8
    dw $F0FC, $F0FC, $FCD5, $FF27, $FFFF, $FFFF, $FFFF, $FFFF
elseif !version == 2
    dw $9CD0, $6300 : base $6300

    dw $63DC, $6412, $6424, $643F, $6784, $6784, $6E20, $6E68
    dw $6E8C, $6ED4, $6EF8, $6EF8, $7E5E, $7E5E, $8848, $88AB
    dw $88BD, $9376, $9A99, $9BEF, $ABDC, $B01D, $B041, $B52D
    dw $B551, $B8D5, $B926, $BC35, $BC59, $C0FD, $C643, $CE2C
    dw $D72C, $E128, $E179, $E72B, $F33A, $F355, $F379, $F43F
    dw $F463, $F463, $FF64, $FF7F
endif

;-----

if !version == 0 || !version == 1
    dw $0090, $5880 : base $5880
endif

spc_5880:
    db $00, $FF, $E0, $B8, $02, $00, $01, $FF, $EC, $B8, $1F, $00, $02, $FF, $F3, $B8
    db $07, $A8, $03, $FF, $E0, $B8, $04, $00, $04, $FF, $E0, $B8, $04, $00, $05, $FF
    db $E0, $B8, $07, $A8, $06, $FF, $E0, $B8, $07, $A8, $07, $FF, $F3, $B8, $02, $00
    db $08, $FF, $E0, $B8, $14, $40, $09, $FF, $E0, $B8, $09, $00, $0A, $FF, $F1, $B8
    db $04, $00, $0B, $FF, $E0, $B8, $04, $00, $0C, $FF, $E0, $B8, $09, $00, $0D, $FF
    db $E0, $B8, $04, $00, $0E, $FF
if !version == 0 || !version == 1
    db $E0, $B8, $03, $C0, $0F, $FF, $E0, $B8, $02, $80, $10, $FF, $E0, $B8, $09, $00
    db $11, $FF, $E0, $B8, $03, $C0, $12, $FF, $EF, $B8, $09, $00, $13, $FF, $EE, $B8
    db $04, $00, $14, $FF, $E0, $B8, $05, $59, $15, $FF, $EC, $B8, $07, $00

    db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
elseif !version == 2
    db $E0, $B8, $01, $80, $0F, $FF, $E0, $B8, $02, $80, $10, $FF, $E0, $B8, $09, $00
    db $11, $FF, $E0, $B8, $03, $C0, $12, $FF, $F0, $B8, $04, $00, $13, $FF, $EE, $B8
    db $04, $00, $14, $FF, $E0, $B8, $04, $F7, $15, $FF, $F1, $B8, $09, $00
endif

base off

;-----

check bankcross off

if !version == 0 || !version == 1
    dw $A630, $5940

    incbin "audio/06D405.bin" ;passes over into next bank. possibly samples
elseif !version == 2
    incbin "audio/06D405.bin":$0000..$5886
    incbin "audio/spc_eu1.bin"
    incbin "audio/06D405.bin":$696F..$9671

    db $45, $54, $33, $32, $00, $11, $00, $8A, $42, $11, $33, $0E, $E2, $42, $01, $21
    db $7A, $EE, $1F, $EB, $D2, $63, $DB, $AB, $BC, $8A, $E0, $FC, $CF, $1F, $ED, $F0
    db $01, $34, $8A, $20, $F1, $11, $11, $FF, $F2, $43, $11, $8B, $32, $21, $33, $0E
    db $E2, $42, $01, $21, $02

    incbin "audio/06D405.bin":$96D3..$97C5
    incbin "audio/spc_eu2.bin"
    incbin "audio/06D405.bin":$9CA5..0
endif

;-----

    dw $0000, $0300

    arch 65816
}

{ ;FA39 - FFFF
if !version == 0
    fillbyte $FF : fill 1479
elseif !version == 1 || !version == 2
    incbin "fill_bytes/us/bank07a.bin"
endif
}

check bankcross full
