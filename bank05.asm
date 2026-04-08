org $058000 : bank05:

{ ;8000 - 805E | a8 x-
_058000:
    phb
    php
    lda.b #bank05>>16 : pha : plb
    !X16
    lda #$00 : xba : lda.w stage : asl : tay
    stz $0A
    stz $0B
    ldx #$0300 : stx $0C
    ldx _058200,Y
    lda _058200_821A+0,X : sta $14
.8021:
    lda.l _058200_821A+3,X : pha : plb
    lda.l _058200_821A+2,X : xba : lda.l _058200_821A+1,X : tay
    inx #3
    phx
    lda.w _058200_821A,Y : sta $15 ;load data from either bank 5 or 8
    tyx
.803B:
    inx #2
    phx
    ldy _058200_821A-1,X
    bne .804B

    ldy $0A
    iny #2
    sty $0A
    bra .8052

.804B:
    ldx $0C : stx $08
    jsr _05805F_80BA
.8052:
    plx
    dec $15
    bne .803B

    plx
    dec $14
    bne .8021

    plp
    plb
    rtl
}

{ ;805F - 8109
_05805F:

.mode1:
    jsr _05810A
    !A16
-:
    iny #2
    inx #2
    lda.w _05826F-2,Y
    cmp #$01FF
    beq -

    jsr meta_sprite_part_to_ram_entry
    bne -

    bra .80D5

.mode2:
    jsr _05810A
    lda.w _05826F+0,Y : sta $00
    lda.w _05826F+1,Y : sta $01
    iny #2
    !A16
-:
    iny
    inx #2
    lda.w _05826F-1,Y
    and #$00FF
    cmp #$00FF
    beq -

    clc
    adc $00
    jsr meta_sprite_part_to_ram_entry
    bne -

    bra .80D5

.mode3:
    jsr _05810A
    !A16
    lda.w _05826F,Y
    dec
    sta $00
    iny #2
-:
    inx #2
    inc $00
    lda $00
    jsr meta_sprite_part_to_ram_entry
    bne -

    bra .80D5

.80BA: ;a- x16
    !A16
    lda _05826F+1,Y
    pha
    rol #4     ;roll 1 garbage bit from carry + 3 upper bits to lowest position
    and #$0006 ;only keep 2 uppermost bits
    tax
    pla
    and #$3FFF
    jmp (+,X) : +: dw .mode1, .mode2, .mode3

.80D5:
    iny #2
    ldx $0C
    inx #2
    stx $0C
    lda.w _05826F-2,Y : sta $7E1FFE,X
    and #$00FF
    cmp #$0080
    bcc .80BA

    lda.w _05826F-0,Y : sta $7E2000,X
    inx #2
    stx $0C
    ldx $0A
    lda $08
    clc
    adc #$2000
    sta $7E2000,X
    inx #2
    stx $0A
    !A8
    rts
}

{ ;810A - 8128
_05810A: ;a16 x16
    pha
    !A8
    lda.w _05826F,Y
    iny #3
    sta $10
    stz $11
    ldx $0C
    sta $7E2000,X
    lda #$00 : sta $7E2001,X
    inx #2
    stx $0C
    plx
    rts
}

{ ;8129 - 8190
meta_sprite_part_to_ram:

.base: ;todo: name?
    dw -8, -16, -32, -64

.entry: ;a16 x16
    phb
    phy
    phx
    txy
    ldx $0C
    pha
    bit #$3000
    beq .8140

    ora #$2000
.8140:
    sta $7E2006,X ;vram tile
    pla
    xba
    lsr #3
    and #$0006
    pha
    !A8
    lda.b #bank05>>16 : pha : plb
    stz $19
    lda.w sprite_offsets-2,Y : sta $18
    bpl .815E

    dec $19
.815E:
    stz $1B
    lda.w sprite_offsets-1,Y : sta $1A
    bpl .8169

    dec $1B
.8169:
    !A16
    lda $18
    sta $7E2000,X ;metasprite x offset
    eor #$FFFF
    inc
    ply
    clc
    adc .base,Y
    sta $7E2002,X ;mirrored x offset
    lda $1A : sta $7E2004,X ;y offset
    clc
    txa
    adc #$0008
    sta $0C
    plx
    ply
    plb
    dec $10
    rts
}

{ ;8191 - 81FF
if !version == 0
    fillbyte $FF : fill 111
elseif !version == 1 || !version == 2
    incbin "fill_bytes/eng/bank05a.bin"
endif
}

{ ;8200 - 826E
_058200:
    dw offset(.821A, .821A), offset(.821A, .8221), offset(.821A, .8228), offset(.821A, .822F)
    dw offset(.821A, .8236), offset(.821A, .823D), offset(.821A, .8244), offset(.821A, .824B)
    dw offset(.821A, .8252), offset(.821A, .8259), offset(.821A, .8260), offset(.821A, .8264)
    dw offset(.821A, .8268)

;-----

    ;count, offset(s)
.821A: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812) ;stage 1
.8221: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_B817) ;stage 2
.8228: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_C358)
.822F: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_CFC6)
.8236: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_D442) ;stage 4b
.823D: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_D8C0) ;stage 4c
.8244: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_E0F6)
.824B: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_E9D6) ;stage 6
.8252: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_EEB6) ;stage 7
.8259: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_F23E) ;stage 8
.8260: db $01 : dl offset(.821A&$FFFF, _05A812_F531) ;map screen?
.8264: db $01 : dl offset(.821A&$FFFF, _05A812_F531)
.8268: db $02 : dl offset(.821A&$FFFF, _08E400) : dl offset(.821A&$FFFF, _05A812_F636)

;todo: surely it makes more sense to place this label here?
;anchor point for sprite animation offsets
_05826F:
}

{ ;826F - 8275
    db $01, $00, $05, $00, $00, $80, $00 ;unused?
}

{
    incsrc "various/sprite_offsets.asm" ;8276 - A811
    incsrc "various/sprite_defs2.asm"   ;A812 - FAFD
}

{ ;FAFE - FFFF
if !version == 0
    fillbyte $FF : fill 1282
elseif !version == 1 || !version == 2
    incbin "fill_bytes/eng/bank05b.bin"
endif
}
