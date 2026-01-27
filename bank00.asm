org $008000

{ ;8000 - 80FF
if !version == 0
    fillbyte $FF : fill 256
elseif !version == 1 || !version == 2
    incbin "fill_bytes/eng/bank00a.bin"
endif
}

{ ;8100 - 8107
clear_snes_regs: ;a8 x8
    stz $2100,X
    inx
    dey : bpl clear_snes_regs

    rts
}

{ ;8108 - 81F6
entry: ;emulated mode (code entry)
    stz $02F3
    stz $02F4
    sei
    clc
    xce
    !X16
    ldx #stack[7].top : txs
    !X8
    lda #$8F : sta.w INIDISP
    ldx #$0D
.8120:
    cpx #$01
    beq .812A

    stz $4200,X
    dex : bpl .8120

.812A:
    lda #$FF : sta !WRIO
    ldx #$01 : ldy #$0B : jsr clear_snes_regs
    ldx #$15 : ldy #$05 : jsr clear_snes_regs
    ldx #$23 : ldy #$10 : jsr clear_snes_regs
    stz !MDMAEN
    phb
    lda #$7E : pha : plb
    !X16
    ldy $02F3
    lda $02F5

    ldx #$E000
.8157:
    stz $1FFF,X
    dex : bne .8157

    ldx #$1FD7
.8160:
    stz $0000,X
    dex : bpl .8160

    sta $02F5
    sty $02F3
    plb
    !AX8
    lda #$F4 : jsl _018049_8053
    lda #$F0 : jsl _018049_8053

    ldy #$90
    ldx #$0C
.817F:
    lda.w stack_offsets+0,X : sta.w !handler_offset.stack_id+0,Y
    lda.w stack_offsets+1,X : sta.w !handler_offset.stack_id+1,Y
    sec : tya : sbc.b #handler.len : tay
    dex #2 : bpl .817F

    lda #$C3 : sta.w rng_state
    lda #$01 : sta.w rng_state+1
    lda.b #irq    : sta $0030
    lda.b #irq>>8 : sta $0031
    stz $0000 ;lowest byte of spc_code_start address
    lda.b #spc_code_start>>8  : sta $0001
    lda.b #spc_code_start>>16 : sta $0002
    !A16
    lda $02F3
    cmp #$3901
    beq .81D7

    lda #$3901 : sta $0002F3
    stz $02F5
    jsl _01931E
.81CD:
    lda !APUI00
    dec : bne .81CD

    inc
    sta $02F5
.81D7:
    !A8
    lda #$01 : sta $02F1
    jsl enable_nmi
    cli
    lda.b #_01FF00>>8 : sta $40
    ldy #$00 : lda.b #_01FF00_00 : jsl _01A6FE
    jsl _03E7FE
    jml _01A6AB
}

{ ;81F7 - 83A3
nmi: ;a- x-
    !AX16
    pha
    phb
    phd
    phx
    phy
    cld
    lda #$0000
    tcd
    !AX8
    pha
    plb
    inc $02C4
    stz !HDMAEN
    jsl disable_nmi
    jsr _0089F4
    lda #$80 : sta.w INIDISP
    inc $02B6
    lda !RDNMI
    lda $0379
    beq .825B

    stz.w OAMADDL
    stz.w OAMADDH
    lda #$00 : sta !DMAP0
    lda #$04 : sta !BBAD0
    lda #$00 : sta !A1T0L
    lda #$F1 : sta !A1T0H
    lda #$7E : sta !A1B0
    lda #$20 : sta !DAS0L
    lda #$02 : sta !DAS0H
    lda #$01 : sta !MDMAEN
    jsr _008669
    jsr _00893C
    jsr _0085A6_85AA
.825B:
    jsr _008807
    jsr _008735
    jsr _00898C
    jsr _008A56
    jsr _008AB3
    jsr _0089B0

    lda $02E2 : sta !WH0
    lda $02E3 : sta !WH1
    lda $02E4 : sta !WH2
    lda $02E5 : sta !WH3
    lda $02DC : sta !BG1SC
    lda $02DD : sta !BG2SC
    lda $02DE : sta !BG3SC
    lda $02E6 : sta !W12SEL
    lda $02E7 : sta !W34SEL
    lda $02E8 : sta !WOBJSEL
    lda $02E9 : sta !WBGLOG
    lda $02EA : sta !WOBJLOG
    lda $02EB : sta !CGWSEL
    lda $02EC : sta !CGADSUB
    lda $02EE : sta !COLDATA
    lda $02D5 : ldx $02D6 : sta !TM : stx !TS
    lda $02C7 : sta !TMW
    lda $02C8 : sta !TSW
    lda $02E0 : sta !BG12NBA
    lda $02E1 : sta !BG34NBA

    jsr _008700
    lda $02D9 : sta !BGMODE
    lda $032E
    beq +

    lda $02D9 : and #$39 : ora #$08 : sta !BGMODE
    lda #$5C : sta !BG3SC
    lda #$05 : sta !BG34NBA
+:
    lda $1FAE
    beq +

    lda $02F0 : sta !HDMAEN
    bra .835F

+:
    !A16
    lda !A1T1L : sta !A2A1L
    lda !A1T2L : sta !A2A2L
    lda !A1T3L : sta !A2A3L
    lda !A1T4L : sta !A2A4L
    lda !A1T5L : sta !A2A5L
    lda !A1T6L : sta !A2A6L
    lda !A1T7L : sta !A2A7L
    !A8
    lda #$01
    sta !NTRL1 : sta !NTRL2 : sta !NTRL3 : sta !NTRL4
    sta !NTRL5 : sta !NTRL6 : sta !NTRL7
.835F:
    lda $02F2 : sta.w INIDISP
    jsr _0083C2_83C3
    jsr _00847F
    lda #$98 : sta !HTIMEL : stz !HTIMEH
    lda #$26 : sta !VTIMEL : stz !VTIMEH

    ldx #$A8
.837D:
    lda.w !handler_offset[-1].state,X
    cmp #$01
    bne +

    dec.w !handler_offset[-1].timer,X
    bne +

    lda #$04 : sta.w !handler_offset[-1].state,X
+:
    sec : txa : sbc.b #handler.len : tax
    bne .837D

    jsr _00853D
    jsl enable_nmi

    !AX16
    ply
    plx
    pld
    plb
    pla
    rti
}

{ ;83A4 - 83C1
irq: ;a- x-
    !A8
    pha
    phb
    lda #$00 : pha : plb
    lda !TIMEUP
-:
    bit !HVBJOY
    bvc -

    lda $02F0 : sta !HDMAEN
    lda #$81  : sta !NMITIMEN
    plb
    pla
    rti
}

{ ;83C2 - 847E
_0083C2:
    rts

.83C3: ;a8 x8
    lda $1F2F
    beq _0083C2

    phb
    lda.b #bank09>>16 : pha : plb
    phd
    !A16 : lda.w #!obj_objects.base : tcd : !A8
    lda #$1F : sta $0036
    stz $0037
.83DE:
    !A8
    lda.w stage
    cmp #$04
    beq .83EB

    bit $09
    bvc .846A

.83EB:
    lda $09
    bit #$04
    beq .846A

    clc
    lda $1F2B
    adc $1F2E
    and #$7F
    asl
    tay
    !A16
    sec
    lda $39
    sbc $1F33
    ldx.w _09FD00+0,Y
    phy
    jsr _00851D
    sty $0032
    stx $0033
    ply
    sec
    lda $3B
    sbc $1F35
    ldx.w _09FD00+1,Y
    phy
    jsr _00851D
    sty $0034
    stx $0035
    ply
    sec
    lda $0032
    sbc $0034
    asl
    clc
    adc $1F33
    sta $1F
    sec
    lda $39
    sbc $1F33
    ldx.w _09FD00+1,Y
    phy
    jsr _00851D
    sty $0032
    stx $0033
    ply
    sec
    lda $3B
    sbc $1F35
    ldx.w _09FD00+0,Y
    phy
    jsr _00851D
    sty $0034
    stx $0035
    ply
    clc
    lda $0032
    adc $0034
    asl
    clc
    adc $1F35
    sta $22
.846A:
    !A16
    clc
    tdc
    adc #$0041
    tcd
    dec $0036
    beq +

    jmp .83DE
+:
    !AX8
    pld
    plb
    rts
}

{ ;847F - 851C
_00847F: ;a8 x8
    lda $02D9
    and #$07
    cmp #$07
    bne .ret

    lda $1FB0
    bne .84C0

    lda $02C9 : sta !M7A
    lda $02CA : sta !M7A
    lda $02CB : sta !M7B
    lda $02CC : sta !M7B
    lda $02CD : sta !M7C
    lda $02CE : sta !M7C
    lda $02CF : sta !M7D
    lda $02D0 : sta !M7D
    bra .8502

.ret:
    rts

.84C0:
    !A16
    lda $02CF : ldx $1FA3 : jsr _00851D
    sty !M7D
    stx !M7D
    lda $02CD : ldx $1FA2 : jsr _00851D
    sty !M7C
    stx !M7C
    lda $02CB : ldx $1FA1 : jsr _00851D
    phy : phx
    lda $02C9 : ldx $1FA0 : jsr _00851D
    sty !M7A
    stx !M7A
    plx : ply
    sty !M7B
    stx !M7B
.8502:
    !A8
    lda $02D1 : sta !M7X
    lda $02D2 : sta !M7X
    lda $02D3 : sta !M7Y
    lda $02D4 : sta !M7Y
    rts
}

{ ;851D - 853C
_00851D: ;a16 x8
    eor #$FFFF
    inc
    tay
    sty !M7A
    xba
    tay
    sty !M7A
    txa
    eor #$FFFF
    inc
    tax
    stx !M7B
    ldy !MPYM
    ldx !MPYH : stx !M7B
    rts
}

{ ;853D - 8576
_00853D: ;a8 x8
    ldx $02F6
    cpx $02F7
    beq .ret

    lda !APUI00
    cmp $02F5
    bne .ret

    inc $02F5
    lda $02F8,X
    cmp #$F5
    beq +

    cmp #$F6
    bne .856B
+:
    pha
    txa
    inc
    and #$1F
    sta $02F6
    tax
    lda $02F8,X : sta !APUI01
    pla
.856B:
    sta !APUI00
    txa
    inc
    and #$1F
    sta $02F6
.ret:
    rts

;-----

    rts ;dead code?
}

{ ;8577 - 85A5
_008577: ;a8 x-
    ;unused function
    stz.w OAMADDL
    stz.w OAMADDH
    lda #$00 : sta !DMAP0
    lda #$04 : sta !BBAD0
    lda #$00 : sta !A1T0L
    lda #$F1 : sta !A1T0H
    lda #$7E : sta !A1B0
    lda #$20 : sta !DAS0L
    lda #$02 : sta !DAS0H
    lda #$01 : sta !MDMAEN
    rts
}

{ ;85A6 - 8668
_0085A6: ;a- x8
    jsr .85AA
    rtl

.85AA: ;a- x8
    phd
    !A16
    lda #$15A2 : tcd
    jsr .85C6
    lda #$16F8 : tcd
    jsr .85C6
    lda #$184E : tcd
    jsr .85C6
    !A8
    pld
    rts

;-----

.85C6:
    ldy $50
    beq .8617

    ldx #$00 : stx $50 : stx !A1B0
    lda $51    : sta !VMADDL
    ldx #$81   : stx !VMAIN
    lda #$1801 : sta !DMAP0
    tdc
    clc
    adc #$0053
    sta !A1T0L
    lda #$0040 : sta !DAS0L
    ldx #$01   : stx !MDMAEN
    dey : beq .8617

    lda $51
    eor #$0800
    sta !VMADDL
    tdc
    clc
    adc #$0093
    sta !A1T0L
    ldx #$00   : stx !A1B0
    lda #$0040 : sta !DAS0L
    ldx #$01   : stx !MDMAEN
.8617:
    ldy $D3
    beq .ret

    ldx #$00 : stx $D3 : stx !A1B0
    lda $D4    : sta !VMADDL
    ldx #$80   : stx !VMAIN
    lda #$1801 : sta !DMAP0
    tdc
    clc
    adc #$00D6
    sta !A1T0L
    lda #$0040 : sta !DAS0L
    ldx #$01   : stx !MDMAEN
    dey : beq .ret

    lda $D4
    eor #$0400
    sta !VMADDL
    tdc
    clc
    adc #$0116
    sta !A1T0L
    ldx #$00   : stx !A1B0
    lda #$0040 : sta !DAS0L
    ldx #$01   : stx !MDMAEN
.ret
    rts
}

{ ;8669 - 86B3
_008669: ;a8 x8
    lda $037A : beq .ret

    ldy $037B : beq .ret

    ldx #$00
    !A16
-:
    lda $037C,X : sta !VMADDL
    lda #$1801  : sta !DMAP0
    lda $037E,X : sta !A1T0L
    lda $0380,X : sta !A1B0
    lda $0381,X : sta !DAS0L
    phy
    ldy $0383,X : sty !VMAIN
    ldy #$01    : sty !MDMAEN
    ply
    clc
    txa
    adc #$0008
    tax
    dey : bne -

    !A8
    stz $037A
    stz $037B
.ret:
    rts
}

{ ;86B4 - 86FB
    ;unused
    dw $6600, $EE00, $6001, $0000, $0000, $0066, $01F0, $00C0, $0000
    dw $6600, $F200, $C001, $0000, $0000, $0066, $01F4, $00C0, $0000
    dw $6600, $F600, $8001, $0000, $0000, $0066, $01F8, $00C0, $0000
    dw $6600, $FA00, $A001, $0000, $0000, $0066, $01FC, $0080, $0000
}

{ ;86FC - 86FF
_0086FC: ;a8 x8
    jsr _008807
    rtl
}

{ ;8700 - 8734
_008700: ;a8 x-
    lda.w layer3_needs_update
    beq .ret

    lda #$80   : sta !VMAIN
    stz.w layer3_needs_update
    !A16
    lda $0318  : sta !VMADDL
    lda #$1801 : sta !DMAP0
    lda.w #_7F9000     : sta !A1T0L
    lda.w #_7F9000>>16 : sta !A1B0
    lda $031A  : sta !DAS0L
    !A8
    lda #$01   : sta !MDMAEN
.ret:
    rts
}

{ ;8735 - 8806
_008735: ;a8 x8
    ldx $1F31
    beq .ret

    jsr (.8741-2,X)
    stz $1F31
.ret:
    rts

.8741: dw .874D, .8790, .8790, .8790, .87CE, .8790

;-----

.874D:
    ldy #$00
    lda #$05 : sta $0034
    stz !VMAIN
    lda #$12 : sta $0032
    lda #$23 : sta $0033
.8761:
    lda $0032
    ldx $0033
    sta !VMADDL
    stx !VMADDH
    ldx #$07
.876F:
    lda.w _00A317,Y : sta !VMDATAL
    iny
    dex : bpl .876F

    clc
    lda $0032 : adc #$80 : sta $0032
    lda $0033 : adc #$00 : sta $0033
    dec $0034
    bpl .8761

    rts

;-----

.8790:
    sec
    lda $1F31
    sbc #$04
    lsr
    tax
    lda.w _00A317_A347,X
    stz !VMADDL
    sta !VMADDH
    stz !VMAIN
    lda #$08 : sta !DMAP0
    lda #$18 : sta !BBAD0
    lda.b #.src     : sta !A1T0L
    lda.b #.src>>8  : sta !A1T0H
    lda.b #.src>>16 : sta !A1B0
    lda #$00 : sta !DAS0L
    lda #$10 : sta !DAS0H
    lda #$01 : sta !MDMAEN
    rts

.src: db $40

;-----

.87CE:
    lda #$80 : sta !VMAIN
    lda #$81 : sta !DMAP0
    lda #$39 : sta !BBAD0
    lda #$00 : sta !A1T0L
    lda #$10 : sta !A1T0H
    lda #$7F : sta !A1B0
    !A16
    lda #$1C00 : sta !DAS0L
    !A8
    stz !VMADDL
    lda #$70 : sta !VMADDH
    lda $213A
    lda #$01 : sta !MDMAEN
    rts
}

{ ;8807 - 893B
_008807: ;a8 x8
    ldx #$00
    jsr .880E
    ldx #$01
.880E:
    ldy #$01
    lda $031E,X
    beq .8870

    stz $031E,X
    bpl .8830

    pha
    tax
    and #$7F
    tax
    pla
    ldy #$09
    cmp #$94
    beq .8831

    cmp #$8A
    bcc .8831

    ldy #$00
    lda #$19
    bra .8833

.8830: ;a8 x8
    tax
.8831:
    lda #$18
.8833:
    sta !BBAD0
    lda #$80    : sta !VMAIN : sty !DMAP0
    ldy .8871-1,X
    lda .8871+0,Y : sta !VMADDL
    lda .8871+1,Y : sta !VMADDH
    lda .8871+2,Y : sta !A1T0L
    lda .8871+3,Y : sta !A1T0H
    lda .8871+4,Y : sta !A1B0
    lda .8871+5,Y : sta !DAS0L
    lda .8871+6,Y : sta !DAS0H
    lda #$01      : sta !MDMAEN
.8870:
    rts

.8871:
    db offset(.8871, .888A), offset(.8871, .8891), offset(.8871, .8898), offset(.8871, .889F)
    db offset(.8871, .88A6), offset(.8871, .88B0), offset(.8871, .88B7), offset(.8871, .88BE)
    db offset(.8871, .88C5), offset(.8871, .88CC), offset(.8871, .88D3), offset(.8871, .88DA)
    db offset(.8871, .88E1), offset(.8871, .88E8), offset(.8871, .88EF), offset(.8871, .88F6)
    db offset(.8871, .88FD), offset(.8871, .8904), offset(.8871, .890B), offset(.8871, .8912)
    db offset(.8871, .8919), offset(.8871, .8920), offset(.8871, .8927), offset(.8871, .892E)
    db offset(.8871, .8935)
if !version == 1 || !version == 2
    db offset(.8871, .893D)
endif

.888A: dw $0000 : dl $7EB000 : dw $1000
.8891: dw $0C00 : dl $7EE000 : dw $0800
.8898: dw $0800 : dl $7ED800 : dw $0800
.889F: dw $0C00 : dl $7ED000 : dw $0800
.88A6: dw $1800 : dl .88AD   : dw $1000

.88AD: db $03, $4E, $02 ;leftover bytes?

.88B0: dw $0000 : dl $7EB000 : dw $0800 ;send collision array to vram (stage 1)
.88B7: dw $0400 : dl $7EB800 : dw $0800 ;send collision array to vram (stage 1)
.88BE: dw $0000 : dl $7EC000 : dw $0800
.88C5: dw $0400 : dl $7EC800 : dw $0800
.88CC: dw $0000 : dl $7FA000 : dw $1000
.88D3: dw $0000 : dl $7FB000 : dw $1000
.88DA: dw $0000 : dl $7FC000 : dw $1000
.88E1: dw $0000 : dl $7FDC00 : dw $1800
.88E8: dw $1000 : dl $7F0000 : dw $1000
.88EF: dw $2000 : dl $7F1000 : dw $1000
.88F6: dw $3000 : dl $7F2000 : dw $1000
.88FD: dw $1040 : dl $7F0040 : dw $04C0
.8904: dw $1040 : dl $7F2A00 : dw $04C0
.890B: dw $1000 : dl $7FB880 : dw $0400
.8912: dw $1000 : dl .88AD+1 : dw $1000
.8919: dw $5C00 : dl $7FD000 : dw $0800
.8920: dw $7000 : dl $7F1000 : dw $1C00
.8927: dw $0C00 : dl $7ED800 : dw $0800
.892E: dw $0000 : dl $7F9800 : dw $0500
.8935: dw $7000 : dl $7F2720 : dw $1000
if !version == 1 || !version == 2
.893D: dw $5C00 : dl $7F9800 : dw $06A0
endif
}

{ ;893C - 898B
_00893C: ;a8 x8
    ldx $1F30
    beq .ret

    stz $1F30
    ldy .8984-1,X
    stz !DMAP0
    lda #$18 : sta !BBAD0
    lda #$00 : sta !VMAIN
    lda .8984+0,Y : sta !VMADDL
    lda .8984+1,Y : sta !VMADDH
    lda .8984+2,Y : sta !A1T0L
    lda .8984+3,Y : sta !A1T0H
    lda .8984+4,Y : sta !A1B0
    lda .8984+5,Y : sta !DAS0L
    lda .8984+6,Y : sta !DAS0H
    lda #$01 : sta !MDMAEN
.ret:
    rts

    .8984: db $01 : dw $2000 : dl $7F0000 : dw $1000
}

{ ;898C - 89AF
_00898C: ;a8 x8
    lda $1A7A
    beq .ret

    sec
    lda.w camera_x+2
    tay
    sbc $1A79
    beq .ret

    bmi +

    iny
+:
    tya
    and #$03
    clc
    adc #$06
    ldy #$01
    jsr _008807_8830
    lda.w camera_x+2 : sta $1A79
.ret:
    rts
}

{ ;89B0 - 89F3
_0089B0: ;a8 x8
    lda $0331
    beq .ret

    stz !CGADD
    stz $0331
    lda #$00 : sta !DMAP0
    lda #$22 : sta !BBAD0
    ldx $0332
    lda _00A300+0,X : sta !A1T0L
    lda _00A300+1,X : sta !A1T0H
    lda _00A300+2,X : sta !A1B0
    cpx #$06
    bne +

    lda #$00
    ldy #$01
    bra .89E8

+:
    lda #$00
    ldy #$02
.89E8:
    sta !DAS0L
    sty !DAS0H
    lda #$01 : sta !MDMAEN
.ret:
    rts
}

{ ;89F4 - 8A55
_0089F4: ;a8 x8
    ldy $032D
    bne +

    lda $19BD : sta !BG1HOFS
    lda $19BE : sta !BG1HOFS
+:
    lda $19C1 : sta !BG1VOFS
    lda $19C2 : sta !BG1VOFS
    lda $19C5 : sta !BG2HOFS
    lda $19C6 : sta !BG2HOFS
    lda $19C9 : sta !BG2VOFS
    lda $19CA : sta !BG2VOFS

    lda $032E : bne +

    lda $19CD : sta !BG3HOFS
    lda $19CE : sta !BG3HOFS
    lda $19D1 : sta !BG3VOFS
    lda $19D2 : sta !BG3VOFS
    rts

+:
    stz !BG3HOFS
    stz !BG3HOFS
    lda #$C0 : sta !BG3VOFS ;only draw the bottom of layer 3 (HUD)
    stz !BG3VOFS
    rts
}

{ ;8A56 - 8AB2
_008A56: ; a8 x8
    ldy #$00 : jsr .8A67
    ldy #$10 : jsr .8A67
    ldy #$20 : jsr .8A67
    ldy #$30
.8A67:
    lda $1566,Y
    bne .8A6D

    rts

.8A6D:
    lda #$00 : sta $1566,Y
    !X16
    ldx $156A,Y
-:
    ldy $0000,X : sty !VMADDL
    ldy #$1801  : sty !DMAP0
    ldy $0002,X : sty !A1T0L
    lda $0004,X : sta !A1B0
    ldy $0005,X : sty !DAS0L
    lda #$80    : sta !VMAIN
    lda #$01    : sta !MDMAEN
    lda $0007,X
    beq .ret

    clc
    !A16
    txa
    adc #$0008
    tax
    !A8
    bra -

.ret:
    !X8
    rts
}

{ ;8AB3 - 8AEB
_008AB3: ;a8 x8
    lda $1EA8
    beq .ret

    lda #$80 : sta !VMAIN
    lda #$01 : sta !DMAP0
    lda #$18 : sta !BBAD0
    lda #$00 : sta !A1T0L
    lda #$00 : sta !A1T0H
    lda #$70 : sta !A1B0
    !A16
    lda #$0800 : sta !DAS0L
    lda #$1800 : sta !VMADDL
    !A8
    lda #$01 : sta !MDMAEN
.ret:
    rts
}

{ ;8AEC - 8B04
brk: ;a- x-
    !AX8
    lda #$01

cop: ;a8 x-
    cli
    sta.b obj.timer
    lda #$01 : sta.b obj.active
    !A16
    pla : sta.b obj.state
    pla : sta.b obj.state+2
    !AX8
    jml _02821B_827A
}

{ ;8B05 - 8B18
_008B05:
    dw offset(_008B05, .8B19), offset(_008B05, .8B48), offset(_008B05, .8B63), offset(_008B05, .8BB0)
    dw offset(_008B05, .8BB2), offset(_008B05, .8BB4), offset(_008B05, .8BC0), offset(_008B05, .8C58)
    dw offset(_008B05, .8C69), offset(_008B05, .8C75)

.8B19:
    dw $0000 : db $00, $03, $01
    dw $0000 : db $2A, $09, $01
    dw $07D0 : db $00, $03, $00
    dw $0860 : db $00, $04, $01
    dw $0860 : db $0E, $05, $01
    dw $09E0 : db $2A, $09, $00
    dw $0C81 : db $1C, $07, $01
    dw $0C82 : db $46, $08, $01
    dw $0DC0 : db $00, $04, $00
    dw $7FFF

.8B48:
    dw $0967 : db $62, $00, $01
    dw $0968 : db $00, $0F, $01
    dw $0A00 : db $72, $03, $01
    dw $0D80 : db $00, $0F, $00
    dw $1180 : db $1C, $10, $01
    dw $7FFF

.8B63:
    dw $0000 : db $00, $22, $01
    dw $000B : db $38, $38, $01
    dw $0030 : db $1C, $26, $01
    dw $0060 : db $2A, $2B, $01
    dw $0100 : db $0E, $25, $01
    dw $0300 : db $38, $38, $00
    dw $05A8 : db $1C, $26, $00
    dw $05B0 : db $2A, $2B, $00
    dw $05E0 : db $0E, $25, $00
    dw $062F : db $00, $22, $00
    dw $0640 : db $38, $11, $01
    dw $0642 : db $00, $16, $01
    dw $0642 : db $0E, $1F, $01
    dw $0642 : db $1C, $20, $01
    dw $0642 : db $2A, $21, $01
    dw $7FFF

.8BB0:
    dw $7FFF

.8BB2:
    dw $7FFF

.8BB4:
    dw $0000 : db $00, $28, $01
    dw $0000 : db $0E, $29, $01
    dw $7FFF

.8BC0:
    dw $0000 : db $62, $06, $01
    dw $0000 : db $00, $12, $01
    dw $0000 : db $0E, $13, $01
    dw $0000 : db $1C, $14, $01
    dw $0000 : db $2A, $15, $01
    dw $0000 : db $38, $0E, $01
    dw $0000 : db $46, $1C, $01
    dw $0278 : db $38, $0E, $00
    dw $027F : db $00, $12, $00
    dw $027F : db $0E, $13, $00
    dw $0282 : db $00, $1D, $01
    dw $0282 : db $38, $0A, $01
    dw $0282 : db $54, $0B, $01
    dw $0410 : db $46, $1C, $00
    dw $06F0 : db $0E, $13, $00
    dw $06F0 : db $1C, $14, $00
    dw $06F0 : db $2A, $15, $00
    dw $06F2 : db $38, $0E, $00
    dw $06F2 : db $46, $0A, $00
    dw $06F4 : db $54, $0B, $00
    dw $06F4 : db $00, $1D, $00
    dw $0720 : db $54, $1E, $01
    dw $0722 : db $0E, $27, $01
    dw $0800 : db $62, $09, $01
    dw $0801 : db $72, $0C, $01
    dw $0984 : db $2A, $23, $01
    dw $0986 : db $1C, $24, $01
    dw $09A6 : db $38, $2E, $01
    dw $09A6 : db $00, $2F, $01
    dw $09A8 : db $46, $2A, $01
    dw $7FFF

.8C58:
    dw $0000 : db $00, $31, $01
    dw $0000 : db $0E, $32, $01
    dw $0000 : db $1C, $37, $01
    dw $7FFF

.8C69:
    dw $0000 : db $00, $2C, $01
    dw $0000 : db $0E, $2D, $01
    dw $7FFF

.8C75:
    dw $0000 : db $00, $39, $01
    dw $0000 : db $0E, $3A, $01
    dw $0000 : db $1C, $3B, $01
    dw $0000 : db $2A, $36, $01
    dw $0000 : db $38, $3C, $01
    dw $7FFF
}

{ ;8C90 - A2FF
if !version == 0
    fillbyte $FF : fill 5744
elseif !version == 1 || !version == 2
    incbin "fill_bytes/eng/bank00b.bin"
endif
}

{ ;A300 - A308
_00A300: dl $7EF400, $7F9E00, $7F9800
}

{ ;A309 - A316
stack_offsets:
    dw stack[0].top, stack[1].top, stack[2].top, stack[3].top
    dw stack[4].top, stack[5].top, stack[6].top
}

{ ;A317 - A34C
_00A317:
    ;death crawler destroyed head
    db $40, $40, $40, $40, $40, $40, $40, $40
    db $40, $40, $40, $40, $40, $40, $40, $40
    db $40, $40, $40, $40, $40, $40, $40, $40
    db $40, $40, $40, $40, $40, $40, $40, $40
    db $40, $40, $40, $40, $40, $E3, $40, $40
    db $40, $40, $40, $E4, $E5, $E6, $E7, $40

.A347: db $10, $20, $30, $00, $00, $00
}

{ ;A34D - A49C
ram_to_vram_offsets:
    ;used by ram_to_vram
    ;unknown length
    ;source | vram dest | count

    dl $1C8000 : dw $6000, $0800 ;00
    dl $03C000 : dw $7C00, $0400 ;07 unused
    dl $03C800 : dw $0000, $0100 ;0E unused
    dl $03C940 : dw $0410, $0280 ;15 unused
    dl $03CFE0 : dw $0200, $0010 ;1C unused
    dl $7F9800 : dw $5C00, $0280 ;23
    dl $7F0000 : dw $6800, $0ED0 ;2A
    dl $7F0000 : dw $75A0, $0360
    dl $18EA00 : dw $6200, $0300
    dl $7F0000 : dw $7000, $1000
    dl $7F0DE0 : dw $7900, $0700
    dl $7F0000 : dw $6000, $0600
    dl $7F0000 : dw $2000, $4000 ;54
    dl $7F2000 : dw $0000, $0400
    dl $7F9800 : dw $5000, $0280
    dl $7F6DC0 : dw $7700, $0700
    dl $7F0000 : dw $0000, $0800
    dl $7F0000 : dw $7200, $0500
    dl $7F4960 : dw $7200, $0390
    dl $7F0000 : dw $7200, $0400
    dl $7F0000 : dw $7590, $01F0
    dl $7F0000 : dw $7400, $0500
if !version == 0 || !version == 1
    dl $7F0000 : dw $0280, $00D0
elseif !version == 2
    dl _04E800 : dw $2000, $0250
endif
    dl $7F0000 : dw $2000, $0800
    dl $7F9800 : dw $0000, $0280
    dl $7F0200 : dw $7200, $0900
    dl $7F0A00 : dw $7200, $0500
    dl $7F0BA0 : dw $7200, $0390
    dl $7F2000 : dw $4600, $0900
    dl $7F7F00 : dw $3000, $0000
    dl $7F7800 : dw $5880, $0900
    dl $7F0000 : dw $0000, $0800
    dl $7F1000 : dw $1000, $0800
    dl $7F3A00 : dw $2000, $0700
    dl $7F3200 : dw $0000, $0400
    dl $7F7800 : dw $5880, $0380
    dl $7F4800 : dw $0000, $0800
    dl $7F5800 : dw $1000, $0800
    dl $7F6800 : dw $1800, $0800
    dl $7FA000 : dw $7000, $1000
    dl $7F0000 : dw $0000, $0400 ;118
    dl $7F0000 : dw $2000, $1000 ;11F
    dl $7F2000 : dw $0000, $0400 ;126
    dl $7F2800 : dw $1000, $0400 ;12D
    dl $7F3000 : dw $0000, $0400 ;134
    dl $7F2000 : dw $7800, $0800 ;13B
    dl $7FD000 : dw $5C00, $0400 ;142
    dl $7F0000 : dw $5280, $00D0 ;149
if !version == 2
    dl _04E000 : dw $0000, $0400
endif
}

{ ;A49D - A4BC
_00A49D:
    dw $0000, $0020, $0040, $0060, $1000, $1020, $1040, $1060
    dw $2000, $2020, $2040, $2060, $3000, $3020, $3040, $3060
}

{ ;A4BD - A4D8
_00A4BD:
    dw $1000 : dl $7F9000 : dw $0010
    dw $1010 : dl $7F9000 : dw $0010
    dw $1200 : dl $7F9000 : dw $0010
    dw $1210 : dl $7F9000 : dw $0010
}

{ ;A4D9 - A4E8
_00A4D9:
    dl $7F0000 : dw $0000, $0000 : db $00
    dl $7F0000 : dw $0000, $0000 : db $40
}

{ ;A4E9 - A530
_00A4E9:
    ;x offset, x limit, y offset, y limit
    dw $00A0, $0140, $00A0, $0140
    dw $00C8, $0190, $00A0, $0140
    dw $00D0, $01A0, $00D0, $01A0
    dw $0090, $0120, $00A0, $0140
    dw $00A0, $0140, $00B0, $0160
    dw $00D0, $01A0, $0090, $0120
    dw $00D0, $01A0, $00B0, $0160
    dw $00B0, $0160, $00A0, $0140
    dw $00F0, $01E0, $00F0, $01E0
}

{ ;A531 - A540
    _00A531: dw $0000, $0060, $00C0, $0120, $0180, $01A8, $01D0, $01F8
}

{ ;A541 - A560
    ;offsets into $13D1 obj list counters
_00A541:
    dw $0000, $0002, $0004, $0006, $0008, $000A, $000C, $000E
    dw $0000, $0002, $0004, $0006, $0008, $000A, $000C, $000E ;unused duplicate
}

{ ;A561 - A647
speeds:

.x:
    dl $000100 ;arthur walk
    dl $000100
    dl $000100
    dl $FFFA00
    dl $FFFE80
    dl $000080
    dl $000100 ;rosebud
    dl $000120 ;shell pearl
    dl $000170
    dl $000070 ;zombie (beginner)
    dl $000070 ;zombie (beginner)
    dl $000040 ;skull flower rising wiggle speed
    dl $000120
    dl $0000D0
    dl $000080
    dl $000100
    dl $0000A0
    dl $000200
    dl $000100
    dl $000400
    dl $000180
    dl $0000A0
    dl $000300
    dl $000150 ;bowgun speed
    dl $000040
    dl $000380 ;lance
    dl $000120
    dl $000040
    dl $000280
    dl $0001C0
    dl $0000C0
    dl $000120 ;hannibal projectile
    dl $000100
    dl $000180
    dl $0000B0
    dl $000300
    dl $0002E0
    dl $000300
    dl $000100
    dl $000400
    dl $000A00
    dl $000400 ;bracelet, underwear
    dl $000400 ;bracelet, steel
    dl $000480 ;bracelet, bronze
    dl $000500 ;bracelet, gold
    dl $000090 ;zombie (expert)
    dl $000120 ;zombie (expert)
    dl $0000C0 ;zombie (professional)
    dl $000140 ;zombie (professional)
    dl $000070 ;zombie (normal)
    dl $0000E0 ;zombie (normal)
    dl $000480 ;upgraded lance

.y:
    dl $000000
    dl $FFFFE0 ;03: raft pulley
    dl $FFFE80
    dl $FFFF20
    dl $FFFF40 ;0C: skull flower head, rising
    dl $FFFE80
    dl $FFFF00
    dl $FFFFD0
    dl $000030
    dl $FFFFA0
    dl $FFFFE0
    dl $000020
    dl $FFFFC0
    dl $FFFFC0
    dl $000040 ;2A: ghost
    dl $FFFFC0 ;2D: ghost
    dl $FFFC00 ;30: axe2
    dl $000400 ;33: axe2
    dl $000400
    dl $FFFF80
    dl $FFFE00
    dl $FFFF80
    dl $000060
    dl $FFFFC0
    dl $FFFE00 ;torch flame
}

{ ;A648 - A6A3
speed_xy_offsets:
    ;todo: figure out how to sort these
    ;maybe just make a offset+length list at the top

    dw $0000, $0010, $0020, $0030, $0070
    dw $0080 ;flower projectile
    dw $0090, $0098
    dw $00B8, $00C8 ;ghost
    dw $00D8, $00E8, $0108, $010D, $012D, $016D
    dw $0176, $0179, $017C, $019C, $01A5, $01C5, $01E5
    dw $01ED ;rosebud (8 values)
    dw $01F5 ;skull dropper
    dw $01FD
    dw $0205 ;mimic_ghost
    dw $0225, $0245, $024D, $0255, $0265
    dw $0285, $0289, $028D, $029D, $02BD, $02CD, $02DD, $02ED, $02FD, $030D, $032D, $034D, $035D, $0365
}

{ ;A6A4 - A75A
_00A6A4:
    ;offsets into ram destination, last ones probably repeated & unused?
    db $00, $0C, $18, $24, $30, $3C, $48, $54, $54, $54

.A6AE:
    db offset(.A6AE, .A6B8), offset(.A6AE, .A6D5), offset(.A6AE, .A6EF), offset(.A6AE, .A704)
    db offset(.A6AE, .A6D5), offset(.A6AE, .A6D5), offset(.A6AE, .A716), offset(.A6AE, .A725)
    db offset(.A6AE, .A73D), offset(.A6AE, .A6D5)

.A6B8:
    db $02 : dw $00F8, $00FC
    db $04 : dw $01A0, $01A8, $01D0, $01D8
    db $02 : dw $0190, $0198
    db $04 : dw $01C0, $01C8, $01E0, $01E8
    db $00

.A6D5:
    db $02 : dw $00F8, $00FC
    db $03 : dw $01E0, $01D0, $01F0
    db $01 : dw $01C0
    db $02 : dw $01E0, $01F0
    db $02 : dw $01EB, $01FB
    db $00

.A6EF:
    db $02 : dw $00F8, $00FC
    db $02 : dw $0180, $01C0
    db $02 : dw $01E0, $01E8
    db $02 : dw $0120, $0130
    db $00

.A704:
    db $02 : dw $00F8, $00FC
    db $03 : dw $01A0, $01A8, $01D0
    db $02 : dw $00F8, $00FC
    db $00

.A716:
    db $04 : dw $0150, $0158, $0180, $0188
    db $02 : dw $00F8, $00FC
    db $00

.A725:
    db $01 : dw $0120
    db $02 : dw $00F8, $00FC
    db $02 : dw $0170, $01A0
    db $02 : dw $01D0, $01D8
    db $02 : dw $015B, $016B
    db $00

.A73D:
    db $02 : dw $01C0, $01E0
    db $02 : dw $01CE, $01EE
    db $02 : dw $00F8, $00FC
    db $03 : dw $01D0, $01E0, $01F0
    db $03 : dw $01DB, $01EB, $01FB
    db $00
}

{ ;A75B - A782
_00A75B: ;not sure what this is. related to sprites
    dw $5080, $1D00, $3EA0, $2F60, $1200, $62A0, $5360, $1200, $1A00, $7BC0
    dw $4040, $12C0, $3840, $5960, $5380, $0000, $3840, $0100, $0900, $5000
}

{ ;A783 - A7E2
score_table:
    db $00, $00, $00, $00, $00, $01, $00, $00
    db $00, $00, $00, $00, $00, $02, $00, $00
    db $00, $00, $00, $00, $00, $03, $00, $00
    db $00, $00, $00, $00, $00, $04, $00, $00
    db $00, $00, $00, $00, $00, $05, $00, $00
    db $00, $00, $00, $00, $00, $06, $00, $00
    db $00, $00, $00, $00, $00, $07, $00, $00
    db $00, $00, $00, $00, $00, $08, $00, $00
    db $00, $00, $00, $00, $00, $09, $00, $00
    db $00, $00, $00, $00, $01, $00, $00, $00
    db $00, $00, $00, $00, $05, $00, $00, $00
    db $00, $00, $00, $01, $00, $00, $00, $00
}

{ ;A7E3 - A7E5
extend_table: db $04, $07, $08
}

{ ;A7E6 - A7F1
_00A7E6: ;unused
    dw $0000, $FFE0
    dw $0000, $0000
    dw $FFB8, $0000
}

{ ;A7F2 - A811
direction16:
    db $00, $01, $02,  $00 ;down, right, upper
    db $04, $03, $02,  $00 ;             lower
    db $08, $07, $06,  $00 ;      left,  upper
    db $04, $05, $06,  $00 ;             lower
    db $00, $0F, $0E,  $00 ;up,   right, lower
    db $0D, $0D, $0E,  $00 ;             upper | oversight: first $0D should be $0C?!
    db $08, $09, $0A,  $00 ;      left,  lower
    db $0C, $0B, $0A,  $00 ;             upper

    ;last column is only for padding

    ;direction from x towards 0-F:
    ;     C
    ;    B D
    ;   A   E
    ;  9     F
    ; 8   x   0
    ;  7     1
    ;   6   2
    ;    5 3
    ;     4
}

{ ;A812 - A851
direction32:
    db $00, $01, $02, $03, $04 : dl $000000
    db $08, $07, $06, $05, $04 : dl $000000
    db $10, $0F, $0E, $0D, $0C : dl $000000
    db $08, $09, $0A, $0B, $0C : dl $000000
    db $00, $1F, $1E, $1D, $1C : dl $000000
    db $18, $19, $1A, $1B, $1C : dl $000000
    db $10, $11, $12, $13, $14 : dl $000000
    db $18, $17, $16, $15, $14 : dl $000000
}

{ ;A852 - A88D
_00A852:
    dw $0050, $0030
    dw $0020, $0100
    dw $0080, $0100
    dw $0050, $0100
    dw $0100, $0100
    dw $0080, $0050
    dw $0050, $0020 ;mimic
    dw $0060, $0040
    dw $0080, $00A0
    dw $0060, $0060
    dw $0080, $0040 ;geyser
    dw $0050, $0040 ;killer
    dw $0080, $0040
    dw $0060, $0040 ;34: astaroth
    dw $00C0, $0060 ;38: cockatrice head2
}

{ ;A88E - A8C9
arthur_range_check_data:

.x:
    dw $0070
    dw $0200
    dw $0040 ;04: stone pillar
    dw $0090
    dw $0014 ;08: stone pillar 2
    dw $0016
    dw $006E
    dw $0028
    dw $0060 ;10: skull dropper
    dw $0060 ;12: rosebud
    dw $0060 ;14: siren
    dw $0040
    dw $000C
    dw $0040
    dw $0020 ;1C: pre-placed zombie coffin
    dw $003C ;1E: pre-placed zombie coffin
    dw $0060 ;20: pre-placed zombie coffin
    dw $0070
    dw $0040
    dw $0020 ;skull flower activation range, unused due to bug (e,p)
    dw $0030
    dw $0040
    dw $0040
    dw $0140
    dw $0080
    dw $0060 ;skull flower activation range, unused due to bug (n)
    dw $006E ;skull flower activation range, unused due to bug (b,n,e)
    dw $0080 ;skull flower activation range, unused due to bug (e,p)

.y:
    dw $0008 ;shell
    dw $0080 ;any skull flower that isn't in stage 1?
}

{ ;A8CA - A8D1
_00A8CA:
    dw $00D0, $FFF0
    dw $0010, $0010
}

{ ;A8D2 - A8E1
rng_bool_data: db 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0 ;rng 50/50
}

{ ;A8E2 - A8E9
_00A8E2: db $01, $02, $04, $08, $10, $20, $40, $80
}

{ ;A8EA - A909
_00A8EA: ;select value by rng and compare against mask
    ;only the first 17 bytes are used; this array is indexed with 0-F.
    ;someone probably realized this accomplishes the same thing as 0-F * 2.
    ;they didn't delete the unused entries, though.
    dw $0001, $0002, $0004, $0008, $0010, $0020, $0040, $0080
    dw $0100, $0200, $0400, $0800, $1000, $2000, $4000, $8000
}

{ ;A90A - AAC9
_00A90A:
    db $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $03, $03, $03, $03, $03 ;00: rosebud
    db $04, $04, $04, $00, $00, $00, $03, $03, $03, $02, $02, $02, $02, $01, $01, $01 ;01: rosebud
    db $04, $04, $04, $04, $04, $03, $03, $03, $03, $03, $03, $02, $02, $02, $02, $02 ;02: rosebud
    db $06, $06, $06, $02, $02, $02, $01, $01, $01, $00, $00, $00, $00, $07, $07, $07 ;03: rosebud
    db $05, $05, $06, $06, $07, $07, $00, $00, $01, $01, $02, $02, $03, $03, $04, $04 ;04: rosebud
    db $02, $02, $02, $06, $06, $06, $03, $03, $03, $04, $04, $04, $04, $05, $05, $05 ;05: rosebud
    db $06, $06, $06, $06, $06, $07, $07, $07, $07, $07, $07, $00, $00, $00, $00, $00 ;06: rosebud
    db $04, $04, $04, $00, $00, $00, $05, $05, $05, $06, $06, $06, $06, $07, $07, $07 ;07: rosebud
    db $06, $06, $06, $06, $06, $05, $05, $05, $05, $05, $05, $04, $04, $04, $04, $04 ;08: rosebud
    db $00, $01, $01, $01, $00, $01, $01, $00, $01, $01, $01, $01, $01, $01, $01, $00 ;09: ghost spawner
    db $05, $05, $05, $05, $07, $07, $07, $07, $09, $09, $09, $09, $0A, $0A, $0A, $0A ;0A: icicle spawner
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00 ;0B: icicle spawner
    db $00, $00, $01, $00, $01, $00, $00, $00, $00, $00, $01, $00, $01, $00, $00, $00 ;0C: icicle spawner
    db $00, $00, $01, $00, $01, $00, $01, $01, $00, $00, $01, $00, $01, $00, $01, $01 ;0D: icicle spawner
    db $01, $00, $01, $00, $00, $00, $00, $00, $01, $00, $01, $00, $00, $00, $00, $00 ;0E: icicle spawner
    db $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $03, $03, $03, $03 ;0F: icicle spawner (2E)
    db $00, $00, $00, $00, $00, $00, $02, $02, $02, $02, $02, $02, $03, $03, $03, $03 ;10: icicle spawner (2E)
    db $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $03, $03, $03, $03 ;11: icicle spawner (2E)
    db $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $03, $03, $03, $03, $03, $03 ;12: icicle spawner (2E)
    db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $06, $06, $06, $06, $06, $06 ;13: icicle spawner (2F)
    db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $06, $06, $06, $06, $06, $06 ;14: icicle spawner (2F)
    db $04, $04, $04, $04, $04, $04, $04, $04, $05, $05, $05, $05, $05, $05, $05, $05 ;15: icicle spawner (2F)
    db $00, $0C, $18, $24, $24, $24, $30, $30, $30, $3C, $3C, $48, $48, $48, $54, $54 ;16: icicle
    db $00, $00, $00, $00, $00, $00, $0C, $0C, $0C, $0C, $0C, $0C, $18, $18, $18, $18 ;17: icicle
    db $60, $60, $60, $60, $80, $80, $80, $80, $80, $80, $C0, $C0, $C0, $C0, $C0, $C0 ;18: lightning
    db $20, $20, $20, $20, $28, $28, $28, $28, $28, $28, $28, $30, $30, $30, $30, $30 ;19: lightning
    db $51, $51, $51, $51, $A0, $A0, $A0, $A0, $A0, $A0, $E0, $E0, $E0, $E0, $E0, $E0 ;1A: lightning
    db $00, $00, $00, $00, $04, $04, $04, $04, $08, $08, $08, $08, $0C, $0C, $0C, $0C ;1B: unused?
}

{ ;AACA - AAD7
_00AACA:
    db $01, $01, $00 ;"shell exists for this water crash" bool

.offset:
    db $03, $07, $0B

.pos: ;x/y pairs
    dw $0A70, $0090
    dw $0B50, $0080
}

{ ;AAD8 - AAD9
_00AAD8: db $E0, $80 ;water rise timer
}

{ ;AADA - AB45
stage3_data:

.AADA: db $04, $00, $06, $00, $08, $00, $FF, $FF, $FF, $FF
.AAE4: db $20, $06, $20, $0A, $20, $0D, $20, $12, $40, $15
.AAEE: db $20, $05, $20, $09, $20, $0C, $20, $11, $40, $14
.AAF8: db $C0, $03, $C0, $02, $C0, $04, $C0, $02, $C0, $03
.AB02: db $E0, $01, $60, $01, $60, $02, $60, $01, $E0, $01
.AB0C: db $E0, $09, $E0, $0C, $E0, $11, $E0, $14, $00, $19
.AB16: db $C0, $02, $C0, $01, $C0, $03, $C0, $01, $C0, $02
.AB20: db $00, $07, $80, $0A, $80, $0E, $80, $12, $20, $16
.AB2A: db $60, $06, $60, $0A, $60, $0D, $60, $12, $80, $15
.AB34: db $40, $02, $40, $01, $40, $03, $40, $01, $40, $02

.AB3E: dw $0008, $FFF8
.AB42: db $01, $01, $FF, $FF ;maybe to do with tower rotation gfx?
}

{ ;AB46 - AB87
boat: ;todo: rename? stage 2 data or something

.AB46: ;seems related to water rising
    dw $03DB, $0212, $00A8, $0004
    dw $05C8, $021B, $0004, $0004

.rocking_speed:
    dl $000014, $FFFFEC
    dl $00000A, $FFFFF6

.AB62: ;interleaved data
    dw $0096, $00AE
    dw $02B4, $015A
    dw $0000, $0156
    db $00, $08

;2-2:
.AB70: ;indices into next values, only first value used
    db 0, 4, 0, 0, 4, 0, 0, 4
    db 0, 4, 0, 0, 4, 0, 0, 4

.AB80: dl $FFFE67 : db $08 ;default wave speed
.AB84: dl $FFFE67 : db $08 ;secondary wave speed (identical), unused
}

{ ;AB88 - ABA7
    ;unused?
    db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
}

{ ;ABA8 - ABBF
_00ABA8: ;water crash related
    dw $0012, $8800,  $0014, $8880
    dw $0016, $8900,  $0018, $8980
    dw $0016, $8B00,  $0018, $8B80

    ;todo: combine with data below
}

{ ;ABC0 - AFCB
_water_crash: ;stage 1 water crash tiles

    dw $0004, $0208 ;offsets

;-----

    dw $0000, $0020 ;offset into ram, count

    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0, $02A0
    dw $12A0, $12A0, $12A0, $12A0, $12A2, $12A4, $12A6, $12A2
    dw $12A6, $12A2, $12A2, $12A4, $12C2, $12C4, $12C6, $12C2
    dw $12C6, $12C2, $12C2, $12C4, $12A8, $12AA, $12A8, $12AA
    dw $12C8, $12CA, $12C8, $12CA, $12C8, $12CA, $12C8, $12CA
    dw $12A8, $12AA, $12A8, $12AA, $12A8, $12AA, $12A8, $12AA
    dw $12C8, $12CA, $12C8, $12CA, $12C8, $12CA, $12C8, $12CA
    dw $12A8, $12AA, $12A8, $12AA, $12A8, $12AA, $12A8, $12AA
    dw $12C8, $12CA, $12C8, $12CA, $12C8, $12CA, $12C8, $12CA
    dw $12A8, $12AA, $12A8, $12AA, $12A8, $12AA, $12A8, $12AA
    dw $12C8, $12CA, $12C8, $12CA, $12C8, $12CA, $12C8, $12CA
    dw $12A8, $12AA, $12A8, $12AA, $12A8, $12AA, $12A8, $12AA
    dw $12C8, $12CA, $12C8, $12CA, $12C8, $12CA, $12C8, $12CA
    dw $12A8, $12AA, $12A8, $12AA, $12A8, $12AA, $12A8, $12AA
    dw $12C8, $12CA, $12C8, $12CA, $12C8, $12CA, $12C8, $12CA
    dw $12A8, $12AA, $12A8, $12AA, $12A8, $12AA, $12A8, $12AA
    dw $12C8, $12CA, $12C8, $12CA, $12C8, $12CA, $12C8, $12CA

;-----

    dw $0800, $0020

    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $0160, $0160, $0160, $0160, $0160, $0160, $0160, $0160
    dw $330A, $330C, $730C, $730A, $330A, $330C, $730C, $730A
    dw $332A, $332C, $732C, $732A, $332A, $332C, $732C, $732A
    dw $330E, $3326, $3326, $3328, $7328, $7326, $3326, $330E
    dw $330E, $330E, $330E, $330E, $330E, $330E, $330E, $330E
    dw $330E, $330E, $330E, $330E, $330E, $330E, $330E, $330E
    dw $330E, $330E, $330E, $330E, $330E, $330E, $330E, $330E
    dw $330E, $330E, $330E, $330E, $330E, $330E, $330E, $330E
    dw $330E, $330E, $330E, $330E, $330E, $330E, $330E, $330E
    dw $330E, $332E, $330E, $3328, $7328, $330E, $330E, $3328
    dw $3308, $3304, $332E, $3328, $7328, $3308, $3308, $3304
    dw $3300, $31E4, $3300, $7304, $3308, $3304, $3300, $31E4
    dw $3320, $3322, $3320, $71E4, $3302, $31E4, $3320, $3322
    dw $31E0, $31E2, $31E0, $7322, $3320, $3322, $31E0, $31E2
    dw $3306, $3324, $3160, $71E2, $31E0, $31E2, $3306, $3324
    dw $3160, $3160, $3160, $3160, $3324, $3160, $3160, $3160
    dw $3160, $3160, $3160, $3160, $3160, $3160, $3160, $3160
}

{ ;AFCC - AFFC
_00AFCC:
    dw $0000 : dl gfx_cockatrice        : dw $4700
    dw $5000 : dl gfx_unk08             : dw $1100
    dw $0000 : dl gfx_death_crawler     : dw $3000
    dw $0000 : dl gfx_unk21             : dw $1000
    dw $0400 : dl gfx_veil_allocen      : dw $26C0
    dw $0000 : dl gfx_nebiroth          : dw $2300
    dw $0000 : dl gfx_princess_dialogue : dw $0900
}

{ ;AFFD - B105
_00AFFD:
    db offset(_00AFFD, .stage1), offset(_00AFFD, .stage2), offset(_00AFFD, .stage3), offset(_00AFFD, .stage4)
    db offset(_00AFFD, .stage4_b), offset(_00AFFD, .stage4_c), offset(_00AFFD, .stage5), offset(_00AFFD, .stage6)
    db offset(_00AFFD, .stage7), offset(_00AFFD, .stage8)

    ;loop count, ?
    ;offset, uncompressed size

.stage1:
    db $06 : dw $0000
    dl gfx_stage1_objects : dw $3860
    dl gfx_unk08        : dw $1100
    dl gfx_skull_flower : dw $0720
    dl gfx_unk10        : dw $1260
    dl gfx_unk11        : dw $0720
    dl gfx_unk14        : dw $0E00

.stage2:
    db $03 : dw $0000
    dl gfx_unk16 : dw $6DC0
    dl gfx_ghost : dw $0E00
    dl gfx_mimic : dw $0C20

.stage3:
    db $05 : dw $0000
    dl gfx_unk20   : dw $3EA0
    dl gfx_grilian : dw $2400
    dl gfx_arremer : dw $2260
    dl gfx_killer  : dw $03E0
    dl gfx_unk11   : dw $0720

.stage4:
    db $03 : dw $0000
    dl gfx_unk25        : dw $0BA0
    dl gfx_skull_flower : dw $0720
    dl gfx_unk26        : dw $1A00

..b:
    db $03 : dw $0000
    dl gfx_geyser_platform : dw $0A00
    dl gfx_killer          : dw $03E0
    dl gfx_unk14           : dw $0E00

..c:
    db $02 : dw $0000
    dl gfx_hydra : dw $4180
    dl gfx_unk11 : dw $0720

.stage5:
    db $05 : dw $0000
    dl gfx_unk22   : dw $1D00
    dl gfx_unk10   : dw $1260
    dl gfx_grilian : dw $2400
    dl gfx_arremer : dw $2260
    dl gfx_unk11   : dw $0720

.stage6:
    db $07 : dw $0000
    dl gfx_unk30    : dw $0100
    dl gfx_unk08    : dw $1100
    dl gfx_arremer  : dw $2260
    dl gfx_killer   : dw $03E0
    dl gfx_unk26    : dw $1A00
    dl gfx_unk11    : dw $0720
    dl gfx_astaroth : dw $2E60

.stage7:
    db $08 : dw $0000
    dl gfx_princess_dialogue : dw $0900
    dl gfx_unk08             : dw $1100
    dl gfx_arremer           : dw $2260
    dl gfx_killer            : dw $03E0
    dl gfx_mimic             : dw $0C20
    dl gfx_unk11             : dw $0720
    dl gfx_astaroth          : dw $2E60
    dl gfx_ghost             : dw $0E00

.stage8:
    db $03 : dw $0000
    dl gfx_samael : dw $2000
    dl gfx_unk11  : dw $0720
    dl gfx_unk13  : dw $3800
}

{ ;B106 - B239
gfx_decomp_offsets:
    ;graphics decompression offsets
    ;layout: destination in extended RAM | source | count / uncompressed size
    dw $0000 : dl gfx_logo              : dw $3000 ;00
    dw $0000 : dl gfx_map               : dw $2200 ;07
    dw $0000 : dl gfx_unk01             : dw $7800 ;0E
    dw $A000 : dl gfx_unk02             : dw $5940 ;15
    dw $0000 : dl gfx_unk15             : dw $7800 ;1C
    dw $A000 : dl gfx_unk17             : dw $5000 ;23
    dw $0000 : dl gfx_unk18             : dw $7800 ;2A
    dw $0000 : dl gfx_stage1_objects    : dw $3860 ;31
    dw $0000 : dl gfx_unk16             : dw $6DC0 ;38
    dw $0000 : dl gfx_unk20             : dw $3EA0 ;3F
    dw $0000 : dl gfx_items_enemy_hits  : dw $0E20 ;46
    dw $0000 : dl gfx_game_over         : dw $0C00 ;4D
    dw $A000 : dl gfx_unk19             : dw $2600 ;54
    dw $0000 : dl gfx_unk22             : dw $1D00 ;5B
    dw $0000 : dl gfx_unk29             : dw $1B00 ;62
    dw $0000 : dl gfx_unk30             : dw $0100 ;69
    dw $0000 : dl gfx_unk23             : dw $3800 ;70
    dw $A000 : dl gfx_unk31             : dw $0180 ;77
    dw $0000 : dl gfx_unk27             : dw $2000 ;7E
    dw $0000 : dl gfx_unk03             : dw $1000 ;85
    dw $0000 : dl gfx_unk22             : dw $1D00 ;8C
    dw $0000 : dl gfx_continue          : dw $0800 ;93
    dw $0000 : dl gfx_continue2         : dw $0800 ;9A
    dw $0000 : dl gfx_princess_dialogue : dw $0900 ;A1
    dw $0000 : dl gfx_capcom            : dw $01A0 ;A8
    dw $9800 : dl gfx_font_hud          : dw $0500 ;AF
    dw $0000 : dl gfx_options           : dw $1000 ;B6
    dw $0000 : dl gfx_unk04             : dw $0800 ;BD
    dw $0000 : dl gfx_unk32             : dw $7800 ;C4
    dw $0000 : dl gfx_skull_flower      : dw $0720 ;CB
    dw $A000 : dl gfx_unk33             : dw $3280 ;D2
    dw $0000 : dl gfx_unk35             : dw $7000 ;D9
    dw $9000 : dl gfx_unk34             : dw $0200 ;E0
    dw $0000 : dl gfx_unk10             : dw $1260 ;E7
    dw $6000 : dl gfx_unk24             : dw $2000 ;EE
    dw $0000 : dl gfx_unk05             : dw $7F00 ;F5
    dw $A000 : dl gfx_unk13             : dw $3800 ;FC
    dw $0000 : dl gfx_intro_castle      : dw $1700 ;103
    dw $0000 : dl gfx_unk06             : dw $0800 ;10A
    dw $A000 : dl gfx_unk13             : dw $3800 ;111
    dw $0000 : dl gfx_the_end           : dw $2000 ;118
    dw $2000 : dl gfx_unk36             : dw $1800 ;11F
    dw $0000 : dl gfx_unk13             : dw $3800 ;126
    dw $9980 : dl gfx_font_hud          : dw $0500 ;12D
if !version == 1 || !version == 2
    dw $9D00 : dl gfx_us_font_extra : dw $01A0
endif
}

{ ;B23A - B43F
speed_xyg:
    ;read vertically, this is: x speed (long) / y speed (long) / gravity

    ;00: arthur knockback
    ;01: exiting stage 1 cages
    ;0A: knife
    ;0D: torch
    ;10: miniwing
    ;11: pot
    ;12: miniwing
    ;1A: shell
    ;1B: shell
    ;1E: skulls

.x1: db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $00, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $00, $00, $00, $00
.x2: db $01, $00, $01, $00, $01, $00, $01, $01, $00, $00, $05, $04, $00, $01, $00, $00, $01, $00, $00, $00, $01, $00, $FD, $00, $FD, $FC, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $00, $02, $08, $02, $00, $00, $01, $00, $FF, $FF, $FF, $FF, $FE, $00, $01, $00, $00, $00, $00, $00, $07, $FC, $FC, $FC, $FC, $03, $03, $03, $03
.x3: db $1E, $00, $00, $00, $00, $00, $40, $00, $80, $40, $80, $00, $00, $80, $B2, $D7, $90, $00, $E0, $00, $00, $80, $3C, $20, $AA, $96, $00, $00, $00, $00, $00, $30, $00, $00, $00, $40, $80, $BA, $66, $C0, $00, $60, $C0, $C0, $00, $4C, $7C, $00, $20, $E0, $00, $1A, $A0, $5F, $BF, $7F, $3F, $FF, $00, $80, $B8, $8A, $5C, $2E, $00, $80, $1B, $1B, $1B, $1B, $E4, $E4, $E4, $E4

.y1: db $FF, $FF, $FF, $FF, $00, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $FF, $FF, $FF, $00, $FF, $FF, $FF, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $00, $FF, $FF, $FF, $FF, $FF, $00, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $FF, $FF, $00, $FF, $00, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.y2: db $FC, $FC, $FC, $FC, $00, $FD, $FC, $FD, $FE, $FF, $00, $00, $02, $FE, $FB, $FC, $00, $FD, $FC, $FD, $02, $00, $FD, $FE, $FD, $FD, $FA, $FC, $00, $FE, $FE, $FF, $FD, $FC, $02, $FE, $FD, $FB, $FB, $02, $02, $03, $03, $00, $FB, $FD, $00, $F7, $03, $FC, $FC, $FC, $FC, $FC, $00, $00, $00, $00, $02, $01, $FC, $FC, $FC, $FC, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.y3: db $EE, $EE, $52, $52, $00, $19, $FF, $FF, $FF, $7F, $00, $00, $00, $7F, $B4, $7B, $00, $7F, $DF, $83, $10, $40, $7A, $FF, $19, $EE, $EE, $0F, $00, $ED, $FF, $D4, $AF, $77, $00, $FF, $FF, $EE, $08, $00, $80, $00, $80, $00, $FF, $83, $4C, $FF, $0D, $EE, $EE, $77, $FF, $FF, $00, $00, $00, $00, $00, $80, $1B, $1B, $1B, $1B, $00, $00, $20, $40, $60, $80, $80, $60, $40, $20

.g:  db $20, $20, $24, $24, $00, $20, $30, $30, $30, $30, $80, $20, $40, $20, $18, $18, $16, $20, $20, $10, $10, $00, $30, $00, $30, $30, $1A, $1A, $20, $20, $20, $0A, $20, $20, $40, $20, $30, $20, $20, $10, $10, $10, $10, $30, $20, $10, $10, $00, $18, $20, $20, $20, $12, $12, $38, $40, $28, $32, $1C, $18, $08, $08, $08, $08, $30, $C0, $08, $08, $08, $08, $08, $08, $08, $08
}

{ ;B440 - B4FD
_00B440:
    db offset(_00B440, .B44A), offset(_00B440, .B44A), offset(_00B440, .B468), offset(_00B440, .B468)
    db offset(_00B440, .B486), offset(_00B440, .B44A), offset(_00B440, .B4A4), offset(_00B440, .B4A4)
    db offset(_00B440, .B4C2), offset(_00B440, .B4E0)

.B44A:
    dw $418A, $520E, $6292, $6AD4, $7BDE, $4B18, $3A94, $014E, $0190, $3A56, $531C, $5980, $0198, $0010, $0842

.B468:
    dw $1920, $2200, $22C0, $4BA8, $7FFD, $0013, $001F, $010E, $1590, $3A56, $531C, $5140, $6609, $01DF, $0842

.B486: ;gold
    dw $00C9, $01AF, $0236, $035D, $77FF, $0013, $001D, $010E, $2190, $3A56, $531C, $5180, $5E48, $01DF, $0842

.B4A4:
    dw $4100, $5940, $69C0, $7646, $7F10, $7F7B, $62D6, $4A10, $398C, $114E, $21D2, $0218, $22DA, $0000, $0421

.B4C2:
    dw $418A, $021C, $5A4E, $6AD4, $7FFF, $435A, $2252, $014E, $0190, $3A56, $531C, $5980, $0198, $0010, $0421

.B4E0: ;frozen
    dw $28C6, $4108, $594A, $69CE, $7F18, $735A, $5252, $514A, $598C, $6252, $7318, $598C, $598C, $598C, $4908
}

{ ;B4FE - B52D
_00B4FE:
    ;stage, checkpoint, timer
    db $00, $00 : dw $018D
    db $01, $02 : dw $02AC
    db $01, $03 : dw $0171
    db $06, $00 : dw $01C8
    db $00, $02 : dw $0470
    db $05, $00 : dw $017E
    db $07, $02 : dw $0230
    db $08, $02 : dw $03E6
    db $09, $00 : dw $0233
    db $07, $00 : dw $0289
    db $09, $00 : dw $00C8
    db $00, $00 : dw $04ED
}

{ ;B52E - B551
_00B52E:

.B52E: db $00, $00, $04, $00, $00, $03, $03, $03, $02, $00, $00, $01
.B53A: db $18, $1A, $1C, $1E, $20, $22, $24, $26, $28, $2A, $2C, $2E
.B546: db $14, $14, $14, $14, $14, $14, $14, $14, $15, $14, $14, $14
}

{ ;B552 - B559
_00B552: ;difficulty, loop 1 & 2
    db $00, $02
    db $01, $02
    db $02, $03
    db $03, $03
}

{ ;B55A - B55B
    _00B55A: db $F7, $F8 ;sound commands
}

{ ;B55C - B56B
_00B55C:

.shot_buttons:
    db !a, !b
    db !a, !y
    db $00, !b|!y
    db $00, $C0 ;unused?

.jump_buttons:
    db $00, !y
    db $00, !b
    db !a, $00
    db $80, $00 ;unused?
}

{ ;B56C - B575
    _00B56C: db $01, $01, $21, $07, $07, $01, $21, $01, $01, $01
}

{ ;B576 - B59D
_00B576: ;indices into gfx_decomp_offsets, plus padding zero
    db $0E, $15, $31, $00
    db $1C, $23, $38, $00
    db $2A, $54, $3F, $00
    db $70, $EE, $5B, $00
    db $7E, $EE, $A1, $00
    db $62, $77, $69, $00
    db $C4, $D2, $CB, $00
    db $D9, $C4, $E7, $00
    db $D9, $C4, $CB, $00
    db $D9, $C4, $CB, $00
}

{ ;B59E - B5BB
_00B59E:
    db $31, $77, $85, $8C, $93, $85, $AF, $85, $85, $3F
    db $7E, $69, $85, $BD, $B6, $85, $AF, $85, $85, $3F
    db $7E, $69, $85, $BD, $46, $85, $AF, $85, $85, $3F
}

{ ;B5BC - B5BF
_00B5BC:
    db $00, $02
    db $00, $30
}

{ ;B5C0 - B5C3
    db $00, $02, $01, $03 ;unused?
}

{ ;B5C4 - B632
stage1_earthquake:

.start_offset:
    db $00, $0C, $11 ;checkpoint never gets set to 2 normally, but it exists (at the boss)

.x_offset:
    dw $0090, $0140, $0240, $02E0, $04D0, $0620, $0710, $0760, $0800, $09D0, $0AF0, $0B40, $0DE0, $0F80, $0FC0, $1120, $1160, $7FFF

.tile_offset:
    ;earthquake tile offsets, ?
    dl stage1_earthquake_tiles_1  : db $05
    dl stage1_earthquake_tiles_2  : db $05
    dl stage1_earthquake_tiles_3  : db $05
    dl stage1_earthquake_tiles_4  : db $05
    dl stage1_earthquake_tiles_5  : db $05
    dl stage1_earthquake_tiles_11 : db $05
    dl stage1_earthquake_tiles_14 : db $05
    dl stage1_earthquake_tiles_13 : db $05
    dl stage1_earthquake_tiles_12 : db $05

    ;these offsets were probably meant for the water crashes, but ended up unused
    dl $000000 : db $86
    dl $000000 : db $86
    dl $000000 : db $86

    dl stage1_earthquake_tiles_6  : db $05
    dl stage1_earthquake_tiles_7  : db $05
    dl stage1_earthquake_tiles_8  : db $05
    dl stage1_earthquake_tiles_9  : db $05
    dl stage1_earthquake_tiles_10 : db $05

.B62F:
    dw $0000, $3000 ;second value is never reached (maybe it was meant to be used by the water crashes at some point?)
}

{ ;B633 - B63C
    stage_music: db $01, $02, $05, $04, $04, $0C, $03, $06, $06, $08 ;song to play on stage load
}

{ ;B63D - B658
checkpoint_location: ;offsets into next data

.idx:
    db offset(.idx, .x_1), offset(.idx, .x_2), offset(.idx, .x_3), offset(.idx, .x_4)
    db offset(.idx, .x_4), offset(.idx, .x_4), offset(.idx, .x_5), offset(.idx, .x_4)
    db offset(.idx, .x_4), offset(.idx, .x_4)

.x:
..1: dw $0CA0, $7FFF
..2: dw $09D0, $7FFF
..3: dw $0640, $7FFF
..4: dw $7FFF
..5: dw $0780, $7FFF
}

{ ;B659 - B754
_00B659: ;offsets into next section. 4 bytes per entry but only 2 reachable?
    db offset(_00B659, .stage1_a), offset(_00B659, .stage1_b), offset(_00B659, .stage1_boss), offset(_00B659, .stage1_boss)
    db offset(_00B659, .stage2_a), offset(_00B659, .stage2_b), offset(_00B659, .stage2_after_pier), offset(_00B659, .stage2_second_ship)
    db offset(_00B659, .stage3_a), offset(_00B659, .stage3_b), offset(_00B659, .stage2_b), offset(_00B659, .stage2_b)
    db offset(_00B659, .stage4_a), offset(_00B659, .stage4_a), offset(_00B659, .stage4_a), offset(_00B659, .stage4_a)
    db offset(_00B659, .stage4_b), offset(_00B659, .stage4_b), offset(_00B659, .stage4_b), offset(_00B659, .stage4_b)
    db offset(_00B659, .stage4_boss), offset(_00B659, .stage4_boss), offset(_00B659, .stage4_boss), offset(_00B659, .stage4_boss)
    db offset(_00B659, .stage5_a), offset(_00B659, .stage5_b), offset(_00B659, .stage5_b), offset(_00B659, .stage5_b)
    db offset(_00B659, .stage6_a), offset(_00B659, .stage6_a), offset(_00B659, .stage6_boss), offset(_00B659, .stage6_boss)
    db offset(_00B659, .stage7_a), offset(_00B659, .stage7_boss), offset(_00B659, .stage7_boss), offset(_00B659, .stage7_boss)
    db offset(_00B659, .stage8_boss), offset(_00B659, .stage8_boss), offset(_00B659, .stage8_boss), offset(_00B659, .stage8_boss)

    ;level starting offsets + something else
.stage1:
..a:    dw $0080, $00B0, $0000, $0000, $0000, $0000
..b:    dw $0CC8, $0050, $0C48, $0000, $0624, $0000
..boss: dw $1267, $00A0, $11E6, $0000, $08F3, $0000

.stage2:
..a:           dw $0040, $0286, $0000, $0200, $0000, $0100
..b:           dw $09D0, $029B, $0950, $0200, $04A8, $0100
..after_pier:  dw $01A7, $0284, $0126, $01FD, $0093, $0100
..second_ship: dw $0633, $0214, $05B3, $0189, $02D9, $00C4

.stage3:
..a: dw $0040, $00F0, $0000, $0060, $0000, $0048
..b: dw $069C, $0457, $061B, $03DE, $0493, $02E6

.stage4:
..a:    dw $0080, $0393
..b:    dw $0380, $0385
..boss: dw $0080, $00A0, $0000, $0000, $0000, $02AA

.stage5:
..a: dw $0080, $08AE, $0000, $0800, $0000, $0600
..b: dw $07CE, $05A0, $074D, $0500, $0579, $03C0

.stage6:
..a:    dw $0050, $03B0, $0000, $0300, $0000, $0000
..boss: dw $03E5, $0170, $0364, $00FF, $01B2, $007F

.stage7:
..a:    dw $0048, $07B0, $0000, $0700, $0000, $0000
..boss: dw $0377, $0190, $02F6, $0100, $017B, $0080

.stage8:
..boss: dw $0040, $01A0, $0000, $0100, $0000, $0000
}

{ ;B755 - B768
_00B755: ;unused? referenced in code but that code is unreachable as far as i can tell
    db $00, $00, $0A, $0A

.B759:
    dw $FFC0, $FFFF
    dw $0040, $0000
    dw $FFEC, $FFFF
    dw $0014, $0000
}

{ ;B769 - B76C
_00B769: db $10, $11, $12, $13 ;temp stage values for rotations
}

{ ;B76D -
_00B76D:
    dd $007FE000, $007FE200, $007FE400, $007FE600, $007FE800, $007FEA00, $007FEC00, $007FEE00
    dd $007FF000, $007FF200, $007FF400, $007FF600, $007FF800, $007FFA00
}

{ ;B7A5 - B7D4
_00B7A5:

.B7A5: db $FF, $00, $04, $FF, $08, $10, $14, $FF, $0C, $18, $1C, $FF, $FF, $FF, $FF, $FF

.B7B5:
    dw $0002, $0000
    dw $FFFE, $0000
    dw $0000, $0002
    dw $0000, $FFFE
    dw $0002, $0002
    dw $FFFE, $0002
    dw $0002, $FFFE
    dw $FFFE, $FFFE
}

{ ;B7D5 - B7FC
_00B7D5:
    db $80, $01, $80, $10
    db $80, $01, $80, $10
    db $80, $01, $80, $10
    db $80, $00, $80, $00
    db $80, $01, $80, $10
    db $80, $01, $80, $10
    db $80, $01, $80, $10
    db $80, $01, $80, $10
    db $80, $01, $80, $10
    db $80, $01, $80, $10
}

{ ;B7FD - B800
    ;has with tile loading to do
    _00B7FD: dw 8, -8
}

{ ;B801 - B804
    _00B801: db $0A, $00, $1E, $14
}

{ ;B805 - B886
_00B805:
    db offset(_00B805, .B80F), offset(_00B805, .B812), offset(_00B805, .B815), offset(_00B805, .B812), offset(_00B805, .B812)
    db offset(_00B805, .B812), offset(_00B805, .B815), offset(_00B805, .B818), offset(_00B805, .B818), offset(_00B805, .B81B)

;-----

    .B80F: db offset(_00B805, .B81E), offset(_00B805, .B846), offset(_00B805, .B87A)
    .B812: db offset(_00B805, .B82C), offset(_00B805, .B846), offset(_00B805, .B87A)
    .B815: db offset(_00B805, .B839), offset(_00B805, .B81E+1), offset(_00B805, .B860)
    .B818: db offset(_00B805, .B839), offset(_00B805, .B853), offset(_00B805, .B81E+1)
    .B81B: db offset(_00B805, .B839), offset(_00B805, .B853), offset(_00B805, .B81E+1)

;-----

    ;some offsets are B81E+1. not sure if intentional or not
    ;some of these values are map/tile banks etc
    .B81E: db $00, $00 : dw $0FFF : db $08, $20, $40, screen_layouts>>16,  _098000>>16, _0A8000>>16, $7F, $7F, $01 : db $00
    .B82C: db $00, $00 : dw $0FFF : db $08, $40, $40, screen_layouts>>16,  _098000>>16, _0A8000>>16, $7F, $7F, $0F
    .B839: db $00, $00 : dw $0FFF : db $08, $40, $40, screen_layouts2>>16, _0C8000>>16, _0D8000>>16, $7F, $7F, $0F ;stage 3
    .B846: db $03, $10 : dw $07FF : db $00, $20, $26, screen_layouts>>16,  _098000>>16, _0A8000>>16, $3F, $7F, $0F
    .B853: db $03, $10 : dw $07FF : db $00, $20, $26, screen_layouts2>>16, _0C8000>>16, _0D8000>>16, $3F, $7F, $0F
    .B860: db $06, $18 : dw $07FF : db $00, $20, $26, screen_layouts2>>16, _0C8000>>16, _0D8000>>16, $3F, $7F, $0F
    .B86D: db $06, $10 : dw $07FF : db $00, $20, $26, screen_layouts2>>16, _0C8000>>16, _0D8000>>16, $3F, $7F, $0F ;unused?
    .B87A: db $06, $18 : dw $07FF : db $00, $20, $26, screen_layouts>>16,  _098000>>16, _0A8000>>16, $3F, $7F, $0F
}

{ ;B887 - B88A
    _00B887: db $01, $02, $04, $08
}

{ ;B88B - B8D1
_00B88B:
    db offset(_00B88B, .B895), offset(_00B88B, .B898), offset(_00B88B, .B898), offset(_00B88B, .B898)
    db offset(_00B88B, .B898), offset(_00B88B, .B898), offset(_00B88B, .B898), offset(_00B88B, .B898)
    db offset(_00B88B, .B898), offset(_00B88B, .B89B)

;-----

.B895: db offset(_00B88B, .B8A2), offset(_00B88B, .B8C2), offset(_00B88B, .B8C2)
.B898: db offset(_00B88B, .B8B2), offset(_00B88B, .B8C2), offset(_00B88B, .B8C2)
.B89B: db offset(_00B88B, .B89E), offset(_00B88B, .B8C2), offset(_00B88B, .B8C2)

;-----

.B89E: dw $0000,$FF00
.B8A2: dw $0000,$0000, $0280,$0000, $FF80,$FF80, $FF80,$0178
.B8B2: dw $FF80,$FF80, $0178,$FF80, $FF80,$FFC0, $FF80,$0140
.B8C2: dw $FFF0,$FFF8, $0110,$FFF0, $FFE8,$FFF0, $FFE8,$00E8
}

{ ;B8D2 - B8D5
    _00B8D2: db $00, $00, $00, $10
}

{ ;B8D6 - B8FD
_00B8D6:
    db $80, $28, $28, $01
    db $40, $28, $28, $00
    db $40, $00, $28, $00
    db $00, $00, $00, $00
    db $00, $00, $00, $00
    db $40, $28, $00, $00
    db $40, $00, $28, $00
    db $40, $28, $28, $00
    db $40, $28, $00, $00
    db $40, $28, $00, $00
}

{ ;B8FE - B907
    _00B8FE: db $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
}

{ ;B908 - B937
_00B908: ;magic meter
    dw $21B0, $21B1, $21B2, $21B3, $21B4, $21B5

.B914: ;mirrored magic meter
    dw $21B5, $21B4, $21B3, $21B2, $21B1, $21B0

.B920: ;first charged meter
    dw $21B6, $21B7, $21B8, $21B9, $21BA, $21BB

.B92C: ;second charged meter
    dw $21BC, $21BD, $21BE, $21BF, $21C0, $21AF
}

{ ;B938 - B95B
_00B938:
    dw $01E0 : db $01, $05
    dw $01E0 : db $01, $10
    dw $0180 : db $03, $05
    dw $0080 : db $02, $05
    dw $0180 : db $04, $05
    dw $0180 : db $01, $05
    dw $0180 : db $01, $05
    dw $01A0 : db $01, $05
    dw $01E0 : db $01, $05
}

{ ;B95C - B983
arthur_hitbox:
    ;height, width, height offset from ground
    ;data is arranged in sets of two; for standing/crouching
    db $10, $08 : dw $0000 ;arthur
    db $0C, $08 : dw $0004

    db $08, $08 : dw $0008 ;baby
    db $08, $08 : dw $0008

    db $08, $08 : dw $0008 ;seal
    db $08, $08 : dw $0008

    db $04, $04 : dw $FFE8 ;bee
    db $04, $04 : dw $FFE8

    db $10, $08 : dw $0000 ;lady
    db $0C, $08 : dw $0004
}

{ ;B984 - B9C3
_00B984:
    ;weapon heights?
    db $06, $06, $06, $06
    db $06, $06, $06, $06
    db $06, $06, $06, $06
    db $06, $06, $04, $06
    db $08, $06, $0A, $06
    db $06, $06, $06, $06
    db $06, $06, $06, $06
if !version == 0 || !version == 1
    db $08, $08, $08, $08
elseif !version == 2
    db $0C, $08, $0C, $08 ;bracelet projectile is 4px taller
endif

    ;widths?
    db $14, $14, $14, $14
    db $08, $08, $08, $08
    db $08, $08, $08, $08
    db $20, $20, $20, $20
    db $08, $08, $08, $08
    db $08, $08, $08, $08
    db $7E, $7E, $7E, $7E
    db $08, $08, $08, $08
}

{ ;B9C4 -
coord_offsets_arthur:
    dw 7,  16
    dw 7,   0
    dw 7, -13
    dw 0, -16
    dw 0,  32

    dw 2,  16
    dw 7,   8

.cage: ;offsets while inside the stage 1 cages
    dw 7, 20
    dw 7, 4
    dw 0, 4
    dw 0, -12
    dw 0, 36

    dw 2, 20
    dw 7, 12

.B9FC: ;stage 4?
    dw 7, 13
    dw 7, 0
    dw 7, -13
    dw 0, -16
    dw 0, 32

    dw 7, 13
    dw 7, 5
}

{ ;BA18 - BA21
_00BA18: db $14, $14, $18, $14, $14, $14, $14, $14, $14, $14 ;offsets into coord_offsets_arthur
}

{ ;BA22 - BA25
_00BA22: db -1, 0, 1, -1
}

{ ;BA26 - BA29
_00BA26: db $01, $02, $02, $01
}

{ ;BA2A - BA2D
_00BA2A: db $01, $00, $00, $01
}

{ ;BA2E - BA31
_00BA2E: db $03, $02, $02, $03
}

{ ;BA32 - BA43
    ;todo: maybe combine all of these into one arthur data main label?
_00BA32:
    dw $0EB8, $0040, $0081
    dw $0FD8, $0020, $0041
    dw $11C0, $0028, $0051
}

{ ;BA44 - BA47
_00BA44: db -1, 0, 1, -1
}

{ ;BA48 - BA5D
    ;unused?
    db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D
    dw arthur_baby, arthur_seal, arthur_bee, arthur_maiden ;pointers to transformed states
}

{ ;BA5E - BA65
_00BA5E: db $01, $01, $01, $01, $01, $01, $01, $01 ;damage dealt by stage / environment
}

{ ;BA66 - BA67
bowgun_facing_offset: db $00, $03
}

{ ;BA68 - BA77
weapon_limit:
    db 2, 1 ;lance
    db 3, 3 ;knife
    db 4, 4 ;bowgun
    db 1, 1 ;scythe
    db 2, 2 ;torch
    db 1, 1 ;axe
    db 2, 2 ;triblade
    db 1, 1 ;bracelet
}

{ ;BA78 - BA79
sprite_shimmer_bit: db $00, $20
}

{ ;BA7A - BA7D
_00BA7A:
    db $07, $08 ;shot/crouch shot anim index
    db $7C, $54 ;offsets into 2nd shot/crouch shot anim
}

{ ;BA7E - BA7F
knife_base_offset: db $56, $5E ;knife: base offset into spawn_offset, standing / crouching
}

{ ;BA80 - BA89
    db $13, $13, $13, $13, $13, $13, $13, $13, $13, $13 ;unused?
}

{ ;BA8A - BAA1
_00BA8A: ;x/y offsets for armor pieces
    dw -8, -12 ;not used for steel armor
    dw  0, -12
    dw -8,  -4
    dw  0,  -4
    dw -8,   4
    dw  0,   4
}

{ ;BAA2 - BAA9
    db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C ;unused?
}

{ ;BAAA - BAB2
;offsets into _00ED00 for arthur
_00BAAA: db $00, $02, $14, $14, $16, $26, $32, $24, $30
}

{ ;BAB3 - BAC4
_00BAB3: dw $13D0, $15B8, $1AE8, $0710, $0710, $01C3, $10D8, $04E0, $04E0 ;x offsets that arthur walks to after grabbing a key
}

{ ;BAC5 - BACD
_00BAC5: db $03, $03, $03, $03, $03, $00, $00, $00, $00
}

{ ;BACE - BAD6
_00BACE:
    db $01, $01, $01, $01, $01 ;armors
    db $02, $01, $00, $04      ;transformations
}

{ ;BAD7 - BADC
_00BAD7:
    db $10, $20, $20
    db $00, $05, $05
}

{ ;BADD - BAE5
_00BADD: db $03, $03, $03, $03, $03, $00, $00, $00, $00
}

{ ;BAE6 - BB0D
_00BAE6:
    db $17, $17, $17, $04, $04, $17, $17, $17, $17, $17
    db $17, $01, $02, $04, $04, $17, $17, $17, $17, $17
    db $17, $17, $17, $12, $12, $13, $17, $13, $13, $13
    db $17, $01, $02, $12, $12, $13, $17, $13, $13, $13
}

{ ;BB0E - BB15
_00BB0E:

.BB0E: db $03, $04, $04, $03
.BB12: db $32, $31, $31, $32
}

{ ;BB16 - BB19
_00BB16: db $32, $31, $31, $32
}

{ ;BB1A - BB21
_00BB1A: dw $FFC0, $0040

.BB1E: dw $0006, $FFFA
}

{ ;BB22 - BBF5
_00BB22: ;bowgun
    ;middle value is gfx offset for second bolt, which is disabled. gfx doesn't appear to exist anymore
    db $04, $02, $00
    db $00, $02, $04

.bowgun_facing:
    db $00, $00, $00
    db $01, $01, $01

.BB2E:
    dw !obj_objects.base+obj.ext.len*0, !obj_objects.base+obj.ext.len*1, !obj_objects.base+obj.ext.len*2
    dw !obj_objects.base+obj.ext.len*0, !obj_objects.base+obj.ext.len*1, !obj_objects.base+obj.ext.len*2

.BB3A:
    db $1C, $1E, $00
    db $10, $12, $14

.BB40:
    db 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0
    db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
    db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1
    db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1
    db 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1
    db 16, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1 ;16 = $10 = typo?
    db 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1
    db 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1
    db 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
    db 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0
    db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1
    db 0, 0, 1, 1, 0, 0
}

{ ;BBF6 - BBF7
_00BBF6: ;scythe2 second $13, first value is taken from previous data
    dw $0010
}

{ ;BBF8 - BBFB
coord_offsets_torch:
    dw 0, 8
}

{ ;BBFC - BBFF
    dw $0000, $0030 ;unused?
}

{ ;BC00 - BC07
_00BC00:
    dd $00FFFE80
    dd $00000180
}

{ ;BC08 -
_00BC08:

.BC08: dw $0000, $4000
.BC0C: dw $FFF9, $0007
}

{ ;BC10 - BC19
bracelet_data:

.speed: db $7B, $7E, $81, $81, $84

.decay_rate:
if !version == 0 || !version == 1
    db $06, $07, $07, $07, $08
elseif !version == 2
    db $08, $09, $09, $09, $0A
endif
}

{ ;BC1A - BC64
tornado_data:
    db $04, $20
    db $04, $20
    db $04, $28
    db $08, $28
    db $08, $28
    db $08, $28
    db $08, $28
    db $03, $20
    db $03, $20
    db $03, $20
    db $03, $20
    db $03, $20
    db $03, $28
    db $03, $28
    db $03, $28
    db $03, $28
    db $02, $28
    db $02, $28
    db $02, $2A
    db $02, $2C
    db $07, $2E
    db $07, $30
    db $08, $30
    db $04, $40
    db $04, $41
    db $04, $42
    db $04, $43
    db $04, $44
    db $04, $45
    db $04, $46
    db $04, $47
    db $04, $48
    db $04, $49
    db $04, $4A
    db $04, $4B
    db $04, $4C
    db $04, $4D
    db $00
}

{ ;BC65 - BC78
_00BC65:

.BC65:
    db $04, $02
    db $00, $FE

.BC69: dw $0000, $002C, $0058, $0084, $00B0, $00DC, $0108, $0134
}

{ ;BC79 - BCF7
triblade_data:

.BC79: db $06, $07, $01, $02, $01, $00, $07, $05, $04, $06, $05, $03, $02, $03, $04, $05, $07, $00
.BC8B: db $02, $00, $00, $02, $00, $00, $00, $01, $01, $02, $01, $01, $02, $01, $01, $01, $00, $00
.BC9D: db $06, $07, $01, $02, $01, $00, $07, $07, $00, $06, $07, $01, $02, $01, $00, $07, $07, $00

.BCAF:
    dw $0000, $002C, $0050, $007C, $00A0, $00CC, $00F0, $011C
    dw $0000, $002C, $0060, $008C, $00C0, $00EC, $0120, $014C

.BCCF: db $0A, $03, $03, $0C, $03, $07, $03, $03, $0E

.BCD8:
    dw $0000, $002C, $0050, $002C, $0000, $011C, $00F0, $011C
    dw $0000, $002C, $0060, $002C, $0000, $014C, $0120, $014C
}

{ ;BCF8 - BD0A
shield_magic_data:

.BCF8: db $30, $05, $1A
.BCFB: db $18, $1A, $1C, $1E, $20, $22, $24, $26, $28, $26, $24, $22, $20, $1E, $1C, $1A
}

{ ;BD0B - BE75
_00BD0B:
    db $0C : dw .BD1A ;2-2 water animation?
    db $0C : dw .BD26
    db $0C : dw .BD32 ;stage 5 snow
    db $0C : dw .BD3E ;stage 5-2 avalanche (top?)
    db $0C : dw .BD4A ;stage 5-2 avalanche (side?)

;-----

.BD1A:
    db $0B : dw .BD56
    db $0B : dw .BD66
    db $0B : dw .BD76
    db $0B : dw .BD86

.BD26:
    db $0B : dw .BD96
    db $0B : dw .BDA6
    db $0B : dw .BDB6
    db $0B : dw .BDC6

.BD32:
    db $05 : dw .BDD6
    db $05 : dw .BDE6
    db $05 : dw .BDF6
    db $05 : dw .BE06

.BD3E:
    db $05 : dw .BE16
    db $05 : dw .BE1E
    db $05 : dw .BE26
    db $05 : dw .BE2E

.BD4A:
    db $05 : dw .BE36
    db $05 : dw .BE46
    db $05 : dw .BE56
    db $05 : dw .BE66

;-----

.BD56:
    dw $5A00 : dl $7FC600 : dw $0200 : db $80
    dw $5B00 : dl $7FCA00 : dw $0200 : db $00
.BD66:
    dw $5A00 : dl $7FC800 : dw $0200 : db $80
    dw $5B00 : dl $7FCC00 : dw $0200 : db $00
.BD76:
    dw $5A00 : dl $7FCA00 : dw $0200 : db $80
    dw $5B00 : dl $7FC600 : dw $0200 : db $00
.BD86:
    dw $5A00 : dl $7FCC00 : dw $0200 : db $80
    dw $5B00 : dl $7FC800 : dw $0200 : db $00

;-----

.BD96:
    dw $5000 : dl $7FCE00 : dw $0400 : db $01
    dw $5200 : dl $7FD600 : dw $0400 : db $00
.BDA6:
    dw $5000 : dl $7FD200 : dw $0400 : db $01
    dw $5200 : dl $7FDA00 : dw $0400 : db $00
.BDB6:
    dw $5000 : dl $7FD600 : dw $0400 : db $01
    dw $5200 : dl $7FCE00 : dw $0400 : db $00
.BDC6:
    dw $5000 : dl $7FDA00 : dw $0400 : db $01
    dw $5200 : dl $7FD200 : dw $0400 : db $00

;-----

.BDD6:
    dw $5280 : dl $7FA800 : dw $0100 : db $80
    dw $5380 : dl $7FA900 : dw $0100 : db $00

.BDE6:
    dw $5280 : dl $7FAA00 : dw $0100 : db $80
    dw $5380 : dl $7FAB00 : dw $0100 : db $00

.BDF6:
    dw $5280 : dl $7FAC00 : dw $0100 : db $80
    dw $5380 : dl $7FAD00 : dw $0100 : db $00

.BE06:
    dw $5280 : dl $7FAE00 : dw $0100 : db $80
    dw $5380 : dl $7FAF00 : dw $0100 : db $00

;-----

.BE16:
    dw $4600 : dl $7FBC80 : dw $0400 : db $00

.BE1E:
    dw $4600 : dl $7FC080 : dw $0400 : db $00

.BE26:
    dw $4600 : dl $7FC480 : dw $0400 : db $00

.BE2E:
    dw $4600 : dl $7FC880 : dw $0400 : db $00

;-----

.BE36:
    dw $4480 : dl $7FCC80 : dw $00C0 : db $80
    dw $4580 : dl $7FCD40 : dw $00C0 : db $00

.BE46:
    dw $4480 : dl $7FCE00 : dw $00C0 : db $80
    dw $4580 : dl $7FCEC0 : dw $00C0 : db $00

.BE56:
    dw $4480 : dl $7FCF80 : dw $00C0 : db $80
    dw $4580 : dl $7FD040 : dw $00C0 : db $00

.BE66:
    dw $4480 : dl $7FD100 : dw $00C0 : db $80
    dw $4580 : dl $7FD1C0 : dw $00C0 : db $00
}

{ ;BE76 - BF05
_00BE76:
    ;score table for objects
    ;starts at id $20
    db $07
    db $07
    db $07
    db $07
    db $00
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07 ;shell
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $00
    db $00
    db $07
    db $17
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07 ;zombie
    db $07
    db $07
    db $07
    db $07
    db $07
    db $00
    db $00
    db $07
    db $07
    db $0F
    db $07
    db $07
    db $07
    db $07
    db $07
    db $00
    db $07
    db $00
    db $00
    db $00
    db $07 ;flower head
    db $07
    db $07
    db $07
    db $00
    db $00
    db $07
    db $07
    db $07
    db $00
    db $00
    db $07
    db $07
    db $00
    db $00
    db $07
    db $07
    db $07
    db $0F ;wolf
    db $07
    db $00
    db $07
    db $00
    db $00
    db $0F
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $00
    db $07
    db $07
    db $07
    db $07
    db $0F
    db $00
    db $00
    db $00
    db $00
    db $27 ;arremer
    db $00
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07 ;killer
    db $17
    db $00
    db $00
    db $00
    db $07
    db $07
    db $07
    db $00
    db $00
    db $00
    db $07
    db $07
    db $07
    db $00
    db $00
    db $00
    db $07
    db $07
    db $00
    db $07 ;mad dog
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
}

{ ;BF06 - BF15
zombie_data:

.coord_offsets:
    dw 4,  20
    dw 8,   0
    dw 8,  24

.difficulty_speed_offset:
    db $09, $31, $2D, $2F
}

{ ;BF16 - BF21
armor_piece_speed_direction:
    db 06, 01
    db 07, 01
    db 08, 01
    db 09, 00
    db 06, 00
    db 07, 00
}

{ ;BF22 - BFCE
shield_data:

.hp: db $00, $02

.BF24: db $00, $04, $04

.BF27:
    db $00, $05, $03, $05, $08, $04, $08, $04, $06, $0A, $07, $08, $0A, $0A, $02, $02
    db $01, $01, $03, $0A, $10, $0B, $04, $09, $03, $0B, $07, $07

.BF43:
    db $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $00, $00
    db $00, $00, $02, $02, $02, $01, $02, $02, $02, $01, $02, $02

.BF5F: ;xy pairs
    dw $000A, $FFFB,  $0008, $FFFC,  $000D, $FFF0,  $0008, $FFFB
    dw $0001, $FFFE,  $FFFA, $FFF8,  $0001, $FFFE,  $000C, $FFFB
    dw $0002, $FFF0,  $FFFA, $0008,  $0008, $FFF8,  $0003, $FFFC
    dw $FFF9, $0007,  $FFFE, $0009,  $FFF7, $FFF6,  $FFF7, $FFF4
    dw $FFF7, $FFF8,  $FFF7, $FFF7,  $0009, $FFED,  $000D, $FFFA
    dw $0007, $FFF1,  $0009, $0000,  $000B, $0005,  $0000, $0008
    dw $0004, $FFF9,  $0008, $0003,  $0004, $FFFB,  $0006, $FFF9
}

{ ;BFCF - BFD4
shield_piece_data:

.BFCF: db $00, $28, $2A
.BFD2: db $16, $18, $19
}

{ ;BFD5 - BFD8
_00BFD5: dw $0000, $0013 ;stone pillar collision offset, unused?
}

{ ;BFD9 - BFE4
    ;a few unused $13?
    dw $0000, $0017
    dw $0000, $001B
    dw $0000, $0023
}

{ ;BFE5 - BFE8
_00BFE5: dw $0000, $FFFC ;unused $13
}

{ ;BFE9 - C01B
storm_cesaris_data:

.BFE9: db $40, $40, $40, $40, $80, $80, $80, $80, $80, $80, $80, $80, $C0, $C0, $C0, $C0
.BFF9: db $00, $00, $00, $00, $00, $C0, $C0, $C0, $C0, $C0, $C0, $40, $40, $40, $40, $40
.C009: db $10, $10, $10, $10, $20, $20, $20, $20, $20, $40, $40, $40, $40, $40, $40 ;mistake: should be 16 values? can read from following data

.C018:
if !version == 0 || !version == 1
    db $14, $0A, $FC, $FB
elseif !version == 2
    db $28, $14, $0A, $00
endif
}

{ ;C01C - C07D
storm_cesaris_parts_data:

.C01C: ;x y speed
    dw $FFF4, $FFFA
    dw $000C, $FFFA
    dw $0000, $FFC8
    dw $FFE8, $FFE0
    dw $0018, $FFE0
    dw $0000, $FFE1
    dw $0000, $0018
    dw $FFFD, $002E
    dw $FFFD, $003C
    dw $FFFD, $004A
    dw $FFFD, $0058
    dw $FFFD, $005F

.C04C: db $02, $02, $00, $00, $02, $00, $04, $06, $06, $06, $08, $08 ;offsets for C058
.C058: dw $21E8, $21F0, $2202, $21E2, $21E4
.C062: db $03, $06, $12, $0C, $0F, $09, $0A, $0E, $12, $16, $1A, $1E
.C06E: db $00, $01, $02, $03, $04, $05, $06, $07, $08, $07, $06, $05, $04, $03, $02, $01
}

{ ;C07E - C085
storm_cesaris_projectile_data:

.C07E:
if !version == 0 || !version == 1
    dw $FF40, $FF60, $FF80, $0000
elseif !version == 2
    dw $FF20, $FF40, $FF80, $0000
endif
}

{ ;C086 - C174
enemy_spawner_data:

.C086: db 180, 128, 100, 80 ;eagler spawner
.C08A: db $04, $08, $0C, $0C ;eagler spawner

.C08E: db $02, $03, $03, $03 ;icicle spawner
.C092: db $3E, $20, $16, $0C ;icicle spawner

.C096: db $38, $40, $48, $50, $58, $60, $68, $70, $78, $80, $88, $90 ;icicle

.C0A2: db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1 ;eagler, last value unreachable
.C0B3: db $0A, $14, $1E ;eagler
.C0B6: dw -8, 8 ;eagler

    dw $0040, $00C0, $FFE0, $0120 ;unused?

.C0C2: ;eagler spawner
    dw $0100, $03C0 : db $02
    dw $0140, $03C0 : db $02
    dw $01A0, $0390 : db $02
    dw $01E0, $03D0 : db $02
    dw $0220, $01B0 : db $02
    dw $0240, $01B0 : db $02
    dw $0260, $01B0 : db $02
    dw $0370, $0210 : db $03
    dw $0300, $00E0 : db $01

.C0EF: dw $0100, $00F0, $00C8, $00C0, $0050, $0030, $0010 ;icicle spawner

.C0FD: ;icicle
    db $0C, $0D, $0E, $0D, $0E, $00, $01, $02, $01, $02, $03, $02
    db $0D, $0E, $0D, $0E, $0F, $00, $00, $00, $01, $02, $03, $04
    db $0A, $0B, $0C, $0C, $0C, $0D, $0D, $0E, $0E, $00, $02, $04
    db $0C, $0C, $0B, $0B, $0A, $0A, $09, $07, $06, $05, $04, $03
    db $0B, $0C, $0B, $0A, $0B, $0A, $08, $05, $04, $05, $05, $04
    db $0D, $0E, $0C, $0C, $0B, $0A, $0A, $09, $07, $08, $07, $06
    db $0B, $0B, $0A, $0C, $0C, $0B, $0B, $09, $08, $08, $07, $08
    db $0A, $0C, $0D, $0B, $0A, $09, $09, $08, $08, $07, $06, $05

.C15D: dw $0000, $0008 ;icicle / icicle spawner $13

.C161: db $40, $40, $60, $60, $60, $60, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80 ;flying knight spawner
.C171: db 20, 0, -10, -20 ;flying knight spawner
}

{ ;C175 - C17A
flying_knight_data:

.C175: dw $0110, $0160, $01B0
}

{ ;C17B - C192
hannibal_data:

.cooldown:
    db $60, $60, $60, $60, $60, $60
    db $80, $80, $80, $80, $80
    db $C0, $C0, $C0, $C0, $C0

.cooldown_difficulty:
    db $2D, $1E, $14, $00

.pos_offset:
    dw -8, 8
}

{ ;C193 - C1F6
    ;unused?
    db $00, $01, $02, $03, $02, $00, $03, $01, $03, $02, $01, $00, $01, $03, $00, $02, $03, $00, $02, $00
    dw $0130, $013C, $0148, $0154, $0146, $0150, $015A, $0164, $013B, $0146
    dw $0150, $0158, $0165, $016F, $0180, $0190, $01A0, $01A8, $01B0, $01B8
    dw $0066, $0068, $006A, $0068, $007E, $0078, $0070, $0068, $0042, $0046
    dw $004C, $0056, $0080, $008C, $0093, $0096, $0093, $0096, $0096, $0093
}

{ ;C1F7 - C2A3
hydra_data:

.C1F7:
    dw $0008, $0010
    dw $0010, $0020
    dw $000D, $0012
    dw $0006, $001A
    dw $0005, $000F

    dw $FFF8, $0010
    dw $FFF0, $0020
    dw $FFF3, $0012
    dw $FFFA, $001A
    dw $FFFB, $000F

.C21F:
    db $04, $03, $02, $01, $00, $07, $06, $05

    ; unused?
    db $00, $01, $02, $03, $04, $05, $06, $07
    db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
    db $00, $01, $02, $03, $04, $05, $06, $07

.C23F:
    db $10, $0F, $0E, $0D, $0C, $0B, $0A, $09, $08, $07, $06, $05, $04, $03, $02, $01
    db $00, $1F, $1E, $1D, $1C, $1B, $1A, $19, $18, $17, $16, $15, $14, $13, $12, $11

.C25F: db $04, $03, $02, $01, $00, $00, $06, $04
.C267: db $00, $0C, $18, $24, $30, $3C, $48, $54
.C26F: db $00, $24, $48, $6C, $90, $B4, $D8, $FC
.C277: db $00, $0C, $18, $24, $30, $0C, $48, $24
.C27F: db $01, $05, $09, $0D, $11, $15, $19, $1D, $21
.C288: db $01, $08, $0F, $16, $1D, $24, $2B, $32, $39
.C291: dw $0120, $0140, $0100, $0120, $0140, $0100 ;hydra genie
.C29D: dw $0004, $0010 ;hydra genie $13
.C2A1: db $01, $02, $04
}

{ ;C2A4 - C2BA
_00C2A4: db $01, $03, $04, $04, $04, $FF, $FF, $FF, $FF

    db $FF, $FF, $FF, $FF, $FF ;5 random FFs

.C2B2: db $01, $03, $04, $04, $04, $01, $03, $04, $04
}

{ ;C2BB - C2CE
    ;unused?
_00C2BB:
    dw $0E30, $0F10, $1050, $10D0, $1168
.C2C5:
    dw $0040, $0078, $0040, $0060, $006C
}

{ ;C2CF - C2D6
belial_data:

.slope_speed: db $18, $0A, $06, $03 ;03 seems to never get used

.C2D3: dw $0000, $0010 ;13
}

{ ;C2D7 - C2DA
_00C2D7: dw $0000, $0010
}

{ ;C2DB - C2DC
    db $00, $04 ;unused?
}

{ ;C2DD - C3C0
chest_offset: ;chest x,y spawn offsets from trigger

;todo: something seems to be wrong here. fix and double check with bank 4 spawn list

    ;00
    dw $0020, $000C
    dw $0040, $FFFE ;2-7
    dw $0040, $0024 ;2-3, 2-10
    dw $0000, $005C ;1-3, 2-9
    dw $0040, $0064 ;1-7
    dw $0040, $004C ;1-1
    dw $FFC0, $0014 ;1-9, 7-6
    dw $FFC0, $0066 ;1-8

    ;08
    dw $FFC0, $0034 ;2-1, 2-8
    dw $0040, $0040 ;2-2
    dw $FFA0, $0044 ;2-4
    dw $FFA0, $0000 ;2-5
    dw $0020, $FFB4 ;2-6
    dw $0020, $FFBA ;1-10
    dw $FFC0, $0030 ;1-5, 6-1, 6-3
    dw $FFA0, $0010 ;1-6

    ;10
    dw $000A, $FFC4 ;1-4
    dw $FFE0, $FFC0 ;1-2
    dw $0020, $0034 ;4-1, 4-5, 5-3
    dw $0099, $FFFF ;5-8
    dw $FFC0, $FFF4 ;5-2
    dw $FFD0, $0014
    dw $0060, $FFF4 ;4-2
    dw $FFF0, $006C ;5-4

    ;18
    dw $FFE0, $0034 ;4-4 (trigger inside wall)
    dw $FFD0, $0030 ;5-1
    dw $FFC0, $FFF4 ;3-1
    dw $FFB8, $FFD4 ;3-2
    dw $FF80, $0024 ;3-3
    dw $0040, $FFC4 ;3-4
    dw $0000, $FFB4
    dw $0030, $0034

.chest2:
    ;00
    dw $0040, $0014 ;3-5
    dw $FFA0, $FFF4 ;3-6
    dw $FFC0, $0014 ;3-7
    dw $0040, $0034 ;3-8
    dw $FFC0, $FFF4 ;3-9
    dw $0000, $0064 ;5-5
    dw $FFC0, $FFB0 ;5-6
    dw $0020, $FFA0

    ;08
    dw $0030, $0050 ;5-7
    dw $FFC0, $FF90
    dw $0020, $0030
    dw $0040, $0044 ;4-3
    dw $0070, $FFEC ;6-2
    dw $FFC0, $0054 ;6-4
    dw $0060, $0054 ;6-5
    dw $0060, $FFE4 ;7-2

    ;10
    dw $FFA0, $0054 ;7-4
    dw $0060, $00B4 ;7-7
    dw $0070, $FFF4
    dw $0060, $0034 ;7-1
    dw $0040, $0038 ;4-6
    dw $0050, $FFE0
    dw $0000, $FFB0
    dw $FFC0, $008C ;7-3

    ;18
    dw $0060, $0094 ;7-5
}

{ ;C3C1 - C3D8
    fillbyte $00 : fill 24
}

{ ;C3D9 - C758
weapon_table:

.s1:
    db $02, $02, $02, $02, $08, $08, $04, $04, $08, $08, $08, $08, $04, $04, $04, $04 ;lance
    db $00, $00, $00, $00, $08, $08, $08, $08, $04, $04, $04, $04, $04, $04, $04, $04 ;knife
    db $00, $00, $00, $00, $00, $00, $08, $08, $02, $02, $02, $02, $08, $08, $08, $08 ;bowgun
    db $00, $00, $00, $00, $02, $02, $04, $04, $04, $08, $08, $08, $04, $04, $02, $02 ;scythe
    db $00, $00, $00, $00, $02, $02, $02, $04, $04, $04, $06, $06, $06, $06, $00, $00 ;torch
    db $00, $00, $00, $00, $02, $02, $02, $02, $04, $04, $04, $04, $06, $06, $06, $06 ;axe
    db $00, $00, $00, $00, $02, $02, $04, $04, $06, $06, $06, $06, $08, $08, $08, $08 ;triblade
    db $00, $00, $00, $00, $00, $00, $02, $04, $02, $02, $02, $02, $04, $04, $04, $04 ;bracelet

.s2:
    db $02, $02, $02, $02, $04, $04, $04, $04, $06, $06, $06, $06, $0A, $0A, $0A, $0A
    db $00, $00, $00, $00, $04, $04, $04, $04, $06, $06, $06, $06, $0A, $0A, $0A, $0A
    db $00, $00, $00, $00, $02, $02, $02, $02, $06, $06, $06, $06, $0A, $0A, $0A, $0A
    db $00, $00, $00, $00, $02, $02, $02, $02, $04, $04, $04, $04, $0A, $0A, $0A, $0A
    db $00, $00, $00, $02, $02, $04, $04, $04, $04, $06, $06, $0A, $0A, $0A, $00, $00
    db $00, $00, $00, $00, $02, $02, $02, $02, $04, $04, $04, $04, $06, $06, $06, $06
    db $00, $00, $00, $00, $00, $02, $02, $02, $02, $04, $04, $04, $04, $06, $06, $06
    db $00, $00, $00, $00, $02, $02, $02, $02, $04, $04, $04, $04, $0A, $0A, $0A, $0A

.s3:
    db $02, $02, $02, $04, $04, $04, $06, $06, $06, $08, $08, $08, $0A, $0A, $0A, $02
    db $00, $00, $00, $04, $04, $04, $06, $06, $06, $08, $08, $08, $0A, $0A, $0A, $00
    db $00, $00, $00, $02, $02, $02, $06, $06, $06, $08, $08, $08, $0A, $0A, $0A, $00
    db $00, $00, $00, $02, $02, $02, $04, $04, $04, $08, $08, $08, $0A, $0A, $0A, $00
    db $00, $00, $00, $02, $02, $02, $04, $04, $04, $06, $06, $06, $0A, $0A, $0A, $00
    db $00, $00, $00, $02, $02, $02, $04, $04, $04, $06, $06, $06, $08, $08, $08, $00
    db $00, $00, $00, $02, $02, $02, $04, $04, $04, $06, $06, $06, $08, $08, $08, $00
    db $00, $00, $00, $02, $02, $02, $04, $04, $04, $06, $06, $06, $08, $08, $00, $00

.s4:
    db $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $0A, $02, $08, $02, $04, $06
    db $00, $00, $04, $04, $06, $06, $08, $08, $0A, $0A, $00, $04, $08, $00, $04, $06
    db $00, $00, $02, $02, $06, $06, $08, $08, $0A, $0A, $00, $08, $0A, $00, $02, $06
    db $00, $00, $02, $02, $04, $04, $08, $08, $0A, $0A, $08, $0A, $00, $00, $02, $04
    db $00, $00, $02, $02, $04, $04, $06, $06, $0A, $0A, $06, $0A, $0A, $00, $02, $04
    db $00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $00, $06, $08, $00, $02, $04
    db $00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $00, $02, $04, $06
    db $00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $0A, $04, $06, $08

.s5:
    db $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $0C, $0C, $02, $04, $06, $08
    db $00, $00, $04, $04, $06, $06, $08, $08, $0A, $0A, $0C, $0C, $04, $06, $08, $0A
    db $00, $00, $02, $02, $06, $06, $08, $08, $0A, $0A, $0C, $0C, $02, $06, $08, $0A
    db $00, $00, $02, $02, $04, $04, $08, $08, $0A, $0A, $0C, $0C, $04, $08, $0A, $0C
    db $00, $00, $02, $02, $04, $04, $06, $06, $0A, $0A, $0C, $0C, $04, $06, $0A, $0C
    db $00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $0C, $0C, $04, $06, $08, $0C
    db $00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $04, $06, $08, $0A
    db $00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $0C, $0C, $02, $04

.s6:
    db $02, $04, $06, $08, $0A, $0C, $02, $04, $06, $08, $0A, $0C, $02, $04, $06, $08
    db $00, $04, $06, $08, $0A, $0C, $00, $04, $06, $08, $0A, $0C, $00, $04, $06, $08
    db $00, $02, $06, $08, $0A, $0C, $00, $02, $06, $08, $0A, $0C, $00, $02, $04, $06
    db $00, $02, $04, $08, $0C, $00, $02, $04, $08, $0A, $0C, $00, $02, $04, $08, $0A
    db $00, $02, $04, $06, $0A, $0C, $00, $02, $04, $06, $0A, $0C, $00, $02, $04, $06
    db $00, $02, $04, $06, $08, $0C, $00, $02, $04, $06, $08, $0C, $00, $02, $04, $06
    db $00, $02, $04, $06, $08, $0A, $00, $02, $04, $06, $08, $0A, $00, $02, $04, $06
    db $00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $0C, $0C, $02, $04

.s7:
    db $02, $04, $06, $08, $0A, $0C, $02, $04, $06, $08, $0A, $0C, $02, $04, $06, $08
    db $00, $04, $06, $08, $0A, $0C, $00, $04, $06, $08, $0A, $0C, $00, $04, $06, $08
    db $00, $02, $06, $08, $0A, $0C, $00, $02, $06, $08, $0A, $0C, $00, $02, $04, $06
    db $00, $02, $04, $08, $0C, $00, $02, $04, $08, $0A, $0C, $00, $02, $04, $08, $0A
    db $00, $02, $04, $06, $0A, $0C, $00, $02, $04, $06, $0A, $0C, $00, $02, $04, $06
    db $00, $02, $04, $06, $08, $0C, $00, $02, $04, $06, $08, $0C, $00, $02, $04, $06
    db $00, $02, $04, $06, $08, $0A, $00, $02, $04, $06, $08, $0A, $00, $02, $04, $06
    db $00, $00, $02, $02, $04, $04, $06, $06, $08, $08, $0A, $0A, $0C, $0C, $02, $04

.s8:
    ;empty
}

{ ;C759 - C7AC
rosebud_data:

.max_active: db 2, 3, 3, 3

.regrowth_timer: dw 336, 256, 216, 176

.C765: ;rosebud 13
    dw $0010, $0000
    dw $0010, $0010
    dw $0000, $0010
    dw $FFF0, $0010
    dw $FFF0, $0000
    dw $FFF0, $FFF0
    dw $0000, $FFF0
    dw $0010, $FFF0

.C785: ;rosebud 13 (2)
    dw $0018, $0000
    dw $0018, $0018
    dw $0000, $0018
    dw $FFE8, $0018
    dw $FFE8, $0000
    dw $FFE8, $FFE8
    dw $0000, $FFE8
    dw $0018, $FFE8

.C7A5: db $01, $04, $03, $02, $FF, $FC, $FD, $FE
}

{ ;C7AD - C7B1
rosebud_chunk_data:

.explosion_timer: db $01, $1E, $0A, $14, $28
}

{ ;C7B2 - C7E5
gate_data:

.C7B2:
    dw $0040, $01E0
    dw $0040, $01E0

.C7BA: ;x, y, $13 offset
    dw $13C8, $0080, .C7C6
    dw $01A0, $0060, .C7D6

.C7C6: dw $B027, $00E0, $6000, $0000, $E0B0, $0001, $0000, $0000 ;related to gate lifting
.C7D6: dw $A007, $00E0, $8000, $0000, $E0A0, $0001, $0000, $0000
}

{ ;C7E6 - C7F7
black_cover_data:
    dw $030C, $0078 : db $78 : dw $02F8, $0398
    dw $053C, $00C4 : db $86 : dw $0528, $0618
}

{ ;C7F8 - C8D5
arthur_plume_data:

.C7F8:
    db $80, $02, $03, $06, $02, $03, $06, $82, $86, $00, $03, $06, $03, $06, $0A, $0B
    db $0A, $0A, $00, $84, $88, $00, $07, $08, $09, $01, $00, $00, $05, $01, $05, $01
    db $05, $02, $04, $02, $04

.C81D:
    db $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $00, $00
    db $00, $00, $02, $02, $02, $02, $02, $02, $02, $01, $02, $01, $01, $02, $02, $02
    db $02, $02, $02, $02, $02

.C842:
    dw $0000, $FFEC, $0000, $FFEA, $0000, $FFE9, $0000, $FFE8
    dw $0000, $FFEA, $0000, $FFE9, $0000, $FFE9, $FFFF, $FFF0
    dw $FFFC, $FFED, $0002, $FFFA, $0003, $FFEC, $0006, $FFEE
    dw $0002, $FFF8, $0005, $FFF7, $0000, $FFF4, $FFFF, $FFF4
    dw $0000, $FFEE, $0000, $FFEE, $0000, $0000, $0000, $FFEF
    dw $0000, $FFEE, $0000, $FFF4, $0011, $FFFE, $0002, $0012
    dw $FFF8, $FFF8, $FFFE, $FFF8, $0000, $FFEB, $0000, $FFEC
    dw $FFFC, $FFEC, $FFFF, $FFF0, $FFFF, $FFF0, $0000, $FFF1
    dw $0000, $FFF1, $FFFC, $FFEE, $FFF9, $FFF2, $0000, $FFEE
    dw $FFFD, $FFF2
}

{ ;C8D6 - C8D9
    money_bag_req_for_continue: db $10, $12, $15, $20 ;used as decimal
}

{ ;C8DA - C8E7
raft_data:

.C8DA: dw $0A18, $0A88, $1127, $1207, $12D7, $13C7, $1B67 ;x coord
}

{ ;C8E8 - C918
skulls_data:

;todo: figure out what these timers are for
.cooldown1: db 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 32, 32, 32, 32
.cooldown1_difficulty: db 10, 0, -4, -4

.cooldown2: db 16, 16, 32, 32, 32, 32, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48
.cooldown2_difficulty:
if !version == 0 || !version == 1
    db 30, 15, 0, -8
elseif !version == 2
    db 40, 30, 10, 0
endif

.C910: db $05, $08, $07

.C913: db $02, $04,  $00, $04,  $00, $02 ;pairs...?
}

{ ;C919 - C920
_00C919:
    dw $2045, $244E
    dw $244E, $2045
}

{ ;C921 - C970
arthur_map_offsets:
    dw $0014,$0060, $003C,$0060
    dw $0064,$0060, $0084,$0060
    dw $00A4,$0068, $00B4,$00A0
    dw $00CC,$00A8, $00F4,$00C0
    dw $00F4,$00C0, $00F4,$00C0
    dw $015C,$00B8, $015C,$00B8
    dw $011C,$00A0, $0144,$0088
    dw $016C,$0068, $016C,$0068
    dw $0194,$0048, $0194,$0048
    dw $01B4,$0020, $01B4,$0020
}

{ ;C971 - C974
_00C971: dw $0004, $000B ;shell $13
}

{ ;C975 - C97A
    dw $0007, $0006, $0005 ;unused?
}

{ ;C97B - C9C2
guillotine_data:

.C97B:
    dw $0038, $0034, $0024, $000E, $0000, $FFF2, $FFDC, $FFCC, $FFC8
    dw        $FFCC, $FFDC, $FFF2, $0000, $000E, $0024, $0034 ;unused, mirrored data

.C99B:
    dw $003C, $0040, $004A, $004E, $0050, $004E, $004A, $0040, $003C
    dw        $0040, $004A, $004E, $0050, $004E, $004A, $0040 ;unused, mirrored data

.C9BB: ;timers per difficulty
    db 4, 4
    db 4, 3
    db 3, 3
    db 3, 2
}

{ ;C9C3 - CA44
cockatrice_body_data:

.C9C3:
    dw $0080, $0100, $0180, $0200, $0280, $0300, $0380, $0400
    dw $0380, $0300, $0280, $0200, $0180, $0100, $0080, $0000
    dw $FF80, $FEFF, $FE80, $FDFF, $FD80, $FCFF, $FC80, $FBFF
    dw $FC80, $FCFF, $FD80, $FDFF, $FE80, $FEFF, $FF80, $0000

.CA03: db $06, $05, $04, $03, $02, $01, $00, $1F, $1E, $1D, $1C, $1B, $1A

.CA10: db $10, $0F, $0E, $0D, $0C, $0B, $0A, $16, $15, $14, $13, $12, $11

.CA1D: dw $0003, $0028 ;cockatrice body $13

.CA21: dw $0004, $0010 ;miniwing $13

.CA25:
    db $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0C, $0C, $0C, $0E, $0E
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
}

{ ;CA45 - CA47
_00CA45: db $1A, $1C, $1E
}

{ ;CA48 - CAF0
arthur_face_data:

.CA48:
    dw $0000, $0010

.sprite_idx:
    db 0
    db 0, 0, 0, 0, 0, 0
    db 0
    db 0
    db 0
    db 0, 1 ;shot
    db 0, 1 ;crouching shot
    db 0, 0
    db 0, 0
    db 0
    db 0
    db 0
    db 0
    db 0, 0, 0
    db 0, 0

.CA67: ;cage related
    db $00, $04, $04

.CA6A: ;layer prio?
    db 1
    db 1, 1, 1, 1, 1, 1
    db 1
    db 1
    db 1
    db 1, 1
    db 1, 1
    db 3, 3
    db 3, 3
    db 3
    db 0
    db 1
    db 1
    db 3, 3, 3
    db 3, 1

.offset: ;x/y pairs
    dw $0005, $FFF1
    dw $0007, $FFF2, $0007, $FFF0, $0007, $FFF1, $0007, $FFF2, $0007, $FFF0, $0007, $FFF2
    dw $0005, $FFF5
    dw $0003, $FFF5
    dw $0007, $FFFF
    dw $000A, $FFF3, $000D, $FFF7
    dw $0009, $FFFF, $000C, $0000
    dw $0002, $FFFE, $FFFF, $FFFE
    dw $0006, $FFF0, $0000, $FFF0
    dw $0000, $0000
    dw $0006, $FFF6
    dw $0007, $FFF6
    dw $0005, $FFF9
    dw $0000, $0000, $0000, $0000, $0000, $0000
    dw $0000, $0000, $0005, $FFF0
}

{ ;CAF1 - CB4D
    ;unused?
    db $01, $01, $01, $01, $01, $01, $02, $02, $02, $03, $03, $04, $04, $05, $05, $06
    db $06, $07, $07, $08, $08, $0A, $0A, $10, $10, $10, $10, $10, $10, $10, $10, $10
    db $10, $0E, $0E, $0C, $0C, $0A, $0A, $08, $08, $06, $06, $04, $04, $02, $02, $01
    db $01, $01, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02
    db $03, $03, $03, $05, $07, $0A, $10, $10, $10, $10, $10, $10, $10, $10, $10, $0E
    db $0E, $0C, $0C, $0A, $0A, $08, $08, $06, $06, $04, $04, $02, $02
}

{ ;CB4E - CD05
boss_explosion_spawner_data:

.CB4E: db $1A, $1A, $18, $1A, $1A, $18, $1A, $1A

.CB56:
    dw offset(.offset_x, .offset_x_1), offset(.offset_x, .offset_x_1), offset(.offset_x, .offset_x_2), offset(.offset_x, .offset_x_1)
    dw offset(.offset_x, .offset_x_1), offset(.offset_x, .offset_x_3), offset(.offset_x, .offset_x_4), offset(.offset_x, .offset_x_1)

.CB66:
    dw offset(.offset_y, .offset_y_1), offset(.offset_y, .offset_y_1), offset(.offset_y, .offset_y_2), offset(.offset_y, .offset_y_1)
    dw offset(.offset_y, .offset_y_1), offset(.offset_y, .offset_y_3), offset(.offset_y, .offset_y_4), offset(.offset_y, .offset_y_1)

.offset_x:
..1:
    dw $FFF0, $0000, $0030, $0050, $0038, $0030, $0018, $0008
    dw $0000, $0050, $0020, $0010, $FFF0, $FFE0, $0040, $0028
    dw $FFF0, $FFD8, $FFF8, $0018, $0058, $0048, $0028, $0018
    dw $0020, $0000

..2:
    dw $0020, $0028, $0040, $0018, $0048, $0048, $0030, $0040
    dw $0048, $0028, $0018, $0028, $0010, $0020, $0008, $FFF0
    dw $FFD8, $FFE0, $FFC8, $FFE0, $FFB8, $FFC0, $FFC8, $FFE8
    dw $FFE0, $FFF8 ;last 2 unused?

..3:
    dw $FFE8, $0000, $FFF8, $0010, $0018, $0010, $0020, $0020
    dw $0038, $0000, $0048, $0060, $0020, $FFF0, $0008, $FFF8
    dw $FFE8, $0000, $FFF8, $0010, $0018, $0010, $0020, $0020

..4: ;loads two values from the next section when used ($FFF0 & $0020)
    dw $FFE8, $0000, $FFF8, $0010, $0018, $0010, $0020, $0020
    dw $0038, $0000, $0048, $0060, $0020, $FFF0, $0008, $FFF8
    dw $FFE8, $0000, $FFF8, $0010, $0018, $0010, $0020, $0020

.offset_y:
..1:
    dw $FFF0, $0020, $FFD0, $FFF0, $0020, $0040, $0028, $0010
    dw $0030, $FFF0, $FFE8, $FFD0, $0020, $0000, $FFD0, $FFB8
    dw $FFC0, $FFE0, $FFE0, $0040, $0030, $0010, $0008, $FFF0
    dw $FFE0, $FFD8

..2:
    dw $FFC0, $FFE0, $FFD0, $FFD0, $FFE0, $FFF8, $0000, $0010
    dw $0020, $0018, $0020, $0030, $0038, $0048, $0058, $0038
    dw $0040, $0020, $0028, $0018, $0010, $FFF8, $FFE8, $FFE0
    dw $FFC8, $FFC8 ;last 2 unused?

..3:
    dw $FFF0, $FFD8, $0010, $0028, $FFF8, $FFD8, $0010, $0040
    dw $0030, $FFE8, $0038, $0028, $0008, $0020, $FFF8, $FFE0
    dw $FFF0, $FFD8, $0010, $0028, $FFF8, $FFD8, $0010, $0040

..4: ;loads two values from the next section when used ($2020 & $2020 from wolf)
    dw $FFF0, $FFD8, $0010, $0028, $FFF8, $FFD8, $0010, $0040
    dw $0030, $FFE8, $0038, $0028, $0008, $0020, $FFF8, $FFE0
    dw $FFF0, $FFD8, $0010, $0028, $FFF8, $FFD8, $0010, $0040
}

{ ;CD06 - CD31
wolf_data:

.idle_timer:
    db $20, $20, $20, $20, $60, $60, $60, $60, $60, $60, $60, $60, $A0, $A0, $A0, $A0

..modifier:
    db $0A, $00, $F8, $F6 ;bug: unused!

.jump_cooldown:
    db $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $60, $60, $60, $60, $60, $60

..modifier:
    db $2A, $20, $18, $16 ;bug: unused!

.CD2E dw $0006, $0010
}

{ ;CD32 - CD47
siren_data:

.CD32: db $1E, $0A, $00, $F6 ;mistake: used as a raw timer
.CD36: db $5B, $47, $3D, $33

.CD3A:
    db $04, $03, $02, $01, $00 ;two overlapping patterns (offsets 0 & 2)
    db $04, $03, $01
    db $04, $03, $00
    db $03, $02, $00
}

{ ;CD48 - CDD2
ghost_data: ;data for both ghost and ghost_unformed
;todo: mark what data is for which ghost
.spawn_offset_x: dw $FFE8, $0118
.spawn_offset_y: db $20, $20, $20, $20, $40, $40, $40, $40, $60, $60, $60, $60, $80, $80, $80, $80

.CD5C:
if !version == 0 || !version == 1
    db 2, 3, 3, 3
elseif !version == 2
    db 1, 1, 2, 3
endif

.CD60: db $00, $20 ;ghost

.CD62:
    db $00, $FF, $00, $FF, $00, $FF, $00, $FF, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $01, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $FF, $00, $00, $FF, $00, $FF, $00, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $01, $00, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00

.wait_timer:
..forming:
if !version == 0 || !version == 1
    db 126, 106, 96, 76
elseif !version == 2
    db 136, 126, 96, 76
endif

..begin: ;wait timer right after ghost has formed
if !version == 0 || !version == 1
    db 32, 16, 16, 16
elseif !version == 2
    db 32, 32, 16, 16
endif

..next: ;wait timer between each action
if !version == 0 || !version == 1
    db 94, 74, 64, 54
elseif !version == 2
    db 104, 94, 64, 54
endif

db $40, $80, $C0 ;unused?

.CDB1: db $24, $24, $27, $27
.CDB5: db $10, $10, $13, $13
.CDB9: db $00, $00, $00, $00, $20, $20 ;stage 2 gets offset +2

.CDBF:
    db $55, $15
    db $AA, $18
    db $55, $15
    db $AA, $18
    db $80, $1B
    db $2A, $00
    db $80, $1E
    db $00, $21
    db $80, $1E
    db $00, $21
}

{ ;CDD3 - CDD6
    ;unused? potentially belongs to .CDBF above
    db $C0, $24
    db $40, $00
}

{ ;CDD7 - CE80
_00CDD7:

.CDD7: dw offset(.CDE1, .CDE1), offset(.CDE1, .CE01), offset(.CDE1, .CE21), offset(.CDE1, .CE41), offset(.CDE1, .CE61)

.CDE1:
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0001, $0001
    dw $0001, $0001, $0001, $0001, $0000, $0000, $0000, $0000

.CE01:
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0001, $0001
    dw $0000, $0000, $0000, $0000, $0001, $0001, $0001, $0001

.CE21:
    ;fifth value (LSB, $CE29) here gets used by wolf unintentionally
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0000, $0001
    dw $0001, $0001, $0001, $0001, $0000, $0000, $0000, $0000

.CE41:
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0001, $0001
    dw $0001, $0001, $0001, $0000, $0000, $0000, $0000, $0000

.CE61:
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0001, $0001
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0000, $0001
}

{ ;CE81 - CEAC
key_data:

.CE81:
    dw $1390, $00AA
    dw $1570, $02A0
    dw $1AB8, $02B8 ;stage 3
    dw $1390, $00AA ;stage 4, unused
    dw $1390, $00AA ;stage 4b, unused
    dw $0180, $00A8 ;stage 4c
    dw $1098, $02E4 ;stage 5
    dw $04A8, $0170 ;stage 6
    dw $0480, $0190 ;stage 7
    dw $04AA, $0190 ;stage 7, bracelet equipped

.CEA9: dw $0002, $000A ;$13
}

{ ;CEAD - CEB5
bat_spawner_data:

;data here is being used in reverse ($0980, 1 is the first spawner)
.x_pos_threshold: dw $1100, $0C00, $0980
.spawn_limit: db 3, 3, 1
}

{ ;CEB6 - CEB9
_00CEB6: dw $0004, $0004 ;todo: flower part $13
}

{ ;CEBA - CEBB
coffin_dirt_data:

.burrow_timer:
    db $6F, $4E
}

{ ;CEBC - CEC2
pot_data:

.CEBC: dw $0008, $0008 ;collision related

.graphics_offset: db $2E, $32, $C4
}

{ ;CEC3 - CECF
mimic_data:

.CEC3: dw $0008, $000C ;mimic $13

.CEC7: db $00, $12, $00, $00, $00, $00, $00, $20, $14 ;also used by mimic_ghost
}

{ ;CED0 - CEE9
rotating_platform_data:

.CED0:
    db $00, $01
    db $00, $03
    db $01, $02
    db $01, $01

.CED8:
    dw _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4 ;armors
    dw arthur_baby_DF31, arthur_seal_E0AA, arthur_bee_E195, arthur_maiden_DFE8 ;transformations
}

{ ;CEEA - CEF7
tower_edge_data:

.CEEA: db $00, $02, $04
.CEED: db $00, $00, $04

.CEF0: ;$13
    dw $0000, $0005
    dw $0000, $0001
}

{ ;CEF8 - CEFF
    ;unused?
    db $88, $8A, $8C, $8E, $90, $92, $94, $96
}

{ ;CF00 - CF03
_00CF00: db $36, $37, $38, $39 ;unused
}

{ ;CF04 - D000
arremer_data:

.CF04: db $00, $10, $10, $10

.CF08: dw $0DC0, $0D00, $0280

.CF0E: db $40, $02, $0A, $0A, $0A, $0A, $0C, $0E, $10

.CF17: db $00, $00, $02, $02, $02, $02, $04, $04, $04, $04, $04, $04, $04, $06, $06, $06
.CF27: dw $0030, $0050, $0070, $0090 ;only lower 8 bits get used?
.CF2F: db $14, $00, $F6, $EE

.CF33: db $AA, $00, $55, 00

.CF37: db $45, $00

.CF39: db $00, $02, $02, $04, $04, $04, $04, $04, $04, $04, $06, $06, $06, $06, $06, $06

.CF49: dw $0100, $0180, $0240, $0300

.CF51: db $20, $20, $20, $20, $20, $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $40

.CF61: db $30, $30, $30, $30, $30, $30, $60, $60, $60, $60, $60, $60, $60, $60, $60, $60

.CF71: db $14, $00, $F8, $F6

.CF75:
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db $04, $04, $02, $02, $04, $04, $04, $04, $00, $04, $00, $00, $00, $00, $00, $00
    db $04, $04, $04, $04, $04, $02, $02, $02, $02, $02, $04, $04, $00, $00, $00, $00
    db $04, $02, $04, $02, $04, $02, $04, $04, $04, $04, $04, $04, $04, $02, $04, $04

.CFB5:
    db $03, $03, $03, $03, $03, $02, $02, $02, $00, $00, $00, $00, $03, $03, $03, $03
    db $03, $01, $01, $01, $01, $00, $00, $00, $02, $02, $02, $01, $01, $01, $01, $01

.CFD5: dw $0008, $0010 ;$13

.CFD9:
    dw $21E4, $21AC, $21AC, $21AC, $21AC, $21AC, $21AC, $21AC, $21B2, $21B2
    dw $21AC, $21AC, $21A6, $21A6, $21B0, $21B0, $21A6, $21AC, $21A6, $21A6
}

{ ;D001 -
moving_platform_data:

.D001: db $30, $30, $30, $30, $30, $30, $00, $00
.D009: db $96, $80, $6E, $64
.D00D: dw .D017, .D02D, .D037, .D047, .D04B

.D017:
    db $00 : dw $0200
    db $06 : dw $0040
    db $00 : dw $0180
    db $06 : dw $0040
    db $00 : dw $0100
    db $0C : dw $0040
    db $00 : dw $0140
    db $FF

.D02D:
    db $12 : dw $0220
    db $18 : dw $0120
    db $12 : dw $0180
    db $FF

.D037:
    db $1E : dw $008C
    db $24 : dw $0118
    db $1E : dw $0118
    db $24 : dw $0118
    db $1E : dw $0118
    db $FF


.D047:
    db $2A : dw $0100
    db $FF

.D04B:
    db $30 : dw $0010
    db $36 : dw $0020
    db $30 : dw $0020
    db $36 : dw $0020
    db $30 : dw $0020
    db $36 : dw $0020
    db $30 : dw $0020
    db $36 : dw $0020
    db $30 : dw $0020
    db $36 : dw $0020
    db $30 : dw $0020
    db $36 : dw $0020
    db $30 : dw $0020
    db $36 : dw $0020
    db $30 : dw $0020
    db $36 : dw $0020
    db $30 : dw $0010
    db $FF

.D07F:
    dl $000080, $000000
    dl $000000, $FFFF80
    dl $000000, $000080
    dl $FFFF80, $FFFFC0
    dl $FFFF80, $000040
    dl $000080, $FFFFE0
    dl $000080, $000020
    dl $000100, $000000
    dl $000080, $FFFF80
    dl $000080, $000080

.D0BB: dw $0028, $0020, $0018, $0048, $0048, $0048, $0024, $0024
.D0CB: db $48, $38, $28, $18
.D0CF: dw $21AE, $21B0, $21A6, $21AC, $21AC, $21AC, $21D8, $21D8
}

{ ;D0DF - D128
skull_flower_multi_data:

.D0DF: db $30, $18, $01

.D0E2:
    dl $000040, $000080
    dl $000080, $000040
    dl $000040, $FFFF80
    dl $FFFF80, $000040

.D0FA:
    dl $000040, $FFFF80
    dl $FFFF80, $000040
    dl $000040, $000080
    dl $000080, $000040

.D112:
    db $10, $00 : dw $FFFE
    db $08, $00 : dw $0000
    db $10, $01 : dw $0002

.D11E: db $01, $01, $01, $01, $08, $10, $18

.D125: db $00, $5C, $40, $1C
}

{ ;D129 - D12C
grilian_projectile_data:

.D129: db 12, 16, 18, 20
}

{ ;D12D - D166
death_crawler_projectile_data:

.D12D: dw $00C0, $00A0, $0090, $00D0, $00B0

.D137:
    db $3C, $3D, $3E, $3F, $3F, $3E, $3D, $3C ;up
    db $42, $43, $44, $45, $45, $44, $43, $42 ;left, 3 last values unused?
    db $46, $47, $48, $49, $49, $48, $47, $46 ;right, 3 last values unused?

.D14F:
    db $00, $00, $00, $00, $01, $01, $01, $01 ;up
    db $00, $00, $00, $00, $01, $01, $01, $01 ;left, 3 last values unused?
    db $00, $00, $00, $00, $01, $01, $01, $01 ;right, 3 last values unused?
}

{ ;D167 - D169
    db $00, $08, $10 ;unused?
}

{ ;D16A - D1AB
_00D16A:
    db $01, $03, $02, $01, $03, $03, $03, $01, $01, $01, $01, $02, $01

.D177:
    dw $0280, $0380
    dw $0240, $0370
    dw $0200, $0340
    dw $01D0, $0370
    dw $0180, $0360
    dw $0100, $0340
    dw $00F0, $0260
    dw $0140, $0240
    dw $0170, $0230
    dw $0180, $0200
    dw $01C0, $01F0
    dw $0260, $0240
    dw $02E0, $0230
}

{ ;D1AB - D1BA
lava_pillar_data:

.D1AB:
    db $D2, $B4, $A0, $8C

.D1AF:
    dw $21D0, $2214
    dw $21D2, $2216
    dw $21D4, $21A8
}

{ ;D1BB - D1BC
_00D1BB: db $05, $11
}

{ ;D1BD - D1C0
    _00D1BD: db $06, $06, $06, $02 ;last value is used to set sound mode in options. other 3 unused?
}

{ ;D1C1 - D1F0
_00D1C1:
    ;offsets
    db $00, $02, $04, $06, $08, $0A, $0C, $0E, $10, $12, $14, $16, $18, $1A, $1C, $1E

    ;pairs
    db $00,$00, $00,$01, $01,$00, $01,$01, $02,$00, $02,$01, $03,$00, $04,$01
    db $06,$00, $06,$01, $07,$00, $07,$01, $08,$00, $08,$01, $09,$00, $09,$01
}

{ ;D1F1 - D218
tiny_goblin_data:

;these 3 are used by enemy_spawner
.D1F1: db $40, $40, $40, $40, $50, $50, $50, $50, $50, $50, $78, $78, $78, $78, $78, $78
.D201: db 30, 15, -20, -40
.D205: dw $0058, $00B8, $00A0, $00A0, $00B8, $00B8, $00B8, $00A0

.D215: dw $0000, $0010 ;$13
}

{ ;D219 -
arremer_projectile_data:

.D219: db $00, $00, $00, $00, $02, $04, $06
.D220: db $80, $70

.D222: db $30, $05, $1A ;arremer killers
}

{ ;D225 - D26C
killer_data:

.D225: db $20, $20, $20, $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $60, $60, $60
.D235: dw $FFFF, $30F3, $EEEB, $30F3 ;rng mask
.D23D: db $40, $40, $40, $40, $40, $40, $40, $80, $80, $80, $80, $80, $80, $C0, $C0, $C0
.D24D: ;x/y offset pairs for stage 4b
    dw $0110, $02F0
    dw $0040, $02D0
    dw $02A0, $0180
    dw $0390, $0140
    dw $0280, $00A0
    dw $0200, $0080
    dw $0180, $00C0
    dw $0100, $0080
}

{ ;D26D - D2F8
explosion_spawner_data:
    dw $0000, $0000
    dw $0000, $FFE8
    dw $FFF0, $FFF0
    dw $0010, $FFED
    dw $FFF0, $0010
    dw $0008, $0008
    dw $0000, $FFF8
    dw $FFE8, $0000
    dw $0010, $0000
    dw $0008, $0004

.D295:
    dw $FFE0, $FFF0, $0000, $0010, $0020, $FFE8, $FFF8, $0008
    dw $0018, $0028, $FFD0, $FFE0, $FFF0, $FFF8, $0000, $0010
    dw $0020, $0030, $FFD0, $FFE0, $FFF0, $0000, $0008, $0010
    dw $0020, $0030 ;last 2 unused?

.D2C9:
    dw $0038, $0008, $0010, $0020, $FFE8, $FFF8, $0018, $0030
    dw $FFF0, $0000, $0020, $0040, $0050, $0060, $0070, $0068
    dw $0010, $FFF8, $0008, $0018, $0028, $0038, $0048, $0058
}

{ ;D2F9 - D31A
game_over_text_flames_data:

.D2F9: dw $2008, $200A, $200C, $200E, $2010, $2012, $200E, $2014
.D309: db $38, $48, $58, $68, $88, $98, $A8, $B8
.D311: db $01, $10, $20, $30, $40, $50, $60, $70, $80, $90 ;last value goes unused
}

{ ;D31B - D31E
lava_data:

.D31B: dw $0004, $0008
}

{ ;D31F - D329
    db $01, $6F, $7D, $8C, $9B, $AA, $B9, $C8, $D7, $E6, $F5 ;unused?
}

{ ;D32A - D369
cockatrice_head2_data:

.D32A:
    db $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0C, $0C, $0C, $0E, $0E
    db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E

.D34A:
    db $02, $02, $02, $04, $04, $04, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
    db $06, $06, $06, $06, $06, $06, $06, $06, $06, $02, $02, $02, $02, $02, $02, $02
}

{ ;D36A - D36C
    db $1A, $1C, $1E ;unused?
}

{ ;D36D - D374
ice_bridge_segment_data:

.D36D:
    dw $0790
    dw $0F10, $0F98, $1038 ;unused, possibly for more ice bridges?
}

{ ;D375 - D376
cockatrice_head2_data2:

.D375: db $22, $24
}

{ ;D377 - D404
crumbling_wall_data:

.D377: dw $0418, $0310, $0208

.D37D:
    dw .D385, .D3A5, .D3C5, .D3E5

.D385:
    dw $1C30, $1C31, $1CD8, $1CD9, $1C32, $1C33, $1CF5, $1CF6
    dw $9C32, $9C33, $9CF5, $9CF6, $9C30, $9C31, $9CD8, $9CD9

.D3A5:
    dw $1C01, $1C02, $1C01, $1C02, $1C10, $1C11, $1C10, $1C11
    dw $1C01, $1C02, $1C01, $1C02, $1C10, $1C11, $1C10, $1C11

.D3C5:
    dw $1DCA, $1DCB, $1DCA, $1DCB, $1DDA, $1DDB, $1DDA, $1DDB
    dw $1DCA, $1DCB, $1DCA, $1DCB, $1DDA, $1DDB, $1DDA, $1DDB

.D3E5:
    dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
    dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
}

{ ;D405 - D43C
_00D405: ;x,y coord pairs. used by intro cutscene objs
    dw $FFF0, $00BF,  $0060, $00B9,  $0110, $00B9,  $0110, $00B9,  $00C0, $0058,  $0140, $0060,  $0180, $0038
    dw $01C0, $0050,  $0138, $00C0,  $0180, $0020,  $0178, $00C8,  $01B0, $0020,  $01C0, $00D0,  $0190, $0020
}

{ ;D43D - D440
    _00D43D: db $3C, $5A, $C8, $AA ;intro fireworks use these as COP timers
}

{ ;D441 - D50C
astaroth_nebiroth_data:

.D441: dw $0100, $0080
.D445: db $40, $40, $40, $60, $60, $60, $60, $60, $60, $60, $80, $80, $80, $80, $80, $80
.D455: db $01, $01, $40, $40, $40, $40, $80, $80, $80, $80, $80, $80, $C0, $C0, $C0, $C0
.D465: db $08, $08, $08, $08, $08, $10, $10, $10, $10, $10, $10, $18, $18, $18, $18, $18

.D475: db $08, $08, $08, $08, $08, $08, $08, $08, $0C, $0C, $0C, $0C, $0C, $0C, $10, $10 ;nebiroth

.D485:
    db $50, $50, $50, $50, $50, $50, $50, $50, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
    db $32, $32, $3C, $3C, $32, $32, $3C, $3C, $5A, $5A, $64, $64, $8C, $8C, $8C, $8C
    db $01, $01, $01, $01, $28, $28, $28, $28, $50, $50, $50, $50, $50, $50, $50, $50
    db $01, $01, $01, $01, $28, $28, $28, $28, $28, $28, $28, $28, $50, $50, $50, $50

.D4C5: ;nebiroth
    db $50, $50, $50, $50, $50, $50, $50, $50, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
    db $32, $32, $3C, $3C, $5A, $5A, $64, $64, $5A, $5A, $64, $64, $8C, $8C, $8C, $8C
    db $28, $28, $28, $28, $32, $32, $32, $32, $50, $50, $50, $50, $80, $80, $80, $80
    db $01, $01, $01, $01, $28, $28, $28, $28, $28, $28, $28, $28, $50, $50, $50, $50

.D505: db $28, $14, $0A, $01 ;nebiroth
.D509: db $8C, $78, $64, $50 ;nebiroth
}

{ ;D50D -
astaroth_laser_data: ;also used for samael laser

.D50D: db $04, $08, $0C, $10

.D511:
    dw $2212, $2214, $21B8, $21BA, $21BC, $21BA, $21B8, $2214
    dw $2212, $2210, $2206, $2204, $2202, $2204, $2206, $2210

.D531: db $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00
}

{ ;D541 - D544
nebiroth_flame_data:

.D541: dw $0000, $0008
}

{ ;D545 - D550
conveyor_belt_data:

.D545:
    db $28, $19
    db $20, $19

.D549:
    db $0E, $22
    db $10, $22

.D54D:
    db $80, $00
    db $80, $FF
}

{ ;D551 - D57A
gate2_data:

.D551:
    dw $10D0, $02EC
    dw $04D8, $0180
    dw $04D8, $01A0

.D55D:
    dw $21BA
    dw $2216
    dw $2216

.D563:
    db $02, $02, $A0, $4E, $01, $B7, $E7, $10
    db $20, $00, $30, $4E, $01, $C1, $E7, $20
    db $20, $00, $50, $4E, $01, $C0, $EF, $20
}

{ ;D57B - D5C6
mad_dog_data:

.D57B: db $20, $20, $20, $20, $60, $60, $60, $60, $60, $60, $60, $60, $A0, $A0, $A0, $A0
.D58B: db $0A, $00, $F8, $F6 ;bug: unused
.D58F: db $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $60, $60, $60, $60, $60, $60
.D59F: db $2A, $20, $18, $16 ;bug: unused
.D5A3: db $08, $08, $08, $08, $08, $08, $08, $20, $10, $10, $10, $10, $10, $10, $10, $20
.D5B3: db $26, $26, $26, $26, $26, $28, $28, $28, $28, $28, $28, $28, $2A, $2A, $2A, $2A
.D5C3: dw $0006, $0010 ;$13
}

{ ;D5C7 - D5FB
grilian_data:

.D5C7: db $04, $04, $04, $04, $06, $08
.D5CD: dw $0000,$0020, $0018,$0020, $0018,$0000 ;13
.D5D9: db $20, $20, $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $40, $50, $50, $50
.D5E9: db $40, $40, $40, $40, $40, $50, $50, $50, $50, $50, $50, $50, $60, $60, $60 ;mistake: 1 value too little
.D5F8: db 20, 0, -10, -20
}

{ ;D5FC - D607
avalanche_data:

.D5FC: dw $FEC0, $0010 ;$13
.direction: db $01, $01, $01, $01

    db $01, $01, $01, $01 ;unused? maybe leftover avalanche data?
}

{ ;D608 - D637
veil_allocen_data:

.D608:
    dw $10A0, $02B0
    dw $10A8, $02D0
    dw $1080, $02A0
    dw $10C0, $02A0

.D618: dd $FFFF80, $000080
.D620: dd $000080, $FFFF80

.D628:
    dw $FFE4, $FFF0
    dw $0028, $FFF0
    dw $FFD8, $FFF0
    dw $001C, $FFF0
}

{ ;D638 - D64C
_00D638:
    db $02 ;difficulty
    db $02 ;controls
    db $04 ;lives
    db $00 ;sound
    db $00 ;stage & checkpoint
.D63D:
    db $01, $09, $06, $07, $00, $03, $02, $06, $AA, $55, $A5
.D648:
    db $07, $05, $11, $03, $10
}

{ ;D64D - D6C5
samael_data:

.D64D: dw $21C0, $21AA, $21C4, $21C2
.D655:
    dw $0000, $003A
    dw $FFD0, $003C
    dw $0030, $003C
    dw $FFEE, $0080
    dw $0012, $0080
    dw $FFEE, $0059
    dw $0012, $0059

.D671: db $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $03 ;mistake: last value unused
.D682: db $18, $18, $18, $18, $40, $40, $40, $40, $40, $40, $40, $80, $80, $80, $80, $80
.D692: db 20, 10, 0, -10
.D696: db 12, 10, 10, 8
.D69A: db 84, 64, 64, 44
.D69E: db 12, 8, 6, 4
.D6A2: db $00, $00, $02, $00, $04, $04, $04, $04, $00, $02, $00, $00
.D6AE: dw $21A4, $21A6, $21A8
.D6B4: dw $0000, $FFFF, $FFFD
.D6BA:
    dw $0000, $0000
    dw $FFF3, $FFF8
    dw $FFF6, $0000
}

{ ;D6C6 - D6E5
samael_platform_data:

.D6C6:
    db $20, $01
    db $06, $01
    db $06, $01
    db $06, $01
    db $04, $01
    db $04, $01
    db $04, $01
    db $04, $01
    db $04, $01
    db $04, $01
    db $04, $01
    db $18, $01
    db $28, $FF
    db $20, $FF
    db $08, $FF
    db $08, $FF
}

if !version == 0
{ ;D6E6 - DA6D
    incsrc "various/text.asm"
}
endif

{ ;DA6E - DAA1
zombie_spawner_data:

.delay:
if !version == 2
    db $04, $0C, $14, $1C ;difficulty offsets

    ;oversight: only the first value here gets used (increment removed)
    db $BE, $D2, $FF, $D2, $BE, $FF, $B4, $DC
    db $82, $A0, $BE, $96, $82, $DC, $78, $A0
    db $1E, $3C, $5A, $32, $1E, $78, $14, $3C
endif
    db $1E, $3C, $5A, $32, $1E, $78, $14, $3C

.offset_x:
    dw $00A0, $00C0, $00E0, $0100, $0120, $0020, $0040, $0060, $0110, $FFF0

;-----

.zone: ;zombie spawning data per zone (256px)

..difficulty_offset:
    db .zone_b-.zone_max, .zone_n-.zone_max, .zone_e-.zone_max, .zone_p-.zone_max

..max: ;max zombies allowed per zone

..b:
    db 2, 2, 1, 1, 1, 1, 1, 1, 1, 1
..n: ..e: ..p:
    db 3, 3, 2, 3, 1, 1, 1, 1, 1, 1
}

{ ;DAA2 - DC1D
_00DAA2:
    ;hitboxes for collision with arthur
    ;starts on obj id $20

    db $02, $03
    db $08, $1C
    db $08, $08
    db $08, $08
    db $00, $00
    db $04, $1C
    db $00, $00
    db $30, $20
    db $00, $00
    db $04, $02 ;flower part
    db $18, $18
    db $18, $18
    db $08, $08
    db $00, $00
    db $00, $00
    db $0C, $0C ;shell
    db $03, $03 ;shell pearl
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $08 ;belial
    db $06, $06
    db $08, $10
    db $06, $06 ;hydra fireball
    db $00, $00
    db $05, $05 ;rosebud uses other values, see below
    db $04, $02
    db $01, $08 ;bars
    db $0A, $0A ;eagler
    db $18, $08
    db $0D, $08 ;chest
    db $08, $10 ;magician
    db $02, $08 ;armor item
    db $07, $08 ;weapon item
    db $06, $06 ;shield item
    db $08, $03 ;trap
    db $10, $10 ;magician orb
    db $00, $00
    db $00, $00
    db $06, $08 ;point statue
    db $10, $10 ;stage 4 exit
    db $16, $04 ;raft pulley
    db $08, $10 ;zombie
    db $00, $F0
    db $00, $F0
    db $00, $F0
    db $03, $03 ;flower projectile
    db $00, $00
    db $08, $08 ;icicle
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $10 ;siren
    db $06, $04 ;flying killer
    db $0A, $0A ;hydra
    db $0C, $0C ;hydra genie
    db $06, $08 ;key
    db $00, $00
    db $00, $00
    db $07, $09 ;guillotine
    db $00, $00
    db $0A, $0C ;ghost
    db $00, $00
    db $06, $06 ;flower head
    db $08, $70 ;cockatrice legs
    db $06, $00 ;cockatrice neck
    db $18, $10 ;cockatrice head
    db $03, $03 ;siren projectile
    db $00, $00
    db $0A, $0A ;miniwing
    db $18, $10 ;cockatrice wings
    db $00, $00 ;cockatrice body
    db $06, $06 ;skulls
    db $0A, $0A ;moneybag
    db $08, $08 ;mimic
    db $08, $04 ;mimic ghost
    db $06, $06 ;hannibal
    db $08, $03 ;storm cesaris projectile
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $0B ;wolf
    db $48, $1C ;pier
    db $00, $00 ;rosebud chunk
    db $08, $08
    db $0D, $0D ;storm cesaris
    db $0D, $0D ;storm cesaris parts
    db $04, $08 ;flying knight
    db $00, $F8
    db $08, $08 ;bat
    db $08, $08 ;chest2
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $14, $18 ;grilian
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $0A, $0A ;gargoyle statue
    db $06, $06 ;grilian projectile
    db $00, $00
    db $04, $04 ;skull flower multi
    db $00, $00 ;arremer projectile
    db $0A, $0D ;arremer
    db $00, $00
    db $00, $00
    db $08, $08 ;death crawler part
    db $08, $08 ;death crawler
    db $00, $00
    db $06, $40 ;geyser
    db $08, $08
    db $20, $08
    db $06, $06 ;killer
    db $08, $08 ;tiny goblin
    db $00, $00
    db $00, $00
    db $02, $02 ;hannibal projectile
    db $05, $05 ;coral
    db $00, $00
    db $00, $00
    db $02, $02 ;arremer killers
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00 ;lava
    db $10, $16 ;astaroth
    db $10, $16 ;nebiroth
    db $00, $00
    db $00, $00
    db $08, $0A ;cockatrice head 2
    db $00, $00
    db $0B, $0B ;mad dog
    db $06, $06 ;astaroth flame
    db $02, $02 ;astaroth laser
    db $00, $00
    db $10, $10 ;ice bridge segment
    db $00, $00
    db $00, $00
    db $04, $04 ;death crawler projectile
    db $0C, $0C ;death crawler head?
    db $04, $04 ;cockatrice head 2 projectile
    db $20, $18 ;veil allocen
    db $30, $30
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $08 ;veil allocen claw 1
    db $10, $08 ;veil allocen claw 2
    db $00, $00
    db $06, $06 ;nebiroth flame
    db $00, $00
    db $00, $00
    db $04, $04 ;freeze splinter
    db $18, $1D ;astaroth / nebiroth body
    db $00, $00
    db $10, $10 ;samael
    db $10, $02 ;samael platform
    db $02, $02 ;samael laser

.DBEA:
    db $00, $00, $00, $00, $0B, $0B, $10, $10 ;rosebud
    db $08, $08, $10, $10, $10, $20 ;todo: what uses this?
    db $04, $04, $08, $08, $0C, $0C, $05, $08 ;lava pillar
    db $05, $10, $05, $18, $05, $20, $20, $08, $18, $08 ;todo ?
    db $04, $10, $08, $10, $0C, $10, $10, $10, $14, $10, $18, $10, $1C, $10, $20, $10, $24, $10 ;nebiroth laser, every other hitbox is unused though
    db $0C, $0C ;rosebud chunk
}

{ ;DC1E - DD93
_00DC1E:
    ;hitboxes for weapon collision, starts on obj id $20
    db $30, $30
    db $08, $1C
    db $08, $08
    db $08, $08
    db $00, $00
    db $04, $1C
    db $00, $00
    db $06, $20
    db $00, $00
    db $00, $00 ;flower part
    db $18, $18
    db $18, $18
    db $08, $08
    db $00, $00
    db $00, $00
    db $10, $10 ;shell
    db $00, $00 ;shell pearl
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $08 ;belial
    db $06, $06
    db $08, $10
    db $08, $08
    db $00, $00
    db $00, $00 ;rosebud uses other values, see below
    db $04, $02
    db $01, $08
    db $10, $08 ;eagler
    db $00, $00
    db $0C, $0A ;chest
    db $08, $10 ;magician
    db $00, $00
    db $00, $00
    db $00, $00
    db $0D, $04
    db $10, $10
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $10 ;zombie
    db $00, $F0
    db $00, $F0
    db $00, $F0
    db $00, $00
    db $00, $00
    db $08, $08 ;icicle
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $18 ;siren
    db $10, $0B ;flying killer
    db $10, $12 ;hydra
    db $10, $0B ;hydra genie
    db $00, $00
    db $00, $00
    db $00, $00
    db $07, $09 ;guillotine
    db $00, $00
    db $12, $12 ;ghost
    db $00, $00
    db $09, $09 ;flower head
    db $10, $30 ;cockatrice legs
    db $08, $08 ;cockatrice neck
    db $10, $20 ;cockatrice head
    db $03, $03 ;siren projectile
    db $00, $00
    db $0C, $10 ;miniwing
    db $20, $30 ;cockatrice wings
    db $30, $10
    db $06, $06
    db $00, $00
    db $0C, $0C ;mimic
    db $08, $04 ;mimic ghost
    db $0C, $0C ;hannibal
    db $04, $04
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $0B ;wolf
    db $00, $00
    db $00, $00
    db $08, $08
    db $10, $10 ;storm cesaris
    db $10, $10
    db $04, $08 ;flying knight
    db $00, $F8
    db $08, $08 ;bat
    db $08, $08 ;chest 2
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $15, $18 ;grilian
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $0C, $0C ;gargoyle statue
    db $00, $00
    db $00, $00
    db $06, $06 ;skull flower multi
    db $00, $00
    db $0A, $0C ;arremer
    db $00, $00
    db $00, $00
    db $08, $08 ;death crawler part
    db $08, $08 ;death crawler
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $07, $07 ;killer
    db $0A, $0A ;tiny goblin
    db $00, $00
    db $00, $00
    db $02, $02
    db $06, $0A ;coral
    db $00, $00
    db $00, $00
    db $03, $03 ;arremer killers
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $10 ;astaroth
    db $10, $10 ;nebiroth
    db $00, $00
    db $00, $00
    db $0F, $0F ;cockatrice head 2
    db $00, $00
    db $0B, $0B ;mad dog
    db $06, $06
    db $02, $02
    db $00, $00
    db $08, $08
    db $08, $08
    db $00, $00
    db $04, $04
    db $0C, $0C ;death crawler head?
    db $08, $08
    db $10, $10
    db $10, $10 ;veil allocen part
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $0A ;veil allocen claw 1
    db $10, $0A ;veil allocen claw 2
    db $00, $00
    db $06, $06
    db $00, $00
    db $00, $00
    db $00, $00
    db $18, $1D ;astaroth / nebiroth body
    db $00, $00
    db $10, $10 ;samael
    db $00, $00 ;samael platform
    db $02, $02 ;samael laser

.DD66:
    db $00, $00, $00, $00, $08, $08, $10, $10 ;rosebud
    db $08, $08, $10, $10, $10, $20, $05, $08, $05, $10, $05, $18 ;todo: don't know what these are
    db $05, $20, $10, $10, $14, $12 ;lava pillar
    db $14, $16, $14, $32, $10, $30, $10, $60 ;todo: don't know what these are
    db $0B, $22 ;stone pillar
    db $0B, $2A ;stone pillar 2
    db $0B, $20, $0B, $14 ;todo: don't know what these are
    db $18, $08, $20, $18 ;veil allocen
}

{ ;DD94 - DD95
_00DD94: db $10, $20 ;todo: unused? most likely connected to DD96?
}

{ ;DD96 - DDAD
_00DD96: ;byte pairs, stone/lava pillar sizes
    db $14, $28
    db $14, $30
    db $14, $30
    db $10, $18
    db $10, $30
    db $14, $36 ;pillar 1
    db $14, $3E ;pillar 2, 3
    db $14, $30
    db $14, $28
    db $18, $18

    ;lava pillars
    db $0F, $28
    db $0F, $30
}

{ ;DDAE - DDB1
    db $40, $18, $30, $18 ;unused? possibly stone/lava pillar sizes
}

{ ;DDB2 - DDD5
_00DDB2:
    db $0C, $1C
    db $08, $18
    db $08, $18
    db $08, $18
    db $14, $24
    db $08, $18
    db $08, $18
    db $18, $18
    db $10, $14
    db $08, $14
    db $0C, $0C
    db $0C, $0C
    db $18, $18
    db $08, $16
    db $08, $15
    db $10, $14
    db $10, $0C
    db $14, $24
}

{ ;DDD6 - DDF5
    db $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
    db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
}

{ ;DDF6 - DE09
_00DDF6:
    db $00, $00
    db $01, $01
    db $02, $02
    db $03, $04
    db $03, $04
    db $03, $04
    db $06, $06
    db $07, $07
    db $08, $08
    db $09, $09
}

{ ;DE0A - DE0D
    _00DE0A: dw _04926B, _04926B_92DC ;options menu + secret menu text offsets (bank 4)
}

{ ;DE0E - DF20
_00DE0E:
    dw .DE2C, .DE47, .DE5A, .DE75, .DE90, .DEA1, .DEB2, .DEC3, .DEC3, .DED2, .DEE1, .DEF0, .DEF0, .DF03, .DF16

    .DE2C: db $0C : dw $0194 : dw $0045, $0045, $000B, $000E, $0010, $0012, $0017, $0017, $000E, $001B, $0045, $0045
    .DE47: db $08 : dw $0198 : dw $0045, $0017, $0018, $001B, $0016, $000A, $0015, $0045
    .DE5A: db $0C : dw $0194 : dw $0045, $0045, $0045, $000E, $0021, $0019, $000E, $001B, $001D, $0045, $0045, $0045
    .DE75: db $0C : dw $0194 : dw $0019, $001B, $0018, $000F, $000E, $001C, $001C, $0012, $0018, $0017, $000A, $0015
    .DE90: db $07 : dw $029A : dw $001C, $0011, $0018, $001D, $0045, $000A, $000B
    .DEA1: db $07 : dw $029A : dw $001C, $0011, $0018, $001D, $0045, $000A, $0022
    .DEB2: db $07 : dw $029A : dw $001C, $0011, $0018, $001D, $0045, $000B, $0022
    .DEC3: db $06 : dw $031A : dw $0013, $001E, $0016, $0019, $0045, $0022
    .DED2: db $06 : dw $031A : dw $0013, $001E, $0016, $0019, $0045, $000B
    .DEE1: db $06 : dw $031A : dw $0013, $001E, $0016, $0019, $0045, $000A
    .DEF0: db $08 : dw $0518 : dw $0045, $001C, $001D, $000E, $001B, $000E, $0018, $0045
    .DF03: db $08 : dw $0518 : dw $0016, $0018, $0017, $000A, $001E, $001B, $000A, $0015
    .DF16: db $04 : dw $059C : dw $180E, $1821, $1812, $181D
}

{ ;DF21 -
_00DF21:
    dw offset(_00DF21, .DF25), offset(_00DF21, .DF45)

.DF25:
    dw $0000, $0100, $0400, $0500, $0200, $0300, $0600, $0700
    dw $0800, $0900, $0C00, $0D00, $0A00, $0B00, $0E00, $0F00

.DF45:
    dw $1000, $1100, $1400, $1500, $1200, $1300, $1600, $1700
    dw $1800, $1900, $1C00, $1D00, $1A00, $1B00, $1E00, $1F00
}

{ ;DF65 - DFE4
_00DF65:
    db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0
    db $D0, $D0, $D0, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30
    db $30, $30, $30, $30, $30, $30, $30, $30, $70, $70, $70, $70, $70, $70, $70, $70
    db $70, $70, $70, $70, $70, $70, $70, $70, $70, $70, $70, $70, $70, $70, $70, $70
    db $00, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0
    db $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $60, $60, $60, $60
    db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0
    db $50, $50, $C0, $C0, $C0, $C0, $C0, $C0, $50, $50, $50, $50, $50, $50, $50, $50
}

{ ;DFE5 - EA5E
    incsrc "various/random_values.asm"
}

{ ;EA5F - EC1E
spawn_offset:

.x:
    dw $0002
    dw $0002 ;raft_hanging
    dw $0000, $0000, $0000, $0004, $0010, $0010
    dw $0000, $FFF8, $0000, $0008, $0000, $0000, $0000, $0050
    dw $0038, $0028, $0018, $0010, $0000, $FFF0, $FFE8, $0010
    dw $0000, $FFFF
    dw $0004 ;upgraded lance fire trail
    dw $0000, $0008, $000C, $0004, $0008
    dw $0018, $0000, $FFF8, $FFF4, $0000, $FFF4, $0000, $FFE8
    dw $0038, $000E, $0003

    dw $0002, $0002, $0002, $0002 ;knife

    dw $0002, $0002, $0002, $0002

    ;death explosions, different amounts used per enemy
    dw $0000, $0008, $FFF8, $0008 ;magician
    dw $0000 ;hannibal

    dw $0000, $0000, $FFF8, $0008, $0020, $0028, $0040, $0048
    dw $0000
    dw $0000 ;ghost pot
    dw $0000, $FFFC, $FFF6, $FFF6, $FFEC, $FFEC
    dw $000A, $000A, $0014, $0014, $FFEE, $FFF8, $0008, $0012
    dw $0012, $0008, $FFF8, $FFEE, $0008, $0008, $0014, $0000
    dw $0010, $0020, $0030, $0040, $0050, $0060, $0070, $0000
    dw $0000, $FFC0, $FFEA, $0000, $FFF8, $000C, $FFF8, $0008
    dw $0000, $0000, $FFF4, $FFE8, $FFDC, $0000, $0000, $FFF8

.y:
    dw $FFF2
    dw $0000 ;raft_hanging
    dw $0000, $FFFC, $FFF8, $FFF0, $0000, $0008
    dw $0014, $0000, $0000, $0000, $FFF8, $0000, $0008, $FFF0
    dw $FFE8, $FFF0, $FFF0, $FFE8, $FFF0, $FFE8, $FFF0, $0000
    dw $FFF1, $0003, $FFFF, $0000, $FFF8, $0004, $0008, $0000
    dw $0000, $FFE0, $0008, $FFF8, $FFF4, $FFEC, $FFF4, $0010
    dw $FFC8, $0000, $FFFA

    dw $FFF0, $FFF3, $FFF6, $FFF9 ;knife

    dw $FFFE, $0001, $0004, $0007

    ;death explosions, different amounts used per enemy
    dw $0008, $0004, $0000, $FFFC ;magician
    dw $FFF8 ;hannibal

    dw $FFFC, $0000, $FFF0, $0020, $0000, $0038, $0010, $0030
    dw $000D
    dw $FFF2 ;ghost pot
    dw $FFE4, $0010, $FFF6, $000A, $FFFC, $0004
    dw $FFF6, $000A, $FFFC, $0004, $FFF8, $FFEE, $FFEE, $FFF8
    dw $0008, $0012, $0012, $0008, $0000, $0000, $0000, $0000
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0026
    dw $0005, $FFE0, $FFF2, $000C, $FFF8, $0008, $000C, $FFFC
    dw $000A, $0008, $0000, $0000, $0000, $FFF4, $FFF0, $FFF0
}

{ ;EF1F - EC3E
weapon_damage:
    ;base damage, boost damage, upgrade damage, boosted upgrade damage
    db $06, $09, $09, $0A ;lance
    db $04, $06, $07, $0A ;knife
    db $03, $04, $06, $09 ;bowgun
    db $06, $09, $09, $0A ;scythe
    db $07, $08, $0A, $08 ;torch - error: upgrade/boosted upgrade values swapped?
    db $06, $09, $09, $0A ;axe
    db $06, $09, $09, $0A ;triblade
    db $00, $03, $00, $02 ;bracelet, unused?
}

{ ;EC3F - EC4A
_00EC3F:
    dw $0400, $0200, $0100 ;zoom starting levels on mode 7 castle in intro cutscene
    dw $0005, $0002, $0002 ;zoom speeds
}

{ ;EC4B - ECFF
if !version == 0
    fillbyte $FF : fill 181
elseif !version == 1
    incbin "fill_bytes/eng/bank00c.bin"
elseif !version == 2
    incbin "fill_bytes/eng/bank00c.bin":83..0
endif
}

{ ;ED00 - FF43
    incsrc "various/sprite_set_offsets.asm"
}

{ ;FF44 - FFBF
if !version == 0
    fillbyte $FF : fill 124
elseif !version == 1
    incbin "fill_bytes/eng/bank00d.bin"
elseif !version == 2
    incbin "fill_bytes/eng/bank00d.bin":8..0
endif
}

{ ;snes header
if !version == 0
    db "CHOHMAKAIMURA        " ;title
elseif !version == 1 || !version == 2
    db "SUPER GHOULS'N GHOSTS"
endif
    db $20                     ;rom mode (LoROM)
    db $00                     ;cart type / extra functionality
    db $0A                     ;rom size
    db $00                     ;sram size
    db !version                ;country
if !version == 0 || !version == 1
    db $08                     ;developer ID
elseif !version == 2
    db $01
endif
    db $00                     ;version number
    dw $FFFF, $0000            ;checksum complement & checksum
}

{ ;interrupt vectors
if !version == 0 || !version == 1
    dw $285C, $01A7 ;unused? not sure what this is
elseif !version == 2
    dw $795C, $01A7
endif
if !version == 0
    dw cop, brk, $FFFF, nmi, $FFFF, irq ;native mode vectors
    dw $FFFF, $FFFF ;unused?
    dw $FFFF, $FFFF, $FFFF, $FFFF, entry, $FFFF ;emulation mode vectors
elseif !version == 1 || !version == 2
    dw cop, brk, $0000, nmi, $0000, irq ;native mode vectors
    dw $0000, $0000 ;unused?
    dw $0000, $0000, $0000, $0000, entry, $0000 ;emulation mode vectors
endif
}
