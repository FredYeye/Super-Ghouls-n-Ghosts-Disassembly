org $018000

{ ;8000 - 8020
set_hp: ;a- x-
    lda.w difficulty : sta $0000
    stz $0001
    !AX16
    lda !obj_type
    and #$00FF
    asl #2
    ora $0000
    tax
    !A8
    lda.l hp_list-$80,X : sta !obj_hp
    !AX8
    rtl
}

{ ;8021 - 8048
_018021: ;a8 x-
    lda #$01 : jsl _01A717_A728
    stz $1F95
    stz $1F96
    jsl _018593
    jsl _02821B
    jsl _0184C3
    jsl _0185BB
    inc $0379
    lda $037B
    beq +

    inc $037A
+:
    rtl
}

{ ;8049 - 8060
_018049: ;a8 x8
    lda #$F2
    bra .8053

.804D: ;a8 x8
    lda #$F0
    bra .8053

.8051: ;a8 x8
    lda #$F1

.8053: ;a8 x8
    ;play sound
    ldx $02F7 : sta $02F8,X
    txa
    inc
    and #$1F
    sta $02F7
    rtl
}

{ ;8061 - 8073
_018061: ;a16 x16
    ;what is the significance of this memory region?

    ;memset
    ;ptr   = 7F9000
    ;value = a
    ;num   = x

    php
    bra .806A

.8064: ;a- x-
    php
    !AX16
    ldx #$07FE
.806A:
    sta $7F9000,X
    dex #2 : bpl .806A

    plp
    rtl
}

{ ;8074 - 8090
_018074: ;a8 x8
    php
    !X16
    ldx #$01FF
    lda #$E0
-:
    sta $7EF100,X
    dex : bpl -

    ldx #$001F
    lda #$00
-:
    sta $7EF300,X
    dex : bpl -

    plp
    rtl
}

{ ;8091 - 80A5
_018091: ;a8 x16
    ldy #$0020
    lda #$80 : sta !VMAIN
    stx !VMADDL
    ldx #$0400
-:
    sty !VMDATAL
    dex : bne -

    rtl
}

{ ;80A6 - 80B8
_0180A6: ;a8 x-
    stz $0066
    stz $007E
    stz $0096
    stz $00AE
    stz $00C6
    stz $00DE
    rtl
}

{ ;80B9 - 80C6
_0180B9: ;a8 x-
    !X16
    ldx #$1C93
-:
    stz $031E,X
    dex : bpl -

    !AX8
    rtl
}

{ ;80C7 - 810D
_0180C7: ;a8 x8
    php
    lda #$80 : sta !VMAIN
    !AX16
    stx $0000 ;multiply x by 7
    txa       ;
    asl #3    ;
    sec       ;
    sbc $0000 ;
    tax       ;
    bra .80E5

.ram_to_vram: ;a8 x8
    php
    lda #$80 : sta !VMAIN
    !AX16
.80E5:
    lda #$0000
    tcd
    lda.w ram_to_vram_offsets,  X : sta $0000
    lda.w ram_to_vram_offsets+2,X : sta $0002
    lda.w ram_to_vram_offsets+3,X : sta !VMADDL
    lda.w ram_to_vram_offsets+5,X
    tax
    ldy #$0000

-:
    lda [$00],Y : sta !VMDATAL
    iny #2
    dex : bne -

    plp
    rtl
}

{ ;810E - 819C
_01810E: ;a8 x-
    php
    lda #$00 : sta !VMAIN
    !AX16
    lda #$0000
    tcd
    ldy.w _00DF21,X
    stz $00
    !A8
    lda #$10 : sta $02
.8125:
    ldx.w _00DF21,Y
    iny #2
    phy
    ldy $00
    inc $00 : inc $00
    lda #$10 : sta $03
    lda.w _00A49D+0,Y : sta $04
    lda.w _00A49D+1,Y : sta $05
.813F:
    ldy #$0010
.8142:
    lda $04 : sta !VMADDL
    lda $05 : sta !VMADDH
    lda $7F6000,X
    sta !VMDATAL
    pha
    inc
    sta !VMDATAL
    clc
    lda $04 : adc #$80 : sta !VMADDL
    lda $05 : adc #$00 : sta !VMADDH
    pla
    clc
    adc #$10
    sta !VMDATAL
    inc
    sta !VMDATAL
    clc
    lda $04 : adc #$02 : sta $04
    lda $05 : adc #$00 : sta $05
    inx
    dey
    bne .8142

    !A16
    clc
    lda $04 : adc #$00E0 : sta $04
    !A8
    dec $03
    bne .813F

    ply
    dec $02
    bne .8125

    plp
    jsr _0181DD
    rtl
}

{ ;819D - 81DC
_01819D:
    !AX16
    phd
    lda #$0000 : tcd
    lda.w _00A4BD+0,Y : sta $06
    lda.w _00A4BD+2,Y : sta $00
    lda.w _00A4BD+4,Y : sta $02
    lda.w _00A4BD+5,Y : sta $04
    ldy #$0000
.81BB:
    lda $06 : sta !VMADDL
    ldx #$0010
.81C3:
    lda [$00],Y : sta !VMDATAL
    iny #2
    dex
    bne .81C3

    clc : lda $06 : adc #$0020 : sta $06
    dec $04
    bne .81BB

    !AX8
    pld
    rtl
}

{ ;81DD - 826D
_0181DD: ;a8 x-
    !X16
    ldx #$0000
    stz !VMAIN
    stz $00
    stz $01
    lda #$40 : sta $02
.81ED:
    lda $00 : sta !VMADDL
    lda $01 : sta !VMADDH
    lda !RDVRAML
    ldy #$0040
.81FD:
    lda !RDVRAML
    pha
    lsr #2
    and #$38
    sta $03
    pla
    lsr
    and #$07
    clc
    adc $03
    sta $7EB000,X
    lda !RDVRAML
    inx
    dey
    bne .81FD

    inc $01
    dec $02
    bne .81ED

    !A8
    phb
    lda #$7E : pha : plb
    ldx #$0000 : ldy #$0FC0 : jsr .8245
    ldx #$1000 : ldy #$1FC0 : jsr .8245
    ldx #$2000 : ldy #$2FC0 : jsr .8245
    !X8
    plb
    rts

.8245:
    sty $02
    lda #$40 : sta $00
.824B:
    lda #$40 : sta $04
    ldy $02
.8251:
    lda $7EB000,X : sta $C000,Y
    inx
    !A16
    sec
    tya
    sbc #$0040
    tay
    !A8
    dec $04
    bne .8251

    inc $02
    dec $00
    bne .824B

    rts
}

{ ;826E - 8339
_01826E: ;a8 x8
    php
    ldx #$00
    lda.w stage
    cmp #$03
    beq .827A

    ldx #$08
.827A:
    lda #$80 : sta !VMAIN
    !AX16
    lda #$0000
    tcd
    lda.w _00A4D9+0,X : sta $00
    lda.w _00A4D9+2,X : sta $02
    lda.w _00A4D9+3,X : sta !VMADDL
    lda.w _00A4D9+5,X : sta $04
    !A8
    lda.w _00A4D9+7,X : sta $06
    stz $07
    ldy #$0000
.82A6:
    lda #$20 : sta $08
    lda $07
    pha
    lsr #2
    and #$38
    sta $09
    pla
    and #$0F
    lsr
    ora $09
    clc
    adc $06
    tax
    lda.w _00DF65,X : sta $04
.82C2:
    lda [$00],Y
    iny
    pha
    and #$0F
    beq .82CC

    ora $04
.82CC:
    sta !VMDATAH
    pla
    lsr #4
    and #$0F
    beq .82DA

    ora $04
.82DA:
    sta !VMDATAH
    dec $08
    bne .82C2

    inc $07
    dec $05
    bne .82A6

    ldx #$0000
    lda #$F0 : sta $05
.82EE:
    lda #$20 : sta $04
    lda #$20 : sta $08
.82F6:
    lda [$00],Y
    iny
    pha
    and #$0F
    ora $04
    sta $7FA000,X
    pla
    lsr #4
    and #$0F
    ora $04
    sta $7FA001,X
    inx #2
    dec $08
    bne .82F6

    dec $05
    bne .82EE

    stz !VMADDL
    stz !VMADDH
    lda #$80 : sta !VMAIN
    !X16
    ldy #$1800
    lda !RDVRAMH
.832C:
    lda !RDVRAMH : sta $7FA000,X
    inx
    dey
    bne .832C

    inx
    plp
    rtl
}

{ ;833A - 8342
enable_nmi: ;a8 x-
    lda $02F1 : ora #$80 : sta !NMITIMEN
    rtl
}

{ ;8343 - 834B
disable_nmi: ;a8 x-
    lda $02F1 : and #$01 : sta !NMITIMEN
    rtl
}

{ ;834C - 835F
_01834C: ;a8 x8
    lda !RDNMI
    bpl +

    lda !RDNMI
+:
    lda $02F2 : ora #$80 : sta !INIDISP : sta $02F2
    rtl
}

{ ;8360 - 8365
_018360: ;a8 x8
    lda #$0F : sta $02F2
    rtl
}

{ ;8366 - 83D3
_018366: ;a- x8
    !A16

    ;clear camera values
    stz.w camera_x+0
    stz.w camera_x+2
    stz.w camera_y+0
    stz.w camera_y+2

    stz $1732
    stz $1734
    stz $1736
    stz $1738

    stz $1888
    stz $188A
    stz $188C
    stz $188E

    stz $19B4
    stz $19B6
    stz $19B8
    stz $19BA
    stz $19BC
    stz $19BE
    stz $19C0
    stz $19C2
    stz $19C4
    stz $19C6
    stz $19C8
    stz $19CA
    stz $19CC
    stz $19CE
    stz $19D0
    stz $19D2
    stz $19D4
    stz $19D6
    stz $19D8
    stz $19DA
    ldx #$40
-:
    stz $19A4,X
    dex #2 : bpl -

    !A8
    rtl
}

{ ;83D4 - 8421
_0183D4: ;a8 x16
    phb
    lda #$04 : pha : plb
    bra .83E6

.83DB: ;a8 x8
    tax
    phb
    lda #$04 : pha : plb
    !X16
    ldy.w text_tilemaps,X
.83E6:
    !A8
    lda $0000,Y
    beq .841B

    iny
    pha
    rol #2
    and #$01
    ora #$80
    pla
    !A16
    and #$003F
    sta $0000
    ldx $0000,Y
    iny #2

-:
    lda $0000,Y : sta $7F9000,X
    bcs +

    iny #2
+:
    inx #2
    dec $0000 : bne -

    bcc .83E6

    iny #2
    bcs .83E6

.841B:
    !AX8
    inc $0323
    plb
    rtl
}

{ ;8422 - 8450
call_rng: ;a8 x-
    lda.w rng_state
    pha
    sta $0000
    lda.w rng_state+1
    sta $0001
    asl $0000
    rol $0001
    clc : lda $0000         : adc.w rng_state : sta.w rng_state
          lda.w rng_state+1 : adc $0001       : sta.w rng_state+1
    pla
    clc
    adc.w rng_state+1
    sta.w rng_state+1
    rtl
}

{ ;8451 - 847D
update_animation:

.custom_timer: ;a8 x- (8451)
    clc
    adc !obj_anim_timer
    sta !obj_anim_timer
    bmi .845D

    rtl

.normal: ;a8 x- (8459)
    ;update animation
    dec !obj_anim_timer
    bne .ret

.845D:
    phb
    lda #$7E : pha : plb
    !AX16
    jsr _0184B3
    iny #2
    xba
    tax
    bpl +

    lda ($0A),Y
    tay
+:
    sty $0C
    jsr _0184B3_84B5
    and #$FF7F
    sta !obj_anim_timer
    !AX8
    plb
.ret:
    rtl
}

{ ;847E - 84B2
set_sprite: ;a8 x8
    lda #$00
.8480: ;a8 x8
    sta $3D
.8482: ;a8 x8
    sty $3E
    stx $3F
    lda $08 : ora #$08 : sta $08
    ldy $3D
.848E:
    phb
    lda #$7E : pha : plb
    !AX16
    lda ($3E),Y : sta $0A
    stz $0C
    jsr _0184B3
    and #$FF7F
    sta !obj_anim_timer
    !AX8
    plb
.ret:
    rtl

.84A7: ;a8 x8
    ;update arthur sprite (also belial flame)
    lda $3C ;new arthur sprite
    cmp $3D ;old arthur sprite
    beq .ret

    sta $3D
.84AF: ;a8 x8
    asl
    tay
    bra .848E
}

{ ;84B3 - 84C2
_0184B3:
    ldy $0C
.84B5:
    lda ($0A),Y
    asl #3
    clc
    adc $0C
    tay
    iny #2
    lda ($0A),Y
    rts
}

{ ;84C3 - 8592
_0184C3: ;a- x-
    php
    phd
    !AX16
    stz $13D1
    stz $13D3
    stz $13D5
    stz $13D7
    stz $13D9
    stz $13DB
    stz $13DD
    stz $13DF
    lda.w _00A531+0  : sta $13E1
    lda.w _00A531+2  : sta $13E3
    lda.w _00A531+4  : sta $13E5
    lda.w _00A531+6  : sta $13E7
    lda.w _00A531+8  : sta $13E9
    lda.w _00A531+10 : sta $13EB
    lda.w _00A531+12 : sta $13ED
    lda.w _00A531+14 : sta $13EF
    ldy #$0034 ;weapons + magic + object + upgrade slot count (i.e. everything but arthur)
    lda #!slot_start+!obj_size
    tcd
    clc
    lda.w camera_x+1 : adc #$0080 : sta $0000
    clc
    lda.w camera_y+1 : adc #$0080 : sta $0002
.852A:
    lda $00
    and #$00FF
    beq .8587

    lda $10
    and #$00FF
    tax
    sec
    lda $0000
    sbc !obj_pos_x+1
    clc
    adc.w _00A4E9+0,X
    cmp.w _00A4E9+2,X
    bcs .8580

    sec
    lda $0002
    sbc !obj_pos_y+1
    clc
    adc.w _00A4E9+4,X
    cmp.w _00A4E9+6,X
    bcs .8580

    lda $08 : ora #$4000 : sta $08 ;set "in range / playfield"(?) flag
    lda $08
    bit #$0008
    beq .8587

    phy
    and #$0007
    asl
    tax
    ldy $13E1,X
    tdc
    sta $11B1,Y
    inc $13E1,X
    inc $13E1,X
    txy
    ldx.w _00A541,Y
    inc $13D1,X
    ply
    bra .8587

.8580:
    lda $08 : and #$BFFF : sta $08 ;clear "in range / playfield"(?) flag?

.8587:
    clc
    tdc
    adc #!obj_size
    tcd
    dey
    bne .852A

    pld
    plp
    rtl
}

{ ;8593 - 85BA
_018593: ;a- x8
    !A16
    stz $0379
    stz $0374
    stz $0376
    lda #$0008 : sta $44
    stz $42
    ldx #$1E
    lda #$0000
-:
    sta $7EF300,X
    dex #2
    bpl -

    lda #$0080 : sta $0344
    !A8
    rtl
}

{ ;85BB - 8672
_0185BB: ;a8 x-
    phd
    !X16
    ldx $0374
    phb
    lda #$7E : pha : plb
    lda $13D1
    beq +

    ldy #$0000 : jsr _018673
+:
    lda $13D3
    beq +

    ldy #$0060 : jsr _018673
+:
    lda !arthur_active
    beq .85EF

    lda.w current_cage
    bne .85EF

    lda #$04 : xba : lda #$3C
    tcd
    jsr _01868B_868E
.85EF:
    lda $13D5
    beq +

    ldy #$00C0 : jsr _018673
+:
    lda $13D7
    beq +

    ldy #$0120 : jsr _018673
+:
    lda $13D9
    beq +

    ldy #$0180 : jsr _018673
+:
    lda $13DB
    beq +

    ldy #$01A8 : jsr _018673
+:
    lda !arthur_active
    beq .862E

    lda.w current_cage
    beq .862E

    lda #$04 : xba : lda #$3C
    tcd
    jsr _01868B_868E
.862E:
    lda $13DD
    beq +

    ldy #$01D0 : jsr _018673
+:
    lda $13DF
    beq +

    ldy #$01F8 : jsr _018673
+:
    stx $0374
    pld
    !A16
    lda $44
    and #$0007
    beq .865F

    tay
    lda $42
-:
    lsr #2
    dey
    bne -

    ldy $0376
    sta $F300,Y
.865F:
    !A8
    lda #$E1
-:
    sta $F101,X
    inx #4
    cpx #$0200
    bcc -

    !X8
    plb
    rtl
}

{ ;8673 - 868A
_018673: ;a8 x16
    sta $0378
.8676:
    lda $11B2,Y
    xba
    lda $11B1,Y
    tcd
    phy
    jsr _01868B_868E
    ply
    iny #2
    dec $0378
    bne .8676

    rts
}

{ ;868B - 87DA
_01868B:
    !A8
.868D:
    rts

.868E: ;a8 x16
    lda $08
    bit #$10
    beq +

    lda $02C3
    and #$01
    bne .868D
+:
    phx
    ldx #$0000
    lda $08
    bit #$20
    beq +

    lda #$00
    xba
    lda $02C3
    and #$1F
    lsr #3
    inc
    tax
+:
    lda #$FF : sta $0010
    stz $0012
    lda.l .87DB,X : sta $0011
    lda.l .87E0,X : sta $0013
    plx
    !A16
    clc
    lda $0C
    adc $0A
    tay
    lda $0000,Y
    cmp $0344
    bcs _01868B

    sta $0000
    eor #$FFFF
    sec
    adc $0344
    sta $0344
    iny #2
    sec
    lda !obj_pos_x+1 : sbc.w camera_x+1 : sta $0002
    sec
    lda !obj_pos_y+1 : sbc.w camera_y+1 : sta $0004
    lda $29 : sta $001A
    lda $08
    eor #$3000
    and #$3000
    ora $0012
    sta $0012
    lda $12
    lsr
    lda #$0000
    tcd
    bcs .8777

.8716:
    lda $0000,Y
    clc
    adc $02
    sta $F100,X
    sta $06
    clc
    lda $0004,Y
    adc $04
    sta $F101,X
    clc
    adc #$0020
    cmp #$0100
    bcs .876A

    lda $0006,Y
    sta $14
    adc $1A
    and $10
    ora $12
    sta $F102,X
    lsr $07
    ror $42
    asl $14
    asl $14
    asl $14
    ror $42
    dec $44
    bne +

    lda #$0008 : sta $44
    phy
    ldy $0376
    lda $42 : sta $F300,Y
    inc $0376
    inc $0376
    ply
+:
    inx #4
.876A:
    clc
    tya
    adc #$0008
    tay
    dec $00
    bne .8716

    !A8
    rts

.8777:
    lda $0002,Y
    clc
    adc $02
    sta $F100,X
    sta $06
    clc
    lda $0004,Y
    adc $04
    sta $F101,X
    clc
    adc #$0020
    cmp #$0100
    bcs .87CE

    lda $0006,Y
    sta $14
    adc $1A
    and $10
    ora $12
    eor #$4000
    sta $F102,X
    lsr $07
    ror $42
    asl $14
    asl $14
    asl $14
    ror $42
    dec $44
    bne .87CA

    lda #$0008 : sta $44
    phy
    ldy $0376
    lda $42 : sta $F300,Y
    inc $0376
    inc $0376
    ply
.87CA:
    inx #4
.87CE:
    clc
    tya
    adc #$0008
    tay
    dec $00
    bne .8777

    !A8
    rts

    .87DB: db $CF, $CF, $C1, $C1, $C1
    .87E0: db $00, $00, $02, $04, $06
}

{ ;87E5 - 87F1
_0187E5: ;a- x-
    ;clear X & Y speeds and set gravity
    !A16
    stz !obj_speed_x+0
    stz !obj_speed_x+2 ;also clears speedY+0
    stz !obj_speed_y+1
    !A8
    sta !obj_gravity
    rtl
}

{ ;87F2 - 8815
set_speed_xyg: ;a8 x8
    lda.w speed_xyg_x3,Y : sta !obj_speed_x
    lda.w speed_xyg_x2,Y : sta !obj_speed_x+1
    lda.w speed_xyg_x1,Y : sta !obj_speed_x+2
    lda.w speed_xyg_y3,Y : sta !obj_speed_y
    lda.w speed_xyg_y2,Y : sta !obj_speed_y+1
    lda.w speed_xyg_y1,Y : sta !obj_speed_y+2
    lda.w speed_xyg_g,Y  : sta !obj_gravity
    rtl
}

{ ;8816 - 8825
set_speed_x: ;a8 x8
    lda.w speeds_x+0,Y : sta !obj_speed_x
    lda.w speeds_x+1,Y : sta !obj_speed_x+1
    lda.w speeds_x+2,Y : sta !obj_speed_x+2
    rtl
}

{ ;8826 - 8835
set_speed_y: ;a8 x8
    lda.w speeds_y+0,Y : sta !obj_speed_y
    lda.w speeds_y+1,Y : sta !obj_speed_y+1
    lda.w speeds_y+2,Y : sta !obj_speed_y+2
    rtl
}

{ ;8836 - 884A
_018836:
    sec
    lda !obj_speed_x+0 : sbc !obj_gravity : sta !obj_speed_x+0
    lda !obj_speed_x+1 : sbc #$00         : sta !obj_speed_x+1
    lda !obj_speed_x+2 : sbc #$00         : sta !obj_speed_x+2
    bra update_pos_xy
}

{ ;884B - 88A1
_01884B: ;a8 x-
    ;name? apply gravity to x speed -> apply x speed to x pos -> apply y speed to y pos
    sec
    lda !obj_speed_x+0 : sbc !obj_gravity  : sta !obj_speed_x+0
    lda !obj_speed_x+1 : sbc #$00          : sta !obj_speed_x+1
    lda !obj_speed_x+2 : sbc #$00          : sta !obj_speed_x+2
    bra .8873

.8860: ;a8 x-
    clc
    lda !obj_speed_x+0 : adc !obj_gravity : sta !obj_speed_x+0
    lda !obj_speed_x+1 : adc #$00         : sta !obj_speed_x+1
    lda !obj_speed_x+2 : adc #$00         : sta !obj_speed_x+2
.8873:
    jsr update_pos_x_88E9
.8876: ;a8 x-
    lda !obj_direction
    bne .888E

    clc
    lda !obj_pos_y+0 : adc !obj_speed_y+0 : sta !obj_pos_y+0
    lda !obj_pos_y+1 : adc !obj_speed_y+1 : sta !obj_pos_y+1
    lda !obj_pos_y+2 : adc !obj_speed_y+2 : sta !obj_pos_y+2
    rtl

.888E:
    sec
    lda !obj_pos_y+0 : sbc !obj_speed_y+0 : sta !obj_pos_y+0
    lda !obj_pos_y+1 : sbc !obj_speed_y+1 : sta !obj_pos_y+1
    lda !obj_pos_y+2 : sbc !obj_speed_y+2 : sta !obj_pos_y+2
    rtl
}

{ ;88A2 - 88E0
update_pos:

.xyg_sub: ;a8 x-
    sec
    lda !obj_speed_y+0 : sbc !obj_gravity : sta !obj_speed_y+0
    lda !obj_speed_y+1 : sbc #00          : sta !obj_speed_y+1
    lda !obj_speed_y+2 : sbc #00          : sta !obj_speed_y+2
    bra update_pos_xy

.xyg_add: ;88B7 | a8 x-
    clc
    lda !obj_speed_y+0 : adc !obj_gravity : sta !obj_speed_y+0
    lda !obj_speed_y+1 : adc #00          : sta !obj_speed_y+1
    lda !obj_speed_y+2 : adc #00          : sta !obj_speed_y+2

.xy: ;88CA | a8 x-
    jsr update_pos_x_local

.y: ;88CD | a8 x-
    clc
    lda !obj_pos_y+0 : adc !obj_speed_y+0 : sta !obj_pos_y+0
    lda !obj_pos_y+1 : adc !obj_speed_y+1 : sta !obj_pos_y+1
    lda !obj_pos_y+2 : adc !obj_speed_y+2 : sta !obj_pos_y+2
    rtl
}

{ ;88E1 - 8910
update_pos_x: ;a8 x-
    jsr .local
    rtl

.local: ;88E5
    lda !obj_direction
    bne .88FD

.88E9:
    clc
    lda !obj_pos_x+0 : adc !obj_speed_x+0 : sta !obj_pos_x+0
    lda !obj_pos_x+1 : adc !obj_speed_x+1 : sta !obj_pos_x+1
    lda !obj_pos_x+2 : adc !obj_speed_x+2 : sta !obj_pos_x+2
    rts

.88FD:
    sec
    lda !obj_pos_x+0 : sbc !obj_speed_x+0 : sta !obj_pos_x+0
    lda !obj_pos_x+1 : sbc !obj_speed_x+1 : sta !obj_pos_x+1
    lda !obj_pos_x+2 : sbc !obj_speed_x+2 : sta !obj_pos_x+2
    rts
}

{ ;8911 - 8922
_018911: ;a- x-
    ;cap y speed to 6 px/f
    !A16
    lda #$0600
    cmp !obj_speed_y+1
    bcs .8920

    sta !obj_speed_y+1
    !A8
    stz !obj_gravity
.8920:
    !A8
    rtl
}

{ ;8923 - 89D8
    ;unused
    sty $000E
    !AX16
    clc
    lda !obj_direction
    and #$00FF
    adc.w speed_xy_offsets,X
    tax
    !A8
    lda.l speed_xy_x1,X : sta $0000
    lda.l speed_xy_x2,X : sta $0001
    lda.l speed_xy_x3,X : sta $0002
    lda.l speed_xy_y1,X : sta $0004
    lda.l speed_xy_y2,X : sta $0005
    lda.l speed_xy_y3,X : sta $0006
    !X8
    !A16
    lda $0000
    ldy $0002
    bpl .896E

    eor #$FFFF
    inc
.896E:
    sta !WRDIVL
    ldy $000E : sty !WRDIVB
    nop #8
    lda !RDDIVL
    ldy $0002
    bpl .898B

    eor #$FFFF
    inc
.898B:
    !A8
    clc
    adc !obj_pos_x+0
    sta !obj_pos_x+0
    xba
    adc !obj_pos_x+1
    sta !obj_pos_x+1
    tya
    adc !obj_pos_x+2
    sta !obj_pos_x+2
    !A16
    lda $0004
    ldy $0006
    bpl .89AA

    eor #$FFFF
    inc
.89AA:
    sta !WRDIVL
    ldy $000E : sty !WRDIVB
    nop #8
    lda !RDDIVL
    ldy $0006
    bpl .89C7

    eor #$FFFF
    inc
.89C7:
    !A8
    clc
    adc !obj_pos_y+0
    sta !obj_pos_y+0
    xba
    adc !obj_pos_y+1
    sta !obj_pos_y+1
    tya
    adc !obj_pos_y+2
    sta !obj_pos_y+2
    rtl
}

{ ;89D9 - 8A72
_0189D9: ;a8 x-
    pha
    !AX16
    clc
    lda !obj_direction
    and #$00FF
    adc.w speed_xy_offsets,X
    tax
    !A8
    lda speed_xy_x1,X : sta $0000
    lda speed_xy_x2,X : sta $0001
    lda speed_xy_x3,X : sta $0002
    lda speed_xy_y1,X : sta $0004
    lda speed_xy_y2,X : sta $0005
    lda speed_xy_y3,X : sta $0006
    pla : sta !WRMPYA
    lda $0000
    jsr mulu_multiplicand_set
    lda $0001
    sty $0000
    jsr mulu_multiplicand_set
    tya
    clc
    adc $0001
    sta $0001
    lda $0004
    jsr mulu_multiplicand_set
    lda $0005
    sty $0004
    jsr mulu_multiplicand_set
    tya
    clc
    adc $0005
    sta $0005
    clc
    lda !obj_pos_x+0 : adc $0000 : sta !obj_pos_x+0
    lda !obj_pos_x+1 : adc $0001 : sta !obj_pos_x+1
    lda !obj_pos_x+2 : adc $0002 : sta !obj_pos_x+2
    clc
    lda !obj_pos_y+0 : adc $0004 : sta !obj_pos_y+0
    lda !obj_pos_y+1 : adc $0005 : sta !obj_pos_y+1
    lda !obj_pos_y+2 : adc $0006 : sta !obj_pos_y+2
    !AX8
    rtl
}

{ ;8A73 - 8A7D
mulu_multiplicand_set: ;a8 x-
    sta !WRMPYB
    nop #4
    ldy !RDMPYL ;return 8 or 16-bit multiplication result in Y
    rts
}

{ ;8A7E - 8A92
_018A7E: ;a16 x8
    sta !WRDIVL
    sty !WRDIVB
    nop #8
    lda !RDDIVL
    ldy !RDMPYL
    rtl
}

{ ;8A93 - 8A9E
mulu: ;a8 x8
    ;a16 = x8 * a8
    stx !WRMPYA
    jsr mulu_multiplicand_set
    lda !RDMPYH
    xba
    tya
    rtl
}

{ ;8A9F - 8AE1
update_pos_xy_2: ;a- x-
    !AX16
    clc
    lda !obj_direction
    and #$00FF
    adc.w speed_xy_offsets,X
    tax
    !A8
    clc
    lda speed_xy_x1,X : adc !obj_pos_x+0 : sta !obj_pos_x+0
    lda speed_xy_x2,X : adc !obj_pos_x+1 : sta !obj_pos_x+1
    lda speed_xy_x3,X : adc !obj_pos_x+2 : sta !obj_pos_x+2
    clc
    lda speed_xy_y1,X : adc !obj_pos_y+0 : sta !obj_pos_y+0
    lda speed_xy_y2,X : adc !obj_pos_y+1 : sta !obj_pos_y+1
    lda speed_xy_y3,X : adc !obj_pos_y+2 : sta !obj_pos_y+2
    !X8
    rtl
}

{ ;8AE2 - 8B24
    ;unused
    !AX16
    clc : lda !obj_direction : and #$00FF : adc.w speed_xy_offsets,X : tax
    !A8
    clc
    lda.l speed_xy_x1,X : adc !obj_speed_x+0 : sta !obj_speed_x+0
    lda.l speed_xy_x2,X : adc !obj_speed_x+1 : sta !obj_speed_x+1
    lda.l speed_xy_x3,X : adc !obj_speed_x+2 : sta !obj_speed_x+2
    clc
    lda.l speed_xy_y1,X : adc !obj_speed_y+0 : sta !obj_speed_y+0
    lda.l speed_xy_y2,X : adc !obj_speed_y+1 : sta !obj_speed_y+1
    lda.l speed_xy_y3,X : adc !obj_speed_y+2 : sta !obj_speed_y+2
    !X8
    rtl
}

{ ;8B25 - 8BBE
_018B25: ;a8 x-
    pha
    !AX16
    clc
    lda !obj_direction
    and #$00FF
    adc.w speed_xy_offsets,X
    tax
    !A8
    lda speed_xy_x1,X : sta $0000
    lda speed_xy_x2,X : sta $0001
    lda speed_xy_x3,X : sta $0002
    lda speed_xy_y1,X : sta $0004
    lda speed_xy_y2,X : sta $0005
    lda speed_xy_y3,X : sta $0006
    pla
    sta !WRMPYA
    lda $0000
    jsr mulu_multiplicand_set
    lda $0001
    sty $0000
    jsr mulu_multiplicand_set
    tya
    clc
    adc $0001
    sta $0001
    lda $0004
    jsr mulu_multiplicand_set
    lda $0005
    sty $0004
    jsr mulu_multiplicand_set
    tya
    clc
    adc $0005
    sta $0005
    clc
    lda !obj_speed_x+0 : adc $0000 : sta !obj_pos_x+0
    lda !obj_speed_x+1 : adc $0001 : sta !obj_pos_x+1
    lda !obj_speed_x+2 : adc $0002 : sta !obj_pos_x+2
    clc
    lda !obj_speed_y+0 : adc $0004 : sta !obj_pos_y+0
    lda !obj_speed_y+1 : adc $0005 : sta !obj_pos_y+1
    lda !obj_speed_y+2 : adc $0006 : sta !obj_pos_y+2
    !AX8
    rtl
}

{ ;8BBF - 8BF1
_018BBF: ;a- x-
    !AX16
    clc
    and #$00FF
    adc.w speed_xy_offsets,X
    tax
    !A8
    lda.l speed_xy_x1,X : sta !obj_speed_x+0
    lda.l speed_xy_x2,X : sta !obj_speed_x+1
    lda.l speed_xy_x3,X : sta !obj_speed_x+2
    lda.l speed_xy_y1,X : sta !obj_speed_y+0
    lda.l speed_xy_y2,X : sta !obj_speed_y+1
    lda.l speed_xy_y3,X : sta !obj_speed_y+2
    !X8
    rtl
}

{ ;8BF2 - 8C2A
_018BF2:
    ;unused
    sta $0000
    jsl get_object_slot
    bmi .8C1B

    lda $0000 : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    jsl .8C1C
    lda !obj_facing : sta.w !obj_direction,X : sta.w !obj_facing,X
    lda $07 : sta $0007,X
    !AX8
    lda #$00
.8C1B:
    rtl

.8C1C:
    !A16
    lda $39 : sta $0039,X
    lda $3B : sta $003B,X
    !A8
    rtl
}

{ ;8C2B - 8C54
prepare_object: ;a8 x8
    sta $0000
    jsl get_object_slot
    bmi .8C54

    lda $0000
.8C37: ;a8 x16
    sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    jsl set_spawn_offset
    lda $12 : sta.w !obj_direction,X : sta.w !obj_facing,X
    lda $07 : sta $0007,X
    !AX8
    lda #$00
.8C54:
    rtl
}

{ ;8C55 - 8C83
_018C55: ;a8 x8
    sta $0000 ;type
    stx $0001 ;direction
    sty $0002 ;params
    jsl get_object_slot
    bmi .ret

    lda $0000 : sta.w !obj_type,X
    lda #$0C  : sta.w !obj_active,X
    jsl set_spawn_offset
    lda $0001 : sta.w !obj_direction,X
    lda $0002 : sta $0007,X
    !AX8
    lda #$00

.ret:
    rtl
}

{ ;8C84 - 8CB2
set_spawn_offset: ;a8 x16
    lda #$00
    xba
    lda $1D
    tay
.8C8A:
    !A16
    lda !obj_facing
    and #$0001
    bne .left

    clc
    lda !obj_pos_x+1 : adc.w spawn_offset_x,Y : sta.w !obj_pos_x+1,X
    bra .Y_offset

.left:
    sec
    lda !obj_pos_x+1 : sbc.w spawn_offset_x,Y : sta.w !obj_pos_x+1,X

.Y_offset:
    clc
    lda !obj_pos_y+1 : adc.w spawn_offset_y,Y : sta.w !obj_pos_y+1,X
    !A8
    rtl
}

{ ;8CB3 - 8CE1
_018CB3:
    ;unused entry
    lda #$00
    xba
    lda $1D
    tay
    !A16
    lda !obj_facing
    and #$0001
    bne .8CCD

    clc : lda.w !obj_pos_x+1,X : adc.w spawn_offset_x,Y : sta !obj_pos_x+1
    bra .8CD6

.8CCD:
    sec : lda.w !obj_pos_x+1,X : sbc.w spawn_offset_x,Y : sta !obj_pos_x+1
.8CD6: ;a16 x16
    clc
    lda.w !obj_pos_y+1,X : adc.w spawn_offset_y,Y : sta !obj_pos_y+1
    !A8
    rtl
}

{ ;8CE2 - 8D48
_018CE2: ;a- x-
    ;object list setup stuff

    !X16
    ldx #$0100
-:
    stz $1A99,X
    dex
    bne -

    ldx #$0D74
-:
    stz !slot_start,X
    dex
    bpl -

    !A16
    !X8
    ldx #$12 : stx !open_weapon_slots
    lda #!slot_weapons
-:
    sta !slot_list_weapons,X
    clc
    adc #!obj_size
    dex #2
    bpl -

    ldx #$3C : stx !open_object_slots
    lda #!slot_objects
-:
    sta !slot_list_objects,X
    clc
    adc #!obj_size
    dex #2
    bpl -

    !A8
    !X16
    lda #$1F : sta $0000
    ldx #$079E
-:
    lda $0000 : sta $094F,X
    dec $0000
    !A16
    txa
    sec
    sbc #!obj_size
    tax
    !A8
    bpl -

    !AX8
    lda #$08 : sta !open_magic_slots
    bra _018D7F
}

{ ;8D4A - 8D5A
get_object_slot: ;a- x-
    ldy !open_object_slots ;object slot index
    bmi .ret

    !X16
    dec !open_object_slots : dec !open_object_slots ;next offset
    ldx !slot_list_objects,Y ;return offset in X
.ret
    rtl
}

{ ;8D5B - 8D7E
_018D5B: ;a8 x8
    lda $14A8,X
    bmi .8D78

    clc
    adc.w _00A6A4,X
    tay
    !A16
    lda $1448,Y : sta $29
    !A8
    dec $14A8,X
    dec $14A8,X
    inx
    stx $2B
    rtl

.8D78:
    pla : pla : pla
    jml _0281A8_81B5
}

{ ;8D7F - 8DB7
_018D7F: ;from 8CE2
    ldx.w stage
    ldy.w _00A6A4_A6AE,X
    stz $0001
.8D88:
    lda.w _00A6A4_A6AE,Y
    beq .ret

    sta $0000
    iny
    dec
    asl
    ldx $0001
    inc $0001
    sta $14A8,X
    lda.w _00A6A4,X
    tax
.8DA0:
    lda.w _00A6A4_A6AE+0,Y : sta $1448,X
    lda.w _00A6A4_A6AE+1,Y : sta $1449,X
    iny #2
    inx #2
    dec $0000
    bne .8DA0

    beq .8D88

.ret:
    rtl
}

{ ;8DB8 - 8DBF
_018DB8: ;a8 x8
    ;check if arthur is in standing/crouching shot anim offset 1
    cmp $0C
    bne .8DBF

    ldx $24
    dex
.8DBF:
    rtl
}

{ ;8DC0 - 8E31
_018DC0: ;a8 x8
    ldx #$00
    txa
-:
    sta $7EF000,X
    dex : bne -

    xba
    lda.w stage
    cmp #$02
    bcs +

    ldx #$37
-:
    lda.l _0493F2_9446,X : sta $7EF000,X
    dex : bpl -

+:
    lda.w stage : asl : tax
    lda.l _0493F2+20,X : sta $0324
    lda.l _0493F2+21,X : sta $0325
    lda.l _0493F2+00,X : sta $0328
    lda.l _0493F2+01,X : sta $0329
    lda.l _0493F2+40,X : sta $0326
    lda.l _0493F2+41,X : sta $0327
.8E0E: ;a8 x-
    phb
    lda #$04 : pha : plb
    lda #$00
    xba
    !X16
    ldy.w _0493F2_942E,X
-:
    lda.w _0493F2_9446,Y
    cmp #$FF
    beq +

    tax
    lda.w _0493F2_9446+1,Y : sta $7EF000,X
    iny #2
    bra -

+:
    !X8
    plb
    rtl
}

{ ;8E32 - 8EE5
_018E32: ;a8 x8
    lda $09
    and #$40
    beq .8E72

    lda $25
    cmp $26
    beq .8E72

    sta $26
    asl
    tay
    lda.w _00A75B+0,X : sta $1FC9
    lda.w _00A75B+1,X : sta $1FCA
    lda $037B
    asl #3
    tax
    !AX16
    bra .8E8F

;-----

    ;unused
    lda $0330,X
    bne .8E72

    lda $09
    and #$0040
    beq .8E72

    lda $25
    cmp $26
    beq .8E72

    inc $0330,X
    bra .8E7F

;-----

.8E70:
    !X8
.8E72:
    rtl

.8E73: ;a8 x8
    ;oam sprite update?
    lda $09
    and #$40
    beq .8E72

.8E79:
    lda $25
    cmp $26
    beq .8E72

.8E7F:
    sta $26
.8E81: ;a8 x8
    asl
    tay
.8E83:
    lda $037B
    asl #3
    tax
    !AX16
    stz $1FC9
.8E8F:
    lda ($27),Y : tay
    lda $29 : asl #4 : clc : adc #$6000 : sta $037C,X
.8E9F:
    clc : lda $0000,Y : adc $1FC9 : sta $037E,X
    iny #2
    lda $0000,Y : sta $0380,X
    iny #2
    !A8
    lda $0000,Y : sta $0382,X
    iny
    lda #$80 : sta $0383,X
    inc $037B
    lda $0000,Y
    cmp #$FF
    beq .8E70

    !A16
    clc
    txa
    adc #$0008
    tax
    clc
    lda $0000,Y : adc $0374,X : sta $037C,X
    iny #2
    bra .8E9F

    ;unused
    lda $25
    jmp .8E83
}

{ ;8EE6 - 8F66
update_score: ;a8 x8
    ldx #$07
    clc

.8EE9:
    lda.w score_table,Y
    adc.w score,X
    cmp #$0A
    bcc +

    sbc #$0A
+:
    sta.w score,X
    dey
    dex
    bpl .8EE9

    inc $036F
    lda $1FB9
    bne .ret

    sec
    lda.w score+3 : sbc.w extend_threshhold+3
    lda.w score+2 : sbc.w extend_threshhold+2
    lda.w score+1 : sbc.w extend_threshhold+1
    lda.w score+0 : sbc.w extend_threshhold+0
    bcc .ret

    jsr add_extra_life_local
    ldx.w extend_counter
    cpx #$02
    beq +

    inc.w extend_counter
+:
    clc
    lda.w extend_threshhold+3
    adc.w extend_table,X
    cmp #$0A
    bcc +

    sbc #$0A
+:
    sta.w extend_threshhold+3
    lda.w extend_threshhold+2
    adc #$00
    cmp #$0A
    bcc +

    sbc #$0A
+:
    sta.w extend_threshhold+2
    lda.w extend_threshhold+1
    adc #$00
    cmp #$0A
    bcc +

    sbc #$0A
+:
    sta.w extend_threshhold+1
    lda.w extend_threshhold+0
    adc #$00
    cmp #$0A
    bcc +

    sbc #$0A
+:
    sta.w extend_threshhold+0

.ret:
    rtl
}

{ ;8F67 - 8F7F
add_extra_life: ;a8 x-
    jsr .local
    rtl

.local: ;8F6B
    lda.w extra_lives
    inc
    cmp #$0A
    bcs .8F7C

    sta.w extra_lives
    lda #!sfx_1up : jsl _018049_8053
.8F7C:
    inc $036D
    rts
}

{ ;8F80 - 9023
_018F80: ;a8 x8
    lda $036F
    beq .8F8F

    stz $036F
    ldx #$C4 : ldy #$00 : jsr .8FEA
.8F8F:
    lda $0370
    beq .8FCD

    stz $0370
    !A16
    lda.w timer_minutes
    and #$00FF
    cmp #$00FF
    bne +

    lda #$0000
+:
    ora #$2580
    sta $7F90F4
    lda.w timer_tens     : and #$00FF : ora #$2580 : sta $7F90F8
    lda.w timer_seconds : and #$00FF : ora #$2580 : sta $7F90FA
    !A8
    inc $0323
.8FCD:
    lda $036D
    beq .8FE9

    stz $036D
    lda.w extra_lives
    !A16
    and #$00FF
    ora #$2580
    sta $7F9106
    !A8
    inc $0323
.8FE9:
    rtl

;-----

.8FEA:
    !A16
    lda #$0005 : sta $0000
.8FF2:
    lda $0295,Y
    and #$00FF
    bne .900F

    lda #$21C5 : sta $7F9000,X
    inx #2
    iny
    dec $0000
    bne .8FF2

.9009:
    lda $0295,Y
    and #$00FF
.900F:
    ora #$2580
    sta $7F9000,X
    inx #2
    iny
    dec $0000
    bpl .9009

    !A8
    inc $0323
    rts
}

{ ;9024 - 908A
_019024: ;a8 x-
    ;copy lots of data into ram. what is this for?

    !X16
    lda.w stage
    bne .9049

    ldx #$7FFF
-:
    lda $048000,X : sta $7F0000,X
    dex : bpl -

    ldx #$1FFF
-:
    lda $058000,X : sta $7F8000,X
    dex : bpl -

    bra .9065

.9049:
    ldx #$7FFF
-:
    lda $118000,X : sta $7F0000,X
    dex : bpl -

    ldx #$1FFF
.905A:
    lda $149000,X : sta $7F8000,X
    dex : bpl .905A

.9065:
    lda.w stage
    bne .907A

    ldx #$5FFF
.906D:
    lda $05A000,X : sta $7FA000,X
    dex : bpl .906D

    bra .9088

.907A:
    ldx #$5FFF
-:
    lda $09A000,X : sta $7FA000,X
    dex : bpl -

.9088:
    !X8
    rtl
}

{ ;908B - 909A
get_arthur_relative_side: ;a- x8
    !A16
    ldx #$00
    lda !arthur_pos_x+1
    cmp !obj_pos_x+1
    bcs +

    inx
+:
    !A8
    txa
    rtl
}

{ ;909B - 90B8
_01909B: ;a- x8
    !A16
    clc
    lda !obj_pos_x+1 : adc #$0100 : sta $0000
    ldx #$00
    clc
    lda !arthur_pos_x+1
    adc #$0100
    cmp $0000
    bcs .90B5

    inx
.90B5:
    !A8
    txa
    rtl
}

{ ;90B9 - 90F0
_0190B9: ;a8 x-
    lda.w stage
    xba
    lda #$00
    !AX16
    clc
    adc #$0040
    tax
    ldy #$0040
    bra .90D7

.90CB: ;a8 x8
    lda.w stage

.palette_to_ram: ;90CE | a8 x8
    xba
    lda #$00
    !AX16
    tax
    ldy #$0000

.90D7:
    lda.l _09E800,X
    phx
    tyx
    sta $7EF400,X
    plx
    inx #2
    iny #2
    cpy #$0100
    bne .90D7

    !AX8
    inc $0331
    rtl
}

{ ;90F1 - 9135
_0190F1: ;a- x8
    !A16
    lda #$0001 : sta $0000
    ldx #$00
    txy
.90FC:
    inx #2

    lda _04984F_9879-$02,X
    phx
    tyx
    sta $7EF582,X
    plx

    lda _04984F_9879+$00,X
    phx
    tyx
    sta $7EF584,X
    plx

    lda _04984F_9879+$02,X
    phx
    tyx
    sta $7EF586,X
    plx

    inx #6
    clc
    tya
    adc #$0020
    tay
    dec $0000
    bne .90FC

    !AX8
    inc $0331
    rtl
}

{ ;9136 - 9186
_019136: ;a- x-
    !AX16
    ldx #$001C : lda #$0010 : ldy #$0000 : jsr .9164
    ldx #$001E : lda #$0040 : ldy #$0100 : jsr .9164
.9150:
    lda.w stage
.9153:
    asl : tax  : lda #$0040 : ldy #$0180 : jsr .9164
    !AX8
    inc $0331
    rtl

;-----

.9164:
    ;palette_to_ram2
    sta $0000
    lda.l _04984F,X : tax
.916C:
    tya
    and #$001F
    beq +

    lda.l _04984F,X
    inx #2
+:
    phx
    tyx
    sta $7EF400,X
    plx
    iny #2
    dec $0000
    bne .916C

    rts

;-----

.9187:
    jsr .9164
    inc $0331
    rtl
}

{ ;918E - 9225
_01918E:
    ;unused
    !AX16
    lda !obj_facing
    and #$0001
    bne .91A3

    clc : lda !arthur_pos_x+1 : adc.w _01A7E6+0,X : sta $0004
    bra .91AD

.91A3:
    sec : lda !arthur_pos_x+1 : sbc.w _01A7E6+0,X : sta $0004
.91AD:
    clc : lda !arthur_pos_y+1 : adc.w _01A7E6+2,X : sta $0006
    bra .91CA

.set_direction16: ;a- x-
    !AX16
    ldx #!slot_arthur
    lda.w !obj_pos_x+1,X : sta $0004
    lda.w !obj_pos_y+1,X : sta $0006
.91CA:
    ldy #$0000
    lda $0006
    sec
    sbc !obj_pos_y+1
    bcs .91DC

    ;arthur is lower
    eor #$FFFF
    inc
    ldy #$0004
.91DC:
    sta $0000 ;y diff
    lda $0004
    sec
    sbc !obj_pos_x+1
    bcs .91ED

    ;arthur is to the left
    eor #$FFFF
    inc
    iny #2
.91ED:
    cmp $0000
    bcs .91FA ;branch if x diff >= y diff

    iny
    ldx $0000
    sta $0000
    txa
.91FA:
    ldx #$0000
    lsr #2
    sta $0002
    cmp $0000
    bcs .9214

    inx
    adc $0002
    adc $0002
    cmp $0000
    bcs .9214

    inx
.9214:
    tya
    asl #2
    sta $0000
    txa
    clc
    adc $0000
    tax
    lda.w direction16,X
    !AX8
    rtl
}

{ ;9226 - 92AC
set_direction32: ;a- x-
;todo: maybe add a .arthur label here
    !AX16
    ldx #!slot_arthur
.custom_obj: ;a16 x16
    lda.w !obj_pos_x+1,X : sta $0004
    lda.w !obj_pos_y+1,X : sta $0006
    ldy #$0000
    lda $0006
    sec
    sbc !obj_pos_y+1
    bcs .9249

    eor #$FFFF
    inc
    ldy #$0004
.9249:
    sta $0000
    lda $0004
    sec
    sbc !obj_pos_x+1
    bcs .925A

    eor #$FFFF
    inc
    iny #2
.925A:
    cmp $0000
    bcs .9267

    iny
    ldx $0000
    sta $0000
    txa
.9267:
    ldx #$0000
    lsr #3
    sta $0002
    cmp $0000
    bcs .929A

    inx
    adc $0002
    adc $0002
    cmp $0000
    bcs .929A

    inx
    adc $0002
    adc $0002
    cmp $0000
    bcs .929A

    inx
    adc $0002
    adc $0002
    cmp $0000
    bcs .929A

    inx
.929A:
    tya
    asl #3
    sta $0000
    txa
    clc
    adc $0000
    tax
    lda.w direction32,X
    !AX8
    rtl
}

{ ;92AD - 92E5
_0192AD: ;a- x8
    ;if arthur within a zone around an object
    !A16
    lda.w _00A852+0,Y : sta $0000
    asl               : sta $0002
    lda.w _00A852+2,Y : sta $0004
    asl               : sta $0006
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    clc
    adc $0000
    cmp $0002
    bcs .ret

    sec
    lda !obj_pos_y+1
    sbc !arthur_pos_y+1
    clc
    adc $0004
    cmp $0006
.ret:
    !A8
    rtl

;-----

    ;guessing this is leftover code from above function
    !A8
    sec
    rtl
}

{ ;92E6 - 931D
arthur_range_check:

.x: ;a- x-
    !A16
    lda.w arthur_range_check_data_x,Y : sta $0000
    asl                               : sta $0002
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    clc
    adc $0000
    cmp $0002
    !A8
    rtl

.y: ;a- x-
    !A16
    lda.w arthur_range_check_data_y,Y : sta $0000
    asl                               : sta $0002
    sec
    lda !obj_pos_y+1
    sbc !arthur_pos_y+1
    clc
    adc $0000
    cmp $0002
    !A8
    rtl
}

{ ;931E - 9388
_01931E: ;a- x-
    ;APU stuff, upload data

    php
    !AX16
    ldy #$0000
    lda #$BBAA
-:
    cmp !APUI00
    bne -

    !A8
    lda #$CC
    bra .9360

.9332:
    lda [$00],Y
    iny
    xba
    lda #$00
    bra .934D

.933A:
    xba
    lda [$00],Y
    iny
    bpl +

    inc $0002
    ldy #$0000
+:
    xba
-:
    cmp !APUI00
    bne -

    inc
.934D:
    !A16
    sta !APUI00
    !A8
    dex
    bne .933A

-:
    cmp !APUI00
    bne -

-:
    adc #$03
    beq -

.9360:
    pha
    !A16
    lda [$00],Y
    iny #2
    tax
    lda [$00],Y
    iny #2
    sta !APUI02
    !A8
    cpx #$0001
    lda #$00
    rol
    sta !APUI01
    adc #$7F
    pla
    sta !APUI00
-:
    cmp !APUI00
    bne -

    bvs .9332

    plp
    rtl
}

{ ;9389 - 939C
_019389: ;a8 x8
    sta $1F32
    !A16
    clc
    lda.w _00A8CA+0,Y : adc.w camera_y+1 : sta !obj_pos_y+1
    lda.w _00A8CA+2,Y : sta $2D
    rtl
}

{ ;939D - 93D6
_01939D: ;a- x-
    !AX16
    lda !obj_pos_x+1 : sta $0000
    clc
    lda !obj_pos_y+1 : adc $2D : sta !obj_pos_y+1 : sta $0002
    jsr _01A3ED_get_tile_type2
    beq .ret

    php
    lda $001F
    pha
    !A16
    ldy #$02
    sec
    lda !obj_pos_y+1 : sbc ($13),Y : sta !obj_pos_y+1
    !AX8
    lda $1F32
    bne .93D0

    jsl _01A5AF
    bra .93D4

.93D0:
    jsl _01A593
.93D4:
    pla
    plp
.ret:
    rtl
}

{ ;93D7 - 9484
_0193D7:
    ;unused
    lda $037B
    cmp #$08
    bcc .93E0

    sec
    rtl
.93E0:
    phd
    lda #$00
    xba
    lda #$00
    tcd
.93E7:
    ldy #$07
.93E9:
    lda ($00),Y : sta $0002,Y
    dey
    bpl .93E9
    lda #$7F : sta $000A
    lda $037B
    asl #3
    tax
    !A16
    lda $0005 : clc : adc $000B : sta $0005
    lda $0008 : clc : adc $000D : sta $0008
.9413:
    ldy #$00
    lda [$02],Y
    cmp #$FFFF
    beq .946D

    lda $0007
    dec
    asl
    tay
.9422:
    lda [$02],Y : sta [$08],Y
    dey #2
    bpl .9422

    lda $0005        : sta $037C,X
    clc : adc #$0020 : sta $0005
    lda $0008        : sta $037E,X
    clc : adc #$0040 : sta $0008
    lda #$007F : sta $0380,X
    lda $0007 : and #$00FF : asl : clc : adc $0002 : sta $0002
    lda $0007 : and #$00FF : asl : sta $0381,X
    inc $037B
    txa
    clc
    adc #$0008
    tax
    bra .9413

.946D:
    !A8
    ldy #$08
    lda ($00),Y
    inc
    beq .9482

    lda $0000 : clc : adc #$08 : sta $0000
    jmp .93E7

.9482:
    pld
    clc
    rtl
}

{ ;9485 - 94CE
_019485:
    ;unused
    lda $2E
    pha
    lda $037B
    cmp #$08

    bcc .9492

    pla
    sec
    rtl

.9492:
    asl #3
    tax
    pla
    asl
    clc
    adc #$05
    sta $0002
    stz $0003
    phd
    lda #$00
    xba
    lda #$00
    tcd
    !A16
    ldy #$00
    lda ($00),Y : sta $037C,X
    iny #2
    lda ($00),Y : sta $0381,X
    iny #2
    lda ($00),Y : sta $0380,X
    ldy $0002
    lda ($00),Y : sta $037E,X
    inc $037B
    !A8
    pld
    clc
    rtl
}

{ ;94CF - 951D
_0194CF: ;a8 x-
    phd
    lda #$00 : xba : lda #$00
    tcd
    !A8
    !X16
    ldx #$0000
    ldy #$0000
    lda #$30 : sta $0004
    lda #$00 : sta $0000
    lda #$92 : sta $0001
    lda #$7F : sta $0002
.94F4:
    lda #$10 : sta $0003
-:
    lda $7F9800,X : sta [$00],Y
    inx
    iny
    dec $0003
    bne -

    lda #$10 : sta $0003
    lda #$00
-:
    sta [$00],Y
    iny
    dec $0003
    bne -

    dec $0004
    bne .94F4

    !AX8
    pld
    rtl
}

{ ;951E - 9538
_01951E: ;a8 x8
    ldx #$29
-:
    stz $02C7,X
    dex
    bpl -

    stz !WH0
    stz !WH1
    stz !WH2
    stz !WH3
    stz !SETINI
    stz !HDMAEN
    rtl
}

{ ;9539 - 957F
_019539: ;a8 x8
    lda #$03 : sta !OBSEL
    lda #$30 : sta $02EB
    lda #$01 : sta $02D9
    lda #$03 : sta $02DC
    lda #$11 : sta $02DD
    ldx.w stage
    cpx #$02
    bne +

    lda #$10 : sta $02DD
+:
    lda #$19 : sta $02DE
    lda #$22 : sta $02E0
    lda #$04 : sta $02E1
    stz $02E6
    stz $02E7
    stz $02E9
    stz $02ED
    stz $02EE
    stz !SETINI
    rtl
}

{ ;9580 - 95B1
_019580:
    ldy !open_weapon_slots
    bmi .95B1

    !A16
    lda #$0002 : sta $0000
.958D:
    phy
    ldx $0000
.9591:
    lda $142D,Y ;todo
    cmp $142F,Y
    bcs .95A4

    pha
    lda $142F,Y : sta $142D,Y
    pla : sta $142F,Y
.95A4:
    dey #2
    dex
    bne .9591

    ply
    dec $0000
    bne .958D

    !A8
.95B1:
    rtl
}

{ ;95B2 - 95E3
_0195B2:
    ldy !open_object_slots
    bmi .95E3

    sta $0000
    stz $0001
    !A16
.95BF:
    phy
    ldx $0000
.95C3:
    lda $13EF,Y ;todo: labels
    cmp $13F1,Y
    bcs .95D6

    pha
    lda $13F1,Y : sta $13EF,Y
    pla : sta $13F1,Y
.95D6:
    dey #2
    dex
    bne .95C3

    ply
    dec $0000
    bne .95BF

    !A8
.95E3:
    rtl
}

{ ;95E4 -
_0195E4: ;a8 x8
    ldy !open_object_slots
    bmi .9634

    sta $0000
    cpy $0000
    bcc .9634

    pha
    lsr
    sta $0002
    stz $0003
    pla
    inc #2
    sta $0000
    sec
    tya
    sbc $0000
    sta !open_object_slots
    !A16
.9609: ;reorder obj slot indices, for proper rendering order
    phy
    ldx $0002
.960D:
    lda !slot_list_objects-0,Y
    cmp !slot_list_objects-2,Y
    bcs .skip_reorder

    pha
    lda !slot_list_objects-2,Y
    sta !slot_list_objects-0,Y
    pla
    sta !slot_list_objects-2,Y
.skip_reorder:
    dey #2
    dex
    bne .960D

    ply
    dec $0002
    bne .9609

    !A8
    ldy !open_object_slots
    iny #2
    sec
    rtl

.9634:
    clc
    rtl
}

{ ;9636 - 963D
get_rng_16: ;a8 x8
    jsl call_rng
    and #$0F
    tax
    rtl
}

{ ;963E - 9648
_01963E: ;a8 x8
    jsl call_rng
    and #$07
    tax
    lda.w _00A8E2,X
    rtl
}

{ ;9649 - 9656
_019649: ;a8 x8
    jsl call_rng
    !A16
    and #$000F
    tax
    lda.w _00A8EA,X
    rtl
}

{ ;9657 - 9661
get_rng_bool: ;a8 x8
    jsl call_rng
    and #$0F
    tax
    lda.w rng_bool_data,X
    rtl
}

{ ;9662 - 9680
_019662: ;a- x-
    !AX16
    and #$00FF
    asl #4
    sta $0002
    !A8
    jsl call_rng
    and #$0F
    clc
    adc $0002
    tay
    lda.w _00A90A,Y
    !X8
    rtl
}

{ ;9681 - 9696
_019681: ;a8 x8
    lda.w weapon_current : asl : tax
    !A16
    lda.w _00B984+00,X : sta $1F25
    lda.w _00B984+32,X : sta $1F27
    !A8
    rtl
}

{ ;9697 - 96EE
_019697: ;a8 x8
    lda $14F7
    beq .96A1

    stz $14F7
    bra .96A4

.96A1:
    jsr .96CA
.96A4:
    !X16
    lda #$0A
    ldy #!slot_weapons
.96AB:
    pha
    lda $0000,Y
    beq .96B9

    phy
    jsl _02810D
    !X16
    ply
.96B9:
    !A16
    tya
    clc
    adc #!obj_size
    tay
    !A8
    pla
    dec
    bne .96AB

    !AX8
    rtl

;-----

.96CA:
    phd
    ldx #$08 : stx !open_magic_slots
    stz $14E7 ;torch magic active bool?
    !X16
    ldy #!slot_magic
.96D8:
    phy
    pld
    jsl _028B17_8B1A ;(partially) clear slots
    !A16
    tya
    clc
    adc #!obj_size
    tay
    !A8
    dex
    bne .96D8

    pld
    !AX8
    rts
}

{ ;96EF - 9734
_0196EF: ;a8 x8
    phd
    lda #$00 : xba : lda #$00
    tcd
    jsl call_rng
    pha
    txy
    !AX16
    lda ($3D),Y ;3D = offset to random_values
    sta $0000
    tay
    !A8
    pla
    cmp.w random_values,Y
    bcc +

    sta !WRDIVL
    stz !WRDIVH
    lda.w random_values,Y : sta !WRDIVB
    nop #8
    lda !RDMPYL
+:
    !A16
    clc
    and #$00FF
    adc $0000
    tax
    lda.w random_values+1,X
    !AX8
    pld
    tay
    rtl
}

if !version == 2
{ ;9735 - 975F
_019735_eu:
    lda #$01 : pha : plb
    ldy #$06
.973B:
    lda.w .9752,Y
    phy
    jsl _01A8CD
    ply
    lda.w .9759,Y : jsl _01A717_A728
    dey : bpl .973B

    jml _01A717

.9752: db $00,$01,$02,$03,$02,$01,$00
.9759: db $01,$05,$02,$04,$02,$05,$01
}
endif

{ ;9735 - 9756
_019735: ;a8 x8
    stz $02F2
    lda $0055,Y
    lsr
    bne .973F

    inc
.973F:
    sta $0055,Y
.9742:
    lda $0055,Y : jsl _01A717_A728
    inc $02F2
    lda $02F2
    cmp #$0F
    bne .9742

    jml _01A717
}

{ ;9757 - 9775
_019757: ;a8 x8
    lda #$0F : sta $02F2
    lda $0055,Y
    lsr
    bne .9763

    inc
.9763:
    sta $0055,Y
.9766:
    lda $0055,Y : jsl _01A717_A728
    dec $02F2
    bne .9766

    jml _01A717
}

{ ;9776 - 97D0
_019776: ;a8 x8
    jsr .97AB

.9779:
    ldx #$1F
    jsr .97C3
    lda #$01 : jsl _01A717_A728
    jsl _018360

    ldx #$1F
-:
    jsr .97C3
    dex : bpl -

    bra .97A4

.9792:
    jsr .97B0
    bra .9779

.9797: ;a8 x8
    jsr .97AB
    ldx #$00
-:
    jsr .97C3
    inx
    cpx #$20
    bne -

.97A4:
    stz $02E8
    jml _01A717

.97AB:
    lda #$9F : sta $02EC

.97B0:
    stz $02EB
    lda #$80 : sta $02E8
    lda $0055,Y
    lsr
    bne +

    inc
+:
    sta $0055,Y
    rts

;-----

.97C3:
    txa
    ora #$E0
    sta $02EE
    lda $0055,Y : jsl _01A717_A728
    rts
}

{ ;97D1 - 9A83
_0197D1: ;a8 x8
    phd
    lda #$60 : jsl _01A717_A728 ;wait 96 frames before continuing
    jsr .985F
    !AX16
    lda $007B
    asl #3
    and #$00FF
    tay
    ldx.w _00ABA8+0,Y
    lda.w _00ABA8+2,Y : sta $7EF700,X
    ldx.w _00ABA8+4,Y
    lda.w _00ABA8+6,Y : sta $7EF700,X
    lda #$15A2
    tcd
    ldx #$0900
    lda $007B
    and #$0003
    beq .980D

    ldx #$0B00
.980D:
    txa
    ldy #$0040
    ldx #$001E
    jsl _01C045_C055
    !AX8
    lda #$0C : sta $1A77
.981F:
    ldy #$00 : jsl _01C386
    ldx #$1E : jsl _01C336
    ldy #$00 : jsl _01C386
    ldx #$1E : jsl _01C336
    lda #$01 : jsl _01A717_A728
    dec $1A77
    bne .981F

    lda $15DE
    pha
    and #$03
    clc
    adc #$06
    sta $031E
if !version == 2
    lda #$01 : jsl _01A717_A728
endif
    pla
    inc
    and #$03
    clc
    adc #$06
    sta $031F
    !AX8
    pld
    jml _01A717

;-----

.985F:
    ldx $007B
    lda.w _00AACA,X : sta $0000
    beq .98A3

    lda.w _00AACA_offset,X : sta $0001
    stz $0002
.9873:
    jsl get_object_slot
    bmi .989C

    lda #$0C : sta.w !obj_active,X
    lda #!id_shell : sta.w !obj_type,X
    !A16
    ldy $0001
    lda.w _00AACA_pos-3,Y : sta.w !obj_pos_x+1,X
    lda.w _00AACA_pos-1,Y : sta.w !obj_pos_y+1,X
    tya
    clc
    adc #$0004
    sta $0001
.989C:
    !A8
    dec $0000
    bne .9873

.98A3:
    rts
}

{ ;98A4 - 9A51
_0198A4: ;a- x8
    ;rising wave
    !A8
    ldy #$30 : lda.b #_01FF00_34 : jsl _01A6FE
    lda #$11 : sta $02D5 : sta $02D7
    lda #$01 : jsr _019A88
    jsr .9987
    lda #$61 : sta $02D9
    !A16
    lda #$0272 : sta $19DE
    lda #$0272 : sta $19E2
    lda #$0124 : sta $19E0
    lda #$0124 : sta $19E4
    stz $19A5
    stz $19A9
    stz $19AD
    stz $19B1
    !A8
    jsl _01B90E
    lda #$08 : sta $02DD
    stz $74
    lda #$0C : sta $02DE
    lda #$04 : sta $031E
if !version == 2
    lda #$01 : jsl _01A717_A728
endif
    lda #$4F : sta.w hud_flicker_timer
    !A16
    lda #$F200 : sta $6D
    lda #$FFFF : sta $6F
    lda #$0050 : sta $79
    stz $71
    stz $73
    stz $75
    !A8
    lda #$15 : sta $02D5 : sta $02D7
    ldx #$00 : lda #$02 : jsl _01F6C9
    lda #!sfx_wave_rise : jsl _018049_8053
.9934:
    lda #$01 : jsr _019A88
    jsr .9992
    jsr .9A05
    lda $73
    cmp #$FE
    bne .9934

if !version == 2
    lda #$11 : sta $02D7
.9981:
    lda #$01 : jsr _019A88
    lda $007E
    bne .9981
endif
    !A16
    stz $19DE
    stz $19E2
    stz $19E0
    stz $19E4
    !A8
    jsl _01B90E
if !version == 0 || !version == 1
    lda #$17 : sta $02D5 : sta $02D7
endif
    lda #$01 : sta $02D9
    lda #$11 : sta $02DD
    lda #$19 : sta $02DE
    ldx #$00 : lda #$04 : jsl _01F6C9
    stz $1554
    !AX8
if !version == 2
    lda #$03 : jsr _019A88
    lda #$17 : sta $02D5 : sta $02D7
endif
    lda #$01 : jsr _019A88
    pld
    jml _01A717

;-----

.9987:
    lda #$01 : jsr _019A88
    lda $031E
    bne .9987

    rts

;-----

.9992:
    !A16
    clc
    lda $6D : adc $79 : sta $6D
    lda $6F : adc #$0000 : sta $6F
    sec
    lda $71 : sbc $6D : sta $71
    lda $73 : sbc $6F : sta $73
    lda $72
    cmp #$0200
    bcc .99B9

    lda #$0000
.99B9:
    sta $19B1
    !A8
    lda $75
    beq .99DA

    !A16
    clc
    lda $72 : adc #$0080 : sta $77
    cmp #$0200
    bcc .99D4

    lda #$0000
.99D4:
    sta $19A9
    !A8
    rts

.99DA:
    lda $6F
    bmi .9A04

    inc $75
    lda #$03 : sta $031E
if !version == 2
    lda #$01 : jsl _01A717_A728
endif
    lda #$17 : sta $02D5 : sta $02D7
    ldx #$54 : lda #$01 : jsl _01F6C9
    lda #$10 : jsr _019A88
    lda #$28 : sta $79
    lda #!sfx_wave_crash : jsl _018049_8053
.9A04:
    rts

;-----

.9A05:
    lda $14CB
    bne .9A51

    lda $6F
    bmi .9A51

    lda $14CA
    bne .9A51

    !A16
    clc
    lda $72
    adc !arthur_pos_y+1
    sec
    sbc #$00E8
    clc
    adc #$0040
    cmp #$0080
    !A8
    bcs .9A51

    lda $14D1
    bne .9A51

    lda.b #_01DC56    : sta !arthur_state+1
    lda.b #_01DC56>>8 : sta !arthur_state+2
    lda !slot_arthur+$08 : ora #$80 : sta !slot_arthur+$08
    lda $0276 : ora #$02 : sta $0276
    lda #$FF : sta !arthur_hp
    inc $14D1
.9A51:
    rts
}

{ ;9A52 - 9A87
water_crash_to_ram: ;a- x-
    !AX16
    ldy.w _water_crash+0,X
    ldx.w _water_crash+0,Y
    lda.w _water_crash+2,Y : sta $0000
.9A60:
    lda #$0008 : sta $0002
.9A66:
    lda.w _water_crash+4,Y : sta $7ED000,X : sta $7ED010,X
    iny #2
    inx #2
    dec $0002
    bne .9A66

    clc
    txa
    adc #$0030
    tax
    dec $0000
    bne .9A60

    !AX8
    rtl
}

{ ;9A88 - 9A92
_019A88: ;a8 x8
    pha
    jsl _01B26D
    pla
    jsl _01A717_A728
    rts
}

{ ;9A93 - 9C0B
_019A93: ;a8 x8
    ldx $0055,Y
    lda.w boat_AB62+12,X : sta $0063,Y
    stz $1ED7
    !AX16
    txa
    asl
    tax
    lda.w boat_AB62+0,X : tcd
    lda.w boat_AB62+4,X : sta $09 : sta $0B
    stz $0D
    !A8
    stz $16
    ldy.w boat_AB62+8,X
    bne .9ADA

.9ABA:
    lda #$01 : jsl _01A717_A728
    jsr .9B12
    lda $006D
    beq .9ABA

.9AC8:
    lda #$01 : jsl _01A717_A728
    lda $16
    beq .9AC8

    lda #$50 : jsl _01A717_A728
    bra .9AEB

.9ADA:
    lda #$01 : jsl _01A717_A728
    ldx.w camera_x+1
    cpx #$0B00
    bcc .9ADA

    ;shortly after vortex screen
    inc $00AC
.9AEB:
    stz $08
.9AED:
    lda #$01 : jsl _01A717_A728
    jsr .9B34
    lda #$01 : jsl _01A717_A728
    jsr .9BC8
    lda #$01 : jsl _01A717_A728
    lda $1ED7
    beq .9AED

    stz $0D
    stz $0E
    jml _01A717

;-----

.9B12:
    php
    lda $14D1
    bne .9B32

    !A16
    sec
    lda #$02D0
    sbc $1EAE
    cmp !arthur_pos_y+1
    bcs .9B32

    lda.w camera_y+1 : sta $19E8
    !AX8
    jsl _02FDCD
.9B32:
    plp
    rts

;-----

.9B34:
    jsr .9B78
.9B37:
    !A16
    lda #$0001 : jsl _01A717_A728
    sec
    lda $1736,Y : sbc $0F : sta $1736,Y
    lda $1738,Y : sbc $11 : sta $1738,Y
    jsr .9B94
    bcc .9B37

.9B56:
    !A16
    lda #$0001 : jsl _01A717_A728
    sec
    lda $1736,Y : sbc $0F : sta $1736,Y
    lda $1738,Y : sbc $11 : sta $1738,Y
    jsr .9BB4
    bmi .9B56

    !A8
    rts

;-----

.9B78:
    clc
    lda $08
    adc $15
    and #$0F
    tax
    lda.w boat_AB70,X
    tax
    stz $0F
    stz $10
    stz $11
    stz $12
    lda.w boat_AB80+3,X : sta $13 ;loads from AB83 (= 8) or AB87 (= 8)
    stz $14
    rts

;-----

.9B94:
    jsr _019CBE
    sec
    lda $0F : sbc $13 : sta $0F
    lda $11 : sbc #$0000 : sta $11
    sec
    lda.w boat_AB80+0,X : sbc $0F ;sets carry flag
    lda.w boat_AB80+2,X : ora #$FF00 : sbc $11 ;binary or turns bottom bits into signed negative number
    rts

;-----

.9BB4:
    jsr _019CBE
    clc
    lda $0F : adc $13 : sta $0F
    lda $11 : adc #$0000 : sta $11
    lda $11
    rts

;-----

.9BC8:
    jsr .9B78
.9BCB:
    !A16
    lda #$0001 : jsl _01A717_A728
    clc
    lda $1736,Y : adc $0F : sta $1736,Y
    lda $1738,Y : adc $11 : sta $1738,Y
    jsr .9B94
    bcc .9BCB

.9BEA:
    !A16
    lda #$0001 : jsl _01A717_A728
    clc
    lda $1736,Y : adc $0F : sta $1736,Y
    lda $1738,Y : adc $11 : sta $1738,Y
    jsr .9BB4
    bmi .9BEA

    !A8
    rts
}

{ ;9C0C - 9C85
_019C0C: ;a8 x-
    !X16
.9C0E:
    lda #$01 : jsl _01A717_A728
    ldx #$02B0
    cpx.w camera_x+1
    bcs .9C0E

    stx.w screen_boundary_left
.9C1F:
    lda #$01 : jsl _01A717_A728
    ldx #$0800
    cpx.w camera_x+1
    bcs .9C1F

    stx.w screen_boundary_left
.9C30:
    lda #$02 : jsl _01A717_A728
    ldx.w camera_x+1
    cpx #$08D6
    bcc .9C30

    !X8
    lda #$00 : sta $0066
    lda.w checkpoint
    bne .9C82

    ldy #$18 : lda.b #_01FF00_38 : jsl _01A6FE
    !AX16
    ldy #$0030
.9C57:
    clc
    lda $1EAB
    adc #$0002
    bmi .9C63

    lda #$0000
.9C63:
    sta $1EAB
    clc
    lda $1EEE
    adc #$0002
    cmp #$0080
    bcc .9C75

    lda #$0080
.9C75:
    sta $1EEE
    lda #$0001 : jsl _01A717_A728
    dey
    bne .9C57

.9C82:
    jml _01A717
}

{ ;9C86 - 9CBD
_019C86: ;a- x-
    !AX16
.9C88:
    lda #$0001 : jsl _01A717_A728
    sec
    lda $1EAE : sbc #$0004 : sta $1EAE
    bpl .9C88

    stz $1EAD
    stz $1EAE
    lda #$0001 : jsl _01A717_A728
.9CA8:
    sec
    lda $1EB1 : sbc #$0004 : sta $1EB1
    bpl .9CA8

    stz $1EB0
    stz $1EB1
    jml _01A717
}

{ ;9CBE - 9CDF
_019CBE: ;a16 x-
    lda $07
    lsr
    bcs .9CDF

    lda $08
    and #$0001
    tax
    sec
    lda #$02B4
    sbc $1737
    clc
    adc #$0200
    sta $09
    pha
    sec
    sbc $0B
    sta $0D
    pla
    sta $0B
.9CDF:
    rts
}

{ ;9CE0 - 9DE4
_019CE0: ;a8 x8
    stz $006D
    lda #$FF : jsl _01A717_A728
.9CE9:
    lda #$A0 : sta $006E
.9CEE:
    ldx #$00 : ldy #$00 : jsr .9D8A
    jsr .9D1F
    lda #$01 : jsl _01A717_A728
    dec $006E
    bne .9CEE

    lda #$A0 : sta $006E
.9D08:
    ldx #$00 : ldy #$03 : jsr .9D8A
    jsr .9D1F
    lda #$01 : jsl _01A717_A728
    dec $006E
    bne .9D08

    bra .9CE9

;-----

.9D1F:
    ldx #$00 : ldy #$00 : jsr .9DA7
    bcc .9D31

    ldx #$01 : ldy #$08 : jsr .9DA7
    bcs .9D89

.9D31:
    phx
    lda #!sfx_ship_creak : jsl _018049_8053
    stz $1A84
    lda #$02 : sta $1A80
    plx
    inc $1EE6,X
    lda.w _00AAD8,X
    tax
.9D48: ;raise water level
    clc
    lda $1EAD : adc #$90 : sta $1EAD
    lda $1EAE : adc #$00 : sta $1EAE
    lda $1EAF : adc #$00 : sta $1EAF
    clc
    lda $1EB0 : adc #$50 : sta $1EB0
    lda $1EB1 : adc #$00 : sta $1EB1
    lda $1EB2 : adc #$00 : sta $1EB2
    lda #$01 : jsl _01A717_A728
    dex
    bne .9D48

    lda #$01 : jsl _01A717_A728
.9D89:
    rts

;-----

.9D8A:
    clc
    lda $1EAA,X : adc.w boat_rocking_speed+0,Y : sta $1EAA,X
    lda $1EAB,X : adc.w boat_rocking_speed+1,Y : sta $1EAB,X
    lda $1EAC,X : adc.w boat_rocking_speed+2,Y : sta $1EAC,X
    rts

;-----

.9DA7:
    lda $1EE6,X
    bne .9DE3

    !A16
    lda.w boat_AB46+4,Y : sta $0000
    asl                 : sta $0002
    lda.w boat_AB46+6,Y : sta $0004
    asl                 : sta $0006
    sec
    lda !arthur_pos_x+1
    sbc.w boat_AB46+0,Y
    clc
    adc $0000
    cmp $0002
    bcs .9DE0

    sec
    lda !arthur_pos_y+1
    sbc.w boat_AB46+2,Y
    clc
    adc $0004
    cmp $0006
.9DE0:
    !A8
    rts

.9DE3:
    sec
    rts
}

{ ;9DE5 - 9E1A
_019DE5: ;a8 x?
    lda #$3F : jsl _01A717_A728
.9DEB:
    lda #$40 : sta $0086
.9DF0:
    ldx #$06 : ldy #$06 : jsr _019CE0_9D8A
    lda #$01 : jsl _01A717_A728
    dec $0086
    bne .9DF0

    lda #$40 : sta $0086
.9E07:
    ldx #$06 : ldy #$09 : jsr _019CE0_9D8A
    lda #$01 : jsl _01A717_A728
    dec $0086
    bne .9E07

    bra .9DEB
}

{ ;9E1B - 9EE9
_019E1B: ;a8 x?
    stz $CD
    lda #$01 : sta $CE
    jsl _018049_8051
.9E25:
    lda #$01 : jsl _01A717_A728
    jsl get_object_slot
    bmi .9E25

    lda #$0C : sta.w !obj_active,X
    lda #!id_waterfall_end : sta.w !obj_type,X
    !A16
    lda #$15B0 : sta.w !obj_pos_x+1,X
    lda #$0228 : sta.w !obj_pos_y+1,X
    !AX8
    lda #$01 : jsl _01A717_A728
    ldx #$0F
    lda #$00
.9E55:
    sta $7F9800,X
    dex
    bpl .9E55

    !A16
    sec
    lda #$1490
    sbc.w camera_x+1
    !A8
    sta $7F9801
    clc
    adc #$40
    sta $7F9802
    lda #$01 : sta $7F9803 : sta $7F9806 : sta $7F9809
    lda #$02 : sta $02E6
    lda #$01 : sta !DMAP5
    lda #$26 : sta !BBAD5
    lda #$00 : sta !A1T5L
    lda #$98 : sta !A1T5H
    lda #$7F : sta !A1B5
    stz !DAS5B
    lda #$20 : ora $02F0 : sta $02F0
.9EA9:
    lda #$01 : jsl _01A717_A728
    lda $CE
    cmp #$57
    bcc .9ECD

    sbc #$56
    sta $7F9803
    lda $7F9801 : sta $7F9804
    lda $7F9802 : sta $7F9805
    bra .9ED1

.9ECD:
    sta $7F9800
.9ED1:
    !A16
    clc : lda $CD : adc #$00F0 : sta $CD
    !A8
    lda $CE
    cmp #$C8
    bcc .9EA9

    inc $1F9F
    jml _01A717
}

{ ;9EEA - 9F42
_019EEA: ;a- x8
    ;stage 3 handler?
    !A16
    lda.w camera_x+1 : sta $B5
    stz $B7
.9EF3:
    !A16
    lda #$0001 : jsl _01A717_A728
    ldy #$00
    sec
    lda.w camera_x+1
    sbc $B5
    bpl .9F0C

    iny #2
    eor #$FFFF
    inc
.9F0C:
    cmp #$0008
    bcc .9EF3

    lda $B5 : adc.w stage3_data_AB3E,Y : sta $B5
    !A8
    tya
    lsr
    and #$01
    sta $1F9A
    lda $1F9B
    beq .9EF3

    clc
    lda $B7
    adc.w stage3_data_AB42,Y
    bpl .9F32

    lda #$0D
    bra .9F38

.9F32:
    cmp #$0E
    bcc .9F38

    lda #$00
.9F38:
    sta $B7
    inc
    sta $031C
    inc $1F99
    bra .9EF3
}

{ ;9F43 - A009
_019F43: ;a8 x8
    lda #$00
    xba
    clc
    tya
    adc #$4E
    tcd
    ldx $07
    stz $02E2
    lda #$FF : sta $02E3
    !A16
.9F57:
    lda.w stage3_data_AAE4,X : sta $0B
.9F5C:
    lda #$0100 : sta $19C5
    lda #$0001 : sta $031D
.9F68:
    lda #$0001 : jsl _01A717_A728
    stz $031D
    lda.w camera_x+1
    cmp.w stage3_data_AB0C,X
    bcc .9F84

    lda.w stage3_data_AADA,X
    tax
    bpl .9F57

    jml _01A717

.9F84:
    sec
    lda.w camera_x+1
    sbc.w stage3_data_AB20,X
    adc.w stage3_data_AB02,X
    cmp.w stage3_data_AAF8,X
    bcs .9F68

    stz $1F9B
    sec
    lda.w camera_x+1
    sbc.w stage3_data_AAEE,X
    cmp.w stage3_data_AAF8,X
    bcs .9F5C

    cmp #$0100
    bcc .9FB4

    cmp.w stage3_data_AB16,X
    bcs .9FB4

    inc $1F9B
    lda.w camera_x+1 : sta $0B
.9FB4:
    sec : lda.w camera_x+1 : sbc $0B : sta $19C5
    clc : lda $0B : adc #$0028 : sta $0000
    sec
    sbc.w stage3_data_AB2A,X
    cmp.w stage3_data_AB34,X
    bcs .9FDB

    sec
    lda $0000
    sbc.w camera_x+1
    cmp #$0100
    bcc .9FDE

.9FDB:
    lda #$0000
.9FDE:
    tay
    sty $02E2
    clc : lda $0B : adc #$00D8 : sta $0000
    sec
    sbc.w stage3_data_AB2A,X
    cmp.w stage3_data_AB34,X
    bcs .A000

    sec
    lda $0000
    sbc.w camera_x+1
    cmp #$0100
    bcc .A003

.A000:
    lda #$FFFF
.A003:
    tay
    sty $02E3
    jmp .9F68
}

{ ;A00A - A0A0
_01A00A:
    ;4b handler?
    !A16
    !A8
    stz $0088
    stz $008A
    lda #$01 : sta $0089
    lda #$01 : sta $1F2F
.A01E:
    lda #$BD : jsl _01A717_A728
    lda #$04
    bra .A02A

.A028:
    lda #$08
.A02A:
    jsr .A067
    lda #$08 : jsr .A084
    lda $0088
    bne .A047

    !A16
    lda !arthur_pos_x+1
    cmp #$0190
    !A8
    bcs .A028

    lda #$01
    bra .A04C

.A047:
    cmp $008A
    beq .A028

.A04C:
    sta $008A
    lda #$04 : jsr .A067
.A054:
    lda #$01 : jsl _01A717_A728
    lda $0087
    cmp $0089
    beq .A054

    sta $0089
    bra .A01E

;-----

.A067:
    sta $85
.A069:
    lda #$06 : jsl _01A717_A728
    dec $1F2B
    dec $1F2D
    jsl _01B9A8_BA9C
    dec $85
    bne .A069

    lda #$0F : jsl _01A717_A728
    rts

;-----

.A084:
    sta $85
.A086:
    lda #$06 : jsl _01A717_A728
    inc $1F2B
    inc $1F2D
    jsl _01B9A8_BA9C
    dec $85
    bne .A086

    lda #$0F : jsl _01A717_A728
    rts
}

{ ;A0A1 - A0B1
    ;unused
    lda $0087,X
    cmp $0089,X
    beq .A0B1

    sta $0089,X
    tya : jsl _01A717_A728
.A0B1:
    rts
}

{ ;A0B2 - A127
_01A0B2:
    ;stage 5 handler
    !X16
    lda.w checkpoint
    beq .A0C6

    ldx #$0580 : stx $19E8
    stz $1A7F
    jml _01A717

.A0C6:
    lda #$01 : jsl _01A717_A728
    ldx.w camera_y+1
    cpx #$0500
    bcs .A0C6

    inc $19EB
    ldx #$0500 : stx $19E8
.A0DD:
    lda #$01 : jsl _01A717_A728
    ldx.w camera_x+1
    cpx #$0180
    bcc .A0DD

    stz $1A7F
.A0EE:
    lda #$01 : jsl _01A717_A728
    ldx.w camera_x+1
    cpx #$0700
    bcc .A0EE

    ;stage 5-2
    lda #$05 : sta $19E9
    stz $19EB
    lda #$60 : sta $1EF0
    lda #$C0 : sta $1EF2
.A10E:
    lda #$01 : jsl _01A717_A728
    dec $1EF0
    lda $1EF0
    pha
    asl
    sta $1EF2
    pla
    cmp #$10
    bne .A10E

    jml _01A717
}

{ ;A128 - A190
_01A128:
    ;stage 5 handler
    lda.w camera_x+2
    bne .A155

    !A16
.A12F:
    lda #$0001 : jsl _01A717_A728
    lda.w camera_x+1
    cmp #$0400
    bcc .A12F

    !AX8
    ldy #$3F
    ldx $02D7
.A145:
    txa
    eor #$02
    tax
    sta $02D7
    lda #$01 : jsl _01A717_A728
    dey
    bne .A145

.A155:
    lda #$15 : sta $02D5 : sta $02D6 : sta $02D7 : sta $02D8
    lda #$FF : sta $19DF : sta $19E3
    lda #$94 : sta $031E
    lda #$01 : jsl _01A717_A728
    lda #$13 : sta $031E
    lda $02DD : and #$FC : ora #$01 : sta $02DD
    lda $02D9 : ora #$20 : sta $02D9
    jml _01A717
}

{ ;A191 - A1F4
_01A191: ;a8 x-
    !X16
.A193:
    lda #$01 : jsl _01A717_A728
    ldx.w camera_x+1
    cpx #$0220
    bcc .A193

    stz $1A7F
.A1A4:
    lda #$01 : jsl _01A717_A728
    ldx.w camera_x+1
    cpx #$0400
    bcc .A1A4

    !A16
    lda #$0500 : sta $19E8
    clc
    txa
    adc #$0100
    sta $1A7B
    !A8
.A1C4:
    lda #$01 : jsl _01A717_A728
    ldx.w camera_x+1
    cpx #$1800
    bcc .A1C4

    ldx.w camera_y+1
    cpx #$0201
    bcc .A1C4

    lda #$01 : sta $19EB
.A1DF:
    lda #$01 : jsl _01A717_A728
    dex
    stx.w camera_y+1
    stx $19E8
    cpx #$0200
    bne .A1DF

    jml _01A717
}

{ ;A1F5 - A21C
_01A1F5:
    ;4b handler?
    lda #$00
    xba
    clc
    tya
    adc #$4E
    tcd
    !X16
    ldx.w camera_y+1
    stx $07
.A204:
    lda #$01 : jsl _01A717_A728
    lda.w jump_counter
    bne .A21B

    ldx.w camera_y+1
    cpx $07
    bcs .A21B

    stx $07
    stx $19E8
.A21B:
    bra .A204
}

{ ;A21D - A242
_01A21D: ;a- x-
    phd
    phb
    php
    !AX16
    sty $0000
    tya
    asl #3
    sec
    sbc $0000
    tay
    bra .A235

.decompress_graphics: ;A230 | a- x-
    phd
    phb
    php
    !AX16
.A235:
    jsr decompress_graphics_offsets
    beq + ;count is 0

-:
    jsr decompress_graphics_function
    bne - ;keep decompressing until count is 0

+:
    plp
    plb
    pld
    rtl
}

{ ;A243 - A26E
    ; X.w  : destination in extended ram
    ; $46.l: source base address
    ; Y.w  : source offset
    ; $4A.w: count, rounded up to nearest mod 8 value

decompress_graphics_offsets: ;a16 x16
    lda #$0000
    tcd
    ldx.w gfx_decomp_offsets+0,Y
    stz $46
    lda.w gfx_decomp_offsets+4,Y : sta $48
    lda.w gfx_decomp_offsets+5,Y
    clc
    adc #$0007
    and #$FFF8
    lsr #3
    sta $4A
    lda.w gfx_decomp_offsets+2,Y
.A263: ;a16 x16
    tay
    !A8
    lda #$7F : pha : plb
    lda $4A
    ora $4B
    rts
}

{ ;A26F - A33B
    ;decompress graphics to ram

    macro decompress_graphics(offset)
    {
        asl $00
        bcs ?+

        lda $01
        bra ?store

    ?+:
        lda [$46],Y
        iny : bne ?store

        ldy #$8000
        inc $48
    ?store:
        sta <offset>,X
    }
    endmacro

;-----

decompress_graphics_function: ;a8 x16
    lda [$46],Y : sta $00
    iny : bne +

    ldy #$8000
    inc $48

+:
    lda [$46],Y : sta $01
    iny : bne +

    ldy #$8000
    inc $48

+:
    %decompress_graphics($0000)
    %decompress_graphics($0001)
    %decompress_graphics($0002)
    %decompress_graphics($0003)
    %decompress_graphics($0004)
    %decompress_graphics($0005)
    %decompress_graphics($0006)
    %decompress_graphics($0007)

    !A16
    clc
    txa
    adc #$0008
    tax
    dec $4A
    !A8
    rts
}

{ ;A33C - A396
_01A33C: ;a8 x8
    php
    phd
    ldx.w stage
    ldy.w _00AFFD,X
    !AX16
    lda #$0000
    tcd
    lda.w _00AFFD,Y   : and #$00FF : sta $10
    lda.w _00AFFD+1,Y : sta $12
.A357:
    lda.w _00AFFD+5,Y
    stz $46
    sta $48
    lda.w _00AFFD+6,Y : sta $14
    clc
    adc #$0007
    and #$FFF8
    lsr #3
    sta $4A
    lda.w _00AFFD+3,Y
    ldx $12
    phy
    php
    phb
    jsr decompress_graphics_offsets_A263
    beq +

-:
    jsr decompress_graphics_function
    bne -

+:
    plb
    plp
    ply
    iny #5
    clc
    lda $12 : adc $14 : sta $12
    dec $10
    bne .A357

    pld
    plp
    rtl
}

{ ;A397 - A3EC
_01A397: ;a- x8
    phd
    phb
    php
    ldy $00E5
    !AX16
    lda #$0000 : tcd
    lda.w _00AFCC+4,Y
    stz $46
    sta $48
    lda.w _00AFCC+5,Y
    clc
    adc #$0007
    and #$FFF8
    lsr #3
    sta $4A
    lda.w _00AFCC+2,Y
    ldx.w _00AFCC+0,Y
    ldx.w _00AFCC+0,Y ;repeated instruction
    jsr decompress_graphics_offsets_A263
    beq .A3E6

.A3C7:
    jsr decompress_graphics_function
    beq .A3E6

    lda.l !SLHV
    lda.l !OPVCT
    cmp #$F0
    bcc .A3C7

    phb
    lda #$00 : pha : plb
    lda #$01 : jsl _01A717_A728
    plb
    bra .A3C7

.A3E6:
    plp
    plb
    pld
    jml _01A717
}

{ ;A3ED - A4C8
_01A3ED:
    lda $0000
    lsr #4
    and #$003F
    sta $0010
    lda $0004
    asl #2
    and #$0FC0
    ora $0010
    clc
    adc $1F8D
    tax
    lda $7EB000,X
    !AX8
    tax
    sec
    sbc $0326
    cmp $0327
    bcs +

    inc $14E9
+:
    lda $7EF000,X
    tax
    rts

.A423:
    !AX8
    lda #$00
    rts

.get_tile_type:  ;A428 | a- x-
    !AX16
.get_tile_type2: ;A42A | a16 x16
    lda $0002
    bmi .A423

    and #$FFF0
    sta $0004
    ldy $02DA
    bne _01A3ED

    !A8
    sta $0010
    stz $0011
    asl $0010
    rol $0011
    asl $0010
    rol $0011
    lda $0000
    and #$F0
    lsr #3
    ora $0010
    sta $0010
    lda $0003
    sta $0007
    lda $0001
    asl #2
    and #$0C
    lsr $0007
    bcc +

    ora #$10
+:
    ora $0011
    xba
    lda $0010
    !A16
    asl
    tax
    stx $0007
.A47E: ;a16 x16
    lda $7EB000,X
    bit #$4000
    beq +

    lda $7EB002,X
+:
    bit #$0011
    beq +

    lda #$0000
+:
    pha
    and #$43F0
    lsr #2
    sta $0010
    pla
    lsr
    and #$0007
    ora $0010
    !AX8
    sta $001F
    tax
    sec
    sbc $0324
    cmp $0325
    bcs +

    inc $001E
+:
    sec
    txa
    sbc $0326
    cmp $0327
    bcs +

    inc $14E9
+:
    lda $7EF000,X
    tax
    rts
}

{ ;A4C9 - A4E1
_01A4C9: ;a- x-
    !A16
    ldy $15
    clc : lda ($13),Y : adc !obj_pos_x+1 : sta $0000
    iny #2
    clc : lda ($13),Y : adc !obj_pos_y+1 : sta $0002
    !X16
    rts
}

{ ;A4E2 - A507
_01A4E2: ;a- x8
    !A16
    lda ($13),Y
    bra .A4F4

.A4E8: ;a- x8
    !A16
    lda ($13),Y
    ldx !obj_direction
    beq .A4F4

    eor #$FFFF
    inc
.A4F4:
    clc
    adc !obj_pos_x+1 : sta $0000
    iny #2
    clc
    lda ($13),Y
    adc !obj_pos_y+1 : sta $0002
    !X16
    bra .A537

.A508: ;a- x8
    !A16
    lda ($13),Y
    bra .A516

.A50E: ;a- x8
    !A16
    lda ($13),Y
    eor #$FFFF
    inc
.A516:
    clc
    adc $14BE
    sta $0000
    iny #2
    clc
    lda ($13),Y
    adc !obj_pos_y+1
    sta $0002
    !X16
    bra .A537

.A52B: ;a- x-
    ;weapon - tile collision check
    !AX16
    lda !obj_pos_x+1 : sta $0000
    lda !obj_pos_y+1 : sta $0002

.A537:
    stz $001E
    jsr _01A3ED_get_tile_type2
    beq .A551

    cmp #$01
    beq .A553

    jsr _01A649_A673
    !AX16
    lda $0002
    cmp $0004
    !AX8
    rtl

.A551:
    clc
    rtl

.A553:
    sec
    rtl
}

{ ;A555 - A558
    ;unused
    jsr _01A56B
    rtl
}

{ ;A559 - A56A
_01A559: ;a8 x8
    stz $001E
    jsr _01A4C9
    jsr _01A56B
    bne .ret

    jsr update_coord_offset_x
    jsr _01A56B
.ret:
    rtl
}

{ ;A56B - A592
_01A56B: ;a- x-
    jsr _01A3ED_get_tile_type
    beq .ret

    jsr _01A649
    !AX16
    lda $0002
    cmp $0004
    bcc .A58E

    sec
    lda $0004
    sbc $0002
    clc
    adc !obj_pos_y+1
    sta !obj_pos_y+1
    !AX8
    lda #$01
    rts

.A58E:
    !AX8
    lda #$00
.ret:
    rts
}

{ ;A593 - A59F
_01A593: ;a8 x8
    jsr _01A5F9
    beq +

    clc
    adc !obj_pos_y+1
    sta !obj_pos_y+1
+:
    !AX8
    rtl
}

{ ;A5A0 - A5AE
update_coord_offset_x: ;a- x-
    !A16
update_coord_offset_x_2: ;A5A2 | a16 x-
    ldy $15
    sec : lda !obj_pos_x+1 : sbc ($13),Y : sta $0000
    !X16
    rts
}

{ ;A5AF - A5F8
_01A5AF: ;a8 x8
    stz $0018
    stz $001E
    jsr _01A5F9
    beq +

    inc $0018
+:
    clc
    adc !obj_pos_y+1
    sta $001A
    asl $0018
    jsr update_coord_offset_x_2
    jsr _01A5F9_A5FC
    beq +

    inc $0018
+:
    clc
    adc !obj_pos_y+1
    asl $0018
    ldx $0018
    phx
    jsr (.offsets,X)
    sta !obj_pos_y+1
    plx
    !AX8
    rtl

.offsets: dw .A5EF, .A5EF, .A5EC, .A5F0

.A5EC:
    lda $001A
.A5EF:
    rts

.A5F0:
    cmp $001A
    bcc +

    lda $001A
+:
    rts
}

{ ;A5F9 - A648
_01A5F9: ;a- x-
    jsr _01A4C9
.A5FC: ;a16 x16
    jsr _01A3ED_get_tile_type2
    bne .A632

    ldy $02DA
    bne .A643

    !AX16
    clc
    lda $0004 : adc #$0010 : sta $0004
    lda $0007
    tax
    and #$0780
    cmp #$0780
    bne .A627

    txa
    eor #$2000
    and #$387F
    bra .A62C

.A627:
    clc
    txa
    adc #$0080
.A62C:
    tax
    jsr _01A3ED_A47E
    beq .A643

.A632:
    jsr _01A649
    beq .A643

    !A16
    php
    sec
    lda $0004
    sbc $0002
    plp
    rts

.A643:
    !A16
    lda #$0000
    rts
}

{ ;A649 - A6AA
_01A649: ;a8 x8
    cmp #$01
    bne .A673

    !AX16
    sec
    lda $0004 : sbc #$0010 : sta $004
    lda $0007
    bit #$0780
    beq .A667

    sec
    sbc #$0080
    bra .A66D

.A667:
    eor #$2000
    ora #$0780
.A66D:
    tax
    jsr _01A3ED_A47E
    beq .A684

.A673: ;a8 x8
    ;slope handling
    and #$70
    cmp #$70
    bne .A685

    txa
    and #$0F
.A67C:
    ora $0004
    sta $0004
    lda #$01
.A684:
    rts

.A685:
    xba
    php
    txa
    lsr #4
    tay
    lda $0000
    and #$0F
    plp
    beq +

    eor #$0F
+:
    cpy #$00
    beq .A69F

-:
    lsr
    dey
    bne -

.A69F:
    sta $000C
    txa
    and #$0F
    sec
    sbc $000C
    bra .A67C
}

{ ;A6AB - A6FD
_01A6AB: ;a8 x8
    stz $02B6
    lda #$07 : sta $02B5
    ldy #$00
.A6B5:
    ldx $004E,Y
    cpx #$04
    bcs .A6C9

.A6BC:
    clc
    tya
    adc #$18
    tay
    dec $02B5
    bne .A6B5

    jmp _01A6AB

.A6C9:
    lda $02B6
    bne _01A6AB

    sty $02B4
    tya
    bne +

    inc $02C3
    jsr _01A74A_A7A4
+:
    lda #$08 : sta $004E,Y
    !A16
    lda $0050,Y : tcs
    lda #$0000
    tcd
    !A8
    cpx #$0C
    bne +

    lda $0054,Y : sta $003F
    jmp ($003F) ;$0040 = $FF from _01FF00

+:
    plp
    ply
    plx
    pld
    plb
    rtl
}

{ ;A6FE - A716
_01A6FE: ;a- x-
    ;"install handler" function?
    php
    !AX8
    sta $0054,Y ;sets 3F later
    lda #$0C : sta $004E,Y
    txa      : sta $0055,Y
    !A16
    lda $0052,Y : sta $0050,Y
    plp
    rtl
}

{ ;A717 - A749
_01A717: ;a8 x8
    !AX8
    ldy $02B4
    jsr .A744

.A71F:
    lda #$02 : xba : lda #$75
    tcs
    jmp _01A6AB_A6BC

.A728: ;a8 x8
    phb
    phd
    phx
    phy
    php
    !AX8
    ldy $02B4
    sta $004F,Y
    lda #$01 : sta $004E,Y
    tsc
    !A16
    sta $0050,Y
    !A8
    bra .A71F

.A744:
    lda #$00
    sta $004E,Y
    rts
}

{ ;A74A - A87B
_01A74A:
    phx
    phy
    lda.w p1_button_hold+1
    pha
    jsr .A7BF
    stz.w p1_button_hold
    stz.w p1_button_press
    stz.w p2_button_hold
    stz.w p2_button_press
    stz.w p2_button_hold+1
    stz.w p2_button_press+1
    pla
    eor #$FF
    sta.w p1_button_press+1
    lda.w p1_button_hold+1
    and #$10
    ora $1FC5
    sta.w p1_button_hold+1
    and.w p1_button_press+1
    sta.w p1_button_press+1
    dec $1FC6
    bne +

    !X16
    ldx $1FC3
    inc $1FC3 : inc $1FC3
    lda recorded_inputs+0,X : and #$EF : sta $1FC5
    lda recorded_inputs+1,X            : sta $1FC6
    !X8
+:
    jsr .A7DC
    ply
    plx
    rts

.A7A4: ;a8 x8
    lda $1FB9
    cmp #$02
    beq _01A74A

    phx
    phy
    jsr .A7BF
    lda $1FB9
    dec
    bne +

    jsr .A811
+:
    jsr .A7DC
    ply
    plx
    rts

;-----

.A7BF: ;a8 x8
    lda !HVBJOY
    lsr
    bcs .A7BF

    ldx #$03
-:
    lda.w p1_button_hold,X                 ;load held buttons (p1 + p2)
    eor #$FF                               ;invert them
    and !JOY1L,X : sta.w p1_button_press,X ;AND with new input and store as buttons pressed this frame
    lda !JOY1L,X : sta.w p1_button_hold,X  ;then store new input as buttons held
    dex : bpl -

    rts

;-----

.A7DC: ;a- x8
    !A16
    ldx #$00
    txy
    lda.w p1_button_hold
    bit.w shot_buttons
    beq +

    inx
+:
    bit.w jump_buttons
    beq +

    iny
+:
    stx.w shot_hold
    sty.w jump_hold
    ldx #$00
    txy
    lda.w p1_button_press
    bit.w shot_buttons
    beq +

    inx
+:
    bit.w jump_buttons
    beq +

    iny
+:
    stx.w shot_press
    sty.w jump_press
    !A8
    rts

;-----

.A811: ;a8 x8
    lda $1FBC
    asl
    tax
    jmp (+,X) : +: dw .A81D, .A836

.A81D:
    ldx #$00
    txa
-:
    sta $700000,X
    dex : bne -

    stz $1FBD
    stz $1FBE
    stz.w p1_button_hold
    stz.w p1_button_hold+1
    inc $1FBC

.A836: ;must be unused code. sram related
    ldx $1FBD
    lda.w p1_button_hold+1
    cmp $700000,X
    bne .A854

    tay
    lda $700001,X : inc : sta $700001,X
    bne .A86A

    dec
    sta $700001,X
    tya
.A854:
    sta $700002,X
    lda $700003,X : inc : sta $700003,X
    inx #2
    cpx #$FE
    beq .A86B

    stx $1FBD
.A86A:
    rts

.A86B:
    stx $1FC1
-:
    jsr .A7BF
if !version == 0 || !version == 1
    lda.w p1_button_hold+1
elseif !version == 2
    lda.w p2_button_hold+1
endif
    bit #!down
    beq -

    stz $1FBC
    rts
}

if !version == 2
{ ;A8CD - A8EB
_01A8CD:
    asl #5
    tax
    phb
    lda #$7E : pha : plb
    ldy #$00
.A8DA:
    lda.l _04ED00,X : sta $F400,Y
    inx
    iny
    cpy #$20
    bne .A8DA

    inc $0331
    plb
    rtl
}
endif

{ ;A87C - AF03
_01A87C: ;a8 x8
    jsl disable_nmi
    jsl _01834C
    jsl _018366
    lda #$0F : sta $02F2
    jsl _018074
if !version == 0 || !version == 1
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldx #$A8 : jsl _0180C7_ram_to_vram
    ldy #$A8 : jsl _01A21D_decompress_graphics
    ldx #$9A : jsl _0180C7_ram_to_vram
    lda #$04 : jsl _048E68
elseif !version == 2
    ldx #$30 : jsl _0180C7
    ldx #$9A : jsl _0180C7_ram_to_vram
    lda #$01 : jsl _048E68
endif
    stz $02E1
    !A16
    lda #$1800 : sta $0318
    lda #$0800 : sta $031A
    !A8
if !version == 0 || !version == 1
    lda #$08 : jsl _0183D4_83DB
    lda #$0B : jsl _0190B9_palette_to_ram
    ldx #$04 : ldy #$18 : lda.b #_01FF00_1C : jsl _01A6FE
    jsl enable_nmi
elseif !version == 2
    lda #$00 : jsl _01A8CD
    lda #$8F : sta $02F2
    jsl enable_nmi
    lda #$62 : jsl _018049_8053
    lda #$19 : jsl _01A717_A728
    ldx #$02 : ldy #$18 : lda.b #_01FF00_1C : jsl _01A6FE
endif
.A8DC:
    lda #$01 : jsl _01A717_A728
    lda $0066
    bne .A8DC

if !version == 0 || !version == 1
    lda #$62 : jsl _018049_8053
    lda #$3F : sta $0055
elseif !version == 2
    lda #$12 : jsl _01A717_A728
    ldy #$30 : lda.b #_01FF00_74 : jsl _01A6FE
.A964:
    lda #$01 : jsl _01A717_A728
    lda $007E
    bne .A964

    lda #$2E : sta $0055
endif
.A8F2:
    lda #$01 : jsl _01A717_A728
    lda.w p1_button_hold+1
    bit #!start
    bne .A904

    dec $0055 : bne .A8F2

.A904:
    ldx #$04 : ldy #$18 : lda.b #_01FF00_20 : jsl _01A6FE
.A90E:
    lda #$01 : jsl _01A717_A728
    lda $0066
    bne .A90E

if !version == 0 || !version == 1
    lda #$00 : sta $0278
elseif !version == 2
    stz $0278
endif
.A91E:
    lda $0278 : asl : tax
    jsr (.A928,X)
    bra .A91E

.A928:
    dw .AAC1, .ABB3, .AB59, .AC08, _01B19D, .AB61
    dw .ABA0, .AC16, .AAB4, .AAB0, .A940, .A945

.A940:
    jsl _03F8A3
    rts

.A945:
    lda $0279
    asl
    tax
    jmp (+,X) : +: dw .A955, .A96A, .A9CE, .AA8E

.A955:
    lda #$80 : sta $0276
    lda #$01 : sta $027B : sta.w difficulty
    stz.w loop
    lda #$00 : sta $1FC7
.A96A:
    ldx #$01
    lda $1FC7
    cmp #$0A
    bne +

    ldx #$FF
+:
    stx $0292
    lda $1FC7
    pha
    clc
    adc #$03
    sta $1FC4
    stz $1FC3
    lda #$02 : sta $1FB9
    lda #$01 : sta $1FC6
    pla
    asl #2
    tax
    lda.w _01B4FE+0,X : sta.w stage
    lda.w _01B4FE+1,X : sta.w checkpoint
    !A16
    lda.w _01B4FE+2,X : sta $1FD4
    stz $1FD6
    !A8
    jsr .ABB3
if !version == 2
    ldx #$02 : jsr .AC7D_eu
endif
    lda $1FC7
    cmp #$0B
    bne +

    lda #$04 : sta $02AE
    lda #$1B : sta $02AF
    lda #$1E : sta $02B0
+:
    lda #$03 : sta $0278
    stz $0279
    rts

;-----

.A9CE:
    jsl _018049_8051
    lda #$3F : jsl _01A717_A728
    ldy $1FC7
    ldx.w _00B52E_B52E,Y : ldy #$90 : lda.b #_01FF00_68 : jsl _01A6FE
.A9E6:
    lda #$01 : jsl _01A717_A728
    lda $00DE
    bne .A9E6

    ldy #$AF : jsl _01A21D_decompress_graphics
    ldy $1FC7 : lda.w _00B52E_B546,Y : sta $02D5
    lda #$18 : sta $031E
    lda #$01 : jsl _01A717_A728
    !AX16

    lda #$1800 : sta $0318
    lda #$0800 : sta $031A
    stz $19CD
    stz $19D1
    !AX8
    stz $02F0
    stz $02E1
    lda #$03 : jsl _01A717_A728
    lda #$00
    xba
    lda #$45 : jsl _018061_8064
    ldx $1FC7
    lda.w _00B52E_B53A,X : jsl _0183D4_83DB
    lda #$01 : jsl _01A717_A728
    lda #$84 : sta $02EC
    ldx #$08 : ldy #$90 : lda.b #_01FF00_6C : jsl _01A6FE
    !A16
    ldx #$1C : lda #$0010 : ldy #$00 : jsl _019136_9187
    !A8
.AA64:
    lda #$01 : jsl _01A717_A728
    lda $00DE
    bne .AA64

    lda #$7E : jsl _01A717_A728
    lda.b #_01FF00_0C : ldy #$90 : ldx #$08 : jsl _01A6FE
.AA7F:
    lda #$01 : jsl _01A717_A728
    lda $00DE
    bne .AA7F

    inc $0279
    rts

;-----

.AA8E:
    inc $1FC7
    lda $1FC7
    cmp #$0C
    bne .AAAA

    jsl _01834C
    jsl _018074
    lda #$01 : jsl _01A717_A728
    jml _03F8A3

.AAAA:
    lda #$01
    sta $0279
    rts

.AAB0:
    stz $0278
    rts

.AAB4:
    lda #$02 : sta $0022
    jsl _049085
    stz $0278
    rts

.AAC1:
    lda $0279 : asl : tax
    jsr (.AACA,X)
    rts

.AACA: dw .AAD6, .AADE, .AB0E, .AADE, .AB40, .AB44

;-----

.AAD6:
    jsl _048C43
    inc $0279
    rts

;-----

.AADE:
    stz.w stage
    stz.w checkpoint
    stz $1FB9
    stz $0276
    stz.w loop
    stz $0292
    stz.w money_bag_count
    jsl _048EAD
    stz $1FEF
    lda !options_sound
    lsr
    tax
    lda.w _00B55A,X : jsl _018049_8053 ;sound related, stop sounds maybe?
    lda !options_difficulty : lsr : sta $027B
    rts

;-----

.AB0E: ;gets here when demo is loading
    lda #$02 : sta $1FB9
    lda #$01 : sta $1FC6
    lda $1FC7
    stz $1FC3
    sta $1FC4
    lda $1FC7 : sta.w stage
    lda #$00  : sta.w checkpoint
    jsr .ABB3
if !version == 2
    ldx #$02 : jsr .AC7D_eu
endif
    lda $1FC7 : eor #$01 : sta $1FC7
    lda #$03  : sta $0278
    stz $0279
    rts

;-----

.AB40:
    stz $0279
    rts

;-----

.AB44: ;on pressing game start
    jsl _03F526_F527 ;play cutscene
    lda #$05 : sta.w continues
    inc $0278
    stz $0279
    stz $1FB9
    rts

    rts : rts ;dead code

;-----

.AB59:
    jsl _049310
    inc $0278
    rts

;-----

.AB61:
    dec.w extra_lives
    bmi .AB70

    lda #$02 : sta $0278
    jsl _049252
    rts

.AB70: ;game over
    jsl _049085 ;show game over text & play music?
    lda.w continues
    beq .AB9C

    stz $1FB3
    stz $1FB4
    inc $1FB5
    jsl _049121
    lda $1FB3
    beq .AB9C

    jsl _049252
    lda $02AD
    pha
    jsr .ABB3
    pla
    sta $02AD
    lda #$02
.AB9C:
    sta $0278
    rts

;-----

.ABA0: ;time over
    jsl _048FDD
    dec.w extra_lives
    bmi .AB70

    lda #$02 : sta $0278
    jsl _049252
    rts

;-----

.ABB3: ;after start cutscene is over
    ldx #$21
.ABB5:
    stz $0293,X
    dex : bpl .ABB5

    lda #$01 : sta $02AE
    !A16
    lda #$5F00 : sta $0318
    lda #$0200 : sta $031A
    !A8
    ldx !options_controls
if !version == 0 || !version == 1
    lda.w _00B55C_shot_buttons+0,X : sta.w shot_buttons
    lda.w _00B55C_shot_buttons+1,X : sta.w shot_buttons+1
    lda.w _00B55C_jump_buttons+0,X : sta.w jump_buttons
    lda.w _00B55C_jump_buttons+1,X : sta.w jump_buttons+1
elseif !version == 2
    jsr .AC7D_eu
endif
    lda !options_extra_lives : lsr : sta.w extra_lives
    lda #$C3 : sta.w rng_state
    lda #$01 : sta.w rng_state+1
    lda #$02 : sta $029E
    stz $02C3
    inc $0278
    rts

;-----

if !version == 2
.AC7D_eu:
    lda.w _00B55C_shot_buttons+0,X : sta.w shot_buttons
    lda.w _00B55C_shot_buttons+1,X : sta.w shot_buttons+1
    lda.w _00B55C_jump_buttons+0,X : sta.w jump_buttons
    lda.w _00B55C_jump_buttons+1,X : sta.w jump_buttons+1
    rts
endif

;-----

.AC08: ;load stage (1)?
    jsr .AC99
    stz $0277
    jsl _018360
    inc $0278
    rts

;-----

.AC16: ;mosaic transition
    jsl _0180A6
    lda #$3F : jsl _01A717_A728
    ldx #$0F
.AC22:
    stx !MOSAIC
    lda #$01 : jsl _01A717_A728
    clc
    txa
    adc #$10
    tax
    and #$F0
    bne .AC22

    stz !MOSAIC
    lda $1F9D : sta.w stage
    jsl _01DCCF
    jsr .AC99
    inc $0277
    lda #$01
    ldx.w stage
    bne .AC50

    lda #$00 ;runs during 2-1 fade in
.AC50:
    sta.w checkpoint
    jsl _01DE0B
    lda $02D5 : and #$0F : sta $02D5 : sta $02D5 ;double stores here for some reason
    lda $02D7 : and #$0F : sta $02D7 : sta $02D7 ;^
    inc $0379
    jsr _01B26D_B271
    jsr _01B90E_B912
    jsl _018360
    lda #$08
    ldx #$FF
.AC7E:
    stx !MOSAIC
    lda #$04 : jsl _01A717_A728
    sec
    txa
    sbc #$10
    tax
    cpx #$FF
    bne .AC7E

    stz !MOSAIC
    lda #$04 : sta $0278
    rts

;-----

.AC99:
    jsl disable_nmi
    jsl _01834C
    !A16
    lda #$5F00 : sta $0318
    lda #$0200 : sta $031A
    !A8
    lda $027B : asl : tax
    lda.w loop
    beq .ACBC

    inx
.ACBC:
    lda.w _00B552,X
    ldy $1FB9
    beq .ACC4

if !version == 2
    lda #$01
endif
.ACC4:
    sta.w difficulty
    asl
    tax
    lda.w _00DFE5+0,X : sta $003D
    lda.w _00DFE5+1,X : sta $003E
    jsl _058000
    jsl _0180B9
    jsl _018CE2
    jsl _0180A6
    jsr _01B4DE
    lda $02AD : sta.w weapon_current
    and #$1E  : sta.w existing_weapon_type
    lda $02AE
    cmp #$05
    bcc +

    lda #$01
+:
    sta !armor_state
    sta.w transform_stored_armor_state

    cmp #$04
    bne +

    lda #$01 : sta.w can_charge_magic
    stz $14B3
+:
    lda $02B0 ;storing shield status across maps?
    beq .AD21

    sta !slot_shield+!obj_type
    lda $02B1 : sta !slot_shield+$07 ;shield type?
    lda #$0C : sta !slot_shield
.AD21:
    lda $02AF
    beq +

    sta $10F4
    lda #$0C : sta !slot_upgrade+!obj_active
+:
    lda #$30 : ora $02F1 : sta $02F1
    !X16
    ldx #$1000 : jsl _018091
    jsl _018074
    !AX8
    jsl _0190B9_90CB
    jsl _019539
    lda.w stage
    cmp #$02
    bne +

    lda #$19 : sta $02DE
+:
    jsl _018DC0
    lda.w stage
    bne +

    lda.w checkpoint
    beq +

    ldx #$16 : jsl _018DC0_8E0E
+:
    ldx.w stage
    lda.w _00B56C,X : sta $02D9
    and #$07 : dec  : sta $02DA
    stz $1F8F
    stz $1F90
    cpx #$00
    beq .AD8C

    dec $1F8F
    dec $1F90
.AD8C:
    lda #$0C : sta !slot_arthur
    jsl _019024
    lda $0292 : and #$01 : eor #$01 : sta $032E
    jsl _019136
    jsr _01BE1C
    jsr _01B526 ;set arthur spawn point and other things
    jsr _01B4EF_B50E
    jsr _01BF31
    jsr _01BEBC
    jsl _048A6B
    stz $02D5
    stz $02D6
    jsl disable_nmi
    jsr _01AF04_AF08
    jsr .AE55
    jsr _01F66A
    stz.w pot_spawn_counter
    stz.w pot_count
    lda #$03 : sta.w pot_weapon_req
    lda #$0A : sta.w pot_armor_state_req
    lda #$20 : sta.w pot_extend_req
    lda #$00 : jsl _0183D4_83DB
    lda #$43 : sta $02EC
    lda #$05 : sta.w timer_minutes
    lda #$00 : sta.w timer_tens
    lda #$00 : sta.w timer_seconds
    stz.w timer_ticks
    lda #$01 : sta $1F1C
    lda #$02 : sta $0284
    inc $036F
    inc $0370
    inc $036E
    inc $036D
    jsr _01B4C5
    jsl _04F000
    jsr _01F6D7
    lda.w stage
    bne .AE2C

    ldx #$00 : jsl water_crash_to_ram
    ldx #$02 : jsl water_crash_to_ram
.AE2C:
    lda #$31 : sta $02F1
    jsl enable_nmi
    lda $02DA
    bne .ret

    ldx #$1F
.AE3C:
    phx
    jsl _04F003
    jsr _01F6E9
    jsr _01B2D6
    inc $0379
    lda #$01 : jsl _01A717_A728
    plx
    dex : bne .AE3C

.ret:
    rts

;-----

.AE55:
    lda #$01 : sta $1F57 : sta $1F5C
    stz $1F61
    lda #$03 : sta !DMAP1
    lda #$11 : sta !BBAD1
    lda #$57 : sta !A1T1L
    lda #$1F : sta !A1T1H
    lda #$00 : sta !A1B1
    stz !DAS1B
    lda #$01 : sta $1F62 : sta $1F67
    stz $1F6C
    lda #$04 : sta !DMAP3
    lda #$09 : sta !BBAD3
    lda #$62 : sta !A1T3L
    lda #$1F : sta !A1T3H
    lda #$00 : sta !A1B3
    stz !DAS3B
    lda #$01 : sta $1F6D : sta $1F6F
    stz $1F71
    lda #$00 : sta !DMAP4
    lda #$05 : sta !BBAD4
    lda #$6D : sta !A1T4L
    lda #$1F : sta !A1T4H
    lda #$00 : sta !A1B4
    stz !DAS4B
    lda #$01 : sta $1F78 : sta $1F7B
    stz $1F7E
    lda #$01 : sta !DMAP5
    lda #$2C : sta !BBAD5
    lda #$78 : sta !A1T5L
    lda #$1F : sta !A1T5H
    lda #$00 : sta !A1B5
    stz !DAS5B
    lda #$00
    ldx $0292
    bne +

    lda #$3A
    ora $02F0
+:
    sta $02F0
    jsr _01B26D_B271
    rts
}

{ ;AF04 -
_01AF04: ;a8 x8
    jsr .AF08
    rtl

.AF08:
    ldy #$46 : jsl _01A21D_decompress_graphics
    ldx #$2A : jsl _0180C7_ram_to_vram
    lda.w stage
    asl #2
    tax
    ldy.w _00B576+2,X
    phy
    ldy.w _00B576+1,X
    phy
    ldy.w _00B576+0,X
    phy
    jsl _01A21D_decompress_graphics
    ply
    cpy #$70
    beq .AF3B

    cpy #$7E
    beq .AF3B

    ldx #$54 : jsl _0180C7_ram_to_vram
    bra .AF3F

.AF3B:
    jsl _01826E
.AF3F:
    ply
    beq +

    jsl _01A21D_decompress_graphics
+:
    ply
    jsl _01A21D_decompress_graphics
    lda.w stage
    pha
    asl
    tax
    jsr (.AF91,X)
    jsl _01A33C
    ply
    ldx.w _00B59E,Y
    phx
    ldx.w _00B59E+10,Y
    phx
    ldx.w _00B59E+20,Y
    jsl _0180C7_ram_to_vram
    plx
    jsl _0180C7_ram_to_vram
    plx
    jsl _0180C7_ram_to_vram
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldx #$23 : jsl _0180C7_ram_to_vram
    !AX16
    ldx #$01FE : lda #$01C5 : jsl _018061
    !AX8
    jsl _0194CF
    rts

.AF91:
    dw .stage1, .stage2, .B05D, .B0B2, .stage4_b
    dw .stage4_c, .stage5, .stage6, .stage7, .stage8

;-----

.stage1:
    ldy #$48 : lda.b #_01FF00_10 : jsl _01A6FE
    rts

;-----

.stage2:
    lda #$07 : sta $02EC
    lda #$02 : sta $02EB
    lda #$E0 : sta $02EE
    ldy #$18 : lda.b #_01FF00_3C : jsl _01A6FE
    ldy #$30 : lda.b #_01FF00_40 : jsl _01A6FE
    ldy #$48 : lda.b #_01FF00_04 : ldx #$00 : jsl _01A6FE
    ldy #$60 : lda.b #_01FF00_04 : ldx #$01 : jsl _01A6FE
    ldy #$90 : lda.b #_01FF00_58 : jsl _01A6FE
    lda #$01 : sta $4360
    lda #$2C : sta $4361
    lda #$F4 : sta $4362
    lda #$1E : sta $4363
    lda #$00 : sta $4364
    stz $4367
    lda #$17
    ldx #$01
    sta $1EF5
    stx $1EF6
    sta $1EF8
    stx $1EF9
    lda #$07
    ldx #$11
    sta $1EFB
    stx $1EFC
    sta $1EFE
    stx $1EFF
    stz $1F00
    lda #$00 : sta $4370
    lda #$31 : sta $4371
    lda #$04 : sta $4372
    lda #$1F : sta $4373
    lda #$00 : sta $4374
    stz $4377
    lda #$43 : sta $1F05 : sta $1F07
    lda #$53 : sta $1F09 : sta $1F0B
    stz $1F0C
    lda #$C0 : sta $02F0
    rts

;-----

.B05D: ;stage 3
    inc $1FB0
    jsr _01BD1D
    ldy #$60 : lda.b #_01FF00_48 : jsl _01A6FE
    ldy #$30 : lda.b #_01FF00_4C : ldx #$00 : jsl _01A6FE
    ldy #$48 : lda.b #_01FF00_4C : ldx #$02 : jsl _01A6FE
    ldy #$78 : lda.b #_01FF00_64 : jsl _01A6FE
    lda #$E0 : sta $02EE
    lda #$03 : sta $02E6
    lda #$FF : sta $19DF
    rts

;-----

.stage4_b:
    ldx #$00 : lda #$30 : jsr _01F6C9_local
    ldy #$30 : lda.b #_01FF00_50 : jsl _01A6FE
    ldy #$48 : lda.b #_01FF00_70 : jsl _01A6FE
    ldx #$02
    bra .B0B4

;-----

.B0B2: ;stage 4
    ldx #$00
.B0B4:
    jsl _01810E
    stz $19EC
    lda #$40 : sta !SETINI ;extbg
    lda #$01 : sta $1FA0 : sta $1FA1 : sta $1FA2 : sta $1FA3
    !A16
    clc
    lda.w camera_x+1 : sta $19BD : sta $1F89
    adc #$0080       : sta $02D1
    clc
    lda.w camera_y+1 : sta $19C1 : sta $1F8B
    adc #$0080       : sta $02D3
    lda #$0100
    sta $02C9
    stz $02CB
    stz $02CD
    sta $02CF
    !A8
    stz $19E6
    stz $19E8
    lda #$03 : sta $19E7 : sta $19E9
    rts

;-----

.stage4_c:
    rts

;-----

.stage5:
    ldy #$E0 : jsl _01A21D_decompress_graphics
    ldy #$00 : jsl _01819D
    ldy #$07 : jsl _01819D
    ldy #$0E : jsl _01819D
    ldy #$15 : jsl _01819D
    ldy #$30 : lda.b #_01FF00_60 : jsl _01A6FE
    ldy #$78 : lda.b #_01FF00_54 : jsl _01A6FE
    lda #$10 : sta $02DD
    rts

;-----

.stage6:
    rts

;-----

.stage7:
    rts

;-----

.stage8:
    stz $15F1
    rts
}

{ ;B14B - B19C
_01B14B: ;a8 x8
    lda $1FB9
    bne .ret

    lda $02AC
    beq .ret

    lda.w p1_button_press+1 ;pause check
    bit #!start
    beq .ret

    lda #$36 : jsl _018049_8053 ;pause sound
    lda #$F3 : jsl _018049_8053
    ldx #$90
.B16A:
    lda $004E,X
    pha
    lda #$02
    sta $004E,X
    sec
    txa
    sbc #$18
    tax
    bne .B16A

.B17A:
    lda #$01 : jsl _01A717_A728
    lda.w p1_button_press+1 ;unpause check
    bit #!start
    beq .B17A

    lda #$F4 : jsl _018049_8053
    ldx #$18
.B18F:
    pla
    sta $004E,X
    clc
    txa
    adc #$18
    tax
    cpx #$A8
    bne .B18F

.ret:
    rts
}

{ ;B19D - B26C
_01B19D: ;a8 x8
    jsr _01B14B
    lda !arthur_pos_x+1 : sta $14BE
    lda !arthur_pos_x+2 : sta $14BF
    lda !arthur_pos_y+1 : sta $14C1
    lda !arthur_pos_y+2 : sta $14C2
    lda #$00 : xba : lda #$00
    tcd
    jsl _018593
    stz $0330
    stz $14E9
    jsl _02821B
    jsr _01B2DF
    jsl _048AD3_8ADB
    lda $1F9B
    bne .B1DB

    jsr _01C679_C681
.B1DB:
    jsr _01B90E_B912
    jsr _01B6CB
    jsr _01B86E
    jsr _01C062
    jsr _01B5AB_B5AF
    jsr _01F722
    jsr _01B26D_B271
    jsr _01B46D
    lda $02DA
    bne .B1FF

    jsl _04F003
    jsr _01F6E9
.B1FF:
    jsr _01CC1B
    jsr _01C8A7
    jsr _01B658
    jsr _01B96E
    jsl _018F80
    jsl _0184C3
    jsl _0185BB
    jsr _01B9A8
    jsr _01B4EF
    jsr _01BDB8
    jsr _01B2D6
    inc $0379
    jsr _01B2B1
    ldx #$01
.B22B:
    txa : jsl _01A717_A728
    ldy $037A
    bne .B22B

    lda $1FB9
    beq .B26C

    lda $0292
    beq .B256

    !A16
    inc $1FD6
    dec $1FD4
    !A8
    bne .B26C

    lda #$0B : sta $0278
    lda #$02 : sta $0279
    rts

.B256:
    lda.w p1_button_press+1
    bit #!start
    beq .B26C

    jsl _01834C
    stz $0278
    lda #$03 : sta $0279
    inc $1FEF
.B26C:
    rts
}

{ ;B26D - B2B0
_01B26D: ;a8 x-
    jsr .B271
    rtl

.B271: ;a8 x-
    lda $02DE : sta $1F63 : sta $1F68
    lda $02DF : sta $1F64 : sta $1F69
    lda $02E0 : sta $1F65 : sta $1F6A
    lda $02E1 : sta $1F66 : sta $1F6B
    lda $02D9 : sta $1F6E : sta $1F70
    lda $02D7 : sta $1F79 : sta $1F7C
    lda $02D8 : sta $1F7A : sta $1F7D
    rts
}

{ ;B2B1 - B2D5
_01B2B1: ;a8 x8
    lda.w hud_flicker_timer
    beq .ret

    dec.w hud_flicker_timer
    and #$01
    sta.w hud_visible
if !version == 0 || !version == 1
    tax
    lda $02F0 : and #$FD : ora.w _00B5BC+0,X : sta $02F0
    lda $02F1 : and #$CF : ora.w _00B5BC+2,X : sta $02F1
endif
.ret:
    rts
}

{ ;B2D6 - B2DE
_01B2D6: ;a8 x-
    lda $037B
    beq .ret

    inc $037A
.ret:
    rts
}

{ ;B2DF - B2EC
_01B2DF: ;a8 x-
    lda.w knife_rapid_timer : beq .ret

    dec.w knife_rapid_timer
    bne .ret

    stz.w knife_rapid_count
.ret:
    rts
}

{ ;B2ED - B314
_01B2ED:
    ;unused
    lda !arthur_pos_x+1
    cmp #$0010
    bcs .B2FB

    lda #$0011 : sta !arthur_pos_x+1
.B2FB:
    lda #$0019 : clc : adc #$00F0 : sta $0000
    lda !arthur_pos_x+1
    cmp $0000
    bcc .B314

    lda $0000 : dec : sta !arthur_pos_x+1
.B314:
    rts
}

{ ;B315 - B46C
_01B315: ;a- x8
    ;stage 1 handler?
    !A16
    lda #$0096 : tcd
    stz $0B ;$00A1, event counter? not sure what to call it
    ldx.w checkpoint
    ldy.w stage1_earthquake_start_offset,X : sty $0B
.B325:
    !A8
    lda #$01 : jsl _01A717_A728
    !A16
    lda $0B
    asl
    tax
    lda !arthur_pos_x+1
    cmp.w stage1_earthquake_x_offset,X
    bcc .B325

    !A8
    inc.w stage1_earthquake_active
    lda $0B
    cmp #$07
    bne .B350

    !A16
    lda #$0640 : sta.w screen_boundary_left
    !A8
.B350:
    sec
    txa
    sbc #$12
    cmp #$06
    bcs .B381

    ;gets here at the water crashes
    stz.w stage1_earthquake_active
    lsr
    sta $007B
    lda #$1F : jsl _01A717_A728
    lda #$0C : sta $02DD
    !A16
    lda #$0272 : sta $19DE
    lda #$0272 : sta $19E2
    stz $19A5
    stz $19A9
    jmp .B436

.B381:
    sec
    txa
    sbc #$0C
    cmp #$04
    bcs + : +: ;unused branch

    phx
    lda $0292
    bne .B395

    lda #$34 : jsl _018049_8053 ;ground shake sfx
.B395:
    plx
    stz $1A84
    lda #$02 : sta $1A80 ;horizontal screen shake
    stz $1A8E
    lda #$04 : sta $1A8A
    lda #$1F : jsl _01A717_A728
    txa
    asl
    tay
    ldx !arthur_pos_x+2
    !AX16
    lda.w stage1_earthquake_tile_offset+0,Y : sta $07
    lda.w stage1_earthquake_tile_offset+2,Y
    pha
    and #$7FFF
    sta $09
    pla
    rol #3
    and #$0002
    sta $13 ;this will always be 0 and never 2
    ldy #$0000
    lda [$07],Y : and #$00FF : sta $0D
    iny
.B3D6:
    lda [$07],Y : and #$00FF : sta $0F
    iny
.B3DE:
    lda [$07],Y : and #$00FF : sta $11
    iny
    lda [$07],Y
    ldx $13
    clc
    adc.w stage1_earthquake_B62F,X
    tax
    iny #2
-:
    lda [$07],Y : sta $7EB000,X
    iny #2
    clc
    txa : adc #$0040 : tax
    dec $11
    bne -

    dec $0F
    bne .B3DE

    !A8
    lda $13
    beq +

    lda #$02 : sta $031E
    bra .B42A

+:
    lda.w camera_x+2
    pha
    and #$03
    clc
    adc #$06
    sta $031E
    pla
    inc
    and #$03
    clc
    adc #$06
    sta $031F
.B42A:
    lda $0A : jsl _01A717_A728
    !A16
    dec $0D
    bne .B3D6

.B436:
    !AX8
    stz.w stage1_earthquake_active
    inc $0B
    lda $0B
    cmp #$11
    bne +

    jml _01A717
+:
    sec
    sbc #$0A
    cmp #$03
    bcs .B46A

    tax
    bne +

    ldx #$16 : jsl _018DC0_8E0E
+:
    ldy #$18
    lda.b #_01FF00_30
    jsl _01A6FE
-:
    lda #$01 : jsl _01A717_A728
    lda $0066
    bne -

.B46A:
    jmp .B325
}

{ ;B46D - B4C4
_01B46D: ;a8 x8
    lda.w stage
    dec
    bne .B4C3

    !A16
    sec
    lda #$028C
    sbc $1737
    ldx $19EB
    bne .B49E

    cmp #$0100
    bcc .B49E

    !A8
    lda #$7F : sta $1EF4 : sta $1EF7 : sta $1F04 : sta $1F06
    stz $1EFA
    stz $1F08
    bra .B4C3

.B49E:
    !A8
    sta $0000
    lsr
    sta $1EF4
    sta $1EF7
    sta $1F04
    sta $1F06
    sec
    lda #$FF
    sbc $0000
    lsr
    sta $1EFA
    sta $1EFD
    sta $1F08
    sta $1F0A
.B4C3:
    rts

;-----

    rts ;leftover rts
}

{ ;B4C5 - B4DD
_01B4C5: ;a x
    lda $0292
    bne .ret

    jsl _018049_804D
    lda $1FB9
    bne .ret

    ldx.w stage
    lda.w stage_music,X : jsl _018049_8053 ;play stage music
.ret:
    rts
}

{ ;B4DE - B4EE
_01B4DE: ;a8 x-
    !X16
    ldx #$3FFF
    lda #$00
-:
    sta $7EB000,X
    dex : bpl -

    !X8
    rts
}

{ ;B4EF - B525
_01B4EF: ;a8 x-
    !X16
    ldx !arthur_pos_x+1
    cpx.w checkpoint_x_pos
    !X8
    bcc .B525

    lda #$01 : sta.w checkpoint
    lda #$05 : sta.w timer_minutes
    stz.w timer_tens
    stz.w timer_seconds
    stz.w timer_ticks
.B50E: ;a8 x8
    ldx.w stage
    lda.w checkpoint
    asl
    adc.w checkpoint_location_idx,X
    tay
    lda.w checkpoint_location+0,Y : sta.w checkpoint_x_pos
    lda.w checkpoint_location+1,Y : sta.w checkpoint_x_pos+1
.B525:
    rts
}

{ ;B526 - B5AA
_01B526: ;a8 x8
    ;set arthur X/Y spawn position, also other things
    ldx #$01
-:
    stz $15A2,X
    dex : bpl -

    lda.w stage
    asl #2
    clc
    adc.w checkpoint
    tay
    ldx.w _00B659,Y
    !A16
    sec
    lda.w _00B659,X
    sta !arthur_pos_x+1
    sbc #$0080
    bpl +

    lda #$0000
+:
    cmp $19E6
    bcc +

    lda $19E6
+:
    sta.w camera_x+1
    sta $15D6
    clc
    adc #$0100
    sta $1A7B
    sec
    lda.w _00B659+2,X
    sta !arthur_pos_y+1
    sbc #$0080
    bpl +

    lda #$0000
+:
    cmp $19E8
    bcc +

    lda $19E8
+:
    sta.w camera_y+1
    sta $1EDB
    sta $15D8
    lda.w _00B659+4,X  : sta $1733 : sta $172C
    lda.w _00B659+6,X  : sta $172E : sta $1737
    lda.w _00B659+8,X  : sta $1889 : sta $1882
    lda.w _00B659+10,X : sta $188D : sta $1EE1 : sta $1884
    !AX8
    rts
}

{ ;B5AB - B648
_01B5AB: ;a8 x8
    jsr .B5AF
    rtl

.B5AF:
    phd
    lda #$15 : xba : lda #$00 : tcd
.B5B6:
    lda $00
    beq .B5C1

    lda $0C
    asl
    tax
    jsr (.B5D2,X)
.B5C1:
    !A16
    tdc
    clc
    adc #$000E
    tcd
    cmp #$1562
    !AX8
    bne .B5B6

    pld
    rts

.B5D2:
    dw .B5DA, .B5F6, .B606, .B63B

;-----

.B5DA:
    lda $01
    asl
    tax
    !AX16
    lda.l palette_cycling+0,X : sta $06 : tax
    lda.l palette_cycling+0,X : sta $02
    lda.l palette_cycling+2,X : sta $0A
    inc $0C
    rts

;-----

.B5F6:
    !X16
    lda $02 : sta $0D
    lda $06 : sta $08
    lda $07 : sta $09
    inc $0C
.B606:
    !X16
    lda $03 : sta $0000
    stz $0001
    ldx $08
    lda.l palette_cycling+4,X : sta $05
    inx
    !A16
    ldy $0A
.B61D:
    lda.l palette_cycling+4,X
    phx
    tyx
    sta $7EF400,X
    plx
    inx #2
    iny #2
    dec $0000
    bne .B61D

    stx $08
    sep #$20
    inc $0C
    inc $0331
    rts

;-----

.B63B:
    dec $05
    bne .B648

    lda #$02
    dec $0D
    bne .B646

    dec
.B646:
    sta $0C
.B648:
    rts
}

{ ;B649 - B657
    ;unused
    phd
    pha
    lda #$03 : xba : lda #$13 : tcd
    pla
    jsl _018E32_8E81
    pld
    rtl
}

{ ;B658 - B6AD
_01B658: ;a8 x8
    ldx.w weapon_current
    cpx $0339
    beq .B6AD

    stz !slot_upgrade2
    stz $14B3
    jsl _019697
    jsl _019681
    ldx.w weapon_current
    phd
    phx
    stx $0339
    lda #$03 : xba : lda #$13 : tcd
    txa
    jsl _018E32_8E81
    pla
    asl
    clc
    adc.w weapon_current
    asl
    tax
    !A16
    lda #$0003 : sta $0000
    ldy #$1A
.B693:
    lda.l _04984F_A035,X ;x: current weapon * 6
    phx
    tyx
    sta $7EF400,X
    plx
    inx #2
    iny #2
    dec $0000
    bne .B693

    !A8
    inc $0331
    pld
.B6AD:
    rts
}

{ ;B6AE - B6CA
_01B6AE:
    ;unused far call
    jsr .local
    rtl

;-----

.local:
    phd
    ldx.w magic_current
    stx $033F
    lda #$03
    xba
    lda #$19
    tcd
    txa
    jsl _018E32_8E81
    !A8
    inc $0331
    pld
    rts
}

{ ;B6CB - B86D
_01B6CB: ;a8 x8
    phd
    lda #$1A : xba : lda #$80
    tcd
    jsr .B6E0
    lda #$1A : xba : lda #$8A
    tcd
    jsr .B6E0
    pld
    rts

;-----

.B6E0:
    ldx $00
    jmp (+,X) : +: dw .B723, .B6EB, .B7A2

;-----

.B6EB:
    lda $04
    asl
    tax
    jmp (+,X) : +: dw .B700, .B724, .B72B, .B736, .B72B, .B736, .B78B

;-----

.B700:
    lda #$01 : sta $01
    inc $04
    lda #$02 : sta $05
    stz $08
    stz $09
    lda #$24
    ldx.w stage
    dex
    beq .B721

    lda #$08
    ldx.w stage
    cpx #$06
    bne .B721

    lda #$10
.B721:
    sta $07
.B723:
    rts

;-----

.B724:
    dec $01
    bne .B72A

    inc $04
.B72A:
    rts

.B72B:
    stz $02
    stz $03
    lda $05 : sta $06
    inc $04
    rts

;-----

.B736:
    !A16
    clc
    lda $02 : adc #$0080 : sta $02
    lda $09
    bne .B758

    clc
    lda $1732 : adc $02    : sta $19C4
    lda $1734 : adc #$0000 : sta $19C6
    bra .B76A

.B758:
    sec
    lda $1732 : sbc $02    : sta $19C4
    lda $1734 : sbc #$0000 : sta $19C6
.B76A:
    ldx $07
    cpx #$03
    bcc .B77C

    lda $19C4 : sta $19BC
    lda $19C6 : sta $19BE
.B77C:
    !A8
    dec $06
    bne .B78A

    lda $09 : eor #$01 : sta $09
    inc $04
.B78A:
    rts

;-----

.B78B:
    lda $08
    bne .B796

    lda.w stage1_earthquake_active
    bne .B79D

    inc $08
.B796:
    dec $07
    bne .B79D

    stz $00
    rts

.B79D:
    lda #$02
    sta $04
    rts

.B7A2:
    lda $04
    asl
    tax
    jmp (+,X) : +: dw .B7BF, .B724, .B7D0, .B7DB, .B7D0, .B824, .B7D0, .B849, .B7D0, .B800, .B78B

;-----

.B7BF:
    lda #$09 : sta $01
    inc $04
    lda #$01 : sta $05
    stz $08
    lda #$07 : sta $07
    rts

;-----

.B7D0:
    stz $02
    stz $03
    lda $05 : sta $06
    inc $04
    rts

;-----

.B7DB:
    !A16
    clc
    lda $02   : adc #$0100 : sta $02
    clc
    lda $1888 : adc $02    : sta $19CC
    lda $188A : adc #$0000 : sta $19CE
    !A8
    dec $06
    bne +

    inc $04
+:
    rts

;-----

.B800:
    !A16
    lda $02   : adc #$0100 : sta $02
    clc
    lda $188C : adc $02    : sta $19D0
    lda $188E : adc #$0000 : sta $19D2
    !A8
    dec $06
    bne +

    inc $04
+:
    rts

;-----

.B824:
    !A16
    clc
    lda $02   : adc #$0100 : sta $02
    sec
    lda $1888 : sbc $02    : sta $19CC
    lda $188A : sbc #$0000 : sta $19CE
    !A8
    dec $06
    bne +

    inc $04
+:
    rts

;-----

.B849;
    !A16
    clc
    lda $02   : adc #$0100 : sta $02
    sec
    lda $188C : sbc $02    : sta $19D0
    lda $188E : sbc #$0000 : sta $19D2
    !A8
    dec $06
    bne .B86D

    inc $04
.B86D:
    rts
}

{ ;B86E - B90D
_01B86E: ;a8 x8
    ldy #$00 : jsr .B875
    ldy #$03
.B875:
    lda $1A94,Y
    beq .B898

    asl
    tax
    jmp (.B87F-2,X) : .B87F: dw .B883, .B899

.B883:
    ldx $1A96,Y
    lda.w _00B755,X
    tax
    lda $1A84,X
    cmp #$03
    bne .B898

    lda $1A94,Y : inc : sta $1A94,Y
.B898:
    rts

;-----

.B899: ;not sure when this is reached (if ever?)
    lda $1A96,Y
    asl #2
    tax
    !A16
    cpx #$08
    bcs .B8B9

    lda.w _00B755_B759+0,X : adc $19A8 : sta $19A8
    lda.w _00B755_B759+2,X : adc $19AA : sta $19AA
    bra .B8D1

.B8B9:
    lda.w _00B755_B759+0,X : adc $19B0 : sta $19B0 : sta $19D0
    lda.w _00B755_B759+2,X : adc $19B2 : sta $19B2 : sta $19D2
.B8D1:
    lda $1A96,Y : asl : tax
    jsr (.B8DC,X)
    !A8
    rts

.B8DC: dw .B8E4, .B8F3, .B8F9, .B908

;-----

.B8E4:
    lda $19A9
    cmp #$FFE0
    bcs .B8F2

.B8EC:
    lda #$0000 : sta $1A94,Y
.B8F2:
    rts

;-----

.B8F3:
    lda $19A9
    beq .B8EC

    rts

;-----

.B8F9:
    lda $19B1
    cmp #$FFF0
    bcs .B907

.B901:
    lda #$0000 : sta $1A94,Y
.B907:
    rts

;-----

.B908:
    lda $19B1
    beq .B901

    rts
}

{ ;B90E - B96D
_01B90E: ;a8 x8
    jsr .B912
    rtl

.B912: ;a8 x8
    lda.w stage
    cmp #$04 : beq +

    lda $02D9
    and #$07
    cmp #$07 : beq .ret

+:
    !A16
    ldx $19DC
    bmi +

    lda.w camera_x+1 : sta $19BD
+:
    !X16
    lda.w camera_y+1 : sta $19C1
    ldx $19DE
    bmi +

    lda $1733,X : sta $19C5
+:
    ldx $19E2
    bmi +

    lda $1737,X : sta $19C9
+:
    ldx $19E0
    lda $1889,X : sta $19CD : sta $1F58 : sta $1F5D
    ldx $19E4
    lda $188D,X : sta $19D1 : sta $1F5A : sta $1F5F
    !AX8
.ret
    rts
}

{ ;B96E - B9A7
_01B96E: ;a8 x-
    lda $1ED7 : bne .ret ;most likely a "boss defeated" var

    lda.w timer_minutes : bmi .ret ;time over

    dec.w timer_ticks : bpl .ret

    inc $0370
    lda #$3F : sta.w timer_ticks
    dec.w timer_seconds : bpl .ret

    lda #$09 : sta.w timer_seconds
    dec.w timer_tens : bpl .ret

    lda #$05 : sta.w timer_tens
    dec.w timer_minutes : bpl .ret

    stz.w timer_tens
    stz.w timer_seconds
    stz.w timer_ticks
.ret:
    rts
}

{ ;B9A8 - BD1C
_01B9A8: ;a8 x?
    lda.w stage
    cmp #$03
    bne .BA08

    ;stage 4 stuff
    lda $1F91
    bne .B9E2

    !A16
    sec
    lda.w camera_x+1
    pha
    sbc $1F89
    sta $1F83
    pla : sta $1F89
    sec
    lda.w camera_y+1
    pha
    sbc $1F8B
    sta $1F85
    pla : sta $1F8B
    lda $1F2B
    lsr #4
    and #$0006
    tax
    jsr (.BC64,X)
.B9E2:
    !AX8
    lda $1F2B : sta $1F2D
    jsr .BA09
    jsr .BA74
    !A16
    clc
    lda.w camera_x+1 : adc #$0080 : sta $1F33
    clc
    lda.w camera_y+1 : adc #$0080 : sta $1F35
    !A8
.BA08:
    rts

;-----

.BA09:
    lda $1F91
    beq .BA08

    lda #$01 : sta $1F2F
    lda $1F92
    bne .BA3B

    dec $1F94
    bpl .BA3A

    lda #$02 : sta $1F94
    inc $1F2B
    lda $1F2B
    and #$1F
    bne .BA3A

    jsr .BAA0
    dec $1F91
    bne .BA3A

    stz $1F2F
    jsr .BA5E
.BA3A:
    rts

.BA3B:
    dec $1F94
    bpl .BA5D

    lda #$02 : sta $1F94
    dec $1F2B
    lda $1F2B
    and #$1F
    bne .BA5D

    jsr .BB83
    dec $1F91
    bne .BA5D

    stz $1F2F
    jsr .BA5E
.BA5D:
    rts

;-----

.BA5E:
    lda.w stage : pha
    ldx $1F93
    lda.w _00B769,X : sta.w stage ;set a temporary stage value to load new data after each rotation
    jsl _048A6B
    pla : sta.w stage
    rts

;-----

.BA74:
    lda $1F2D
    and #$7F
    !AX16
    asl #2
    and #$01FF
    tax
    lda.l _09FE00+0,X : sta $02C9 : sta $02CF
    lda.l _09FE00+2,X : sta $02CB
    eor #$FFFF : inc  : sta $02CD
    !AX8
    rts

;-----

.BA9C:
    jsr .BA74
    rtl

;-----

.BAA0: ;todo: uh. are these loads actually for arthur? maybe change these definitions? slot_begin?
    !AX16
    lda !arthur_pos_x+1 : sta $0000
    lda !arthur_pos_y+1 : sta $0002
    ldx #$0000 : jsr .BB70
    sec : lda !arthur_pos_x+1 : sbc $0000 : sta $0004
    sec : lda !arthur_pos_y+1 : sbc $0002 : sta $0006
    sec : lda #$0300 : sbc.w camera_x+1 : sec : sbc.w camera_y+1 : sta $000E
    lda.w camera_y+1 : sec : sbc.w camera_x+1 : sta $000C
    ldx #!slot_upgrade2-!slot_arthur
.BAE3:
    !A8
    lda !slot_arthur+!obj_type,X
    cmp #$3E
    bne .BAF4

    lda !slot_arthur+$07,X
    cmp $1F93
    beq .BB42

.BAF4:
    !A16
    lda !slot_arthur+$08,X
    bit #$0800
    bne .BB27

    bit #$0400
    bne .BB0A

    bit #$0008
    bne .BB3F

    bra .BB42

.BB0A:
    lda $0475,X : sta !arthur_pos_x+1,X ;todo: more !slot_arthur+
    lda $0477,X : sta !arthur_pos_y+1,X
    jsr .BB70
    lda !arthur_pos_x+1,X : sta $0475,X
    lda !arthur_pos_y+1,X : sta $0477,X
    bra .BB42

.BB27:
    clc : lda !arthur_pos_x+1,X : adc $000C : sta !arthur_pos_x+1,X
    clc : lda !arthur_pos_y+1,X : adc $000E : sta !arthur_pos_y+1,X
    bra .BB42

    bra .BB42 ;unused

.BB3F:
    jsr .BB70
.BB42:
    !A16
    sec
    txa
    sbc #!obj_size
    tax
    bne .BAE3

    lda.w camera_y+1 : pha
    sec : lda #$0300 : sbc.w camera_x+1 : sta.w camera_y+1 : sta $1F8B
    pla : sta.w camera_x+1 : sta $1F89
    !AX8
    sec : lda $1F2E : sbc #$20 : sta $1F2E
    rts

;-----

.BB70:
    lda $045E,X : pha
    sec : lda #$0400 : sbc $045B,X : sta $045E,X
    pla : sta $045B,X
    rts

;-----

.BB83:
    ;todo: uh. are these loads actually for arthur? maybe change these definitions? slot_begin?
    ;third rotation device gets here, at least
    !AX16
    ldx !arthur_pos_x+1 : stx $0000
    ldx !arthur_pos_y+1 : stx $0002
    ldx #$0000 : jsr .BC51
    sec : lda !arthur_pos_x+1 : sbc $0000 : sta $0004
    sec : lda !arthur_pos_y+1 : sbc $0002 : sta $0006
    sec : lda #$0300 : sbc.w camera_y+1 : sec : sbc.w camera_x+1 : sta $000C
    sec : lda.w camera_x+1 : sbc.w camera_y+1 : sta $000E
    ldx #!slot_upgrade2-!slot_arthur
.BBC6:
    !A8
    lda !slot_arthur+!obj_type,X
    cmp #$3E
    bne .BBD7

    lda $0443,X ;todo: more !slot_arthur+
    cmp $1F93
    beq .BC23

.BBD7:
    !A16
    lda !slot_arthur+$08,X
    bit #$0800
    bne .BC0A

    bit #$0400
    bne .BBED

    bit #$0008
    bne .BC20

    bra .BC23

.BBED:
    lda $0475,X : sta $045B,X
    lda $0477,X : sta $045E,X
    jsr .BC51
    lda $045B,X : sta $0475,X
    lda $045E,X : sta $0477,X
    bra .BC23

.BC0A: ;never seems to get reached?
    clc : lda $045B,X : adc $000C : sta $045B,X
    clc : lda $045E,X : adc $000E : sta $045E,X
    bra .BC23

.BC20:
    jsr .BB70
.BC23:
    !A16
    sec
    txa
    sbc #!obj_size
    tax
    bne .BBC6

    lda.w camera_x+1 : pha
    sec : lda #$0300 : sbc.w camera_y+1 : sta.w camera_x+1 : sta $1F89
    pla : sta.w camera_y+1 : sta $1F8B
    !AX8
    clc
    lda $1F2E : adc #$20 : sta $1F2E
    rts

;-----

.BC51:
    lda $045B,X : pha
    sec : lda #$0400 : sbc $045E,X : sta $045B,X
    pla : sta $045E,X
    rts

;-----

.BC64: dw .BC6C, .BCF0, .BCBF, .BC92

;-----

.BC6C:
    clc : lda $1F83 : adc $02D1  : sta $02D1
    sec             : sbc #$0080 : sta $19BD
    clc : lda $1F85 : adc $02D3  : sta $02D3
    sec             : sbc #$0080 : sta $19C1
    stz $1F8D
    rts

;-----

.BC92:
    lda $1F85 : clc : adc $02D1  : sta $02D1
                sec : sbc #$0080 : sta $19BD
    lda $1F83 : eor #$FFFF : inc : clc : adc $02D3  : sta $02D3
                                   sec : sbc #$0080 : sta $19C1
    lda #$3000 : sta $1F8D
    rts

;-----

.BCBF:
    lda $1F83
    eor #$FFFF
    inc
    clc
    adc $02D1
    sta $02D1
    sec
    sbc #$0080
    sta $19BD
    lda $1F85
    eor #$FFFF
    inc
    clc
    adc $02D3
    sta $02D3
    sec
    sbc #$0080
    sta $19C1
    lda #$2000 : sta $1F8D
    rts

;-----

.BCF0:
    lda $1F85
    eor #$FFFF
    inc
    clc
    adc $02D1
    sta $02D1
    sec
    sbc #$0080
    sta $19BD
    lda $1F83
    clc
    adc $02D3
    sta $02D3
    sec
    sbc #$0080
    sta $19C1
    lda #$1000 : sta $1F8D
    rts
}

{ ;BD1D - BDB7
_01BD1D: ;a- x-
    !AX16
    ldx #$0000 : stx $0000
    lda #$000E : sta $0002
    stz $0008
.BD2E:
    ldy $0000
    jsr .BD51
    jsr .BD8E
    lda $0008 : eor #$0002 : sta $0008
    inc $0000 : inc $0000
    dec $0002
    bne .BD2E

    !AX8
    inc $031C
    rts

.BD51:
    lda #$0008 : sta $0004
.BD57:
    phy
    phx
    tyx
    lda _03EF86,X
    plx
    tay
    lda #$0010 : sta $0006
.BD66:
    phx
    tyx
    lda _03EF86,X
    plx
    sta $7FE000,X
    lda #$0084 : sta $7FE020,X
    iny #2
    inx #2
    dec $0006
    bne .BD66

    txa
    clc
    adc #$0020
    tax
    ply
    dec $0004
    bne .BD57

    rts

.BD8E:
    phx
    phy
    ldy $0008
    phx
    tyx
    lda _03EF86+$1C,X
    plx
    tay
    lda #$0010 : sta $000A
.BDA1:
    phx
    tyx
    lda _03EF86,X
    plx
    sta $7FDE00,X
    inx #2
    iny #2
    dec $000A
    bne .BDA1

    ply
    plx
    rts
}

{ ;BDB8 - BE1B
_01BDB8: ;a8 x8
    lda $031C
    beq .ret

    stz $031C
    asl #2
    tay
    lda $037B
    pha
    asl #3
    tax
    !AX16
    lda #$1000 : sta $037C,X
    lda #$1100 : sta $0384,X
    lda #$1200 : sta $038C,X
    lda #$1300 : sta $0394,X
    lda.w _00B76D+0-4,Y : sta $037E,X : sta $0386,X : sta $038E,X : sta $0396,X
    lda.w _00B76D+2-4,Y : sta $0380,X : sta $0388,X : sta $0390,X : sta $0398,X
    lda #$8002 : sta $0382,X : sta $038A,X : sta $0392,X : sta $039A,X
    !AX8
    pla
    clc
    adc #$04
    sta $037B
.ret:
    rts
}

{ ;BE1C - BEBB
_01BE1C: ;a8 x-
    ;set up screen layout in memory
    phb
    lda #$03 : pha : plb
    !AX16
    ldx #$093E
    lda #$8000
-:
    sta $7EF6C0,X
    dex #2 : bpl -

    lda.w stage
    asl
    tax
    lda.l _038000,X
    tay
    stz $0008
    lda $0000,Y : and #$00FF : sta $0006
    stz $0010
.BE4A:
    phy
    lda $0001,Y
    tay
    lda $0000,Y
    ldx $0010
    bne .BE6A

    tax
    xba
    and #$FF00
    sta $19E6
    txa
    and #$FF00
    sta $19E8
    inc $0010
    txa
.BE6A:
    pha
    and #$00FF
    sta $00
    pla
    xba
    and #$00FF
    sta $0002
    ldx $0008
.BE7B:
    lda $0000 : sta $0004
.BE81:
    lda $0002,Y
    and #$00FF
    xba
    lsr
    ora #$8000
    sta $7EF700,X
    inx #2
    iny
    dec $0004
    bpl .BE81

    clc
    txa
    and #$FFC0
    adc #$0040
    tax
    dec $0002
    bpl .BE7B

    ply
    iny #2
    clc
    lda $0008 : adc #$0300 : sta $0008
    dec $0006
    bne .BE4A

    !AX8
    plb
    rts
}

{ ;BEBC - BF30
_01BEBC: ;a8 x8
    lda $02DA
    bne .ret

    phd
    jsr _01BF78
    !A16
    lda #$15A2
    tcd
    ldx #$03 : stx $1A77
    lda.w stage
    asl #2
    tay
    ldx.w _00B8D6+3,Y : stx $1A7A
.BEDC:
    phy
    ldx.w _00B8D6,Y
    beq .BEF8

    stx $1A78
-:
    ldy #$01
    jsr _01C38A
    ldx #$00
    jsr _01C29D_C2A1
    jsl _0085A6
    dec $1A78
    bne -

.BEF8:
    !A16
    clc
    tdc
    adc #$0156
    tcd
    !A8
    ply
    iny
    dec $1A77
    bne .BEDC

    jsr _01BF78
    lda $1A7A
    beq +

    lda.w camera_x+2
    pha
    and #$03
    clc
    adc #$06
    sta $031E
    jsl _0086FC
    pla
    inc
    and #$03
    clc
    adc #$06
    sta $031E
    jsl _0086FC
+:
    pld
.ret:
    rts
}

{ ;BF31 - BF77
_01BF31: ;a8 x8
    lda.w stage
    tax
    lda.w _00B8FE,X : sta $1A7F
    txa
    asl #2
    tax
    lda.w _00B7D5+0,X : sta $1EE8
    stz $1EE9
    lda.w _00B7D5+1,X : sta $1EEA
    stz $1EEB
    asl
    bne +

    inc
+:
    sta $1EEC
    stz $1EED
    lda.w _00B7D5+2,X : sta $1EEE
    stz $1EEF
    lda.w _00B7D5+3,X : sta $1EF0
    stz $1EF1
    asl
    bne +

    inc
+:
    sta $1EF2
    stz $1EF3
    rts
}

{ ;BF78 - C00A
_01BF78: ;a- x8
    phd
    !A16
    ldx.w stage
    phx
    ldy.w _00B805,X
    lda #$15A2
    tcd
    ldx.w _00B805+0,Y
    phy
    jsr .BFCE
    ply
    lda #$16F8
    tcd
    ldx.w _00B805+1,Y
    phy
    jsr .BFCE
    ply
    lda #$184E
    tcd
    ldx.w _00B805+2,Y
    jsr .BFCE
    plx
    ldy.w _00B88B,X
    lda #$15A2
    tcd
    ldx.w _00B88B+0,Y
    phy
    jsr _01C00B
    ply
    lda #$16F8
    tcd
    ldx.w _00B88B+1,Y
    phy
    jsr _01C00B
    ply
    lda #$184E
    tcd
    ldx.w _00B88B+2,Y
    jsr _01C00B
    !AX8
    pld
    rts

;-----

.BFCE: ;a16 x8
    ldy.w _00B805+00,X : sty $43
    ldy.w _00B805+01,X : sty $2F
    lda.w _00B805+02,X : sta $30
    ldy.w _00B805+04,X : sty $33
    ldy.w _00B805+05,X : sty $28
    ldy.w _00B805+06,X : sty $2A
    ldy.w _00B805+07,X : sty $46
    ldy.w _00B805+08,X : sty $49
    ldy.w _00B805+09,X : sty $4C
    ldy.w _00B805+10,X : sty $4D
    ldy.w _00B805+11,X : sty $2C
    ldy.w _00B805+12,X : sty $4F
    rts
}

{ ;C00B - C027
_01C00B: ;a16 x-
    !X16
    lda #$0000 : jsr _01C028
    lda #$000A : jsr _01C028
    lda #$0014 : jsr _01C028
    lda #$001E : jsr _01C028
    !X8
    rts
}

{ ;C028 - C044
_01C028: ;a16 x16
    phx
    sta $0010
    clc
    lda $3F
    adc.w _00B88B+2,X
    tay
    clc
    lda $3B
    adc.w _00B88B,X
    ldx $0010
    jsr _01C045
    plx
    inx #4
    rts
}

{ ;C045 - C058
_01C045: ;a16 x16
    phy
    pha
    jsr _01C14A
    and $30
    ora $2E
    sta $00,X
    pla
    ply
    jmp _01C172

.C055: ;a16 x16
    jsr _01C045
    rtl
}

{ ;C059 - C061
    ;unused
    lda $02DA
    bne .C061

    jsr _01C062
.C061:
    rtl
}

{ ;C062 - C149
_01C062: ;a- x8
    php
    phd
    !A16
    lda #$15A2
    tcd
.C06A:
    lda $4F
    beq .C074

    jsr .C0E0
    jsr .C115
.C074:
    clc
    tdc
    adc #$0156
    tcd
    cmp #$19A4
    bne .C06A

    !A8
.C081:
    ldx $1A6F
    cpx $1A71
    beq .C0AF

    lda $19EF,X : xba : lda $19F0,X : xba : tcd
    ldy $19F1,X : sty $38
    clc
    txa
    adc #$04
    and #$3F
    sta $1A6F
    lda.w _00B887,Y
    bit $4F
    beq .C0AA

    jsr _01C38A
.C0AA:
    jsr _01C1DC
    bra .C081

.C0AF:
    ldx $1A73
    cpx $1A75
    beq .C0DD

    lda $1A2F,X : xba : lda $1A30,X : xba
    tcd
    ldy $1A31,X : sty $39
    clc
    txa
    adc #$04
    and #$3F
    sta $1A73
    lda.w _00B887+2,Y
    bit $4F
    beq .C0D8

    jsr _01C4AB
.C0D8:
    jsr _01C219
    bra .C0AF

.C0DD:
    pld
    plp
    rts

;-----

.C0E0:
    ldy #$00
    sec
    lda $3B
    sbc $34
    bpl .C0EE

    iny
    eor #$FFFF
    inc
.C0EE:
    cmp #$0006
    bcc .C114

    ldx $1A71
    tdc
    sta $19EF,X
    tya
    sta $19F1,X
    clc
    txa
    adc #$0004
    and #$003F
    sta $1A71
    tya
    asl
    tay
    clc
    lda.w _00B7FD,Y : adc $34 : sta $34
.C114:
    rts

;-----

.C115:
    ldy #$00
    sec
    lda $3F
    sbc $36
    bpl .C123

    iny
    eor #$FFFF
    inc
.C123:
    cmp #$0006
    bcc .C149

    ldx $1A75
    tdc
    sta $1A2F,X
    tya
    sta $1A31,X
    clc
    txa
    adc #$0004
    and #$003F
    sta $1A75
    tya
    asl
    tay
    clc
    lda.w _00B7FD,Y : adc $36 : sta $36
.C149:
    rts
}

{ ;C14A - C171
_01C14A: ;a16 x16
    pha
    and #$00FF
    lsr #3
    sta $0008
    tya
    and #$00F8
    asl #2
    ora $0008
    sta $0008
    pla
    xba
    lsr
    tya
    xba
    ror #2
    lsr #4
    and #$0C00
    ora $0008
    rts
}

{ ;C172 - C1DB
_01C172: ;a16 x16
    php
    sta $0000
    sty $0002
    xba
    inc
    asl
    and #$00FE
    sta $0004
    tya
    clc
    adc #$0100
    and #$FF00
    lsr #2
    clc
    adc $0004
    sec
    sbc #$0042
    clc
    adc $42
    sta $02,X
    !A8
    lda $0000
    lsr #4
    and #$0E
    sta $0004
    lda $0002
    lsr
    and #$70
    ora $0004
    sta $04,X
    lda $0000
    lsr #2
    pha
    lsr
    and #$02
    sta $0004
    lda $0002
    lsr
    pha
    lsr
    and #$04
    ora $0004
    sta $06,X
    pla
    and #$04
    sta $0004
    pla
    and #$02
    ora $0004
    sta $08,X
    plp
    rts

;-----

    rts ;leftover rts
}

{ ;C1DC - C218
_01C1DC: ;a8 x8
    ldx $38 : bne .C1FC

    lda #$02 : ldx #$00 : jsr _01C29D
    lda #$01 : ldx #$0A : jsr _01C29D
    lda #$08 : ldx #$14 : jsr _01C29D
    lda #$04 : ldx #$1E : jmp _01C29D

.C1FC:
    lda #$02 : ldx #$00 : jsr _01C255
    lda #$01 : ldx #$0A : jsr _01C255
    lda #$08 : ldx #$14 : jsr _01C255
    lda #$04 : ldx #$1E : jmp _01C255

;-----

    rts ;unused return
}

{ ;C219 - C254
_01C219: ;a8 x8
    ldx $39
    bne .C239

    lda #$02 : ldx #$00 : jsr _01C336_C33A
    lda #$01 : ldx #$0A : jsr _01C336_C33A
    lda #$08 : ldx #$14 : jsr _01C336_C33A
    lda #$04 : ldx #$1E : jmp _01C336_C33A

.C239:
    lda #$02 : ldx #$00 : jsr _01C2E7
    lda #$01 : ldx #$0A : jsr _01C2E7
    lda #$08 : ldx #$14 : jsr _01C2E7
    lda #$04 : ldx #$1E : jmp _01C2E7
}

{ ;C255 - C29C
_01C255: ;a8 x8
    bit $4F
    beq .C297

    dec $00,X
    lda $00,X
    and #$1F
    cmp #$1F
    bne .C271

    inc $00,X
    lda $00,X : ora #$1F : sta $00,X
    lda $01,X : eor #$04 : sta $01,X
.C271:
    lda $08,X : eor #$02 : sta $08,X
    bit #$02
    beq .C297

    lda $06,X : eor #$02 : sta $06,X
    bit #$02
    beq .C297

    lda $04,X
    bit #$0E
    bne .C298

    ora #$0E
    sta $04,X
    !A16
    dec $02,X
    dec $02,X
    !A8
.C297:
    rts

.C298:
    dec #2
    sta $04,X
    rts
}

{ ;C29D - C2E6
_01C29D: ;a8 x8
    bit $4F
    beq .ret

.C2A1: ;a8 x8
    inc $00,X
    lda $00,X
    and #$1F
    bne +

    dec $00,X
    lda $00,X : and #$E0 : sta $00,X
    lda $01,X : eor #$04 : sta $01,X
+:
    lda $08,X : eor #$02 : sta $08,X
    bit #$02
    bne .ret

    lda $06,X : eor #$02 : sta $06,X
    bit #$02
    bne .ret

    lda $04,X
    tay
    and #$0E
    cmp #$0E
    bne .C2E2

    tya
    and #$70
    sta $04,X
    !A16
    inc $02,X
    inc $02,X
    !A8
.ret:
    rts

.C2E2:
    iny #2
    sty $04,X
    rts
}

{ ;C2E7 - C335
_01C2E7: ;a8 x-
    bit $4F
    beq .C335

    !AX16
    sec
    lda $00,X
    tay
    sbc #$0020
    sta $00,X
    and #$03E0
    cmp #$03E0
    bne .C306

    tya
    eor $32
    ora #$03E0
    sta $00,X
.C306:
    !AX8
    lda $08,X : eor #$04 : sta $08,X
    bit #$04
    beq .C335

    lda $06,X : eor #$04 : sta $06,X
    bit #$04
    beq .C335

    sec
    lda $04,X : sbc #$10 : and #$7E : sta $04,X
    cmp #$70
    bcc .C335

    !A16
    sec
    lda $02,X : sbc #$0040 : sta $02,X
    !A8
.C335:
    rts
}

{ ;C336 - C385
_01C336: ;a- x-
    jsr .local
    rtl

;-----

.C33A: ;a8 x-
    bit $4F
    beq .C385

.local:
    !AX16
    clc
    lda $00,X
    tay
    adc #$0020
    sta $00,X
    and #$03E0
    bne .C356

    tya
    eor $32
    and #$FC1F
    sta $00,X
.C356:
    !AX8
    lda $08,X : eor #$04 : sta $08,X
    bit #$04
    bne .C385

    lda $06,X : eor #$04 : sta $06,X
    bit #$04
    bne .C385

    clc
    lda $04,X : adc #$10 : and #$7E : sta $04,X
    cmp #$10
    bcs .C385

    !A16
    clc
    lda $02,X : adc #$0040 : sta $02,X
    !A8
.C385:
    rts
}

{ ;C386 - C389
_01C386: ;a8 x8
    jsr _01C4AB
    rtl
}

{ ;C38A - C4AA
_01C38A: ;a- x8
    ldx.w _00B801,Y
    !AX16
    phx
    clc
    lda $02,X : sta $0000
    lda $04,X : sta $0002
    lda $06,X : sta $0004
    lda $08,X : sta $0006
    lda $28   : sta $0008
    lda $00,X
    and #$FBFF
    lsr #5
    bit #$0040
    beq +

    ora #$0020
+:
    asl
    and $4D
    tay
    ldx $0000
.C3C3:
    lda $7EF700,X : ora #$8000 : sta $44
    tyx
    ldy $0002
.C3D0:
    lda [$44],Y : ora #$8000 : sta $47
    ldy $0004
.C3DA:
    lda [$47],Y : ora #$8000 : sta $4A
    ldy $0006
.C3E4:
    lda [$4A],Y : sta $53,X
    dec $0008
    beq .C42F

    inx #2
    txa
    and $4D
    tax
    tya
    eor #$0004
    tay
    bit #$0004
    bne .C3E4

    sta $0006
    lda $0004 : eor #$0004 : sta $0004
    tay
    bit #$0004
    bne .C3DA

    clc
    lda $0002
    adc #$0010
    and #$007E
    tay
    sta $0002
    cmp #$0010
    bcs .C3D0

    txy
    lda $0000 : adc #$0040 : sta $0000
    tax
    bra .C3C3

.C42F:
    plx
    lda $00,X
    and #$041F
    ora $2E
    sta $51
    tdc
    cmp #$15A2
    bne .C493

    !X8
    lda $02,X
    and #$0004
    lsr
    tay
    lda $51
    and #$041F
    asl
    adc.w _00B8D2,Y
    ldx #$00
    phb
    ldy #$7E
    phy
    plb
    !X16
    tay
    lda $28
    cmp #$0021
    bcs .C47B

-:
    lda $53,X : sta $B000,Y
    lda $73,X : sta $B400,Y
    clc
    tya
    adc #$0040
    tay
    inx #2
    cpx #$0020
    bne -

    bra .C492

.C47B:
    lda $53,X : sta $B000,Y
    lda $93,X : sta $D000,Y
    clc
    tya
    adc #$0040
    tay
    inx #2
    cpx #$0040
    bne .C47B

.C492:
    plb
.C493:
    !AX8
    tdc
    cmp #$A2
    bne .C49F

    lda $1A7A
    bne .ret

.C49F:
    lda #$01
    ldy $28
    cpy #$21
    bcc +

    inc
+:
    sta $50
.ret:
    rts
}

{ ;C4AB - C678
_01C4AB: ;a8 x8
    ;water crash, replace terrain
    ldx.w _00B801+2,Y ;Y is always 0 here?
    !AX16
    phx
    clc
    lda $02,X : sta $0000
    lda $04,X : sta $0002
    lda $06,X : sta $0004
    lda $08,X : sta $0006
    lda $2A : sta $0008
    lda $00,X
    and #$041F
    bit #$0400
    beq .C4D8

    ora #$0020
.C4D8:
    and $2C
    asl
    tay
    ldx $0000
.C4DF:
    lda $7EF700,X : ora #$8000 : sta $44
    tyx
    ldy $0002
.C4EC:
    lda [$44],Y : ora #$8000 : sta $47
    ldy $0004
.C4F6:
    lda [$47],Y : ora #$8000 : sta $4A
    ldy $0006
.C500:
    lda [$4A],Y : sta $D6,X
    dec $0008
    beq .C54D

    inx #2
    txa
    and $2C
    tax
    tya
    eor #$0002
    tay
    bit #$0002
    bne .C500

    sta $0006
    lda $0004 : eor #$0002 : sta $0004
    tay
    bit #$0002
    bne .C4F6

    inc $0002 : inc $0002
    lda $0002
    tay
    bit #$000E
    bne .C4EC

    sec
    sbc #$0010
    sta $0002
    txy
    inc $0000 : inc $0000
    ldx $0000
    bra .C4DF

.C54D:
    plx
    lda $00,X
    and #$0BE0
    and $30
    ora $2E
    sta $D4
    tdc
    cmp #$15A2
    bne .C594

    !X8
    phb
    ldy #$7E : phy : plb
    !X16
    lda $D4
    tay
    and #$03E0
    asl
    cpy #$0800
    bcc .C577

    ora #$2000
.C577:
    tay
    lda $02,X
    and #$0006
    tax
    phd
    clc
    tdc
    adc #$00D3
    tcd
    lda.w stage
    bne .C58F

    jsr (.C5A5,X)
    bra .C592

.C58F:
    jsr (.C5AD,X)
.C592:
    pld
    plb
.C594:
    !AX8
    tdc
    cmp #$A2
    bne .C5A0

    lda $1A7A
    bne .C5A4

.C5A0:
    lda #$02 : sta $D3
.C5A4:
    rts

.C5A5: dw .C5B5, .C5E6, .C617, .C648
.C5AD: dw .C5CC, .C5FD, .C62E, .C65F

;-----

.C5B5:
    ldx #$0000
.C5B8:
    lda $03,X : sta $B000,Y
    lda $43,X : sta $B800,Y
    iny #2
    inx #2
    cpx #$0040
    bne .C5B8

    rts

;-----

.C5CC: ;stage 7 gets here at least
    ldx #$0000
.C5CF:
    lda $03,X : sta $B000,Y : sta $C000,Y
    lda $43,X : sta $B800,Y
    iny #2
    inx #2
    cpx #$0040
    bne .C5CF

    rts

;-----

.C5E6:
    ldx #$0000
.C5E9:
    lda $43,X : sta $B800,Y ;bank 7E, transfer post-water crash tiles?
    lda $03,X : sta $C000,Y
    iny #2
    inx #2
    cpx #$0040
    bne .C5E9

    rts

;-----

.C5FD:
    ;stage 2 uses this, unknown function
    ;updates tile collision array?
    ldx #$0000
.C600:
    lda $43,X : sta $B800,Y : sta $C800,Y
    lda $03,X : sta $C000,Y
    iny #2
    inx #2
    cpx #$0040
    bne .C600

    rts

;-----

.C617: ;not sure if this is used
    ldx #$0000
.C61A:
    lda $03,X : sta $C000,Y
    lda $43,X : sta $C800,Y
    iny #2
    inx #2
    cpx #$0040
    bne .C61A

    rts

;-----

.C62E:
    ;stage 2 uses this, unknown function
    ;updates tile collision array?
    ldx #$0000
.C631:
    lda $03,X : sta $C000,Y : sta $B000,Y
    lda $43,X : sta $C800,Y
    iny #2
    inx #2
    cpx #$0040
    bne .C631

    rts

;-----

.C648:
    ldx #$0000
.C64B:
    lda $43,X : sta $C800,Y
    lda $03,X : sta $B000,Y
    iny #2
    inx #2
    cpx #$0040
    bne .C64B

    rts

;-----

.C65F:
    ;stage 2 uses this, unknown function
    ;updates tile collision array?
    ldx #$0000
.C662:
    lda $43,X : sta $C800,Y : sta $B800,Y
    lda $03,X : sta $B000,Y
    iny #2
    inx #2
    cpx #$0040
    bne .C662

    rts
}

{ ;C679 - C87A
_01C679:
    jmp .C7AC

.C67C:
    rts

.C67D: ;a8 x8
    jsr .C681
    rtl

.C681: ;a8 x8
    lda $032A
    bne _01C679

    lda $1F95
    bne .C67C

    ldx $19EC
    bmi .C67C

    jmp (+,X) : +: dw .C699, .C7F6, .C848

.C699:
    !A16
    stz $19ED
    ldx $1A7F
    bne .C6BC

    lda.w stage
    asl
    tax
    sec
    lda $1A7B
    sbc #$0100
    bpl +

    lda #$0000
+:
    cmp.w screen_boundary_left
    bcc .C6BC

    sta.w screen_boundary_left
.C6BC:
    clc
    lda.w screen_boundary_left
    adc #$0010
    cmp !arthur_pos_x+1
    bcs .C6D3

    lda $19E6
    ora #$00F0
    cmp !arthur_pos_x+1
    bcs +

.C6D3:
    sta !arthur_pos_x+1
+:
    clc
    lda.w camera_x+1
    adc $1EE8
    sec
    sbc !arthur_pos_x+1
    adc $1EEA
    bmi +

    sec
    sbc $1EEC
    bcc .C718

+:
    eor #$FFFF
    inc
    clc
    adc.w camera_x+1
    bmi .C6FB

    cmp.w screen_boundary_left
    bcs .C700

.C6FB:
    lda.w screen_boundary_left
    bra +

.C700:
    inc $19ED
    cmp $19E6
    bcc +

    stz $19ED
    lda $19E6
+:
    sta.w camera_x+1
    sta $1733
    lsr
    sta $1889
.C718:
    ldx $19EB
    bne .C772

    clc
    lda $1EDB
    adc $1EEE
    sec
    sbc !arthur_pos_y+1
    adc $1EF0
    bmi .C733

    sec
    sbc $1EF2
    bcc .C754

.C733:
    eor #$FFFF
    inc
    clc
    adc $1EDB
    bpl .C742

    lda #$0000
    bra +

.C742:
    cmp $19E8
    bcc +

    lda $19E8
+:
    sta $1EDB
    sta $1737
    lsr
    sta $1EE1
.C754:
    clc
    lda $1EDB : adc $1EAB : sta.w camera_y+1
    clc
    lda $1EDB : adc $1EAE : sta $1737
    clc
    lda $1EE1 : adc $1EB1 : sta $188D
.C772:
    sec
    lda.w camera_x+1
    cmp $1A7B
    bcc +

    sta $1A7B
+:
    lda.w stage
    cmp #$0006
    beq +

    cmp #$0002
    bne .ret

+:
    lda.w camera_x+1
    lsr
    sta $0000
    lsr
    clc
    adc $0000
    sta $1889
    lda.w camera_y+1
    lsr
    sta $0000
    lsr
    clc
    adc $0000
    sta $188D
.ret:
    !AX8
    rts

;-----

.C7AC:
    ;debugging? free camera movement
    lda.w p1_button_hold+1 : and #!right|!left|!down|!up : tax
    ldy.w _01B7A5_B7A5,X
    bmi .C7F5

    clc : lda.w _01B7A5_B7B5+0,Y : adc.w camera_x+1 : sta.w camera_x+1 : sta $1733 : sta $1889
          lda.w _01B7A5_B7B5+1,Y : adc.w camera_x+2 : sta.w camera_x+2 : sta $1734 : sta $188A
    clc : lda.w _01B7A5_B7B5+2,Y : adc.w camera_y+1 : sta.w camera_y+1 : sta $1737 : sta $188D
          lda.w _01B7A5_B7B5+3,Y : adc.w camera_y+2 : sta.w camera_y+2 : sta $1738 : sta $188E
.C7F5:
    rts

;-----

.C7F6: ;raft sets 19EC to 2
    !A16
    clc
    lda.w camera_x+0 : adc #$0040 : sta.w camera_x+0 : sta $1732
    lda.w camera_x+2 : adc #$0000 : sta.w camera_x+2 : sta $1734
    lda.w camera_x+1 : lsr : sta $1889
    clc
    lda.w camera_x+1
    adc #$0008
    cmp !arthur_pos_x+1
    bcs .C82F

    lda.w camera_x+1
    adc #$00F8
    cmp !arthur_pos_x+1
    bcs .C832

.C82F:
    sta !arthur_pos_x+1
.C832:
    lda #$1500
    cmp.w camera_x+1
    bcs .C845

    sta.w camera_x+1
    sta $1A7B
    ldx #$04 : stx $19EC
.C845:
    !A8
    rts

.C848: ;2-2: pan back to arthur from boss
    !AX16
    lda #$1490
    cmp !arthur_pos_x+1
    bcc .C855

    sta !arthur_pos_x+1
.C855:
    sec
    lda.w camera_x+1
    adc #$0080
    cmp !arthur_pos_x+1
    bcc .C875

    sec
    lda.w camera_x+1
    sbc #$0001
    sta.w camera_x+1
    sta $1733
    lsr
    sta $1889
    !AX8
    rts

.C875:
    !AX8
    stz $19EC
    rts
}

{ ;C87B - C8A6
_01C87B:
    ;unused
    lda $1EB3
    beq .C892

    php
    phd
    lda $1EB4
    asl
    tax
    !AX16
    lda #$15A2
    tcd
    jsr (.C893,X)
    pld
    plp
.C892:
    rtl

.C893: dw .C895

;-----

.C895:
    lda.w .C8A1+0,X
    ldy.w .C8A1+2,X
    ldx #$001E
    jmp _01C045

.C8A1: db $18, $00, $00, $0C, $80, $00
}

{ ;C8A7 - CC1A
_01C8A7: ;a x
    lda.w can_charge_magic
    beq .C8D1

    lda !arthur_hp
    bmi .C8D1

    ldx $14B3
    jsr (.C8BD, X)
    jsr .CBB6
    jmp .CB56

.C8BD: dw .C8D2, .C93F, .CA9F, .C8C5

;-----

.C8C5:
    lda.w weapon_current
    and #$0E
    cmp #$0E
    beq .C8D1

    stz $14B3
.C8D1:
    rts

;-----

.C8D2:
    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    bne .C8E4

    jsr .CB63
    lda #$06 : sta $14B3
    rts

.C8E4: ;magic bar
    !A16
    ldx #$0A
.C8E8:
    lda.w _00B908+$00,X
                 sta $7F9092,X
    ora #$8000 : sta $7F90D2,X
    dex #2
    bpl .C8E8

    ldx #$0A
.C8FC:
    lda.w _00B908+$0C,X
    ora #$4000 : sta $7F90A2,X
    ora #$8000 : sta $7F90E2,X
    dex #2
    bpl .C8FC

    lda #$2DC7 : jsr .CA86
    !A8
    lda #$02 : sta $14B3
    lda #$7F : sta $14B5 : sta $14B6
    stz $14E1
    stz $14B4
    stz $14B7
    stz $14E3
    stz $14F0
    lda.w weapon_current : jsr .CBDA
    inc $0323
.C93E:
    rts

;-----

.C93F:
    !AX8
    lda $14E3
    ora.w is_frozen
    bne .C93E

    lda !open_magic_slots
    cmp #$08
    bne .C93E

    lda.w shot_hold
    bne .C958

    jmp .CA46

.C958:
    lda.w weapon_current : lsr : sta.w magic_current
    lda $14B7
    beq .C96F

    lda $14F0
    beq .C96C

    jmp .CA46

.C96C:
    jmp .CA85

.C96F:
    ldx #$08
    lda !slot_shield
    beq .C97F

    ldx #$0D
    lda !slot_shield+$07
    beq .C97F

    ldx #$12
.C97F:
    stx $0000
    sec : lda $14B6 : sbc $0000 : sta $14B6
    bpl .C9FC

    lda $14E6
    bne .C9B5

    lda $14B4
    cmp #$01
    bne .C9B5

    lda #$0C : sta !slot_upgrade2
    lda #$01 : sta !slot_upgrade2+$07
    lda #!id_magic_charge : sta !slot_upgrade2+!obj_type
    stz !slot_upgrade2+$08
    inc $14E6
    lda #!sfx_magic_charge : jsl _018049_8053
.C9B5:
    sec : lda $14B5 : sbc #$08 : sta $14B5 : sta $14B6
    lda $14B4
    cmp #$06
    bne .C9FD

    lda $14E1
    bne .C9D7

    inc $14E1
    stz $14B4
    lda #$00
    bra .C9FD

.C9D7:
    lda #$0C : sta !slot_upgrade2
    lda #!id_magic_charge : sta !slot_upgrade2+!obj_type
    lda #$02 : sta !slot_upgrade2+$07
    stz !slot_upgrade2+$08
    lda #$01 : sta $14B7
    jsr _01B6AE_local
    !A16
    lda #$2DCE
    jsr .CA86
    jsr .CBD4
.C9FC:
    rts

.C9FD:
    asl
    tax
    sta $0000
    stz $0001
    lda #$0A : sec : sbc $0000 : sta $0000
    lda $14E1
    bne .CA1A

    !A16
    lda.w _00B908_B920,X
    bra .CA1F

.CA1A:
    !A16
    lda.w _00B908_B92C,X
.CA1F:
    pha
    sta $7F9092,X
    ora #$8000
    sta $7F90D2,X
    pla
    ldx $0000
    ora #$4000
    sta $7F90A2,X
    ora #$8000
    sta $7F90E2,X
    !A8
    inc $0323
    inc $14B4
    rts

;-----

.CA46:
    lda $14F0
    bne .CA55

    lda $14B7
    beq .CA73

    lda #$01 : sta $14F0
.CA55:
    lda.w jump_counter
    bne .CA85

    stz $14F0
    stz !slot_upgrade2
    lda #$FF : sta $14B7
    lda !slot_arthur+$0F
    bmi .CA73

    inc $14E3
    inc $14E4
    jsr _01B6AE_local
.CA73:
    lda $14B4
    beq .CA85

    stz $14B5
    lda #$05 : sta $14B4
    lda #$04 : sta $14B3
.CA85:
    rts

;-----

.CA86:
    sta $7F909E
    inc
    sta $7F90A0
    inc
    sta $7F90DE
    inc
    sta $7F90E0
    !A8
    inc $0323
    rts

;-----

.CA9F:
    lda $14E6
    beq .CAC3

    dec $14B5
    bpl .CA85

    stz !slot_upgrade2
    lda #!id_magic_charge : sta !slot_upgrade2+!obj_type
    stz !slot_upgrade2+$08
    lda $14E4
    stz $14E4
    bne .CAC3

    stz $14E6
    jsl _018049_8051
.CAC3:
    lda #$01 : sta $14B5
    lda $14B4 : asl : tax : sta $0000
    stz $0001
    lda #$0A : sec : sbc $0000 : sta $0000
    lda $14E1
    beq .CB08

    !A16
    lda.w _00B908_B920,X
    pha
    sta $7F9092,X
    ora #$8000 : sta $7F90D2,X
    pla
    ldx $0000
    ora #$4000 : sta $7F90A2,X
    ora #$8000 : sta $7F90E2,X
    !A8
    bra .CB2E

.CB08:
    !A16
    lda.w _00B908,X : sta $7F9092,X
    ora #$8000      : sta $7F90D2,X
    ldx $0000
    lda.w _00B908_B914,X : ora #$4000 : sta $7F90A2,X
                           ora #$8000 : sta $7F90E2,X
    !A8
.CB2E:
    inc $0323
    dec $14B4
    bpl .CB55

    lda $14E1
    beq .CB45

    lda #$05 : sta $14B4
    stz $14E1
    bra .CB55

.CB45:
    stz $14B4
    lda #$7F : sta $14B5 : sta $14B6
    lda #$02 : sta $14B3
.CB55:
    rts

;-----

.CB56:
    lda !armor_state
    cmp #!gold
    beq .CBB5

    stz.w can_charge_magic
    stz $14B3
.CB63:
    !A16
    ldx #$0C
    lda #$01C5
.CB6A:
    dex #2
    sta $7F9092,X
    sta $7F90A2,X
    sta $7F90D2,X
    sta $7F90E2,X
    bne .CB6A

    lda #$21AE : sta $7F909C : sta $7F90A2
    lda #$A1AE : sta $7F90DC : sta $7F90E2
    lda #$2DC7 : jsr .CA86
    lda.w weapon_current : jsr .CBDA
    inc $0323
    stz !slot_upgrade2
    stz !slot_upgrade2+$08
    stz $14B5
    stz $14B6
    stz $14B4
    stz $14B7
.CBB5:
    rts

;-----

.CBB6:
    lda $14B7
    beq .CC03

    bpl .CBCD

    !A16
    lda #$2DC7 : jsr .CA86
    stz $14B7
    lda.w weapon_current
    bra .CBDA

.CBCD:
    lda $02C3
    and #$01
    bne .CC04

.CBD4:
    clc
    lda.w weapon_current
    adc #$0B

.CBDA:
    sta $0000
    asl
    clc
    adc $0000
    asl
    tax
    !A16
    lda.l _04984F_A035+0,X : sta $7EF41A
    lda.l _04984F_A035+2,X : sta $7EF41C
    lda.l _04984F_A035+4,X : sta $7EF41E
    !A8
    inc $0331
.CC03:
    rts

.CC04:
    !A16
    lda #$FFFF : sta $7EF41A : sta $7EF41C : sta $7EF41E
    !A8
    inc $0331
    rts
}

{ ;CC1B -
_01CC1B: ;a- x-
    !AX8
    lda $1F19 : asl : tax
    jmp (+, X) : +: dw .CC31, .CC3A, .CC74, .CC78, .CC74, .CCAB

;-----

.CC31:
    lda $1F18
    beq .CC39

    inc $1F19
.CC39:
    rts

;-----

.CC3A:
    dec $1F18
    lda $1F16 : sta $0001
    !X16
    ldx $1F14
.CC48:
    !A16
    lda #$0000 : sta $7EF400,X
    !A8
    inx #2
    lda #$1E : sta $0000
.CC5A:
    lda #$FF : sta $7EF400,X
    inx
    dec $0000
    bne .CC5A

    dec $0001
    bne .CC48

    inc $0331
    inc $1F19
    !X8
    rts

;-----

.CC74:
    inc $1F19
    rts

;-----

.CC78:
    lda $1F16 : sta $0001
    !X16
    ldy $1F14
    ldx #$0000
.CC86:
    lda #$20 : sta $0000
.CC8B:
    lda $7EAE00,X
    phx
    tyx
    sta $7EF400,X
    plx
    inx
    iny
    dec $0000
    bne .CC8B

    dec $0001
    bne .CC86

    inc $0331
    inc $1F19
    !X8
    rts

;-----

.CCAB:
    stz $1F19
    rts
}

{ ;CCAF - CCBC
_01CCAF: ;a8 x8
    lda #$10
    ldx $02DA
    beq +

    lda #$30
+:
    ora $09
    sta $09
    rtl
}

{ ;CCBD -
_01CCBD: ;a8 x8
    lda $0276 : and #$F8 : sta $0276
    lda !armor_state
    beq .CCCC

    lda #$01
.CCCC:
    sta !obj_hp
    lda #$FF : sta $0F
    stz.w chest_counter
    stz.w knife_rapid_timer
    stz.w knife_rapid_count
    stz $14CB
    stz $0338
    stz $033E
    lda #$FF : sta $0339 : sta $033F
    ldy #$00 : ldx #$20 : jsl set_sprite
    stz.w transform_timer
    lda.b #coord_offsets_arthur
    ldx.b #coord_offsets_arthur>>8
    ldy $02DA
    beq .CD04

    lda.b #coord_offsets_arthur_B9FC
    ldx.b #coord_offsets_arthur_B9FC>>8
.CD04:
    sta $13
    stx $14
    lda #$FF : sta $26 : sta $14B8
    !A16
    lda.w _00ED00+$04 : sta $0313+$27 ;todo: what is 313?
    lda.w _00ED00+$34 : sta $0340
    lda #$0020 : sta $0313+$29
    lda #$0050 : sta $0342
    !A8
    lda.w stage
    cmp #$04
    bne .CD36

    lda #$01 : sta !obj_facing ;make arthur face left initially in 4b
.CD36:
    jsl _01CCAF
    lda $09 : ora #$C0 : sta $09
    lda #$03 : sta $3C
    !A16
    lda.l _04984F_9879+0 : sta $7EF522
    lda.l _04984F_9879+2 : sta $7EF524
    lda.l _04984F_9879+4 : sta $7EF526
    !A8
    inc $0331
    lda #$02 : cop #$00

;----- CD67

    lda #$0C : sta !slot_weapons ;0C = "create" enum
    lda #!id_ready_go : sta !slot_weapons+!obj_type
    lda #$01 : sta $1F96
    brk #$00

;----- CD78

    lda $0292
    bpl .CD87

    lda #$12 : sta $02D5 : sta $02D7
    bra .CD8B

.CD87:
    jsl _01DE0B

.CD8B:
    brk #$00

;----- CD8D

    lda !slot_weapons+!obj_active
    bne .CD8B

    lda #$FF : sta $0339
    !A16
    lda.l _04984F_9897+0 : sta $7EF522
    lda.l _04984F_9897+2 : sta $7EF524
    lda.l _04984F_9897+4 : sta $7EF526
    !A8
    inc $0331
    stz $1F96
    inc $02AC
    bra .CDC4

.CDBE:
    lda #$2C : jsl _018049_8053 ;arthur land sfx

.CDC4:
    lda $09 : and #$FE : sta $09
    ldy #$00
    ldx #$20
    sty $3E
    stx $3F
    stz $1D
    stz $0F
    stz.w double_jump_state
    stz.w jump_state
    stz.w jump_counter
    stz $14F6
    lda !obj_facing  : sta !obj_direction
    lda #$03 : sta $3C
    lda #$FF : sta $3D
.CDEE:
    lda #$00
    jsr .CE9C
    jsr _01D090_D263
    jsr _01D565
    jsr _01DE62_DE63
    lda #!down
    bit.w p1_button_hold+1
    beq .CE08

    brk #$00

;----- CE05

    jmp .CF8B

.CE08:
    lda #$00 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    beq .CE18

    brk #$00

;----- CE16

    bra .CE1C

.CE18:
    brk #$00

;---- CE1A

    bra .CDEE

.CE1C:
    ldy #$00
    lda.w bowgun_magic_active
    beq +

    ldy #$45
+:
    jsl set_speed_x
    lda !obj_facing : sta !obj_direction
    stz $3C
.CE2F:
    lda.w is_shooting
    bne .CE68

    lda $14D5
    beq +

    lda #$03 : sta $3C
+:
    jsr .CE85
    jsr _01DE62_DE63
    lda #$00 : jsr .CE9C
    lda #!down
    bit.w p1_button_hold+1
    beq .CE54

    brk #$00

;----- CE51

    jmp .CF8B

.CE54:
    lda #$00 : jsr _01D090_D1C5
    jsr _01D565
    lda.w p1_button_hold+1
    bit #!right|!left
    bne .CE79

    brk #$00

;----- CE65

    jmp .CDC4

.CE68:
    lda #$00 : jsr .CE9C
    lda #!down
    bit.w p1_button_hold+1
    beq .CE79

    brk #$00

;----- CE76

    jmp .CF8B

.CE79:
    lda.w stage1_earthquake_active
    beq +

    jsr _01D957
+:
    brk #$00

;----- CE83

    bra .CE2F

;-----

.CE85:
    lda.w p1_button_hold+1
    and #!right|!left
    tax
    lda.w _00BA22,X
    bmi .CE9B

    sta !obj_direction
    sta !obj_facing
    jsl update_pos_x
    jsr _01D91C_D94E

.CE9B:
    rts

;-----

.CE9C:
    sta.w jump_type
    lda !obj_pos_y+1 : sta $39
    lda !obj_pos_y+2 : sta $3A
    jsr _01D957
    bne .CECD

    lda $14D1
    bne .CEC1

    lda $14C3
    bne .CECC

    pla : pla
    stz $14C3
    ldx.w jump_type
    jmp (.CEDD,X)

.CEC1:
    stz $14D0
    lda.w !obj_pos_x
    beq .CECC

    inc $14D0
.CECC:
    rts

.CECD:
    lda $14C3
    beq .CEDA

    lda $39 : sta !obj_pos_y+1
    lda $3A : sta !obj_pos_y+2
.CEDA:
    lda #$01
    rts

.CEDD: dw .CFC8, arthur_baby_fall, arthur_seal_fall, arthur_bee_jump, arthur_maiden_fall

;-----

    ;unused
    sta.w jump_type
    lda $14C3
    bne .CEFB

    lda $14BB
    bne .CEF9

    jsr _01D957
    bne .CEFB

.CEF9:
    lda #$00
.CEFB:
    rts

;-----

.arthur_jump:
    inc.w jump_counter
    lda #!sfx_jump : jsl _018049_8053
    jsr _01D090_D2D4
    lda.w _00BA26,X : sta $14B0
    ldy.w _00BA2A,X
    lda.w jump_state
    beq .CF22

    clc
    lda $14B0 : adc #$04 : sta $14B0
    ldy.w _00BA2E,X
.CF22:
    jsl set_speed_xyg
    lda.w bowgun_magic_active
    beq .CF3A

    tya
    and #$01 ;don't change speed if neutral jump?
    bne .CF3A

    lda #$50 : sta !obj_speed_x   ;set custom speed if bowgun magic is active
    lda #$01 : sta !obj_speed_x+1
               stz !obj_speed_x+2
.CF3A:
    lda !obj_facing : sta !obj_direction
    lda $14B0 : sta $3C
    lda.w jump_state
    beq .CF53

.CF48:
    lda.w jump_hold
    beq .CF53

    brk #$00

;----- CF4F

    dec $2F ;jump stall timer
    bne .CF48

.CF53:
    lda.w double_jump_state
    bne +

    jsr _01D090_D2D4
+:
    jsr _01DE62_DE63
    jsr arthur_cap_fall_speed
    jsr _01D8F1
    jsr _01D91C
    jsr _01D97E
    beq .CF71

    brk #$00

;----- CF6E

    jmp .CDBE

.CF71:
    lda.w jump_state
    bne .CF87

    lda.w jump_press
    beq .CF87

    inc.w jump_state
    lda #$05 : sta $2F
    brk #$00

;----- CF84

    jmp .arthur_jump

.CF87:
    brk #$00

;----- CF89

    bra .CF53

.CF8B: ;crouch
    lda !obj_facing : sta !obj_direction
    lda #$04 : sta $3C
    lda #$02 : sta $1D
    lda #$01 : ora $09 : sta $09
.CF9D:
    jsr _01D090_D263
    jsr _01D565
    lda #$00
    jsr .CE9C
    lda #!down
    bit.w p1_button_hold+1
    bne .CFB4

    brk #$00

;----- CFB1

    jmp .CDC4

.CFB4:
    lda $14C3
    bne +

    jsr _01D957
+:
    jsr _01D090_D2D4
    lda #$00 : jsr _01D090_D1C5
    brk #$00

;---- CFC6

    bra .CF9D

.CFC8:
    ldy #$0C : jsl set_speed_xyg
    lda #$03 : sta $3C
    inc.w jump_counter
.CFD5:
    jsr arthur_cap_fall_speed
    jsr _01D97E_D985
    bne .CFE1

    brk #$00

;----- CFDF

    bra .CFD5

.CFE1:
    brk #$00

;----- CFE3

    jmp .CDBE
}

{ ;CFE6 - CFF2
_01CFE6: ;a8 x-
    lda #$20
    sta $1EF0
    asl
    sta $1EF2
    inc $14F9
    rts
}

{ ;CFF3 -
;ladder stuff

_01CFF3:
    !A16
    sec : lda !obj_pos_y+1 : sbc #$0010 : sta !obj_pos_y+1
    !A8
    jsr _01CFE6
    jmp _01CCBD_CDC4

.D005:
    lda #$0D : sta $3C
    lda #$07 : sta $2F
.D00D:
    brk #$00

;----- D00F

    dec $2F
    bne .D00D

.D013:
    brk #$00

;----- D015

    lda.w p1_button_hold+1
    bit #!up
    bne _01CFF3

    bit #!down
    beq .D013

.D020:
    lda #$0C : sta $3C
    lda #$07 : sta $2F
.D028:
    brk #$00

;----- D02A
    dec $2F
    bne .D028

.D02E:
    lda #$01 ;does nothing
    brk #$00

;----- D032

    lda.w p1_button_hold+1
    bit #!up
    bne .D005

    bit #!down
    beq .D02E

.D03D: ;a8 x8
    lda #$0B : sta $3C
.D041:
    brk #$00

;----- D043

    lda.w p1_button_hold+1
    bit #!up
    beq .D066

    jsl update_animation_normal
    !A16
    dec !obj_pos_y+1
    !A8
    ldy #$08
    jsr _01D090_D2AB
    bcc .D041

    jsl _01A4E2_A52B
    jsr _01D090_D2C9
    bcc .D041

    bra .D020

.D066:
    bit #!down
    beq .D03D

    jsl update_animation_normal
    !A16
    inc !obj_pos_y+1
    !A8
    ldy #$08
    jsr _01D090_D2BD
    bcc .D085

    ldy #$00
    jsr _01D090_D2BD
    bcc .D085

    jmp _01CCBD_CFC8

.D085:
    ldy #$00
    jsl _01A4E2_A4E8
    bcc .D041

    jmp _01CCBD_CDC4
}

{ ;D090 - D564
;arthur thing code

_01D090: ;a8 x8
    jsr .D184
    jsr .D16C
    jsr _01DEE7_DEE8
    lda $14C3 : sta $14BB
    stz $14C3
    stz $14CA
    lda $0F
    bne .D0B1

    lda !armor_state : asl : tax
    jsr (.D114,X)
.D0B1:
    jsr .D2E2
    jsr .D30F
    jsr .D143
    lda $0F
    bmi .D0C3

    lda.w is_shooting
    bne .D0C7

.D0C3:
    jsl set_sprite_84A7
.D0C7:
    lda !armor_state
    cmp $14B8
    beq .D0DC

    ;change sprite set and such for arthur
    sta $14B8
    jsr _01DA88
    lda #$FF : sta $26
    jsr set_arthur_palette ;unsure if this should be a local function or not
.D0DC:
    jsl _018E32_8E73
    jsr .D1E1
    lda $08
    and #$7F
    ldx $0276
    beq +

    ora #$80
+:
    sta $08
    lda $1F9B
    beq +

    jsl _01C679_C67D
+:
    lda $0E
    bmi .D113

    lda $2E
    beq .D113

    dec $2E
    bne .D113

    lda $08   : and #$EF : sta $08
    lda $0276 : and #$FD : sta $0276
.D113:
    rtl

.D114: dw .D126, .D126, .D126, .D126, .D126, .D12A, .D12A, .D12A, .D12A

;-----

.D126:
    jsr .D133
    rts

;-----

.D12A:
    jsl update_animation_normal
    jsl set_sprite_84A7
    rts

;-----

.D133:
    lda.w is_shooting
    beq +

    jsr .D2D4
+:
    jsl update_animation_normal
    jsr .D3C4
    rts

;-----

.D143:
    lda !armor_state
    sec
    sbc #$04
    bpl +

    lda #$00
+:
    asl
    sta $0000
    lda $09
    and #$01
    ora $0000
    asl #2
    tax
    !A16
    lda.w arthur_hitbox+0,X : sta $14D6
    lda.w arthur_hitbox+2,X : sta $14D8
    !A8
    rts

;-----

.D16C:
    lda $14F9
    beq .D183

    lda $1EF0 : dec : sta $1EF0
                asl : sta $1EF2
    cmp #$21
    bcs .D183

    stz $14F9

.D183:
    rts

;-----

.D184:
    lda.w stage
    bne .D1AE

    lda.w checkpoint
    beq .D1AE

    ;gets here if at stage 1b
    !A16
    lda !obj_pos_y+1
    bmi .D199

    cmp #$0018
    bcs .D1AC

.D199:
    ldx #$00 : jsr .D1AF
    bcc .D1AC

    ldx #$06 : jsr .D1AF
    bcc .D1AC

    ldx #$0C : jsr .D1AF
.D1AC:
    !AX8
.D1AE:
    rts

;-----

.D1AF:
    sec
    lda !obj_pos_x+1
    sbc.w _00BA32+0,X
    clc
    adc.w _00BA32+2,X
    cmp.w _00BA32+4,X
    bcs .D1C3

    lda $14BE : sta !obj_pos_x+1
.D1C3:
    rts

;-----

.D1C4:
    rts

.D1C5: ;a8 x-
    sta.w jump_type
    lda.w jump_press
    beq .D1C4

    pla : pla
    brk #00

;----- D1D1

    ldx.w jump_type
    jmp (+,X) : +: dw _01CCBD_arthur_jump, arthur_baby_jump, arthur_seal_jump, arthur_bee_jump, arthur_maiden_jump

;-----

.D1E1:
    ;transformation
    lda $14D1 : ora $14F5
    bne .D208

    lda.w transform_timer : ora.w transform_timer+1
    beq .D208

    !A16
    dec.w transform_timer
    lda.w transform_timer
    beq .undo_transformation

    cmp #$003F
    !A8
    bne .D208

    lda $08 : ora #$10 : sta $08 ;flicker
.D208:
    rts

.undo_transformation:
    !A8
    lda $08   : and #$EF : sta $08
    lda.b #_01CCBD_CDC4    : sta !obj_state+1
    lda.b #_01CCBD_CDC4>>8 : sta !obj_state+2
    lda.w transform_stored_armor_state : sta !armor_state
    lda #$FF  : sta $3D
    stz.w is_shooting
    lda $02B0
    beq .D239

    sta !slot_shield+!obj_type
    lda $02B1 : sta !slot_shield+$07
    lda #$0C  : sta !slot_shield+!obj_active
.D239:
    lda !armor_state
    cmp #!bronze
    beq .D245

    cmp #!gold
    beq .D250

    rts

.D245:
    lda #$1C : sta !slot_upgrade+!obj_type
    lda #$0C : sta !slot_upgrade
    rts

.D250:
    lda #$1B : sta !slot_upgrade+!obj_type
    lda #$0C : sta !slot_upgrade
    lda #$01 : sta.w can_charge_magic
    stz $14B3
    rts

;-----

.D263: ;a8 x? ;arthur code, called from arthur idle?
    lda $14C3
    bne .D2AA

    lda.w is_shooting
    ora.w current_cage
    bne .D2AA

    lda.w p1_button_hold+1
    bit #!up
    bne .D298

    bit #!down
    beq .D2AA

    ldy #$10
    jsr .D2AB
    bcs .D2AA

    !A16
    lda !obj_pos_y+1 : adc #$0010 : sta !obj_pos_y+1
    !A8
    jsr _01CFE6
    pla : pla
    inc $14F6
    jmp _01CFF3_D005

.D298:
    ldy #$0C
    jsr .D2AB
    bcs .D2AA

    jsr _01D957
    pla : pla
    inc $14F6
    jmp _01CFF3_D03D
.D2AA:
    rts

;-----

.D2AB:
    jsr .D2BD
    bcs .D2AA

    ;snap arthur's x position, ladder related
    lda #$FF : sta $0F
    lda !obj_pos_x+1 : and #$F0 : ora #$08 : sta !obj_pos_x+1
    rts

;-----

.D2BD: ;arthur at ladder check?
    lda $14E9
    pha
    jsl _01A4E2_A4E8
    pla
    sta $14E9
.D2C9:
    sec
    lda $001F
    sbc $0328
    cmp $0329
    rts

;-----

.D2D4:
    lda.w p1_button_hold+1
    and #!right|!left
    tax
    lda.w _00BA44,X
    bmi .D2E1 ;do nothing if nothing or left+right is pressed

    sta !obj_facing
.D2E1:
    rts

;-----

.D2E2:
    lda !armor_state
    cmp #!bee
    beq .D30E

    lda !obj_hp
    ora $08
    bmi .D30E

    lda $14E9
    beq .D30E

    jsl _02FDB3
    lda !obj_direction : eor #$01 : sta !obj_direction
    ldx.w stage
    sec
    lda !obj_hp : sbc.w _00BA5E,X : sta !obj_hp
    bpl .D30E

    inc $14D1
.D30E:
    rts

;-----

.D30F:
    lda $14D1
    bne .D370

    lda !obj_pos_y+2
    bmi .D343

    !A16
    clc
    lda $19E8
    adc #$0100
    cmp !obj_pos_y+1
    !A8
    bcs .D343

    ;falling into a pit
    jsl _018049_8051
    inc $14D1
    lda.b #_01DD5C    : sta !obj_state+1
    lda.b #_01DD5C>>8 : sta !obj_state+2
    stz !slot_upgrade2
    stz.w can_charge_magic
    stz $02AC
    jsr _01DDE6
    rts

;-----

.D343:
    lda $14D2
    bne .D370

    lda.w timer_minutes
    bpl .D370

    ;time over
    stz !armor_state
    lda.b #_01D72B    : sta !obj_state+1
    lda.b #_01D72B>>8 : sta !obj_state+2
    lda #$FF : sta !obj_hp
    stz $0F
    stz $1170
    stz.w can_charge_magic
    stz $02AC
    jsr _01DDE6
    inc $14D2
    inc $14D1
.D370:
    rts

;-----

.D371:
    asl
    tax
    jmp (+,X) : +: dw .D3B7, .D384, .D392, .D3B8, .D3C3, .D3BC, .D3D1

;-----

.D384:
    stz.w skip_double_jump_boost
    ldy !obj_speed_y+2
    bmi +

    inc.w skip_double_jump_boost
+:
    inc.w double_jump_state
    rts

;-----

.D392:
    lda $14B9
    cmp $0C
    bne .D3B7

    lda !obj_anim_timer
    cmp #$07
    bne .D3B7

    lda.w skip_double_jump_boost
    beq .D3AA

    lda #$05 : sta.w double_jump_state
    rts

.D3AA:
    inc.w double_jump_state
    lda #$09 : sta $31 ;flip timer: cuts flip anim short
    lda #$0F : jsl set_sprite_84AF
.D3B7: ;will never jump here directly (double_jump_state is always > 0)
    rts

;-----

.D3B8:
    dec $31
    bne .D3C3

.D3BC:
    lda #$FF : sta $3D ;invalidate sprite
    stz.w double_jump_state
.D3C3:
    rts

;-----

.D3C4:
    lda $14EE
    ora $14B7
    bne .D3C3

    lda.w double_jump_state
    bne .D371

.D3D1:
    lda.w weapon_cooldown
    beq +

    dec.w weapon_cooldown
+:
    lda.w is_shooting
    beq .D3F4

    lda.w shot_press
    bne .D3FC

    lda $14B9 : jsl _018DB8
    bne .D3F3

    lda #$FF : sta $3D
    stz.w is_shooting
.D3F3:
    rts

.D3F4:
    lda.w shot_press
    beq .D3F3

    inc.w is_shooting
.D3FC:
    lda.w jump_state
    beq .D417

    ;pressing shot while double jumping
    cmp #$02
    beq .D417

    inc.w jump_state
    inc.w double_jump_state
    lda !obj_speed_y+2
    bpl .D414

    lda #$01 : sta.w weapon_double_jump_boost
.D414:
    stz.w is_shooting
.D417:
    ldx #$00
    lda $09
    and #$01
    beq .D42C

    inx
    lda.w jump_counter
    beq .D42C

    dex
    lda $09 : and #$FE : sta $09 ;clear crouch status bit
.D42C:
    lda.w _00BA7A+2,X : sta $14B9 ;store sprite offset to 2nd shot/crouch shot
    lda.w _00BA7A,X : jsl set_sprite_84AF ;load offset to shot/crouch shot
    ldx.w weapon_current
    lda.w obj_type_count+1,X
    cpx #$09 ;check if weapon is upgraded torch
    bne .D447

    clc
    adc $14CE
.D447:
    cmp.w weapon_limit,X
    bcs .D45C

    lda.w weapon_cooldown
    bne .D45C

    lda.w weapon_current : asl : tax
    jsr (.D45D,X)
    stz.w weapon_double_jump_boost

.D45C:
    rts

.D45D: dw .D50B, .D510, .D51C, .D51C, .D527, .D543, .D510, .D510, .D510, .D510, .D510, .D510, .D549, .D549, .D510, .D510

;-----

.D47D:
    lda.w weapon_current : sta $0000
    jsr get_weapon_slot_local
    bmi .D4D7

    lda $1F25 : sta $002B,X ;store weapon height / 2 in object
    lda #$0C  : sta.w !obj_active,X
    lda.w weapon_current
    pha
    inc
    sta.w !obj_type,X
    lda #$00
    xba
    pla ;weapon_current
    asl
    ora.w weapon_double_jump_boost
    tay
    lda.w weapon_damage,Y : sta.w !obj_hp,X
    jsr _01DD90
    lda $0009,X : ora #$08 : sta $0009,X
    lda.w weapon_double_jump_boost
    tay
    lda.w sprite_shimmer_bit,Y : ora $0008,X : sta $0008,X
    lda !obj_facing : sta.w !obj_direction,X : sta.w !obj_facing,X
    lda $07 : sta $0007,X
    phx
    ldx.w weapon_current
    inc.w obj_type_count+1,X
    plx
.D4D7:
    rts

;-----

.D4D8: ;torch
    sta $0000
    sty $0001
    jsr get_weapon_slot_local
    bmi .D50A

    lda #$0C : sta.w !obj_active,X
    lda #$08 : sta $0009,X
    lda $1F25 : sta $002B,X
    lda $0000 : sta.w !obj_type,X
    jsr _01DD90
    lda $12 : sta.w !obj_direction,X : sta.w !obj_facing,X
    lda $0001 : sta $0007,X
.D50A:
    rts

;-----

.D50B: ;lance (and others)
    lda #$0C : sta.w weapon_cooldown
.D510:
    jsr .D47D
    bmi .D51B

    jsl set_spawn_offset
    !X8
.D51B:
    rts

;-----

.D51C: ;knife
    jsr .D47D
    bmi .D526

    jsr .D54E
    !X8
.D526:
    rts

;-----

.D527: ;bowgun
    lda.w obj_type_count+!id_bowgun
    cmp #$04
    bcs .D542

.D52E: ;creates 3 bolts, (1 gets removed later for base bowgun)
    ldx !obj_facing
    lda.w bowgun_facing_offset,X : sta $07
    jsr .D50B
    inc $07
    jsr .D50B
    inc $07
    jmp .D50B

.D542:
    rts ;unreachable?

;-----

.D543:
    lda.w obj_type_count+!id_bowgun2
    beq .D52E
    rts

.D549:
    stz $07
    jmp .D50B

;-----

.D54E:
    lda #$00 : xba : lda $1D
    lsr
    tay
    lda.w knife_rapid_count
    and #$03
    asl
    clc
    adc.w knife_base_offset,Y
    tay
    jsl set_spawn_offset_8C8A
    rts
}

{ ;D565 - D6F7
_01D565: ;a8 x?
    lda $14E3
    beq .D59E

    lda !armor_state
    cmp #!gold
    bne .D59E

    pla : pla
    jsl _019697
    jsr _01DDE6
    lda #$FF : sta $0F
    stz.w is_shooting
    jmp .D59F

.D584:
    stz $0F
    jsr _01DDEF_local
    lda $0276 : ora #$02 : sta $0276
    lda $08 : ora #$90 : sta $08
    lda #$2D : sta $2E
    jmp _01CCBD_CDC4

.D59E:
    rts

.D59F:
    lda.w magic_current : asl : tax
    jmp (+,X) : +: dw .thunder, .fire_dragon, .seek, .tornado, .shield, .lightning, .nuclear

;-----

.thunder:
    lda #$13 : sta $3C
    jsr _01EDAD
.D5BC:
    brk #$00

;----- D5BE

    jsr _01D957
    lda $14E3
    bne .D5BC

    lda #$21 : sta $30
.D5CA:
    brk #$00

;----- D5CC

    jsr _01D957
    dec $30
    bne .D5CA

    bra .D584

;-----

.fire_dragon:
    lda #$13 : sta $3C
    jsr _01EF44
.D5DC:
    brk #$00

;----- D5DC

    lda $14E3
    bne .D5DC

    lda #$21 : sta $30
.D5E7:
    brk #$00

;----- D5E9

    jsr _01D957
    dec $30
    bne .D5E7

    jmp .D584

;-----

.seek:
    lda.w bowgun_magic_active : sta $14F8
    lda #$01 : sta.w bowgun_magic_active
    jsr get_magic_slot
    bmi .D62C

    lda #$80 : sta $0008,X
    lda #$0C : sta.w !obj_active,X
    lda #$14 : sta.w !obj_type,X
    !X8
    lda #$FF : sta $0F
    stz $14B1
    jsr _01DDE6
    lda #$13 : sta $3C
.D622:
    brk #$00

;----- D624

    jsr _01D957
    lda $14E3
    bne .D622

.D62C:
    lda $14F8 : sta.w bowgun_magic_active
    jmp .D584

;-----

.tornado:
    lda #$13 : sta $3C
    jsr _01D6F8
    lda #$3F : sta $30
.D640:
    brk #$00

;----- D642

    jsr _01D957
    dec $30
    bne .D640

    stz $14E3
    jmp .D584

;-----

.lightning:
    lda #$13 : sta $3C
    jsr _01EC63
.D656:
    brk #$00

;----- D658

    jsr _01D957
    lda $14E3
    bne .D656

    lda #$21 : sta $30
.D664:
    brk #$00

;----- D666

    jsr _01D957
    dec $30
    bne .D664

    jmp .D584

;-----

.shield:
    lda $14E7
    bne .D6B5

    lda !open_magic_slots
    cmp #$03
    bcc .D6B5

    lda #$13 : sta $3C
    lda #$10 : sta $30
.D684:
    brk #$00

;----- D686

    jsr _01D957
    dec $30
    bne .D684

    inc $14E7
    lda #$56 : jsl _018049_8053
    lda #$02 : sta $0000
.D69B:
    jsr get_magic_slot
    lda #$0C : sta.w !obj_active,X
    lda #!id_shield_magic : sta.w !obj_type,X
    lda $0000 : sta $0007,X
    !X8
    dec $0000
    bpl .D69B

.D6B5:
    stz $14E3
    jmp .D584

;-----

.nuclear:
    lda #$13 : sta $3C
    jsr get_magic_slot
    lda #$0C : sta.w !obj_active,X
    lda #!id_nuclear : sta.w !obj_type,X
    lda #$80 : sta $0008,X
    !A16
    lda !arthur_pos_x+1 : sta.w !obj_pos_x+1,X
    sec : lda !arthur_pos_y+1 : sbc #$0040 : sta.w !obj_pos_y+1,X
    !AX8
    lda #$3F : sta $30
.D6E9:
    brk #$00

;----- D6EB

    jsr _01D957
    dec $30
    bne .D6E9

    stz $14E3
    jmp .D584
}

{ ;D6F8 - D72A
_01D6F8:
    lda #$01 : sta $0000
.D6FD:
    jsr get_magic_slot
    bmi .D725

    lda #$0C : sta.w !obj_active,X
    lda #!id_tornado : sta.w !obj_type,X
    !A16
    lda !arthur_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !arthur_pos_y+1 : sta.w !obj_pos_y+1,X
    lda $0000 : sta.w !obj_direction,X : sta.w !obj_facing,X
    !AX8
.D725:
    dec $0000
    bpl .D6FD

    rts
}

{ ;D72B - D8B2
_01D72B: ;a8 x8
    ;arthur_destroy
    lda.w is_frozen
    beq .D744

    !AX16
    ldx #$001E : lda #$0040 : ldy #$0100 : jsl _019136_9187
    !AX8
    stz.w is_frozen
.D744:
    ldy #$00
    ldx #$20
    sty $3E
    stx $3F
    stz.w transform_timer
    stz $14DF
    stz $14EF
    stz $14F5
    lsr.w weapon_current : asl.w weapon_current ;clear bit0
    inc $14F7
    inc.w jump_counter
    ldy #$00 : jsl set_speed_xyg ;knockback
    lda #$FF : sta $0F
    lda #$09 : sta $3C
    stz.w is_shooting
    stz !slot_upgrade
    stz !slot_upgrade+!obj_size*2
    lda !obj_hp
    bpl .D791

    ;0 hp
    stz $02AC
    stz !armor_state
    lda $08 : and #$EF : sta $08
    jsr _01DA88
    jmp .D819

.D791:
    lda.w transform_stored_armor_state : sta !armor_state
    ldy #$01 : jsr set_arthur_palette_D9DB
    lda #$2F : jsl _018049_8053 ;armor shatter sfx
    lda #$05 : sta $0000 ;armor piece count
    jsr _019697_96CA
    stz $0332
    inc $0331
.D7B0:
    jsr get_magic_slot
    lda #$0C : sta.w !obj_active,X ;0C: "create" enum value of sorts
    lda #!id_armor_piece : sta.w !obj_type,X
    jsr _01DD90
    lda $0008,X : ora #$80 : sta $0008,X
    lda $0000
    asl
    sta $003D,X ;store current loop counter in obj to tell them apart
    asl
    !A16
    and #$00FF
    tay
    clc
    lda !obj_pos_x+1 : adc.w _00BA8A+0,Y : sta.w !obj_pos_x+1,X
    clc
    lda !obj_pos_y+1 : adc.w _00BA8A+2,Y : sta.w !obj_pos_y+1,X
    !AX8
    dec $0000
    bpl .D7B0

    brk #$00

;----- D7F1

    stz !armor_state
    stz.w transform_stored_armor_state
.D7F7:
    jsr _01D8B3
    jsr _01D8F1
    jsr _01D91C
    jsr _01D8BF
    jsr _01D97E
    beq .D815

    ;landing after taking a hit
    lda #$7E : sta $2E
    lda $08 : ora #$10 : sta $08
    jmp _01CCBD_CDBE

.D815:
    brk #$00

;----- D817

    bra .D7F7

;-----

.D819:
    lda #$31 : jsl _018049_8053 ;death jingle
    lda #$1F : sta $30
.D823:
    brk #$00

;----- D825

    jsl update_animation_normal
    jsr _01D8B3
    jsr _01D8F1
    jsr _01D91C
    jsr _01D8BF
    jsr _01D97E
    dec $30
    bne .D823

    lda #$0A : sta $3C
.D840:
    brk #$00

;----- D842

    lda $0C
    cmp #$84
    beq +

    jsl update_animation_normal
+:
    jsr _01D8B3
    jsr _01D8F1
    jsr _01D91C
    jsr _01D8BF
    jsr _01D97E
    beq .D840 ;branch if not on ground yet

    lda #$3F : sta $30
    inc $14D1
.D864:
    brk #$00

;----- D866

    jsr _01D8BF
    jsr _01D957
    jsl update_animation_normal
    dec $30
    bne .D864

    jsr _01D8E6
.D877:
    brk #$00

;----- D879

    lda $00DE : bne .D877 ;check if fading is done

    lda #$00
    ldx $1FB9
    bne .D88D

    lda #$05
    ldx $14D2
    beq .D88D

    inc
.D88D:
    sta $0278
    stz $0279
    stz $0332
    inc $0331
    lda #$01 : sta $02AE
    stz $02AF
    stz $02B0
    stz $02B1
    lda.w weapon_current : and #$FE : sta $02AD
.D8AF:
    brk #$00

;----- D8B1

    bra .D8AF ;never reached? maybe just safety measure
}

{ ;D8B3 - D8BE
_01D8B3: ;a8 x-
    lda $1F91
    bne .D8BB

    jmp arthur_cap_fall_speed

.D8BB:
    inc $14C3
    rts
}

{ ;D8BF - D8E5
_01D8BF: ;a8 x-?
    lda !arthur_pos_y+2
    bmi .D8D4

    !A16
    clc
    lda $19E8
    adc #$0100
    cmp !arthur_pos_y+1
    !A8
    bcc .D8D5

.D8D4:
    rts

.D8D5:
    pla : pla
    stz !slot_upgrade2+!obj_active
    stz.w can_charge_magic
    stz $02AC
    jsr _01DDE6
    jmp _01DD5C
}

{ ;D8E6 - D8F0
_01D8E6: ;a8 x8
    lda.b #_01FF00_0C : ldy #$90 : ldx #$08 : jsl _01A6FE
    rts
}

{ ;D8F1 - D91B
_01D8F1: ;a8 x8
    lda !obj_speed_y+2
    bpl .D91A ;branch if falling

    ldy #$08 : jsl _01A4E2_A50E
    bcs .D905

    ldy #$08 : jsl _01A4E2_A508
    bcc .D919

.D905:
    ;this gets reached when being close to ground you can jump up through
    lda $001E ;0x1E in ram, common collision variable. type of tile behind arthur?
    bne .D91A

    !A16
    lda $14C1 : sta !obj_pos_y+1
    stz !slot_arthur+!obj_speed_y
    !A8
    stz !slot_arthur+!obj_speed_y+2

.D919:
    rts

.D91A:
    sec
    rts
}

{ ;D91C - D956
_01D91C: ;a x8
    ldy #$08 : jsl _01A4E2_A4E8
    bcc .D936

    lda $001E
    beq .D943

    ldy #$00 : jsl _01A4E2_A4E8
    bcc .D936

    lda $001E
    beq .D943

.D936:
    ldy #$04 : jsl _01A4E2_A4E8
    bcc .D94D

    lda $001E
    bne .D94D

.D943:
    lda $14BE : sta !obj_pos_x+1
    lda $14BF : sta !obj_pos_x+2
.D94D:
    rts

.D94E: ;a- x8
    ldy #$04
    jsl _01A4E2_A4E8
    bcs .D943

    rts
}

{ ;D957 - D97D
_01D957: ;a8 x-
    lda $14E9 : sta $14ED
    stz $15
    jsl _01A5AF
    php
    lda $14ED
    bne .D97C

    stz $14E9
    ldx.w stage
    ldy.w _00BA18,X
    phy
    jsl _01A4E2_A50E
    ply
    jsl _01A4E2_A508
.D97C:
    plp
    rts
}

{ ;D97E - D9C2
_01D97E: ;a8 x?
    lda !obj_speed_y+2
    bpl .D985
    lda #$00
    rts

.D985:
    !A16
    clc
    lda $19E8
    adc #$00E0
    cmp !obj_pos_y+1
    !A8
    bcc .D9C0

    lda $14C3
    bne .D9BF

    lda $14E9 : sta $14ED
    stz $15
    jsl _01A559
    php
    lda $14ED
    bne .D9BE

    stz $14E9
    ldx.w stage
    ldy.w _00BA18,X
    phy
    jsl _01A4E2_A50E
    ply
    jsl _01A4E2_A508
.D9BE:
    plp
.D9BF:
    rts

.D9C0:
    lda #$00
    rts
}

{ ;D9C3 - D9D7
get_weapon_slot: ;a8 x-
    jsr .local
    rtl

.local: ;D9C7 a8 x-
    ldy !open_weapon_slots
    bmi .D9D7

    !X16
    dec !open_weapon_slots : dec !open_weapon_slots
    ldx !slot_list_weapons,Y
.D9D7:
    rts
}

{ ;D9D8 - D9F9
set_arthur_palette: ;a- x8
    ldy !armor_state
.D9DB: ;a- x8
    ldx.w _00B440,Y
    ldy #$02
    !A16
.D9E2:
    lda.w _00B440,X
    phx
    tyx
    sta $7EF500,X
    plx
    inx #2
    iny #2
    cpy #$20
    bne .D9E2

    !A8
    inc $0331
    rts
}

{ ;D9FA - DA87
_01D9FA: ;arthur armor up code
    ldx #$90
    ldy #$06
.D9FE:
    lda $004E,X : sta $1FCB,Y
    lda #$02 : sta $004E,X
    dey
    sec
    txa
    sbc #$18
    tax
    bne .D9FE

    ldy #$00
    ldx #$20
    sty $3E
    stx $3F
    jsr _01DA88
    jsr _01DDE6
    lda #$FF : sta $0F
    stz.w is_shooting
    lda #$12 : sta $3C
    lda #$0C : sta !slot_upgrade2
    lda #!id_armor_up_vfx : sta !slot_upgrade2+!obj_type
    stz !slot_upgrade2+$08
    stz !slot_upgrade2+$09
    !A16
    lda !arthur_pos_x+1 : sta !slot_upgrade2+!obj_pos_x+1
    lda !arthur_pos_y+1 : sta !slot_upgrade2+!obj_pos_y+1
    !A8
    lda #$02 : sta $2F
.DA4E:
    brk #$00

;----- DA50

    dec $2F
    bne .DA4E

    inc $1F95
    stz $0332
    inc $0331
    lda #$24 : sta $39
.DA61:
    brk #$00

;----- DA63

    jsl update_animation_normal
    dec $39
    bne .DA61

    jsr _01DDEF_local
    stz $1F95
    stz $0F
    ldx #$90
    ldy #$06
.DA77:
    lda $1FCB,Y : sta $004E,X
    dey
    sec
    txa
    sbc #$18
    tax
    bne .DA77

    jmp _01CCBD_CDC4
}

{ ;DA88 - DA98
_01DA88: ;a8 x8
    ;todo: name? update arthur sprite set?
    ldy !armor_state
    ldx.w _00BAAA,Y
    lda.w _00ED00+0,X : sta $27
    lda.w _00ED00+1,X : sta $28
    rts
}

{ ;DA99 - DAA3
_01DA99: ;unused
    lda #$03 : sta $3C
    stz.w is_shooting
.DAA0:
    brk #$00

;-----

    bra .DAA0
}

{ ;DAA4 - DAB7
_01DAA4:
    lda !arthur_hp
    bmi .DAB7

    stx !arthur_state+1
    sty !arthur_state+2
    jsr _01DDE6
    lda #$FF : sta !slot_arthur+$0F
.DAB7:
    rtl
}

{ ;DAB8 - DB66
_01DAB8:
    lda #$16 : jsl _018049_8053
    stz $02AC
    stz !slot_upgrade2
    stz.w can_charge_magic
    stz.w is_shooting
    lda #$FF : sta $0F : sta $19EC
    lda #$01 : sta !obj_direction : sta !obj_facing
    stz $3C
    ldy #$00 : jsl set_speed_x
.DADF:
    brk #$00

;----- DAE1

    jsl update_animation_normal
    jsl update_pos_x
    !A16
    sec
    lda !obj_pos_x+1
    sbc.w camera_x+1
    cmp #$0040
    !A8
    bcs .DADF

    stz !obj_direction
    stz !obj_facing
    lda #$03 : sta $3C
    lda #$1F : cop #$00

;----- DB04

    lda #!id_intro_cutscene_obj : ldx #$00 : ldy #$16 : jsl _018C55
    !AX16
    ldy !open_object_slots
    ldx $13F3,Y : stx $35
    stz $002D,X
    clc : lda.w camera_x+1 : adc #$00C0 : sta.w !obj_pos_x+1,X
    !AX8
    stz $1EB7
.DB2A:
    brk #$00

;----- DB2C

    lda $1EB7
    beq .DB2A

    stz $3C
.DB33:
    brk #$00

;----- DB35

    jsl update_pos_x
    jsl update_animation_normal
    !AX16
    ldx $35
    lda.w !obj_pos_x+1,X
    sbc !obj_pos_x+1
    cmp #$000D
    !AX8
    bcs .DB33

    !X16
    lda #$03 : sta $3C
    ldx $35
    inc $002D,X
    lda #$7E : cop #$00

;----- DB5C

    ldx $35
    inc $002D,X
    !X8
.DB63:
    brk #$00

;----- DB65

    bra .DB63
}

{ ;DB67 - DC18
_01DB67: ;a8 x?
    lda #$04 : jsr _01DDCE
    stz $02AC
    stz !slot_upgrade2
    stz.w can_charge_magic
    stz.w is_shooting
    lda #$FF : sta $19EC
    lda #$FF : sta $0F
    stz !arthur_facing
    stz $0332
    inc $0331
    lda.w stage
    cmp #$08
    bne .DBA7

    lda.w loop
    beq .DB9F

    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    beq .DBA7

.DB9F:
    lda #$03 : sta $3C
.DBA3:
    brk #$00

;----- DBA5

    bra .DBA3

.DBA7:
    lda !armor_state
    bne .DBB4

    inc !armor_state
    lda #$01 : sta !arthur_hp
.DBB4:
    jsr _01DA88
    jsr set_arthur_palette
    jsl _01DCCF
    lda #$0E : sta $3C
    lda !slot_upgrade+$08 : and #$F7 : sta !slot_upgrade+$08
.DBCA:
    brk #$00

;----- DBCC

    lda $1F9F
    beq .DBCA

    lda !slot_upgrade+$08 : ora #$08 : sta !slot_upgrade+$08
    lda.w stage
    dec
    beq .DBE1

    stz $3C
.DBE1:
    jsr _01D8E6
.DBE4:
    !A8
    jsl update_animation_normal
    !A16
    inc !obj_pos_x+1
    brk #$00

;----- DBF0

    lda.w stage
    tay ;unused?
    asl
    tax
    lda.w _00BAB3,X
    cmp !obj_pos_x+1
    !A8
    bcs .DBE4

.DBFF:
    brk #$00

;----- DC01

    lda $00DE
    bne .DBFF

    lda #$02 : sta $0278
    stz $028F
    lda.w stage : inc : sta.w stage
.DC15:
    brk #$00

;----- DC17

    bra .DC15 ;unreachable?
}

{ ;DC19 -
_01DC19: ;hit by avalanche
    inc $14F5
    lda #$FF : sta $0F
    ldx !armor_state
    lda.w _00BAC5,X : sta $3C
.DC28:
    brk #$00

;----- DC2A

    lda $14EF
    beq .DC34

    jsr _01D957
    bne .DC28

.DC34:
    stz $14EF
    stz $0F
    stz $14F5
    lda !armor_state : asl : tax
    jmp (+,X) : +: dw _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4, arthur_baby_DF31, arthur_seal_E0AA, arthur_bee_E195, arthur_maiden_DFE8
}

{ ;DC56 - DCCE
_01DC56: ;a8 x8
    ;hit by water crash
    inc $14D1
    lda $09 : and #$CF : sta $09
    inc $14CB
    lda #$FF : sta $0F
    lda !armor_state
    cmp #$05
    bcs .DC77

    lda #$1D : sta $3C
    lda #!id_water_crash_splash : jsl prepare_object
.DC77:
    lda #$3F : sta $2D
    lda #!sfx_arthur_death : jsl _018049_8053
.DC81:
    clc
    lda !obj_pos_y+0 : adc $006D : sta !obj_pos_y+0
    lda !obj_pos_y+1 : adc $006E : sta !obj_pos_y+1
    lda !obj_pos_y+2 : adc $006F : sta !obj_pos_y+2
    brk #$00

;----- DC99

    dec $2D
    bne .DC81

.DC9D:
    jsr _01D8E6
.DCA0:
    brk #$00

;----- DCA2

    lda $00DE
    bne .DCA0

    lda #$05
    ldx $14D2
    beq .DCAF

    inc
.DCAF:
    sta $0278
    stz $0279
    lda #$01 : sta $02AE
    lda $14D3 : and #$FE : sta $02AD
    stz $02B0
    stz $02B1
    stz $02AF
.DCCB:
    brk #$00

;----- DCCD

    bra .DCCB ;unreachable
}

{ ;DCCF - DD00
_01DCCF: ;a8 x-
    ;store armor / upgrades / weapon across stages?
    stz $02B0
    stz $02B1
    stz $02AF
    lda !armor_state : sta $02AE
    lda.w weapon_current : sta $02AD
    lda !slot_upgrade
    beq .DD00

    lda !slot_upgrade+!obj_type : sta $02AF
    lda !slot_shield
    beq .DD00

    lda !slot_shield+!obj_type : sta $02B0
    lda !slot_shield+$07 : sta $02B1
.DD00:
    rtl
}

{ ;DD01 - DD44
_01DD01: ;a8 x8
    inc.w jump_counter
    ldx !armor_state
    lda.w _00BACE,X : sta $3C
    ldy #$01 : jsl set_speed_xyg
    lda #$FF : sta $0F
    stz.w is_shooting
.DD19:
    brk #$00

;----- DD1B

    jsl update_pos_xyg_add
    lda !obj_speed_y+2
    bmi .DD19

    jsr _01D97E_D985
    beq .DD19

    stz.w jump_counter
    lda !armor_state : asl : tax
    jmp (+,X)

+:
    dw _01CCBD_CDBE, _01CCBD_CDBE, _01CCBD_CDBE, _01CCBD_CDBE, _01CCBD_CDBE ;armors
    dw arthur_baby_DF31, arthur_seal_E0AA, arthur_bee_E195, arthur_maiden_DFE8 ;transformations
}

{ ;DD45 - DD5B
arthur_cap_fall_speed: ;a8 x-
    jsl update_pos_xyg_add
    lda !obj_speed_y+2
    bmi .DD5B

    lda !obj_speed_y+1
    cmp #$07
    bcc .DD5B

    stz !obj_speed_y
    lda #$06 : sta !obj_speed_y+1
    stz !obj_gravity
.DD5B:
    rts
}

{ ;DD5C - DD79
_01DD5C: ;a8 x?
    inc $14D1
    lda #$FF : sta $0F
    lda !obj_hp
    bmi .DD6D

    lda #!sfx_arthur_death : jsl _018049_8053
.DD6D:
    lda #$3F : sta $2F
.DD71:
    brk #$00

;----- DD73

    dec $2F
    bne .DD71

    jmp _01DC56_DC9D
}

{ ;DD7A - DD8F
_01DD7A:
    ldy.w current_cage
    lda $09 : and #$CF : ora.w _00BAD7+0,Y : sta $09
    lda $08 : and #$F8 : ora.w _00BAD7+3,Y : sta $08
    rts
}

{ ;DD90 - DD9F
_01DD90: ;a8 x16
    ;layer/depth related
    ldy.w current_cage
    lda.w _00BAD7+0,Y : sta $0009,X
    lda.w _00BAD7+3,Y : sta $0008,X
    rts
}

{ ;DDA0 - DDAD
    ;unused
    lda.b #_01DA99    : sta !arthur_state+1
    lda.b #_01DA99>>8 : sta !arthur_state+2
    stz !slot_arthur+$0F
    rtl
}

{ ;DDAE - DDCD
_01DDAE: ;a9 x-
    lda.b #_01DB67    : sta !arthur_state+1
    lda.b #_01DB67>>8 : sta !arthur_state+2
    stz !slot_arthur+$0F
    !AX16
    ldx #$01C7
.DDC0:
    stz $0707,X
    sec
    txa
    sbc #$0041
    tax
    bpl .DDC0

    !AX8
    rtl
}

{ ;DDCE - DDD9
_01DDCE: ;a8 x-
    jsr _01DDE6_DDE8
    lda !slot_arthur+$08 : ora #$80 : sta !slot_arthur+$08
    rts
}

{ ;DDDA - DDE5
    ;unused
    jsr _01DDE6
    lda !slot_arthur+$08 : ora #$80 : sta !slot_arthur+$08
    rtl
}

{ ;DDE6 - DDEE
_01DDE6: ;a8 x-
    lda #$01
.DDE8:
    ora $0276
    sta $0276
    rts
}

{ ;DDEF - DDFB
_01DDEF:
    ;unused far call
    jsr .local
    rtl

.local: ;a8 x-
    lda $0276 : and #$FE : sta $0276
    rts
}

{ ;DDFC - DE0A
_01DDFC:
    ;in rotating platform
    ldx !armor_state
    lda.w _00BADD,X : sta $3C
.DE04:
    brk #$00

;----- DE06

    jsr _01D090_D2D4
    bra .DE04
}

{ ;DE0B - DE61
_01DE0B: ;a8 x8
    ldx.w stage
    cpx #$06
    bne .DE17

    lda.w checkpoint
    bne .DE4D

.DE17:
    lda.w _00BAE6+00,X : sta $02D5 : sta $02C7
    lda.w _00BAE6+10,X : sta $02D6 : sta $02C8
    lda.w _00BAE6+20,X : sta $02D7
    lda.w _00BAE6+30,X : sta $02D8
    lda $0292
    beq .DE4C

    lda $02D7 : sta $02D5 : sta $02C7
    lda $02D8 : sta $02D6 : sta $02C8
.DE4C:
    rtl

.DE4D:
    lda #$15
    sta $02D5
    sta $02D6
    sta $02D7
    sta $02D8
    sta $02C7
    sta $02C8
    rtl
}

{ ;DE62 - DEE6
_01DE62:
    rts

.DE63: ;a8 x8
    lda.w is_frozen
    beq _01DE62

    pla : pla
    lda #$03 : sta $3C
    ldy #$09 : jsr set_arthur_palette_D9DB
    !A16
    ldx #$1E
.DE77:
    lda $7EF500,X : sta $7EF540,X : sta $7EF560,X
    dex #2
    bpl .DE77

    !A8
    inc $0331
    lda #$43 : jsl _018049_8053
    lda #$FF : sta $0F
    lda.w jump_counter
    beq .DEAB

    ldy #$0C : jsl set_speed_xyg
.DEA1:
    brk #$00

;----- DEA3

    jsr arthur_cap_fall_speed
    jsr _01D97E_D985
    beq .DEA1

.DEAB:
    brk #$00

;-----  DEAD

    lda.w shot_press
    beq .DEAB

    lda #$04 : sta $2F
.DEB6:
    !A16
    inc !obj_pos_x+1
    brk #$00

;----- DEBC

    dec !obj_pos_x+1
    brk #$00

;----- DEC0

    !A8
    dec $2F
    bne .DEB6

    dec.w frozen_counter
    bpl .DEAB

    !AX16
    ldx #$001E : lda #$0040 : ldy #$0100 : jsl _019136_9187
    !AX8
    jsr set_arthur_palette
    stz $0F
    stz.w is_frozen
    jmp _01CCBD_CDC4
}

{ ;DEE7 - DF28
_01DEE7:
    rts

.DEE8: ;a8 x8
    lda $14EB
    beq _01DEE7

    dec
    sta $14EB
    beq .DEF9

    lda !slot_upgrade2+$35
    and #$07
    asl
.DEF9:
    tax
    jmp (+,X) : +: dw set_arthur_palette, .DF14, .DF14, .DF0D, .DF0D, .DF0D, .DF0D, set_arthur_palette

;-----

.DF0D:
    !AX16
    lda #$2529
    bra .DF19

.DF14:
    !AX16
    lda #$739C
.DF19:
    ldx #$001E
.DF1C:
    sta $7EF500,X
    dex
    bne .DF1C

    !AX8
    inc $0331
    rts
}

{ ;DF29 - DFDF
arthur_baby: ;a8 x8
    ldy #$EA : ldx #$20 : jsl set_sprite
.DF31:
    lda #$00 : sta $3C
    stz.w jump_state
    stz.w jump_counter
    stz $0F
    lda !obj_facing : sta !obj_direction
.DF41:
    lda #$02 : jsr _01CCBD_CE9C
    lda #$02 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    bne .DF56

    brk #$00

;----- DF54

    bra .DF41

.DF56:
    brk #$00

;----- DF58

    lda #$01 : sta $3C
    ldy #$2A : jsl set_speed_x
    lda !obj_facing : sta !obj_direction
.DF66:
    jsr _01CCBD_CE85
    lda #$02 : jsr _01CCBD_CE9C
    lda #$02 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    bne .DF7F

    brk #$00

;----- DF84

    jmp .DF31

.DF7F:
    jsr _01D957
    brk #$00

;----- DF84

    bra .DF66

;-----

.jump: ;a8 x8
    lda #$02 : sta $3C
    inc.w jump_counter
    lda #!sfx_jump : jsl _018049_8053
    jsr _01D090_D2D4
    ldy.w _00BA2A,X : jsl set_speed_xyg
    lda !obj_facing : sta !obj_direction
.DFA1:
    brk #$00

;----- DFA3

    jsr _01D090_D2D4
    jsr arthur_cap_fall_speed
    jsr _01D8F1
    jsr _01D91C
    jsr _01D97E
    beq .DFA1 ;branch if still in the air

    lda #$03 : sta $3C
    lda #$20 : sta $31
.DFBC:
    brk #$00

;----- DFBE

    jsr _01D97E
    dec $31 ;crying timer
    bne .DFBC

    jmp .DF31

;-----

.fall:
    ldy #$0C : jsl set_speed_xyg
    inc.w jump_counter
.DFD1:
    jsr arthur_cap_fall_speed
    jsr _01D97E_D985
    bne .DFDD

    brk #$00

;----- DFDB

    bra .DFD1

.DFDD:
    jmp .DF31
}

{ ;DFE0 - E0A1
arthur_maiden:
    ldy #$FC : ldx #$20 : jsl set_sprite
.DFE8:
    lda #$00 : sta $3C
    stz.w jump_state
    stz.w jump_counter
    stz $0F
    lda !obj_facing : sta !obj_direction
.DFF8:
    brk #$00

;----- DFFA

    lda #$08 : jsr _01CCBD_CE9C
    lda #$08 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    bne .E01E

    bit #!down
    beq .DFF8

    lda #$02 : sta $3C
.E013:
    brk #$00

;----- E015

    lda.w p1_button_hold+1
    bit #!down
    bne .E013

    bra .DFE8

.E01E:
    lda #$01 : sta $3C
    ldy #$5A : jsl set_speed_x
    lda !obj_facing : sta !obj_direction
.E02C:
    jsr _01CCBD_CE85
    lda #$08 : jsr _01CCBD_CE9C
    lda #$08 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    bne .E045

    brk #$00

;----- E042

    jmp .DFE8

.E045:
    jsr _01D957
    brk #$00

;----- E04A

    bra .E02C

;-----

.jump:
    lda #$2B : jsl _018049_8053
    lda #$04 : sta $3C
    inc.w jump_counter
    lda #$2B : jsl _018049_8053
    jsr _01D090_D2D4
    lda.w _01BB0E_BB0E,X : sta $3C
    ldy.w _01BB0E_BB12,X : jsl set_speed_xyg
    lda !obj_facing : sta !obj_direction
.E072:
    brk #$00

;----- E074

    jsr _01D090_D2D4
    jsr arthur_cap_fall_speed
    jsr _01D8F1
    jsr _01D91C
    jsr _01D97E
    beq .E072

    brk #$00

;----- E087

    jmp .DFE8

;-----

.fall:
    ldy #$0C : jsl set_speed_xyg
    inc.w jump_counter
.E093:
    jsr arthur_cap_fall_speed
    jsr _01D97E_D985
    bne .E09F

    brk #$00

;----- E09D

    bra .E093

.E09F:
    jmp .DFE8
}

{ ;E0A2 - E18C
arthur_seal: ;a? x8
    ldy #$08 : ldx #$21 : jsl set_sprite
.E0AA:
    lda #$00 : sta $3C
    stz.w jump_state
    stz.w jump_counter
    stz $0F
    lda !obj_facing : sta !obj_direction
.E0BA:
    brk #$00

;----- E0BC

    lda #$04 : jsr _01CCBD_CE9C
    lda #$04 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    beq .E0BA

    lda #$01 : sta $3C
    ldy #$5A : jsl set_speed_x
    lda !obj_facing : sta !obj_direction
.E0DB:
    jsr _01CCBD_CE85
    lda #$04 : jsr _01CCBD_CE9C
    lda #$04 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    bne .E0F4

    brk #$00

;----- E0F1

    jmp .E0AA

.E0F4:
    jsr _01D957
    brk #$00

;----- E0F9

    bra .E0DB

;-----

.jump:
    lda #$02 : sta $3C
    inc.w jump_counter
    lda #$2B : jsl _018049_8053
    jsr _01D090_D2D4
    ldy.w _01BB16,X : jsl set_speed_xyg
    lda !obj_facing : sta !obj_direction
    lda #$2B : jsl _018049_8053
.E11C:
    brk #$00

;----- E11E

    jsr .E155
    lda #!b
    bit.w p1_button_press+1
    beq .E11C

    lda #$2B : jsl _018049_8053
    lda #$03 : sta $3C
    lda #$08 : sta $2F
.E136:
    brk #$00

;----- E138

    dec $2F
    bne .E136

    jsr _01D090_D2D4
    ldy.w _01BB16,X : jsl set_speed_xyg
    lda !obj_facing : sta !obj_direction
    lda #$02 : sta $3C
.E14E:
    brk #$00

;----- E150

    jsr .E155
    bra .E14E

;-----

.E155:
    jsr _01D090_D2D4
    jsr arthur_cap_fall_speed
    jsr _01D8F1
    jsr _01D91C
    jsr _01D97E
    bne .E16F

    lda !obj_speed_y+2
    bmi .E174

    lda $14C3
    beq .E174

.E16F:
    pla : pla
    jmp .E0AA

.E174:
    rts

;-----

.fall:
    ldy #$0C : jsl set_speed_xyg
    inc.w jump_counter
.E17E:
    jsr arthur_cap_fall_speed
    jsr _01D97E_D985
    bne .E18A

    brk #$00

;----- E188

    bra .E17E

.E18A:
    jmp .E0AA
}

{ ;E18D - E223
arthur_bee:
    ldy #$60 : ldx #$20 : jsl set_sprite
.E195:
    lda #$00 : sta $3C
    stz.w jump_state
    stz.w jump_counter
    stz $0F
    lda !obj_facing : sta !obj_direction
.E1A5:
    brk #$00

;----- E1A7

    lda #$06 : jsr _01CCBD_CE9C
    lda #$06 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    beq .E1A5

    ldy #$60 : jsl set_speed_x
    lda !obj_facing : sta !obj_direction
.E1C2:
    jsr _01CCBD_CE85
    lda #$06 : jsr _01D090_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    bne .E1D6

    brk #$00

;----- E1D3

    jmp .E195

.E1D6:
    jsr _01D957
    bne .E1EB

    !A16
    lda $14BE : sta !arthur_pos_x+1
    lda $14BE : sta !arthur_pos_x+1 ;duplicate load+store
    !A8
.E1EB:
    brk #$00

;----- E1ED

    bra .E1C2

;-----

.jump:
    inc.w jump_counter
    lda #$2B : jsl _018049_8053
    jsr _01D090_D2D4
    ldy #$33 : jsl set_speed_xyg
    lda !obj_facing : sta !obj_direction
.E205:
    brk #$00

;----- E207

    jsr _01D090_D2D4
    jsr arthur_cap_fall_speed
    jsr _01D8F1
    jsr _01D91C
    jsr _01D97E
    bne .E221

    lda !obj_speed_y+2
    bmi .E205

    lda $14C3
    beq .E205

.E221:
    jmp .E195
}

{ ;E224 - E284
_01E224:
    lda #$E0 : sta $14F4
.E229: ;a8 x8
    ldx $0F
    jmp (+,X) : +: dw .E234, .E240, .E262

.E234:
    lda #!sfx_hit : jsl _018049_8053
    ldy #$44 : ldx #$20 ;hit gfx
    bra .E24A

.E240:
    ;convert to collision sprite
    lda #$69 : jsl _018049_8053 ;weapon solid collision sfx
    ldy #$46 : ldx #$20 ;collision particle gfx
.E24A:
    jsl set_sprite
    lda $08 : and #$DF : sta $08
    lda #$09 : sta $2D
.E258:
    brk #$00

;----- E25A

    jsl update_animation_normal
    dec $2D
    bne .E258

.E262:
    jml _0280CB_remove_weapon

.E266:
    pla : pla
    bra .E240

.E26A: ;a8 x
    ;weapon update
    lda $1F91
    bne .E27A

    jsl _01A4E2_A52B
    bcc .E27A

    lda $001E
    beq .E266

.E27A:
    bit $09
    bvs .E284

    pla : pla
    jml _0280CB_remove_weapon

.E284:
    rts
}

{ ;E285 - E2AA
_01E285:
    lda $1F91
    bne .E2A2

    jsl _01A4E2_A52B
    bcc .E2A2

    lda $001E
    bne .E2A2

    lda #$8C : sta $00
    asl $09 : lsr $09
    lda #$02 : sta $0F
    rts

.E2A2:
    bit $09
    bvs .E2AA

    jml _0280CB

.E2AA:
    rts
}

{ ;E2AB -
_01E2AB: ;a8 x8
    ;create lance
    lda #!sfx_lance : jsl _018049_8053
    ldy #$3E : ldx #$20 : jsl set_sprite
    stz $2D
    jsr _01DD90 ;bug? incorrect setup to call the depth/layer function
    ldy #$4B : jsl set_speed_x
.E2C4:
    brk #$00

;----- E2C6

    jsl update_pos_x
    jsr _01E224_E26A
    bra .E2C4
}

{ ;E2CF - E350
_01E2CF:
    lda #!sfx_lance2 : jsl _018049_8053
    ldy #$40 : ldx #$20 : jsl set_sprite
    ldy #$99 : jsl set_speed_x
    lda #$34 : sta $1D
    stz $2D
    stz $2F
    stz $30
    lda #$01 : sta $2E ;delay until creating fire trail
    jsr _01DD90
.E2F4:
    brk #$00

;----- E2F6

    jsl update_pos_x
    jsr _01E224_E26A
    lda $2E
    bmi .E307

    dec $2E
    bpl .E30A

    bra .E30A

.E307:
    jsr .E311
.E30A:
    jsl update_animation_normal
    jmp .E2F4

;-----

.E311:
    dec $2D
    bpl .E350

    lda #$02 : sta $2D
    jsr get_weapon_slot_local
    bmi .E350

    jsr _01DD90
    lda #$0C : sta.w !obj_active,X
    lda #!id_lance_fire_trail : sta.w !obj_type,X
    lda $08 : and #$27 : ora #$90 : sta $0008,X
    lda #$08 : ora $0009,X : sta $0009,X
    lda $12 : sta.w !obj_direction,X : sta.w !obj_facing,X
    jsl set_spawn_offset
    !AX8
    lda $2F : eor #$01 : sta $2F
.E350:
    rts
}

{ ;E351 - E377
_01E351: ;a8 x8
    ;knife
    lda #!sfx_knife : jsl _018049_8053
    ldy #$3C : ldx #$20 : jsl set_sprite
    lda #$18 : sta.w knife_rapid_timer
    inc.w knife_rapid_count
    ldy #$0A : jsl set_speed_xyg
.E36D:
    brk #$00

;----- E36F

    jsl update_pos_x
    jsr _01E224_E26A
    bra .E36D
}

{ ;E378 - E533
_01E378:
    ;knife2
    lda $09 : ora #$42 : sta $09
    stz $40
    lda #$29 : jsl _018049_8053
    ldy #$5E : ldx #$20 : jsl set_sprite
    lda #$18 : sta.w knife_rapid_timer
    inc.w knife_rapid_count
    lda #$08 : sta $10
    ldy #$41 : jsl set_speed_xyg
    stz $3C
    !A8
.E3A4:
    brk #$00

;----- E3A6

    jsl _018836
    lda !obj_speed_x+2
    bpl .E3A4

    inc $3C
    lda !obj_direction : asl : tax
    !A16
    lda.w _01BC08_BC08,X : sta $37
    lda.w _01BC08_BC0C,X : sta $35
    lda !obj_pos_x+1 : sta $31
    lda #$262F : sta $39
    !A8
    jsr get_weapon_slot_local
    bmi .E408

    jsr _01DD90
    lda #$0C : sta.w !obj_active,X
    lda #$80 : ora $0008,X : sta $0008,X
    lda #$08 : ora $0009,X : sta $0009,X
    lda #!id_knife2_shimmer : sta.w !obj_type,X
    lda !obj_facing : sta.w !obj_facing,X
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_x+2 : sta.w !obj_pos_x+2,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    lda !obj_pos_y+2 : sta.w !obj_pos_y+2,X
    !X8
.E408:
    brk #$00

;----- E40A

    lda $08 : and #$F7 : sta $08
    ldy #$41 : jsl set_speed_xyg
.E416:
    brk #$00

;----- E418

    jsl update_pos_x
    !A16
    sec
    lda !obj_pos_x+1
    sbc $31
    bpl .E429

    eor #$FFFF
    inc
.E429:
    cmp #$0040
    bcc .E43A

    lda !obj_direction
    asl
    tax
    clc : lda.w _01BB1A,X : adc !obj_pos_x+1 : sta $31
.E43A:
    !A8
    jsr .E44C
    lda $09
    and #$40
    bne .E416

    jml _0280CB_remove_weapon

;-----

.E449:
    !AX8
    rts

.E44C:
    !A16
    clc
    lda.w camera_y+1
    adc #$0080
    sec
    sbc !obj_pos_y+1
    clc
    adc #$0088
    cmp #$0110
    bcs .E449

    sec : lda !obj_pos_x+1 : sbc.w camera_x+1 : sec : sbc #$0004 : sta $2F
    sec : lda !obj_pos_y+1 : sbc.w camera_y+1 : sec : sbc #$0004 : sta $33
    ldx $0374
    lda $2F : sta $7EF100,X
    jsr _01E967
    lda $33 : sta $7EF101,X
    lda $39 : eor $37 : sta $7EF102,X
    sec : lda $31 : sbc.w camera_x+1 : sec : sbc #$0004 : sta $7EF104,X
    jsr _01E967
    lda $33 : sta $7EF105,X
    lda #$222E : eor $37 : sta $7EF106,X
    clc
    txa
    adc #$0008
    tax
    dec $0344 : dec $0344
    sec
    lda !obj_pos_x+1
    sbc $31
    bpl .E4CA

    eor #$FFFF
    inc
.E4CA:
    lsr #3
    beq .E4F9

    sta $2D
.E4D1:
    clc : lda $2F : adc $35 : sta $2F : sta $7EF100,X
    jsr _01E967
    lda $33 : sta $7EF101,X
    lda #$262E : eor $37 : sta $7EF102,X
    inx #4
    dec $0344
    dec $2D
    bne .E4D1

.E4F9:
    !A8
    stx $0374
    rts

;-----

.destroy:
    lda $3C
    beq .E52E

    inc $3B
    lda !obj_direction : asl : tax
    !A16
    lda #$2621 : sta $39
    clc
    lda $31
    adc.w _01BB1A_BB1E,X
    sta $31
    sec
    sbc !obj_pos_x+1
    bpl .E521

    eor #$FFFF
    inc
.E521:
    !A8
    cmp #$08
    bcc .E52E

    jsr .E44C
    brk #$00

;----- E52C

    bra .destroy

.E52E:
    !AX8
    jml _0280CB_remove_weapon
}

{ ;E534 - E559
_01E534:

.create:
    lda #$29 : jsl _018049_8053
    lda $08 : ora #$10 : sta $08
    ldy #$DE : ldx #$20 : jsl set_sprite
    lda #$18 : sta $2D
.E54C:
    brk #$00

;----- E54E

    jsl update_animation_normal
    dec $2D
    bne .E54C

    jml _0280CB_remove_weapon
}

{ ;E55A - E58F
_01E55A: ;a8 x8
    lda #$21 : jsl _018049_8053 ;bowgun sfx
    lda $07 : sta !obj_direction
    cmp #$01
    beq .E56E ;remove second bolt

    cmp #$04
    beq .E56E

    bra .E572

.E56E:
    jml _0280CB_remove_weapon

.E572:
    tax
    lda.w _00BB22_bowgun_facing,X : sta !obj_facing
    lda.w _00BB22,X : ldy #$3A : ldx #$21 : jsl set_sprite_8480
.E583:
    brk #$00

;----- E585

    ldx #$20 : jsl update_pos_xy_2
    jsr _01E224_E26A
    bra .E583
}

{ ;E590 -
_01E590:
    ;bowgun2
    lda #$C0 : ora $09 : sta $09
    lda #$80 : sta $35
    lda #$28 : jsl _018049_8053
    ldx $07
    phx
    stz !obj_facing
    lda.w _00BB22_BB3A,X : sta !obj_direction
    lsr         : sta $3C
    ldy #$1A : ldx #$21 : jsl set_sprite
    pla : clc : adc #$02 : cop #$00

;----- E5BB

    lda $07 : asl : tax
    !X16
    ldy.w _00BB22_BB2E,X : sty $2D
.E5C6:
    ldx $2D
.E5C8:
    stx $2F
    brk #$00

;----- E5CC

    ldx $2F
    ldx $2F ;duplicate ldx
    lda.w !obj_active,X
    beq .E5EC

    lda #$00
    xba
    lda.w !obj_type,X : tay
    lda.w _00BB22_BB40-$10,Y
    and #$0F
    bne .E5EC

    lda $0008,X
    bmi .E5EC

    bit #$08
    bne .E5FE

.E5EC:
    !A16
    clc
    lda $2F
    adc #!obj_size*3
    tax
    !A8
    cpx #!slot_upgrade
    bcc .E5C8

    bra .E5C6

.E5FE:
    stx $31
.E600:
    lda #$02 : cop #$00

;----- E604

    lda $35
    beq .E614

    dec $35
    !AX16
    ldx $31 : jsl set_direction32_custom_obj
    !AX8
.E614:
    ldx #$01
    sec
    sbc !obj_direction
    and #$1F
    cmp #$10
    bcc .E621

    ldx #$FF
.E621:
    txa : clc : adc !obj_direction : and #$1F : sta !obj_direction
    lsr :                                       sta $3C
    !X16
    ldx $31
    lda.w !obj_active,X
    beq .E5C8

    lda $0008,X
    bmi .E5C8

    bra .E600

;-----

.thing:
    ldx #$24 : jsl update_pos_xy_2
    jsl set_sprite_84A7
    jsl update_animation_normal
    jsr _01E285
    lda !obj_direction : lsr : tax
    lda.w _00BB22_BB40,X : sta !obj_facing
    rtl
}

{ ;E657 - E6FC
_01E657:

.scythe2_create:
    ldy #$98
    ldx #$20
    bra .E661

.scythe_create:
    ldy #$94 : ldx #$20
.E661:
    jsl set_sprite
    lda #$23 : jsl _018049_8053
    stz $3C
    lda $09 : ora #$C1 : sta $09
    ldy #$0B : jsl set_speed_xyg
    !A16
    lda.w #_00BBF6-2 : sta $13
    !A8
    lda !slot_arthur+$09
    lsr
    bcs .E6A6

.E688:
    brk #$00

;----- E68A

    jsl update_pos_xy
    jsl _01A559
    beq .E688

.E694:
    ldy #$0B : jsl set_speed_xyg
.E69A:
    brk #$00

;----- E69C

    jsl update_pos_xy
    jsl _01A593
    bne .E69A

.E6A6:
    ldy #$0B : jsl set_speed_xyg
.E6AC:
    brk #$00

;----- E6AE

    jsl update_pos_xyg_add
    jsl _01A559
    beq .E6AC

    bra .E694

;-----

.thing:
    jsr _01E285
    jml update_animation_normal

;-----

.scythe_destroy:
    lda #$01
    bra .E6C7

.scythe2_destroy:
    lda #$03
.E6C7:
    sta $38
    lda $0F
    cmp #$02
    bne .E6D2

    jmp _01E224_E240
.E6D2:
    lda #$38 : jsl _018049_8053
.E6D8:
    lda #$08 : sta $37
    ldy #$96 : ldx #$20 : jsl set_sprite
.E6E4:
    jsl update_animation_normal
    brk #$00

;----- E6EA

    dec $37
    bne .E6E4

    lda !obj_facing : eor #$01 : sta !obj_facing
    dec $38
    bne .E6D8

    inc $3C
    jmp _01E224_E229
}

{ ;E6FD - E75D
_01E6FD: ;a8 x8
    ;torch
    lda #$04 : sta $1D
    lda.b #coord_offsets_torch    : sta $13
    lda.b #coord_offsets_torch>>8 : sta $14
    ldy #$6A : ldx #$20
    lda !obj_type
    cmp #!id_torch
    beq .E717

    ldy #$74 : ldx #$20 ;torch2
.E717:
    jsl set_sprite
    ldy #$0D : jsl set_speed_xyg
    brk #$00

;----- E723

.E723:
    brk #$00

;----- E725

    jsl update_animation_normal
    jsl update_pos_xyg_add
    jsr _01E224_E26A
    lda $1F91
    bne .E723

    jsl _01A559
    beq .E723

    ;ground collision
    lda #!id_torch_flame
    ldx !obj_type
    cpx #!id_torch
    beq .E745

    lda #!id_torch2_flame ;torch2
.E745:
    ldy #$00
    jsr _01D090_D4D8
    bmi .E752

    jsl set_spawn_offset
    !X8
.E752:
    stz $08
    stz $09
    lda #$3F : cop #$00

;----- E75A

    jml _0280CB_remove_weapon
}

{ ;E75E - E835
_01E75E: ;a8 x8
    ;torch flame
    stz $3C
    !A16
    lda.w #coord_offsets_torch : sta $13
    !A8
    lda $08 : and #$DF : ora #$80 : sta $08
    jsl _01A593
    jsl _01A4E2_A52B
    bcs .E7A3 ;branch if encountering a non-solid tile

    brk #$00

;----- E77D

    lda $07
    beq .E7AD

    !A16
    lda #$0008 : sta $2D
    clc
    lda.w camera_y+1
    adc #$0100
    sec
    sbc !obj_pos_y+1
    lsr #3
    !A8
    inc
    sta $2F
    lda #$01 : sta $1F32
.E79F:
    dec $2F
    bne .E7A7

.E7A3:
    jml _0280CB_remove_weapon

.E7A7:
    jsl _01939D
    beq .E79F

.E7AD:
    lda #$52 : sta $1D
    lda #$03 : sta !obj_hp
    lda $07
    beq .E7C3

    lda #$08 : cop #$00

;----- E7BD

    lda $07
    cmp #$03
    beq .E7D3

.E7C3:
    lda #!id_torch_flame
    ldy $07
    iny
    jsr _01D090_D4D8
    bmi .E7D3

    jsl set_spawn_offset
    !X8
.E7D3:
    lda #$24 : jsl _018049_8053 ;torch sfx
    lda $08 : and #$7F : sta $08
    lda #$82 : ora $09 : sta $09
    stz $40
    ldy #$6C : ldx #$20 : jsl set_sprite
    lda #$0C : cop #$00

;----- E7F3

    ldy #$48 : jsl set_speed_y
    lda #$08 : sta $2F
    ldy #$A0 : ldx #$20 : jsl set_sprite
    inc $3C
.E807:
    brk #$00

;----- E809

    jsl update_pos_y
    dec $2F
    bne .E807

    ldy #$B6 : ldx #$20 : jsl set_sprite
    lda #$0C : cop #$00

;----- E81D

    jml _0280CB_remove_weapon

;-----

.E821: ;a8 x8
    lda $C3
    and #$03
    bne .E829

    inc $40
.E829:
    jsl update_animation_normal
    lda $3C
    bne .E835

    jsl _01A593
.E835:
    rtl
}

{ ;E836 - E8F8
_01E836:

.create:
    stz $3C
    !A16
    lda.w #coord_offsets_torch : sta $13
    !A8
    lda $08 : and #$DF : ora #$80 : sta $08
    jsl _01A593
    jsl _01A4E2_A52B
    bcs .E87B

    brk #$00

;----- E855

    lda $07
    beq .E885

    !A16
    lda #$0008 : sta $2D
    clc
    lda.w camera_y+1
    adc #$0100
    sec
    sbc !obj_pos_y+1
    lsr #3
    !A8
    inc
    sta $2F
    lda #$01 : sta $1F32
.E877:
    dec $2F
    bne .E87F

.E87B:
    jml _0280CB_remove_weapon

.E87F:
    jsl _01939D
    beq .E877

.E885:
    lda #$52 : sta $1D
    lda #$03 : sta !obj_hp
    lda $07
    beq .E89B

    lda #$08 : cop #$00

;----- E895

    lda $07
    cmp #$03
    beq .E8AB

.E89B:
    lda #$2B
    ldy $07
    iny
    jsr _01D090_D4D8
    bmi .E8AB

    jsl set_spawn_offset
    !X8
.E8AB:
    lda #$24 : jsl _018049_8053
    lda $08 : and #$7F : sta $08
    lda #$82 : ora $09 : sta $09
    stz $40
    ldy #$6E : ldx #$20 : jsl set_sprite
    lda #$0C : cop #$00

;----- E8CB

    ldy #$48 : jsl set_speed_y
    lda #$14 : sta $2F
    ldy #$70 : ldx #$20 : jsl set_sprite
    inc $3C
.E8DF:
    brk #$00

;----- E8E1

    jsl update_pos_y
    dec $2F
    bne .E8DF

    ldy #$E0 : ldx #$20 : jsl set_sprite
    lda #$0C : cop #$00

;----- E8F5

    jml _0280CB_remove_weapon
}

{ ;E8F9 - E966
_01E8F9:
    lda $09 : ora #$80 : sta $09
    stz $2D
    lda #$02 : sta $2E
    ldy #$5A : ldx #$21 : jsl set_sprite
    lda #$06 : cop #$00

;----- E911

    ldy #$5C : ldx #$21 : jsl set_sprite
    lda #$06 : cop #$00

;----- E91D

    ldy #$5E : ldx #$21 : jsl set_sprite
    lda #$06 : cop #$00

;----- E929

    ldy #$E8 : ldx #$20 : jsl set_sprite
    lda #$02 : cop #$00

;----- E935

    jml _0280CB_remove_weapon

;-----

.E939:
    jsl update_animation_normal
    dec $2E
    bne .E94B

    lda #$04 : sta $2E
    lda $2D : eor #$01 : sta $2D
.E94B:
    lda $2D : asl #2 : tax
    clc
    lda.w _00BC00+0,X : adc !obj_pos_y+0 : sta !obj_pos_y+0
    lda.w _00BC00+1,X : adc !obj_pos_y+1 : sta !obj_pos_y+1
    lda.w _00BC00+2,X : adc !obj_pos_y+2 : sta !obj_pos_y+2
    rtl
}

{ ;E967 - E98C
_01E967:
    xba
    lsr
    ror $0042
    lsr $0042
    dec $0044
    bne .E98C

    lda #$0008 : sta $0044
    phx
    ldx $0376
    lda $0042 : sta $7EF300,X
    inc $0376 : inc $0376
    plx
.E98C:
    rts
}

{ ;E98D - E9C4
_01E98D:
    lda #$10 : ora $09 : sta $09
    ldy #$10 : ldx #$21 : jsl set_sprite
    lda #$16 : sta $2D
    !A16
    lda.w _00ED00+$36 : sta $27
    lda #$0050 : sta $29
    !A8
    lda #$FF : sta $26
.E9B1:
    jsl update_animation_normal
    jsl _018E32_8E73
    brk #$00

;----- E9BB

    dec $2D
    bne .E9B1

    stz $00
    jml _02821B_827A
}

{ ;E9C5 - EA58
_01E9C5:

.create:
    lda $08 : ora #$80 : sta $08
    lda #$80 : ora $09 : sta $09
    lda #$06 : sta !obj_hp
    !A16
    lda #$0050 : sta $29
    !A8
    lda #$AA : sta $1D
    ldy #$12 : ldx #$21 : jsl set_sprite
    lda #$18 : cop #$00

;----- E9EE

    ldy #$14 : ldx #$21 : jsl set_sprite
    lda #$20 : cop #$00

;----- E9FA

    stz !obj_facing
    jsr .EA36
    lda #$01 : sta !obj_facing
    jsr .EA36
    stz !obj_facing
    ldy #$7E : ldx #$21 : jsl set_sprite
    lda #$10 : cop #$00

;----- EA14

    lda $08 : and #$77 : sta $08
    !A16
    clc : lda.w camera_x+1 : adc #$0080 : sta !obj_pos_x+1
    clc : lda.w camera_y+1 : adc #$0080 : sta !obj_pos_y+1
    !A8
    brk #$00

;----- EA32

    jml _028B0E

;-----

.EA36:
    jsr get_magic_slot
    bmi .EA53

    lda #$0C : sta.w !obj_active,X
    lda #$AA : sta.w !obj_type,X
    stz $0007,X
    lda !obj_facing : sta.w !obj_facing,X
    jsl set_spawn_offset
    !X8
.EA53:
    rts

;-----

.thing:
    jsl update_animation_normal
    rtl
}

{ ;EA59 - EAC2
_01EA59:

.create:
    lda #$3B : jsl _018049_8053
    lda #$80 : ora $08 : sta $08
    lda #$80 : ora $09 : sta $09
    ldy #$7C : ldx #$21 : jsl set_sprite
    lda #$AC : sta $1D
    !A16
    lda #$0050 : sta $29
    !A8
    lda #$07 : cop #$00

;----- EA84

    lda $07
    cmp #$08
    beq .EA8D

    jsr .EA9A
.EA8D:
    lda #$07 : cop #$00

;----- EA91

    jml _028B0E

;-----

.thing:
    jsl update_animation_normal
    rtl

;-----

.EA9A:
    jsr get_magic_slot
    bmi .EAC2

    lda #$0C : sta.w !obj_active,X
    lda #$80 : ora $0008,X : sta $0008,X
    lda #!id_nuclear_projectile : sta.w !obj_type,X
    lda $07 : inc : sta $0007,X
    lda !obj_facing : sta.w !obj_facing,X
    jsl set_spawn_offset
    !X8
.EAC2:
    rts
}

{ ;EAC3 - EB17
_01EAC3:
    lda $07 : asl : ldy #$94 : ldx #$21
    jsl set_sprite_8480
    rts

;-----

.create:
    jsr _01DD90
    lda $09 : ora #$80 : sta $09
    ldy $34 : jsl set_speed_x
.EADE:
    jsr _01EAC3
.EAE1:
    brk #$00

;----- EAE3

    lda $14F4
    bmi .EAFA

    cmp $31
    beq .EAE1

    sta $31
    inc $07
    lda $07
    cmp #$03
    bcc .EADE

.EAF6:
    jml _0280CB_remove_weapon

.EAFA:
    cmp #$F0
    bcc .EAF6

    lda $07
    cmp #$03
    bcs .EAF6

    jsr _01EAC3
    lda #$07 : cop #$00

;----- EB0B

    inc $07
    bra .EAFA

;-----

.thing: ;EB0F
    jsl update_pos_x
    jsl update_animation_normal
    rtl
}

{ ;EB18 - EC62
_01EB18:
    jsr get_weapon_slot_local
    bmi .EB4A

    lda $0008,X : ora #$81 : sta $0008,X
    lda #$0C : sta.w !obj_active,X
    lda #!id_bracelet_tail : sta.w !obj_type,X
    lda $07 : sta $0007,X
    lda !obj_direction : sta.w !obj_direction,X : sta.w !obj_facing,X
    lda $34 : sta $0034,X
    stz $0031,X
    jsl set_spawn_offset
    !X8
.EB4A:
    rts

;-----

.create:
    lda #$3A : jsl _018049_8053
    jsr _01DD90
    lda $09 : ora #$42 : sta $09
    stz $40
    lda $09 : ora #$80 : sta $09
    lda #$12 : sta !obj_hp
    stz $14F4
    stz $31
    ldy #$92 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $2D
    lda !armor_state
    sta $07
    pha
    jsr .EC24
    jsr .EC30
    lda #$02 : jsl _019580
    lda #$D4 : sta $1D
    stz $07
    jsr _01EB18
    inc $07
    inc $1D : inc $1D
    jsr _01EB18
    inc $07
    inc $1D : inc $1D
    jsr _01EB18
    lda $35 : sta $2E
    pla : sta $07
.EBAB:
    brk #$00

;----- EBAD

    lda $14F4
    cmp $31
    bne .EBB8

    dec $2E
    bne .EBAB

.EBB8:
    lda #$0C : sta !obj_hp
    lda #$01 : sta $14F4 : sta $31
    ldy #$94 : ldx #$21 : jsl set_sprite
    lda $35 : sta $2E
.EBCF:
    brk #$00

;----- EBD1

    lda $14F4
    cmp $31
    bne .EBDC

    dec $2E
    bne .EBCF

.EBDC:
    lda #$06 : sta !obj_hp
    ldy #$94 : ldx #$21 : jsl set_sprite
    lda #$02 : sta $14F4 : sta $31
    lda $35 : sta $2E
.EBF3:
    brk #$00

;----- EBF5

    lda $14F4
    cmp $31
    bne .EC00

    dec $2E
    bne .EBF3

.EC00:
    ldy #$98 : ldx #$21 : jsl set_sprite
    lda #$03 : sta !obj_hp
    lda #$03 : sta $14F4
    lda $35 : sta $2E
.EC15:
    brk #$00

;----- EC17

    dec $2E
    bne .EC15

    lda #$FF : sta $14F4
    jml _0280CB_remove_weapon

;-----

.EC24:
    ldx $07
    ldy.w bracelet_data_speed,X : sty $34
    jsl set_speed_x
    rts

;-----

.EC30:
    ldx $07
    lda.w bracelet_data_decay_rate,X : sta $35
    rts

;-----

.thing:
    jsl update_pos_x
    jsl update_animation_normal
    jsl _01A4E2_A52B
    bcc .EC62

    lda $001E
    bne .EC62

    lda #$FF : sta $14F4
    lda #$8C : sta $00
    lda #$02 : sta $0F
    lda $08 : ora #$80 : sta $08
    asl $09 : lsr $09
.EC62:
    rtl
}

{ ;EC63 - ED45
_01EC63:
    pla : sta $39
    pla : sta $3A
    brk #$00

;----- EC6B

    jsr get_magic_slot
    bpl .EC73

    jmp .ED35

.EC73:
    lda #!id_lightning : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    stz $0007,X
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    !AX8
    lda #$07 : sta $30
.EC92:
    brk #$00

;----- EC94

    jsr _01D957
    dec $30
    bne .EC92

    lda #$3F : sta $14EB
    lda #$0C : sta !slot_upgrade2+!obj_active
    stz !slot_upgrade2+$07
    lda #!id_magic_charge : sta !slot_upgrade2+!obj_type
    stz !slot_upgrade2+$08
    lda #$08 : sta $30
.ECB4:
    brk #$00

;----- ECB6

    jsr _01D957
    dec $30
    bne .ECB4

    lda #$01 : sta $0000 : sta $0001 : sta $0002
    lda $1D : sta $0003
    lda #$A6 : sta $1D
    lda #$08 : sta $0004
    lda !obj_facing : sta $0005
    lda $02C3 : sta $0006
.ECE1:
    jsr get_magic_slot
    bmi .ED35

    lda #!id_lightning : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda $0000 : sta $0007,X
    lda $0001 : sta.w !obj_direction,X
    lda $0004 : sta $000F,X
    lda #$01 : sta !obj_facing
    jsl set_spawn_offset
    lda #$01 : sta.w !obj_facing,X
    lda $0006 : asl : sta $0006
    bcc .ED1F

    lda #$4A : sta $002D,X
    bra .ED24

.ED1F:
    lda #$4C : sta $002D,X
.ED24:
    !X8
    dec $1D : dec $1D
    inc $0001 : inc $0001
    dec $0004
    bne .ECE1

.ED35:
    lda $0005 : sta !obj_facing
    lda $0003 : sta $1D
    lda $3A : pha
    lda $39 : pha
    rts
}

{ ;ED46 - EDAC
_01ED46:

.create:
    lda $07
    beq .ED4C

    bra .ED6C

.ED4C:
    ldy #$78 : ldx #$21 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    lda #$06 : cop #$00

;----- ED5E

    lda #$57 : jsl _018049_8053
    lda #$06 : cop #$00

;----- ED68

    jml _028B0E
.ED6C:
    lda #$02 : sta !obj_hp
    lda $0F : dec : asl : ldy #$82 : ldx #$21 : jsl set_sprite_8480
.ED7C:
    brk #$00

;----- ED7E

    jsl update_animation_normal
    lda $2D : tax : jsl update_pos_xy_2
    lda $09
    and #$40
    bne .ED7C

    stz $14E3
    jml _028B0E

;-----

.thing:
    jsl update_animation_normal
    !A16
    lda !arthur_pos_x+1 : sta !obj_pos_x+1
    lda !arthur_pos_y+1 : sta !obj_pos_y+1
    !A8
    rtl

;-----

    jml _028B0E ;unused, probably belongs to this code
}

{ ;EDAD - EE72
_01EDAD:
    stz $0000
    stz $14E6
    pla : sta $39
    pla : sta $3A
    lda #$53 : jsl _018049_8053
.EDBF:
    jsr get_magic_slot
    bpl .EDC7

    jmp .EE69

.EDC7:
    lda #$0C : sta.w !obj_active,X
    lda #!id_thunder : sta.w !obj_type,X
    lda $0000 : sta $0007,X
    !A16
    lda.w camera_y+1 : sta.w !obj_pos_y+1,X
    lda !arthur_pos_x+1 : sta.w !obj_pos_x+1,X
    !AX8
    inc $0000
    lda $0000
    cmp #$04
    bne .EDBF

    lda #$3F : sta $14EB
    lda #$0C : sta !slot_upgrade2
    stz !slot_upgrade2+$07
    lda #$82 : sta !slot_upgrade2+!obj_type
    stz !slot_upgrade2+$08
.EE06:
    brk #$00

;----- EE08

    jsr _01D957
    lda !open_magic_slots
    cmp #$08
    bne .EE06

    lda #$04 : sta $0000
.EE17:
    jsr get_magic_slot
    bmi .EE69

    lda #$0C : sta.w !obj_active,X
    lda #!id_thunder : sta.w !obj_type,X
    lda $0000 : sta $0007,X
    !A16
    lda !arthur_pos_y+1 : sta.w !obj_pos_y+1,X
    lda !arthur_pos_x+1 : sta.w !obj_pos_x+1,X
    !A8
    lda $0000
    and #$08
    bne .EE51

    !A16
    lda.w !obj_pos_x+1,X : clc : adc #$000E : sta.w !obj_pos_x+1,X
    bra .EE5D

.EE51:
    !A16
    lda.w !obj_pos_x+1,X : sec : sbc #$000E : sta.w !obj_pos_x+1,X
.EE5D:
    !AX8
    inc $0000
    lda $0000
    cmp #$0C
    bne .EE17

.EE69:
    stz $14E3
    lda $3A : pha
    lda $39 : pha
    rts
}

{ ;EE73 - EF43
_01EE73:

.create:
    lda $07
    and #$03
    asl #2
    inc
    cop #$00

;----- EE7C

    lda $07
    cmp #$0B
    bne .EE85

    stz $14E3
.EE85:
    lda $07 : asl : tax
    jmp (+,X) : +: dw .EEA4, .EEA4, .EEA4, .EEA4, .EEAA, .EEAA, .EEAA, .EEAA, .EEAA, .EEAA, .EEAA, .EEAA

;-----

.EEA4:
    ldy #$40 : ldx #$21
    bra .EEB0

.EEAA:
    ldy #$42 : ldx #$21
    bra .EEB0

.EEB0:
    jsl set_sprite
    lda #$02 : sta !obj_hp
    lda $08 : ora #$10 : sta $08
    lda $09 : ora #$88 : sta $09
    !A16
    lda #$0008 : sta !obj_speed_x+1 : sta !obj_speed_y+1
    lda #$0050 : sta $29
    !A8
    stz !obj_speed_x+0
    stz !obj_speed_y+0
    lda $07
    sec
    sbc #$08
    bcc .EEE3

    inc !obj_direction
    inc !obj_facing
.EEE3:
    brk #$00

;----- EEE5

    lda $07 : asl : tax
    jmp (+,X) : +: dw .EF04, .EF04, .EF04, .EF04, .EF23, .EF23, .EF23, .EF23, .EF2F, .EF2F, .EF2F, .EF2F

;-----

.EF04:
    jsl update_pos_y
    !A16
    lda !arthur_pos_x+1 : sta !obj_pos_x+1
    lda !obj_pos_y+1
    clc
    adc #$0020
    sec
    sbc !arthur_pos_y+1
    bcc .EF1F

    !A8
    bra .EF40

.EF1F:
    !A8
    bra .EEE3

;-----

.EF23:
    jsl update_pos_x
    lda $09
    and #$40
    bne .EEE3

    bra .EF40

;-----

.EF2F:
    jsl update_pos_x
    lda $09
    and #$40
    bne .EEE3

    bra .EF40

;-----

.thing:
    jsl update_animation_normal
    rtl

;-----

.EF40:
    jml _028B0E
}

{ ;EF44 -
_01EF44:
    stz $0000
    stz $14E6
    pla : sta $39
    pla : sta $3A
    lda #$53 : jsl _018049_8053
.EF56:
    brk #$00

;----- EF58

    jsr _01D957
    lda !open_magic_slots
    cmp #$08
    bne .EF56

    lda #$07 : sta $0000
.EF67:
    jsr get_magic_slot
    bmi .EF9F

    lda #$0C : sta.w !obj_active,X
    lda #!id_fire_dragon : sta.w !obj_type,X
    lda $0000 : sta $0007,X
    lda !obj_direction : sta.w !obj_direction,X
    lda !obj_facing : sta.w !obj_facing,X
    !A16
    lda !arthur_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !arthur_pos_y+1 : sec : sbc #$001C : sta.w !obj_pos_y+1,X
    !AX8
    dec $0000
    bpl .EF67

.EF9F:
    lda #$03 : sta $2D
.EFA3:
    lda #$03 : sta $0332
    inc $0331
    brk #$00

;----- EFAD

    jsr _01D957
    lda #$00 : sta $0332
    inc $0331
    brk #$00

;----- EFBA

    jsr _01D957
    dec $2D
    bne .EFA3

    lda #$3F : sta $30
.EFC5:
    brk #$00

;----- EFC7

    jsr _01D957
    dec $30
    bne .EFC5

    stz $14E3
    lda $3A : pha
    lda $39 : pha
    rts
}

{ ;EFD8 - F263
_01EFD8:

.create:
    lda $07
    beq .F00C

    sta $2F
    asl
    clc
    adc $2F
    cop #$00

;----- EFE4

    lda $07 : dec : asl : tax
    jmp (+,X) : +: dw .EFFA, .EFFA, .EFFA, .F000, .F000, .F006, .F006

;-----

.EFFA:
    ldy #$BA : ldx #$20
    bra .F010

.F000:
    ldy #$BC : ldx #$20
    bra .F010

.F006:
    ldy #$BE : ldx #$20
    bra .F010

.F00C:
    ldy #$B8 : ldx #$20
.F010:
    jsl set_sprite
    lda #$02 : sta !obj_hp
    lda $09 : ora #$88 : sta $09
    stz !obj_speed_x+0
    stz !obj_speed_y+0
    !A16
    lda #$0008 : sta !obj_speed_x+1 : sta !obj_speed_y+1
    lda #$0050 : sta $29
    !A8
    stz $0F
    lda #$09 : sta $2D
.F038:
    brk #$00

;----- F03A

    lda $0F : asl : tax
    jmp (.F041,X)

.F041:
    dw .F063, .F07D, .F09D, .F0B2, .F0D5, .F0FD, .F119, .F135
    dw .F151, .F16F, .F18E, .F1AA, .F1C6, .F1E8, .F204, .F223
    dw .F23B

;-----


.F063:
    !A16
    dec !obj_pos_y+1 : dec !obj_pos_y+1 : dec !obj_pos_y+1 : dec !obj_pos_y+1 : dec !obj_pos_y+1
    !A8
    dec $2D
    bne .F038

    inc $0F
    lda #$03 : sta $2D
    bra .F038

;-----

.F07D:
    jsr .F24A
    jsr .F24A
    !A16
    dec !obj_pos_y+1 : dec !obj_pos_y+1 : dec !obj_pos_y+1 : dec !obj_pos_y+1 : dec !obj_pos_y+1
    !A8
    dec $2D
    bne .F038

    inc $0F
    lda #$02 : sta $2D
    bra .F038

;-----

.F09D:
    jsr .F24A
    jsr .F24A
    jsr .F24A
    dec $2D
    bne .F038

    inc $0F
    lda #$03 : sta $2D
    bra .F038

;-----

.F0B2:
    jsr .F24A
    jsr .F24A
    !A16
    inc !obj_pos_y+1 : inc !obj_pos_y+1 : inc !obj_pos_y+1 : inc !obj_pos_y+1 : inc !obj_pos_y+1
    !A8
    dec $2D
    bne .F0D2

    inc $0F
    lda #$09 : sta $2D
    bra .F0D2

.F0D2:
    jmp .F038

;-----

.F0D5:
    !A16
    inc !obj_pos_y+1 : inc !obj_pos_y+1 : inc !obj_pos_y+1 : inc !obj_pos_y+1 : inc !obj_pos_y+1
    !A8
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F0F7

    lda #$05 : sta !obj_direction
    bra .F0D2

.F0F7:
    lda #$03 : sta !obj_direction
    bra .F0D2

;-----

.F0FD:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F115

    inc !obj_direction
    bra .F0D2
.F115:

    dec !obj_direction
    bra .F0D2

;-----

.F119:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F131

    inc !obj_direction
    bra .F0D2

.F131:
    dec !obj_direction
    bra .F0D2


;-----

.F135:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$09 : sta $2D
    lda !obj_facing
    beq .F14D

    inc !obj_direction
    bra .F18B

.F14D:
    dec !obj_direction
    bra .F18B

;-----

.F151:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F169

    inc !obj_direction
    bra .F18B

.F169:
    lda #$0F : sta !obj_direction
    bra .F18B

;-----

.F16F:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F187

    inc !obj_direction
    bra .F18B

.F187:
    dec !obj_direction
    bra .F18B

.F18B:
    jmp .F038

;-----

.F18E:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F1A6

    inc !obj_direction
    bra .F18B

.F1A6:
    dec !obj_direction
    bra .F18B

;-----

.F1AA:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$0D : sta $2D
    lda !obj_facing
    beq .F1C2

    inc !obj_direction
    bra .F18B

.F1C2:
    dec !obj_direction
    bra .F18B

;-----

.F1C6:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    lda !obj_facing : eor #$01 : sta !obj_facing
    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F1E4

    dec !obj_direction
    bra .F220

.F1E4:
    inc !obj_direction
    bra .F220

;-----

.F1E8:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F200

    dec !obj_direction
    bra .F220

.F200:
    inc !obj_direction
    bra .F220

;-----

.F204:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda #$03 : sta $2D
    lda !obj_facing
    beq .F21C

    dec !obj_direction
    bra .F220

.F21C:
    inc !obj_direction
    bra .F220

.F220:
    jmp .F038

;-----

.F223:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda !obj_facing
    beq .F237

    dec !obj_direction
    bra .F220

.F237:
    stz !obj_direction
    bra .F220

;-----

.F23B:
    ldx #$48 : jsl update_pos_xy_2
    lda $09
    and #$40
    beq .F260

    jmp .F038

;-----

.F24A:
    lda !obj_facing
    bne .F254

    !A16
    inc !obj_pos_x+1
    bra .F258

.F254:
    !A16
    dec !obj_pos_x+1
.F258:
    !A8
    rts

;-----

.thing:
    jsl update_animation_normal
    rtl

;-----

.F260:
    jml _028B0E
}

{ ;F264 - F2ED
_01F264:

.create:
    jsr _01F5A9_F648
    lda #$04 : cop #$00

;----- F26B

    jsr _01F5A9_F653
    lda #$55 : jsl _018049_8053
    lda !obj_facing
    bne .F279

    dec
.F279:
    sta $2D
    lda #$06 : sta !obj_hp
    lda $09 : ora #$C2 : sta $09
    stz $40
    ldy #$9A : ldx #$20 : jsl set_sprite
    lda #$04 : sta !obj_direction
    lda #$08 : sta $3B
    lda #$10 : sta $2E
.F29B:
    brk #$00

;----- F29D

    lda $09 : ora #$40 : sta $09
    dec $3B
    bne .F2C2

    lda !obj_direction : clc : adc $2D : and #$0F : sta !obj_direction
    ldx $0F
    lda.w tornado_data+0,X
    beq .F2CE

    sta $3B
    lda.w tornado_data+1,X : sta $2E
    inx #2
    stx $0F
.F2C2:
    lda $2E : ldx #$12 : jsl _0189D9
    bra .F29B

.F2CC:
    brk #$00

;----- F2CE

.F2CE:
    lda $2E : ldx #$12 : jsl _0189D9
    bra .F2CC

;-----

.thing:
    bit $09
    bvc .F2EA

    jsl update_animation_normal
    lda $02C3
    and #$0F
    bne .F2E9

    inc $40
.F2E9:
    rtl

.F2EA:
    jml _028B17
}

{ ;F2EE -
_01F2EE:

.create:
    lda #$67 : jsl _018049_8053
    jsl _02F9DA
    ldy #$4A : ldx #$21 : jsl set_sprite
    stz $32
    lda !obj_direction : asl : tax
    !A16
    lda.w _00BC65_BC65,X : sta $2F
    !A8
    ldy #$6C : jsl set_speed_x
    lda $2F : asl #2 : sta $31
.F31B:
    brk #$00

;----- F31D

    jsl update_pos_x
    clc
    lda $31
    adc $30
    and #$1F
    sta $31
    lsr #2
    cmp $2F
    beq .F31B

    sta $2D
    lda $2F : clc : adc #$04 : and #$07 : sta !obj_direction
    ldx #$38 : jsl update_pos_xy_2
    lda $2D : sta $2F : sta !obj_direction
    ldx #$38 : jsl update_pos_xy_2
    lda !obj_facing : sta !obj_direction
    lda $32
    clc
    adc #$02
    and #$0F
    sta $32
    tax
    !A16
    lda.w _00BC65_BC69,X : sta $0C
    !A8
    bra .F31B

;-----

.axe2_create:
    lda #$5F : jsl _018049_8053
    lda #$0C : sta $2D
    lda #$06 : sta $2F
    lda $09 : ora #$C2 : sta $09
    stz $40
    ldy #$4C : ldx #$21 : jsl set_sprite
    !A16
    lda !obj_pos_y+1 : sec : sbc #$000C : sta !obj_pos_y+1
    !A8
    ldx #$01
    lda !obj_direction
    beq .F398

    ldx #$FF
.F398:
    stx $30
    ldy #$30 : jsl set_speed_y
    lda #$10 : sta $33
.F3A4:
    brk #$00

;----- F3A6

    jsl update_pos_y
    dec $33
    bne .F3A4

    lda #$10 : sta $33
    ldy #$39 : jsl set_speed_x
    ldy #$33 : jsl set_speed_y
.F3BE:
    brk #$00

;----- F3C0

    jsl update_pos_xy
    dec $33
    bne .F3BE

.F3C8:
    brk #$00

;----- F3CA

    jsl update_pos_x
    bra .F3C8

;-----

.axe2_thing:
    jsl update_animation_normal
    lda $2F : clc : adc #$04 : and #$07 : sta !obj_direction
    ldx #$0C : jsl update_pos_xy_2
    clc : lda $2F : adc $30 : and #$07 : sta $2F : sta !obj_direction
    ldx #$0C : jsl update_pos_xy_2
    lda !obj_facing : sta !obj_direction

;-----

.thing:
    jsr _01E285
    rtl
}

{ ;F3FC - F4D6
_01F3FC:

.triblade2_create:
    lda #$5F : jsl _018049_8053
    lda #$10 : sta $2F
    lda $09 : ora #$02 : sta $09
    stz $40
    ldy #$E2 : ldx #$20
    bra .F420

;-----

.create:
    lda #$67 : jsl _018049_8053
    stz $2F
    ldy #$C0 : ldx #$20
.F420:
    jsl set_sprite
    ldx #$00
    lda !obj_direction
    beq .F42C

    ldx #$09
.F42C:
    stx $2D
    jsl _02F9DA
    stz $2E
    jsr .F4A6
.F437:
    brk #$00

;----- F439

    lda $09 : ora #$40 : sta $09
    ldx #$32 : jsl update_pos_xy_2
    dec $3B
    bne .F437

    jsr .F4A6
    cpx #$09
    bne .F437

.F450:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$000C
    sec
    sbc !obj_pos_x+1
    cmp #$0010
    bcs .F476

    lda !arthur_pos_y+1
    clc
    adc #$000C
    sec
    sbc !obj_pos_y+1
    cmp #$0010
    bcs .F476

    !A8
    jml _0280CB_remove_weapon

.F476:
    !A8
    brk #$00

;----- F47A

    jsl _01918E_set_direction16
    inc
    and #$0F
    lsr
    sta !obj_direction
    ldx $2F
    bne .F49E

    asl : tax
    !A16
    lda.w triblade_data_BCD8,X : sta $0C
    !A8
    lda !obj_direction : clc : adc #$02 : and #$07 : lsr #2 : sta !obj_facing
.F49E:
    ldx #$32 : jsl update_pos_xy_2
    bra .F450

.F4A6:
    lda $2E : clc : adc $2D : tax
    lda.w triblade_data_BC79,X : sta !obj_direction
    lda.w triblade_data_BC8B,X : sta !obj_facing
    ldx $2E
    lda.w triblade_data_BCCF,X : sta $3B ;loads value from BCD8
    inc $2E
    lda $2F
    bne .F4D1

    lda.w triblade_data_BC9D,X : asl : tay
    !A16
    lda.w triblade_data_BCAF,Y : sta $0C
    !A8
.F4D1:
    rts

;-----

.triblade2_thing:
    jsl update_animation_normal

;-----

.thing:
    rtl
}

{ ;F4D7 - F4F6
get_magic_slot: ;a8 x8
    ldy #$07
    !X16
    ldx #!slot_magic
.F4DE:
    lda.w !obj_active,X
    beq .F4F3

    !A16
    clc
    txa
    adc #!obj_size
    tax
    !A8
    dey
    bpl .F4DE

    !X8
    rts ;no slots available (return -1)

.F4F3:
    dec !open_magic_slots
    rts
}

{ ;F4F7 -
_01F4F7:

.create:
    lda #$03 : sta !obj_hp
    ldx $07
    lda.w shield_magic_data_BCF8,X : sta !obj_direction
    lda $09 : ora #$8A : sta $09
    stz $40
    lda #$04 : sta $2D
    lda #$20 : sta $2E
    ldy #$46 : ldx #$21 : jsl set_sprite
.F51A:
    brk #$00

;----- F51C

    lda $24
    cmp #$70
    bne .F51A

    ldy #$48 : ldx #$21 : jsl set_sprite
    stz $3B
.F52C:
    brk #$00

;----- F52E

    lda !obj_direction : inc : and #$3F : sta !obj_direction
    lda $02C3
    and #$03
    bne .F549

    lda $2D : inc : and #$0F : sta $2D
    tax
    lda.w shield_magic_data_BCFB,X : sta $2E
.F549:
    dec $3B
    bne .F52C

    ldy #$4E : ldx #$21 : jsl set_sprite
.F555:
    brk #$00

;----- F557

    lda $24
    cmp #$7A
    bne .F555

    stz $14E7
    stz $14E3
    jml _028B0E

;-----

.thing:
    lda !armor_state
    cmp #$04
    bne .F59F

    jsr _01DD7A
    jsl update_animation_normal
    !A16
    lda !arthur_pos_x+0 : sta !obj_pos_x+0
    lda !arthur_pos_x+2 : sta !obj_pos_x+2
    lda !arthur_pos_y+1 : sec : sbc #$0004 : sta !obj_pos_y+1
    !A8
    clc
    lda $2E
    ldx #$06 : jsl _0189D9
    lda $02C3
    and #$0F
    bne .F59E

    inc $40
.F59E:
     rtl

.F59F: ;not sure if this can be reached?
    stz $14E7
    stz $14E3
    jml _028B17
}

{ ;F5A9 - F669
_01F5A9:

.create:
    lda $08 : ora #$80 : sta $08
    lda #$20 : cop #$00

;----- F5B3

    jsr .F65E
    lda #!sfx_magic_seek : jsl _018049_8053
    !X16
    ldx #!slot_objects
.F5C1:
    lda.w !obj_active,X
    beq .F606

    lda.w !obj_type,X
    cmp #!id_chest
    beq .F5D1

    cmp #!id_chest2
    bne .F606

.F5D1:
    lda $0031,X
    bne .F606

    !A16
    lda.w !obj_pos_x+1,X
    adc #$0030
    sbc.w camera_x+1
    cmp #$0160
    bcs .F606

    lda.w !obj_pos_y+1,X
    sbc.w camera_y+1
    cmp #$0100
    bcs .F606

    !A8
    ldy.w #chest_B6DE
    lda.w !obj_type,X
    cmp #!id_chest
    beq .F600

    ldy.w #chest2_B691
.F600:
    !A16
    tya : sta.w !obj_state+1,X
.F606:
    !A16
    clc
    txa
    adc #!obj_size
    cmp #!slot_upgrade ;todo: maybe replace slot*count
    tax
    !A8
    bcc .F5C1

    !X8
    lda #$40 : cop #$00

;----- F61B

    jsr .F648
    cop #$00

;----- F620

    jsr .F65E
    cop #$00

;----- F625

    jsr .F648
    cop #$00

;----- F62A

    jsr .F65E
    cop #$00

;----- F62F

    jsr .F648
    cop #$00

;----- F634

    jsr .F65E
    cop #$00

;----- F639

    jsr .F648
    cop #$00

;----- F63E

    jsr .F653
    stz $14E3
    jml _028B0E

;-----

.F648:
    lda #$03 : sta $0332
    inc $0331
    lda #$04
    rts

;-----

.F653:
    lda #$00 : sta $0332
    inc $0331
    lda #$04
    rts

;-----

.F65E:
    lda #$06 : sta $0332
    inc $0331
    lda #$04
    rts

;-----

.thing: ;unused
    rtl
}

{ ;F66A - F6C8
_01F66A: ;a8 x-
    phb
    lda #$7F : pha : plb
    !AX16
    ldx #$01FE
    lda #$FFFF
    tay
.F678: ;all white palette
    tya
    sta $9E00,X
    txa
    and #$001F
    bne +

    stz $9E00,X
+:
    dex #2
    bpl .F678

    tya
    sta $9E00
    !X8
    ldx #$FE
    ldy #$1C
.F693:
    phx
    tyx
    lda.l _04984F_A0D7,X
    plx
    sta $9800,X
    txa
    and #$001F
    bne +

    stz $9800,X
    ldy #$1E
+:
    dey #2
    dex #2
    cpx #$1E
    bne .F693

    ldy #$1C
.F6B2:
    phx
    tyx
    lda.l _04984F_9879,X
    plx
    sta $9800,X
    dey #2
    dex #2
    bne .F6B2

    stz $9800
    !AX8
    plb
    rts
}

{ ;F6C9 - F6D6
_01F6C9: ;a8 x-
    jsr .local
    rtl

;-----

.local:
    stz $150C,X
    sta $1501,X
    inc $1500,X
    rts
}

{ ;F6D7 - F6E8
_01F6D7: ;a8 x8
    lda.w stage
    asl
    tax
    lda.w _008B05+0,X : sta $032B
    lda.w _008B05+1,X : sta $032C
    rts
}

{ ;F6E9 - F721
_01F6E9: ;a- x-
    !AX16
    clc : lda.w camera_x+1 : adc #$0080 : sta $0000
    ldy $032B
    lda.w _008B05,Y
    cmp $00
    bcs .ret

    tya
    clc
    adc #$0005
    sta $032B
    !A8
    lda #$00
    xba
    lda.w _008B05+2,Y
    tax
    stz $150C,X
    lda.w _008B05+3,Y : sta $1501,X
    lda.w _008B05+4,Y : sta $1500,X
.ret:
    !AX8
    rts
}

{ ;F722 - F782
_01F722: ;a8 x8
    phd
    lda #$15 : xba : lda #$62 : tcd
.F729:
    lda $00
    beq .F757

    lda $0C
    bne +

    jsr .F768
+:
    dec $05
    bne .F757

    lda $03
    clc
    adc #$03
    cmp $02
    bcc .F743

    lda #$00
.F743:
    sta $03
    tay
    lda ($06),Y : sta $05
    iny
    !A16
    lda ($06),Y : sta $08
    !A8
    lda #$02 : sta $04
.F757:
    !A16
    tdc
    clc
    adc #$0010
    tcd
    cmp #$15A2
    !A8
    bne .F729

    pld
    rts

;-----

.F768:
    lda #$80 : sta $0C : sta $03
    lda #$01 : sta $05
    ldx $01
    lda.w _00BD0B+0,X : sta $02
    !A16
    lda.w _00BD0B+1,X : sta $06
    !A8
    rts
}

if !version == 0
{ ;F783 - FEFF
    incbin "fill_bytes/jp/bank01a.bin" ;unused duplicate code
    fillbyte $FF : fill 1398
}
elseif !version == 1
    incbin "fill_bytes/eng/bank01a.bin"
elseif !version == 2
    incbin "fill_bytes/eng/bank01a.bin":121..0
endif

{ ;FF00 - FF73
_01FF00: ;a- x-
    .00: jml _01A87C
    .04: jml _019A93
    .08: jml _019735
    .0C: jml _019757
    .10: jml _01B315
    .14: jml _048EAD ;never called from here?
if !version == 0 || !version == 1
    .18: jml _03EE1D ;talking time
elseif !version == 2
    .18: jml _0484B9
endif
    .1C: jml _019776
    .20: jml _019776_9797
    .24: jml _04A0F5 ;unused?
    .28: jml text_tilemaps ;unused, not even code! might have been at some point
    .2C: jml _01FF74 ;unused, infinite loop
    .30: jml _0198A4
    .34: jml _0197D1
    .38: jml _019C86 ;right before raft down to 2-2
    .3C: jml _019CE0
    .40: jml _019DE5
    .44: jml _019E1B
    .48: jml _019EEA
    .4C: jml _019F43
    .50: jml _01A00A
    .54: jml _01A0B2
    .58: jml _019C0C
    .5C: jml _01A397 ;cockatrice, death crawler, nebiroth
    .60: jml _01A128
    .64: jml _01A191
    .68: jml _039DDA ;ending slides related
    .6C: jml _019776_9792 ;ending slides related
    .70: jml _01A1F5
if !version == 2
    .74: jml _019735_eu
endif
}

{ ;FF74 - FF76
_01FF74:
    jmp _01FF74 ;infinite loop
}

{ ;FF77 - FFFF
if !version == 0
    fillbyte $FF : fill 137
elseif !version == 1
    incbin "fill_bytes/eng/bank01b.bin"
elseif !version == 2
    incbin "fill_bytes/eng/bank01b.bin":4..0
endif
}
