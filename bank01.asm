org $018000

{ ;8000 - 8020
set_hp: ;a- x-
    lda.w difficulty : sta $0000
    stz $0001
    !AX16
    lda.b obj.type
    and #$00FF
    asl #2
    ora $0000
    tax
    !A8
    lda.l hp_list-$80,X : sta.b obj.hp
    !AX8
    rtl
}

{ ;8021 - 8048
_018021: ;a8 x-
    lda.b #1 : jsl current_task_suspend
    stz $1F95
    stz $1F96
    jsl _018593
    jsl _02821B
    jsl fill_sprite_queue
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
    lda #$0000 : tcd
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
    lda #$0000 : tcd
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
    lda #$0000 : tcd
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
    lda $02F2 : ora #$80 : sta.w INIDISP : sta $02F2
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
    inc.w layer3_needs_update
    plb
    rtl
}

{ ;8422 - 8450
call_rng: ;a8 x-
    ;16-bit MCG, state *= 259
    lda.w rng_state
    pha
    sta $0000
    lda.w rng_state+1 : sta $0001
    asl $0000 : rol $0001
    clc : lda $0000         : adc.w rng_state : sta.w rng_state
          lda.w rng_state+1 : adc $0001       : sta.w rng_state+1
    pla : clc : adc.w rng_state+1 : sta.w rng_state+1
    rtl
}

{ ;8451 - 847D
update_animation:

.custom_timer: ;a8 x- (8451)
    clc
    adc.b obj.anim_timer
    sta.b obj.anim_timer
    bmi .845D

    rtl

.normal: ;a8 x- (8459)
    ;update animation
    dec.b obj.anim_timer
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
    sta.b obj.anim_timer
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
    sta.b obj.anim_timer
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
fill_sprite_queue: ;a- x-
    php
    phd
    !AX16
    stz.w !sprite_prio_offset.count+0*2
    stz.w !sprite_prio_offset.count+1*2
    stz.w !sprite_prio_offset.count+2*2
    stz.w !sprite_prio_offset.count+3*2
    stz.w !sprite_prio_offset.count+4*2
    stz.w !sprite_prio_offset.count+5*2
    stz.w !sprite_prio_offset.count+6*2
    stz.w !sprite_prio_offset.count+7*2
    lda.w sprite_queue_offsets+0  : sta.w !sprite_prio_offset.offsets+0*2
    lda.w sprite_queue_offsets+2  : sta.w !sprite_prio_offset.offsets+1*2
    lda.w sprite_queue_offsets+4  : sta.w !sprite_prio_offset.offsets+2*2
    lda.w sprite_queue_offsets+6  : sta.w !sprite_prio_offset.offsets+3*2
    lda.w sprite_queue_offsets+8  : sta.w !sprite_prio_offset.offsets+4*2
    lda.w sprite_queue_offsets+10 : sta.w !sprite_prio_offset.offsets+5*2
    lda.w sprite_queue_offsets+12 : sta.w !sprite_prio_offset.offsets+6*2
    lda.w sprite_queue_offsets+14 : sta.w !sprite_prio_offset.offsets+7*2
    ldy.w #$34 ;weapons + magic + object + upgrade slot count (i.e. everything but arthur)
    lda.w #obj_start+obj[1] : tcd
    clc : lda.w camera_x+1 : adc #$0080 : sta $0000
    clc : lda.w camera_y+1 : adc #$0080 : sta $0002
.852A:
    lda $00
    and #$00FF
    beq .8587

    lda $10
    and #$00FF
    tax
    sec
    lda $0000
    sbc.b obj.pos_x+1
    clc
    adc.w _00A4E9+0,X
    cmp.w _00A4E9+2,X
    bcs .8580

    sec
    lda $0002
    sbc.b obj.pos_y+1
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
    tax ;sprite priority * 2
    ldy.w !sprite_prio_offset.offsets,X
    tdc : sta.w !sprite_prio_offset.queues,Y ;store obj offset in queue
    inc.w !sprite_prio_offset.offsets,X : inc.w !sprite_prio_offset.offsets,X
    txy
    ldx.w sprite_queue_A541,Y
    inc.w !sprite_prio_offset.count,X
    ply
    bra .8587

.8580:
    lda $08 : and #$BFFF : sta $08 ;clear "in range / playfield"(?) flag?

.8587:
    clc : tdc : adc.w #obj.ext.len : tcd
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
    lda.w !sprite_prio_offset.count+0*2
    beq +

    ldy #$0000 : jsr _018673
+:
    lda $13D3
    beq +

    ldy #$0060 : jsr _018673
+:
    lda.w !obj_arthur.active
    beq .85EF

    lda.w current_cage
    bne .85EF

    lda #$04 : xba : lda #$3C : tcd ;todo: use label
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
    lda.w !obj_arthur.active
    beq .862E

    lda.w current_cage
    beq .862E

    lda #$04 : xba : lda #$3C : tcd ;todo: use label
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
    lda.w !sprite_prio_offset.queues+1,Y : xba : lda.w !sprite_prio_offset.queues,Y : tcd
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
    bit #$10 ;todo: flicker bit
    beq +

    lda.w frame_counter
    and #$01 ;skip drawing on odd (finished?) frames
    bne .868D
+:
    phx
    ldx #$0000
    lda $08
    bit #$20
    beq +

    lda #$00
    xba
    lda.w frame_counter
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
    lda.b obj.pos_x+1 : sbc.w camera_x+1 : sta $0002
    sec
    lda.b obj.pos_y+1 : sbc.w camera_y+1 : sta $0004
    lda $29 : sta $001A
    lda $08
    eor #$3000
    and #$3000
    ora $0012
    sta $0012
    lda $12
    lsr
    lda #$0000 : tcd
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
    stz.b obj.speed_x+0
    stz.b obj.speed_x+2 ;also clears speedY+0
    stz.b obj.speed_y+1
    !A8
    sta.b obj.gravity
    rtl
}

{ ;87F2 - 8815
set_speed_xyg: ;a8 x8
    lda.w speed_xyg_x3,Y : sta.b obj.speed_x
    lda.w speed_xyg_x2,Y : sta.b obj.speed_x+1
    lda.w speed_xyg_x1,Y : sta.b obj.speed_x+2
    lda.w speed_xyg_y3,Y : sta.b obj.speed_y
    lda.w speed_xyg_y2,Y : sta.b obj.speed_y+1
    lda.w speed_xyg_y1,Y : sta.b obj.speed_y+2
    lda.w speed_xyg_g,Y  : sta.b obj.gravity
    rtl
}

{ ;8816 - 8825
set_speed_x: ;a8 x8
    lda.w speeds_x+0,Y : sta.b obj.speed_x
    lda.w speeds_x+1,Y : sta.b obj.speed_x+1
    lda.w speeds_x+2,Y : sta.b obj.speed_x+2
    rtl
}

{ ;8826 - 8835
set_speed_y: ;a8 x8
    lda.w speeds_y+0,Y : sta.b obj.speed_y
    lda.w speeds_y+1,Y : sta.b obj.speed_y+1
    lda.w speeds_y+2,Y : sta.b obj.speed_y+2
    rtl
}

{ ;8836 - 884A
_018836:
    sec
    lda.b obj.speed_x+0 : sbc.b obj.gravity : sta.b obj.speed_x+0
    lda.b obj.speed_x+1 : sbc #$00          : sta.b obj.speed_x+1
    lda.b obj.speed_x+2 : sbc #$00          : sta.b obj.speed_x+2
    bra update_pos_xy
}

{ ;884B - 88A1
_01884B: ;a8 x-
    ;name? apply gravity to x speed -> apply x speed to x pos -> apply y speed to y pos
    sec
    lda.b obj.speed_x+0 : sbc.b obj.gravity : sta.b obj.speed_x+0
    lda.b obj.speed_x+1 : sbc #$00          : sta.b obj.speed_x+1
    lda.b obj.speed_x+2 : sbc #$00          : sta.b obj.speed_x+2
    bra .8873

.8860: ;a8 x-
    clc
    lda.b obj.speed_x+0 : adc.b obj.gravity : sta.b obj.speed_x+0
    lda.b obj.speed_x+1 : adc #$00          : sta.b obj.speed_x+1
    lda.b obj.speed_x+2 : adc #$00          : sta.b obj.speed_x+2
.8873:
    jsr update_pos_x_88E9
.8876: ;a8 x-
    lda.b obj.direction
    bne .888E

    clc
    lda.b obj.pos_y+0 : adc.b obj.speed_y+0 : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : adc.b obj.speed_y+1 : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : adc.b obj.speed_y+2 : sta.b obj.pos_y+2
    rtl

.888E:
    sec
    lda.b obj.pos_y+0 : sbc.b obj.speed_y+0 : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : sbc.b obj.speed_y+1 : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : sbc.b obj.speed_y+2 : sta.b obj.pos_y+2
    rtl
}

{ ;88A2 - 88E0
update_pos:

.xyg_sub: ;a8 x-
    sec
    lda.b obj.speed_y+0 : sbc.b obj.gravity : sta.b obj.speed_y+0
    lda.b obj.speed_y+1 : sbc #00           : sta.b obj.speed_y+1
    lda.b obj.speed_y+2 : sbc #00           : sta.b obj.speed_y+2
    bra update_pos_xy

.xyg_add: ;88B7 | a8 x-
    clc
    lda.b obj.speed_y+0 : adc.b obj.gravity : sta.b obj.speed_y+0
    lda.b obj.speed_y+1 : adc #00           : sta.b obj.speed_y+1
    lda.b obj.speed_y+2 : adc #00           : sta.b obj.speed_y+2

.xy: ;88CA | a8 x-
    jsr update_pos_x_local

.y: ;88CD | a8 x-
    clc
    lda.b obj.pos_y+0 : adc.b obj.speed_y+0 : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : adc.b obj.speed_y+1 : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : adc.b obj.speed_y+2 : sta.b obj.pos_y+2
    rtl
}

{ ;88E1 - 8910
update_pos_x: ;a8 x-
    jsr .local
    rtl

.local: ;88E5
    lda.b obj.direction
    bne .88FD

.88E9:
    clc
    lda.b obj.pos_x+0 : adc.b obj.speed_x+0 : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : adc.b obj.speed_x+1 : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : adc.b obj.speed_x+2 : sta.b obj.pos_x+2
    rts

.88FD:
    sec
    lda.b obj.pos_x+0 : sbc.b obj.speed_x+0 : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : sbc.b obj.speed_x+1 : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : sbc.b obj.speed_x+2 : sta.b obj.pos_x+2
    rts
}

{ ;8911 - 8922
_018911: ;a- x-
    ;cap y speed to 6 px/f
    !A16
    lda #$0600
    cmp.b obj.speed_y+1
    bcs .8920

    sta.b obj.speed_y+1
    !A8
    stz.b obj.gravity
.8920:
    !A8
    rtl
}

{ ;8923 - 89D8
    ;unused
    sty $000E
    !AX16
    clc
    lda.b obj.direction
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
    adc.b obj.pos_x+0
    sta.b obj.pos_x+0
    xba
    adc.b obj.pos_x+1
    sta.b obj.pos_x+1
    tya
    adc.b obj.pos_x+2
    sta.b obj.pos_x+2
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
    adc.b obj.pos_y+0
    sta.b obj.pos_y+0
    xba
    adc.b obj.pos_y+1
    sta.b obj.pos_y+1
    tya
    adc.b obj.pos_y+2
    sta.b obj.pos_y+2
    rtl
}

{ ;89D9 - 8A72
_0189D9: ;a8 x-
    pha
    !AX16
    clc
    lda.b obj.direction
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
    lda.b obj.pos_x+0 : adc $0000 : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : adc $0001 : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : adc $0002 : sta.b obj.pos_x+2
    clc
    lda.b obj.pos_y+0 : adc $0004 : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : adc $0005 : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : adc $0006 : sta.b obj.pos_y+2
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
    lda.b obj.direction
    and #$00FF
    adc.w speed_xy_offsets,X
    tax
    !A8
    clc
    lda speed_xy_x1,X : adc.b obj.pos_x+0 : sta.b obj.pos_x+0
    lda speed_xy_x2,X : adc.b obj.pos_x+1 : sta.b obj.pos_x+1
    lda speed_xy_x3,X : adc.b obj.pos_x+2 : sta.b obj.pos_x+2
    clc
    lda speed_xy_y1,X : adc.b obj.pos_y+0 : sta.b obj.pos_y+0
    lda speed_xy_y2,X : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
    lda speed_xy_y3,X : adc.b obj.pos_y+2 : sta.b obj.pos_y+2
    !X8
    rtl
}

{ ;8AE2 - 8B24
    ;unused
    !AX16
    clc : lda.b obj.direction : and #$00FF : adc.w speed_xy_offsets,X : tax
    !A8
    clc
    lda.l speed_xy_x1,X : adc.b obj.speed_x+0 : sta.b obj.speed_x+0
    lda.l speed_xy_x2,X : adc.b obj.speed_x+1 : sta.b obj.speed_x+1
    lda.l speed_xy_x3,X : adc.b obj.speed_x+2 : sta.b obj.speed_x+2
    clc
    lda.l speed_xy_y1,X : adc.b obj.speed_y+0 : sta.b obj.speed_y+0
    lda.l speed_xy_y2,X : adc.b obj.speed_y+1 : sta.b obj.speed_y+1
    lda.l speed_xy_y3,X : adc.b obj.speed_y+2 : sta.b obj.speed_y+2
    !X8
    rtl
}

{ ;8B25 - 8BBE
_018B25: ;a8 x-
    pha
    !AX16
    clc
    lda.b obj.direction
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
    lda.b obj.speed_x+0 : adc $0000 : sta.b obj.pos_x+0
    lda.b obj.speed_x+1 : adc $0001 : sta.b obj.pos_x+1
    lda.b obj.speed_x+2 : adc $0002 : sta.b obj.pos_x+2
    clc
    lda.b obj.speed_y+0 : adc $0004 : sta.b obj.pos_y+0
    lda.b obj.speed_y+1 : adc $0005 : sta.b obj.pos_y+1
    lda.b obj.speed_y+2 : adc $0006 : sta.b obj.pos_y+2
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
    lda.l speed_xy_x1,X : sta.b obj.speed_x+0
    lda.l speed_xy_x2,X : sta.b obj.speed_x+1
    lda.l speed_xy_x3,X : sta.b obj.speed_x+2
    lda.l speed_xy_y1,X : sta.b obj.speed_y+0
    lda.l speed_xy_y2,X : sta.b obj.speed_y+1
    lda.l speed_xy_y3,X : sta.b obj.speed_y+2
    !X8
    rtl
}

{ ;8BF2 - 8C2A
_018BF2:
    ;unused
    sta $0000
    jsl get_object_slot
    bmi .8C1B

    lda $0000 : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    jsl .8C1C
    lda.b obj.facing : sta.w obj.direction,X : sta.w obj.facing,X
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
    sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    jsl set_spawn_offset
    lda $12 : sta.w obj.direction,X : sta.w obj.facing,X
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

    lda $0000 : sta.w obj.type,X
    lda #$0C  : sta.w obj.active,X
    jsl set_spawn_offset
    lda $0001 : sta.w obj.direction,X
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
    lda.b obj.facing
    and #$0001
    bne .left

    clc
    lda.b obj.pos_x+1 : adc.w spawn_offset_x,Y : sta.w obj.pos_x+1,X
    bra .Y_offset

.left:
    sec
    lda.b obj.pos_x+1 : sbc.w spawn_offset_x,Y : sta.w obj.pos_x+1,X

.Y_offset:
    clc
    lda.b obj.pos_y+1 : adc.w spawn_offset_y,Y : sta.w obj.pos_y+1,X
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
    lda.b obj.facing
    and #$0001
    bne .8CCD

    clc : lda.w obj.pos_x+1,X : adc.w spawn_offset_x,Y : sta.b obj.pos_x+1
    bra .8CD6

.8CCD:
    sec : lda.w obj.pos_x+1,X : sbc.w spawn_offset_x,Y : sta.b obj.pos_x+1
.8CD6: ;a16 x16
    clc
    lda.w obj.pos_y+1,X : adc.w spawn_offset_y,Y : sta.b obj.pos_y+1
    !A8
    rtl
}

{ ;8CE2 - 8D48
_018CE2: ;a- x-
    ;object list setup stuff

    !X16
    ldx #$0100
.8CE7:
    stz $1A99,X
    dex : bne .8CE7

    ldx.w #obj[53].base-1
.8CF0:
    stz.w !obj_start,X ;zero out object array
    dex : bpl .8CF0

    !A16
    !X8
    ldx #$12 : stx.w open_weapon_slots
    lda.w #!obj_weapons.base
.8D02:
    sta.w slot_list_weapons,X
    clc
    adc.w #obj.ext.len
    dex #2 : bpl .8D02

    ldx #$3C : stx.w open_object_slots
    lda.w #!obj_objects.base
.8D15:
    sta.w slot_list_objects,X
    clc
    adc.w #obj.ext.len
    dex #2 : bpl .8D15

    !A8
    !X16
    lda.b #31 : sta $0000 ;obj_objects slot count
    ldx #$079E
.8D2C:
    lda $0000 : sta.w !obj_objects.ext.index,X
    dec $0000
    !A16
    txa : sec : sbc.w #obj.ext.len : tax
    !A8
    bpl .8D2C

    !AX8
    lda #$08 : sta.w open_magic_slots
    bra _018D7F
}

{ ;8D4A - 8D5A
get_object_slot: ;a- x-
    ldy.w open_object_slots ;object slot index
    bmi .ret

    !X16
    dec.w open_object_slots : dec.w open_object_slots ;next offset
    ldx.w slot_list_objects,Y ;return offset in X
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

    inc.w hud_update_score
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
    inc.w hud_update_lives
    rts
}

{ ;8F80 - 9023
_018F80: ;a8 x8
    lda.w hud_update_score
    beq .8F8F

    stz.w hud_update_score
    ldx #$C4 : ldy #$00 : jsr .8FEA
.8F8F:
    lda.w hud_update_timer
    beq .8FCD

    stz.w hud_update_timer
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
    inc.w layer3_needs_update
.8FCD:
    lda.w hud_update_lives
    beq .8FE9

    stz.w hud_update_lives
    lda.w extra_lives
    !A16
    and #$00FF
    ora #$2580
    sta $7F9106
    !A8
    inc.w layer3_needs_update
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
    inc.w layer3_needs_update
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
    lda.w !obj_arthur.pos_x+1
    cmp.b obj.pos_x+1
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
    lda.b obj.pos_x+1 : adc #$0100 : sta $0000
    ldx #$00
    clc
    lda.w !obj_arthur.pos_x+1
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
    lda.b obj.facing
    and #$0001
    bne .91A3

    clc : lda.w !obj_arthur.pos_x+1 : adc.w _00A7E6+0,X : sta $0004
    bra .91AD

.91A3:
    sec : lda.w !obj_arthur.pos_x+1 : sbc.w _00A7E6+0,X : sta $0004
.91AD:
    clc : lda.w !obj_arthur.pos_y+1 : adc.w _00A7E6+2,X : sta $0006
    bra .91CA

.set_direction16: ;a- x-
    !AX16
    ldx.w #!obj_arthur.base
    lda.w obj.pos_x+1,X : sta $0004
    lda.w obj.pos_y+1,X : sta $0006
.91CA:
    ldy #$0000
    lda $0006
    sec
    sbc.b obj.pos_y+1
    bcs .91DC

    ;arthur is lower
    eor #$FFFF
    inc
    ldy #$0004
.91DC:
    sta $0000 ;y diff
    lda $0004
    sec
    sbc.b obj.pos_x+1
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

.toward_arthur: ;todo: use this label
    !AX16
    ldx.w #!obj_arthur.base
.custom_obj: ;a16 x16
    lda.w obj.pos_x+1,X : sta $0004
    lda.w obj.pos_y+1,X : sta $0006
    ldy #$0000
    lda $0006
    sec
    sbc.b obj.pos_y+1
    bcs .9249

    eor #$FFFF
    inc
    ldy #$0004
.9249:
    sta $0000
    lda $0004
    sec
    sbc.b obj.pos_x+1
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
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    clc
    adc $0000
    cmp $0002
    bcs .ret

    sec
    lda.b obj.pos_y+1
    sbc.w !obj_arthur.pos_y+1
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
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
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
    lda.b obj.pos_y+1
    sbc.w !obj_arthur.pos_y+1
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
    lda.w _00A8CA+0,Y : adc.w camera_y+1 : sta.b obj.pos_y+1
    lda.w _00A8CA+2,Y : sta $2D
    rtl
}

{ ;939D - 93D6
_01939D: ;a- x-
    !AX16
    lda.b obj.pos_x+1 : sta $0000
    clc
    lda.b obj.pos_y+1 : adc $2D : sta.b obj.pos_y+1 : sta $0002
    jsr _01A3ED_get_tile_type2
    beq .ret

    php
    lda $001F
    pha
    !A16
    ldy #$02
    sec
    lda.b obj.pos_y+1 : sbc ($13),Y : sta.b obj.pos_y+1
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
    lda #$00 : xba : lda #$00 : tcd
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
    lda #$00 : xba : lda #$00 : tcd
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
    lda #$00 : xba : lda #$00 : tcd
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
    lda #$03 : sta.w OBSEL
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
    ldy.w open_weapon_slots
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
    ldy.w open_object_slots
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
    ldy.w open_object_slots
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
    sta.w open_object_slots
    !A16
.9609: ;reorder obj slot indices, for proper rendering order
    phy
    ldx $0002
.960D:
    lda.w slot_list_objects-0,Y
    cmp.w slot_list_objects-2,Y
    bcs .skip_reorder

    pha
    lda.w slot_list_objects-2,Y
    sta.w slot_list_objects-0,Y
    pla
    sta.w slot_list_objects-2,Y
.skip_reorder:
    dey #2
    dex
    bne .960D

    ply
    dec $0002
    bne .9609

    !A8
    ldy.w open_object_slots
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
    ldy.w #!obj_weapons.base
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
    adc.w #obj.ext.len
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
    ldx #$08 : stx.w open_magic_slots
    stz $14E7 ;torch magic active bool?
    !X16
    ldy.w #!obj_magic.base
.96D8:
    phy
    pld
    jsl _028B17_8B1A ;(partially) clear slots
    !A16
    tya
    clc
    adc.w #obj.ext.len
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
    lda #$00 : xba : lda #$00 : tcd
    jsl call_rng
    pha
    txy
    !AX16
    lda ($3D),Y ;3D = offset to random_values_idx
    sta $0000
    tay
    !A8
    pla
    cmp.w random_values_idx,Y
    bcc +

    sta !WRDIVL
    stz !WRDIVH
    lda.w random_values_idx,Y : sta !WRDIVB
    nop #8
    lda !RDMPYL
+:
    !A16
    clc
    and #$00FF
    adc $0000
    tax
    lda.w random_values_idx+1,X
    !AX8
    pld
    tay
    rtl
}

{
if !version == 2
    incsrc "task_fns/_019735_eu.asm" ;9735 - 975F
endif
    incsrc "task_fns/_019735.asm" ;9735 - 9756
    incsrc "task_fns/_019757.asm" ;9757 - 9775
    incsrc "task_fns/_019776.asm" ;9776 - 97D0
    incsrc "task_fns/_0197D1.asm" ;97D1 - 98A3
    incsrc "task_fns/_0198A4.asm" ;98A4 - 9A51
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
    pla : jsl current_task_suspend
    rts
}

{
    incsrc "task_fns/_019A93.asm" ;9A93 - 9C0B
    incsrc "task_fns/_019C0C.asm" ;9C0C - 9C85
    incsrc "task_fns/_019C86.asm" ;9C86 - 9CBD
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

{
    incsrc "task_fns/_019CE0.asm" ;9CE0 - 9DE4
    incsrc "task_fns/_019DE5.asm" ;9DE5 - 9E1A
    incsrc "task_fns/_019E1B.asm" ;9E1B - 9EE9
    incsrc "task_fns/_019EEA.asm" ;9EEA - 9F42
    incsrc "task_fns/_019F43.asm" ;9F43 - A009
    incsrc "task_fns/_01A00A.asm" ;A00A - A0A0
}

{ ;A0A1 - A0B1
    ;unused
    lda $0087,X
    cmp $0089,X
    beq .A0B1

    sta $0089,X
    tya : jsl current_task_suspend
.A0B1:
    rts
}

{
    incsrc "task_fns/_01A0B2.asm" ;A0B2 - A127
    incsrc "task_fns/_01A128.asm" ;A128 - A190
    incsrc "task_fns/_01A191.asm" ;A191 - A1F4
    incsrc "task_fns/_01A1F5.asm" ;A1F5 - A21C
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
    lda #$0000 : tcd
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
    lda #$0000 : tcd
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
    incsrc "task_fns/_01A397.asm"
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
    asl $0010 : rol $0011
    asl $0010 : rol $0011
    lda $0000
    and #$F0
    lsr #3
    ora $0010
    sta $0010
    lda $0003 : sta $0007
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
    clc : lda ($13),Y : adc.b obj.pos_x+1 : sta $0000
    iny #2
    clc : lda ($13),Y : adc.b obj.pos_y+1 : sta $0002
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
    ldx.b obj.direction
    beq .A4F4

    eor #$FFFF
    inc
.A4F4:
    clc
    adc.b obj.pos_x+1 : sta $0000
    iny #2
    clc
    lda ($13),Y
    adc.b obj.pos_y+1 : sta $0002
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
    adc.b obj.pos_y+1
    sta $0002
    !X16
    bra .A537

.A52B: ;a- x-
    ;weapon - tile collision check
    !AX16
    lda.b obj.pos_x+1 : sta $0000
    lda.b obj.pos_y+1 : sta $0002

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
    adc.b obj.pos_y+1
    sta.b obj.pos_y+1
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
    adc.b obj.pos_y+1
    sta.b obj.pos_y+1
+:
    !AX8
    rtl
}

{ ;A5A0 - A5AE
update_coord_offset_x: ;a- x-
    !A16
update_coord_offset_x_2: ;A5A2 | a16 x-
    ldy $15
    sec : lda.b obj.pos_x+1 : sbc ($13),Y : sta $0000
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
    adc.b obj.pos_y+1
    sta $001A
    asl $0018
    jsr update_coord_offset_x_2
    jsr _01A5F9_A5FC
    beq +

    inc $0018
+:
    clc
    adc.b obj.pos_y+1
    asl $0018
    ldx $0018
    phx
    jsr (.offsets,X)
    sta.b obj.pos_y+1
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
    lda.b #7 : sta.w task_loop_count
    ldy.b #$00
.A6B5:
    ldx.w !task_offset.state,Y
    cpx #$04
    bcs .A6C9

.A6BC:
    clc : tya : adc.b #task.len : tay
    dec.w task_loop_count
    bne .A6B5

    jmp _01A6AB

.A6C9:
    lda $02B6
    bne _01A6AB

    sty.w current_task_offset
    tya
    bne .A6DA

    inc.w frame_counter
    jsr _01A74A_A7A4
.A6DA:
    lda #$08 : sta.w !task_offset.state,Y
    !A16
    lda.w !task_offset.stack_reg,Y : tcs
    lda #$0000 : tcd
    !A8
    cpx #$0C
    bne +

    lda.w !task_offset.fn_id,Y : sta.w task_function_pointer
    jmp.w (task_function_pointer)

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
    ;"install task" function?
    php
    !AX8
    sta.w !task_offset.fn_id,Y
    lda #$0C : sta.w !task_offset.state,Y
    txa      : sta.w !task_offset.init_param,Y
    !A16
    lda.w !task_offset.stack_id,Y : sta.w !task_offset.stack_reg,Y
    plp
    rtl
}

{ ;A717 - A749
current_task:

.remove: ;a- x-
    !AX8
    ldy.w current_task_offset
    jsr .clear_state
.A71F:
    lda.b #stack[7].top>>8 : xba : lda.b #stack[7].top : tcs
    jmp _01A6AB_A6BC

.suspend: ;a- x-
    ;suspend task for A frames
    phb
    phd
    phx
    phy
    php
    !AX8
    ldy.w current_task_offset
    sta.w !task_offset.timer,Y
    lda #$01 : sta.w !task_offset.state,Y
    tsc
    !A16
    sta.w !task_offset.stack_reg,Y
    !A8
    bra .A71F

.clear_state:
    lda #$00 : sta.w !task_offset.state,Y
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
    incsrc "task_fns/_01A87C.asm"
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

    lda #!sfx_pause : jsl _018049_8053
    lda #$F3 : jsl _018049_8053
    ldx.b #task[6].base
.B16A:
    lda.w !task_offset.state,X : pha
    lda #$02 : sta.w !task_offset.state,X
    sec : txa : sbc.b #task.len : tax
    bne .B16A

.B17A:
    lda.b #1 : jsl current_task_suspend
    lda.w p1_button_press+1 ;unpause check
    bit #!start
    beq .B17A

    lda #$F4 : jsl _018049_8053
    ldx.b #task[1].base
.B18F:
    pla : sta.w !task_offset.state,X
    clc : txa : adc.b #task.len : tax
    cpx.b #task[7].base
    bne .B18F

.ret:
    rts
}

{ ;B19D - B26C
_01B19D: ;a8 x8
    jsr _01B14B
    lda.w !obj_arthur.pos_x+1 : sta $14BE
    lda.w !obj_arthur.pos_x+2 : sta $14BF
    lda.w !obj_arthur.pos_y+1 : sta $14C1
    lda.w !obj_arthur.pos_y+2 : sta $14C2
    lda #$00 : xba : lda #$00 : tcd
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
    jsr _01B5AB_local
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
    jsl fill_sprite_queue
    jsl _0185BB
    jsr _01B9A8
    jsr _01B4EF
    jsr _01BDB8
    jsr _01B2D6
    inc $0379
    jsr _01B2B1
    ldx #$01
.B22B:
    txa : jsl current_task_suspend
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
    lda.w !obj_arthur.pos_x+1
    cmp #$0010
    bcs .B2FB

    lda #$0011 : sta.w !obj_arthur.pos_x+1
.B2FB:
    lda #$0019 : clc : adc #$00F0 : sta $0000
    lda.w !obj_arthur.pos_x+1
    cmp $0000
    bcc .B314

    lda $0000 : dec : sta.w !obj_arthur.pos_x+1
.B314:
    rts
}

{ ;B315 - B46C
    incsrc "task_fns/_01B315.asm"
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
    ldx.w !obj_arthur.pos_x+1
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
    sta.w !obj_arthur.pos_x+1
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
    sta.w !obj_arthur.pos_y+1
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
    jsr .local
    rtl

.local:
    phd
    lda.b #palette_cycle_start>>8 : xba : lda.b #palette_cycle_start : tcd
.B5B6:
    lda $00
    beq .B5C1

    lda $0C
    asl
    tax
    jsr (.B5D2,X)
.B5C1:
    !A16
    tdc : clc : adc.w #palette_cycle.len : tcd
    cmp.w #palette_cycle_start+palette_cycle[7].base
    !AX8
    bne .B5B6

    pld
    rts

.B5D2:
    dw .B5DA, .B5F6, .B606, .B63B

;-----

.B5DA:
    lda $01 : asl : tax
    !AX16
    lda.l palette_cycling_data+0,X : sta $06 : tax
    lda.l palette_cycling_data+0,X : sta $02
    lda.l palette_cycling_data+2,X : sta $0A
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
    lda.l palette_cycling_data+4,X : sta.b palette_cycle.timer
    inx
    !A16
    ldy $0A
.B61D:
    lda.l palette_cycling_data+4,X
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
    dec.b palette_cycle.timer
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

    stz.w !obj_upgrade2.active
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
    lda #$03 : xba : lda #$19 : tcd
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
    lda #$1A : xba : lda #$80 : tcd
    jsr .B6E0
    lda #$1A : xba : lda #$8A : tcd
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

    inc.w hud_update_timer
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
    lda.w !obj_arthur.pos_x+1 : sta $0000
    lda.w !obj_arthur.pos_y+1 : sta $0002
    ldx #$0000 : jsr .BB70
    sec : lda.w !obj_arthur.pos_x+1 : sbc $0000 : sta $0004
    sec : lda.w !obj_arthur.pos_y+1 : sbc $0002 : sta $0006
    sec : lda #$0300 : sbc.w camera_x+1 : sec : sbc.w camera_y+1 : sta $000E
    lda.w camera_y+1 : sec : sbc.w camera_x+1 : sta $000C
    ldx.w #obj[52] ;total size of all slots
.BAE3:
    !A8
    lda.w !obj_start.type,X
    cmp #$3E
    bne .BAF4

    lda.w !obj_start.init_param,X
    cmp $1F93
    beq .BB42

.BAF4:
    !A16
    lda.w !obj_start.flags1,X
    bit #$0800
    bne .BB27

    bit #$0400
    bne .BB0A

    bit #$0008
    bne .BB3F

    bra .BB42

.BB0A: ;todo: add more defines here
    lda $0475,X : sta.w !obj_start.pos_x+1,X
    lda $0477,X : sta.w !obj_start.pos_y+1,X
    jsr .BB70
    lda.w !obj_start.pos_x+1,X : sta $0475,X
    lda.w !obj_start.pos_y+1,X : sta $0477,X
    bra .BB42

.BB27:
    clc : lda.w !obj_start.pos_x+1,X : adc $000C : sta.w !obj_start.pos_x+1,X
    clc : lda.w !obj_start.pos_y+1,X : adc $000E : sta.w !obj_start.pos_y+1,X
    bra .BB42

    bra .BB42 ;unused

.BB3F:
    jsr .BB70
.BB42:
    !A16
    sec
    txa
    sbc.w #obj.ext.len
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
    ldx.w !obj_arthur.pos_x+1 : stx $0000
    ldx.w !obj_arthur.pos_y+1 : stx $0002
    ldx #$0000 : jsr .BC51
    sec : lda.w !obj_arthur.pos_x+1 : sbc $0000 : sta $0004
    sec : lda.w !obj_arthur.pos_y+1 : sbc $0002 : sta $0006
    sec : lda #$0300 : sbc.w camera_y+1 : sec : sbc.w camera_x+1 : sta $000C
    sec : lda.w camera_x+1 : sbc.w camera_y+1 : sta $000E
    ldx.w #obj[52] ;total size of all slots
.BBC6:
    !A8
    lda.w !obj_start.type,X
    cmp #$3E
    bne .BBD7

    lda $0443,X ;todo: more !obj_start
    cmp $1F93
    beq .BC23

.BBD7:
    !A16
    lda.w !obj_start.flags1,X
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
    sbc.w #obj.ext.len
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
    lda.l tower_tiles,X
    plx
    tay
    lda #$0010 : sta $0006
.BD66:
    phx
    tyx
    lda.l tower_tiles,X
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
    lda.l tower_tiles+$1C,X
    plx
    tay
    lda #$0010 : sta $000A
.BDA1:
    phx
    tyx
    lda.l tower_tiles,X
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

    lda.w stage : asl : tax
    lda.l stage_layouts,X
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
    lda #$15A2 : tcd
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
    clc : tdc : adc #$0156 : tcd
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
    lda #$15A2 : tcd
    ldx.w _00B805+0,Y
    phy
    jsr .BFCE
    ply
    lda #$16F8 : tcd
    ldx.w _00B805+1,Y
    phy
    jsr .BFCE
    ply
    lda #$184E : tcd
    ldx.w _00B805+2,Y
    jsr .BFCE
    plx
    ldy.w _00B88B,X
    lda #$15A2 : tcd
    ldx.w _00B88B+0,Y
    phy
    jsr _01C00B
    ply
    lda #$16F8 : tcd
    ldx.w _00B88B+1,Y
    phy
    jsr _01C00B
    ply
    lda #$184E : tcd
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

{ ;C00B - C044
_01C00B: ;a16 x-
    !X16
    lda #$0000 : jsr .C028
    lda #$000A : jsr .C028
    lda #$0014 : jsr .C028
    lda #$001E : jsr .C028
    !X8
    rts

;-----

.C028:
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

.far: ;a16 x16
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
    lda #$15A2 : tcd
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

    lda $1A2F,X : xba : lda $1A30,X : xba : tcd
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
    clc : tdc : adc #$00D3 : tcd
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
    cmp.w !obj_arthur.pos_x+1
    bcs .C6D3

    lda $19E6
    ora #$00F0
    cmp.w !obj_arthur.pos_x+1
    bcs +

.C6D3:
    sta.w !obj_arthur.pos_x+1
+:
    clc
    lda.w camera_x+1
    adc $1EE8
    sec
    sbc.w !obj_arthur.pos_x+1
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
    sbc.w !obj_arthur.pos_y+1
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
    ldy.w _00B7A5_B7A5,X
    bmi .C7F5

    clc : lda.w _00B7A5_B7B5+0,Y : adc.w camera_x+1 : sta.w camera_x+1 : sta $1733 : sta $1889
          lda.w _00B7A5_B7B5+1,Y : adc.w camera_x+2 : sta.w camera_x+2 : sta $1734 : sta $188A
    clc : lda.w _00B7A5_B7B5+2,Y : adc.w camera_y+1 : sta.w camera_y+1 : sta $1737 : sta $188D
          lda.w _00B7A5_B7B5+3,Y : adc.w camera_y+2 : sta.w camera_y+2 : sta $1738 : sta $188E
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
    cmp.w !obj_arthur.pos_x+1
    bcs .C82F

    lda.w camera_x+1
    adc #$00F8
    cmp.w !obj_arthur.pos_x+1
    bcs .C832

.C82F:
    sta.w !obj_arthur.pos_x+1
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
    cmp.w !obj_arthur.pos_x+1
    bcc .C855

    sta.w !obj_arthur.pos_x+1
.C855:
    sec
    lda.w camera_x+1
    adc #$0080
    cmp.w !obj_arthur.pos_x+1
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
    lda #$15A2 : tcd
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

    lda.w !obj_arthur.hp
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
    inc.w layer3_needs_update
.C93E:
    rts

;-----

.C93F:
    !AX8
    lda $14E3
    ora.w is_frozen
    bne .C93E

    lda.w open_magic_slots
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
    lda.w !obj_shield.active
    beq .C97F

    ldx #$0D
    lda.w !obj_shield.init_param
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

    lda #$0C : sta.w !obj_upgrade2.active
    lda #$01 : sta.w !obj_upgrade2.init_param
    lda #!id_magic_charge : sta.w !obj_upgrade2.type
    stz.w !obj_upgrade2.flags1
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
    lda #$0C : sta.w !obj_upgrade2.active
    lda #!id_magic_charge : sta.w !obj_upgrade2.type
    lda #$02 : sta.w !obj_upgrade2.init_param
    stz.w !obj_upgrade2.flags1
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
    inc.w layer3_needs_update
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
    stz.w !obj_upgrade2.active
    lda #$FF : sta $14B7
    lda.w !obj_arthur._0F
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
    inc.w layer3_needs_update
    rts

;-----

.CA9F:
    lda $14E6
    beq .CAC3

    dec $14B5
    bpl .CA85

    stz.w !obj_upgrade2.active
    lda #!id_magic_charge : sta.w !obj_upgrade2.type
    stz.w !obj_upgrade2.flags1
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
    inc.w layer3_needs_update
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
    lda.w armor_state
    cmp #!arthur_state_gold
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
    inc.w layer3_needs_update
    stz.w !obj_upgrade2.active
    stz.w !obj_upgrade2.flags1
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
    lda.w frame_counter
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
    lda.w armor_state
    beq .CCCC

    lda #$01
.CCCC:
    sta.b obj.hp
    lda #$FF : sta $0F
    stz.w chest_counter
    stz.w knife_rapid_timer
    stz.w knife_rapid_count
    stz.w hit_by_water_crash
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
    lda.w _00ED00+$04 : sta $0313+$27 ;todo: what is 313? edit: mistaken assumption most likely, should be 33A & 33C?
    lda.w _00ED00+$34 : sta $0340
    lda #$0020 : sta $0313+$29
    lda #$0050 : sta $0342
    !A8
    lda.w stage
    cmp #$04
    bne .CD36

    lda #$01 : sta.b obj.facing ;make arthur face left initially in 4b
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

    lda #$0C : sta.w !obj_weapons.active ;0C = "create" enum
    lda #!id_ready_go : sta.w !obj_weapons.type
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

    lda.w !obj_weapons.active
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
    lda #!sfx_land : jsl _018049_8053

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
    lda.b obj.facing  : sta.b obj.direction
    lda #$03 : sta $3C
    lda #$FF : sta $3D
.CDEE:
    lda #$00
    jsr .CE9C
    jsr _01D263
    jsr _01D565
    jsr _01DE62_DE63
    lda #!down
    bit.w p1_button_hold+1
    beq .CE08

    brk #$00

;----- CE05

    jmp .CF8B

.CE08:
    lda #$00 : jsr _01D1C4_D1C5
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
    lda.b obj.facing : sta.b obj.direction
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
    lda #$00 : jsr _01D1C4_D1C5
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

    sta.b obj.direction
    sta.b obj.facing
    jsl update_pos_x
    jsr _01D91C_D94E

.CE9B:
    rts

;-----

.CE9C:
    sta.w jump_type
    lda.b obj.pos_y+1 : sta $39
    lda.b obj.pos_y+2 : sta $3A
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
    lda.w obj.pos_x
    beq .CECC

    inc $14D0
.CECC:
    rts

.CECD:
    lda $14C3
    beq .CEDA

    lda $39 : sta.b obj.pos_y+1
    lda $3A : sta.b obj.pos_y+2
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
    jsr _01D263_D2D4
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

    lda #$50 : sta.b obj.speed_x   ;set custom speed if bowgun magic is active
    lda #$01 : sta.b obj.speed_x+1
               stz.b obj.speed_x+2
.CF3A:
    lda.b obj.facing : sta.b obj.direction
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

    jsr _01D263_D2D4
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
    lda.b obj.facing : sta.b obj.direction
    lda #$04 : sta $3C
    lda #$02 : sta $1D
    lda #$01 : ora $09 : sta $09
.CF9D:
    jsr _01D263
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
    jsr _01D263_D2D4
    lda #$00 : jsr _01D1C4_D1C5
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
    lda #$20 : sta $1EF0
    asl      : sta $1EF2
    inc $14F9
    rts
}

{ ;CFF3 -
;ladder stuff

_01CFF3:
    !A16
    sec : lda.b obj.pos_y+1 : sbc #$0010 : sta.b obj.pos_y+1
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
    dec.b obj.pos_y+1
    !A8
    ldy #$08
    jsr _01D263_D2AB
    bcc .D041

    jsl _01A4E2_A52B
    jsr _01D263_D2C9
    bcc .D041

    bra .D020

.D066:
    bit #!down
    beq .D03D

    jsl update_animation_normal
    !A16
    inc.b obj.pos_y+1
    !A8
    ldy #$08
    jsr _01D263_D2BD
    bcc .D085

    ldy #$00
    jsr _01D263_D2BD
    bcc .D085

    jmp _01CCBD_CFC8

.D085:
    ldy #$00
    jsl _01A4E2_A4E8
    bcc .D041

    jmp _01CCBD_CDC4
}

{ ;D090 - D1C3
;arthur thing code

_01D090: ;a8 x8
    jsr .D184
    jsr .D16C
    jsr _01DEE7_DEE8
    lda $14C3 : sta $14BB
    stz $14C3
    stz.w is_on_stone_pillar
    lda $0F
    bne .D0B1

    lda.w armor_state : asl : tax
    jsr (.D114,X)
.D0B1:
    jsr _01D263_D2E2
    jsr _01D30F
    jsr .D143
    lda $0F
    bmi .D0C3

    lda.w is_shooting
    bne .D0C7

.D0C3:
    jsl set_sprite_84A7
.D0C7:
    lda.w armor_state
    cmp $14B8
    beq .D0DC

    ;change sprite set and such for arthur
    sta $14B8
    jsr _01DA88
    lda #$FF : sta $26
    jsr set_arthur_palette ;unsure if this should be a local function or not
.D0DC:
    jsl _018E32_8E73
    jsr _01D1E1
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

    jsr _01D263_D2D4
+:
    jsl update_animation_normal
    jsr _01D371_D3C4
    rts

;-----

.D143:
    lda.w armor_state
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
    lda.b obj.pos_y+1
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
    lda.b obj.pos_x+1
    sbc.w _00BA32+0,X
    clc
    adc.w _00BA32+2,X
    cmp.w _00BA32+4,X
    bcs .D1C3

    lda $14BE : sta.b obj.pos_x+1
.D1C3:
    rts
}

{ ;D1C4 - D1E0
_01D1C4:
    rts

.D1C5: ;a8 x-
    sta.w jump_type
    lda.w jump_press
    beq _01D1C4

    pla : pla
    brk #$00

;----- D1D1

    ldx.w jump_type
    jmp (+,X) : +: dw _01CCBD_arthur_jump, arthur_baby_jump, arthur_seal_jump, arthur_bee_jump, arthur_maiden_jump
}

{ ;D1E1 - D262
_01D1E1:
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
    lda.b #_01CCBD_CDC4    : sta.b obj.state+1
    lda.b #_01CCBD_CDC4>>8 : sta.b obj.state+2
    lda.w transform_armor_state_stored : sta.w armor_state
    lda #$FF  : sta $3D
    stz.w is_shooting
    lda.w shield_state_stored
    beq .D239

    sta.w !obj_shield.type
    lda.w shield_type_stored : sta.w !obj_shield.init_param
    lda #$0C                 : sta.w !obj_shield.active
.D239:
    lda.w armor_state
    cmp #!arthur_state_bronze
    beq .D245

    cmp #!arthur_state_gold
    beq .D250

    rts

.D245:
    lda #!id_arthur_face : sta.w !obj_upgrade.type
    lda #$0C             : sta.w !obj_upgrade.active
    rts

.D250:
    lda #!id_arthur_plume : sta.w !obj_upgrade.type
    lda #$0C              : sta.w !obj_upgrade.active
    lda #$01              : sta.w can_charge_magic
    stz $14B3
    rts
}

{ ;D263 - D30E
_01D263: ;a8 x? ;arthur code, called from arthur idle?
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
    lda.b obj.pos_y+1 : adc #$0010 : sta.b obj.pos_y+1
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
    lda.b obj.pos_x+1 : and #$F0 : ora #$08 : sta.b obj.pos_x+1
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

    sta.b obj.facing
.D2E1:
    rts

;-----

.D2E2:
    lda.w armor_state
    cmp #!arthur_state_bee
    beq .D30E

    lda.b obj.hp
    ora $08
    bmi .D30E

    lda $14E9
    beq .D30E

    jsl _02FDB3
    lda.b obj.direction : eor #$01 : sta.b obj.direction
    ldx.w stage
    sec : lda.b obj.hp : sbc.w _00BA5E,X : sta.b obj.hp
    bpl .D30E

    inc $14D1
.D30E:
    rts
}

{ ;D30F - D370
_01D30F:
    lda $14D1
    bne .D370

    lda.b obj.pos_y+2
    bmi .D343

    !A16
    clc
    lda $19E8
    adc #$0100
    cmp.b obj.pos_y+1
    !A8
    bcs .D343

    ;falling into a pit
    jsl _018049_8051
    inc $14D1
    lda.b #_01DD5C    : sta.b obj.state+1
    lda.b #_01DD5C>>8 : sta.b obj.state+2
    stz.w !obj_upgrade2.active
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
    stz.w armor_state
    lda.b #_01D72B    : sta.b obj.state+1
    lda.b #_01D72B>>8 : sta.b obj.state+2
    lda #$FF : sta.b obj.hp
    stz $0F
    stz $1170
    stz.w can_charge_magic
    stz $02AC
    jsr _01DDE6
    inc $14D2
    inc $14D1
.D370:
    rts
}

{ ;D371 - D564
_01D371:
    asl
    tax
    jmp (+,X) : +: dw .D3B7, .D384, .D392, .D3B8, .D3C3, .D3BC, .D3D1

;-----

.D384:
    stz.w skip_double_jump_boost
    ldy.b obj.speed_y+2
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

    lda.b obj.anim_timer
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
    bne _01D371

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
    lda.b obj.speed_y+2
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
    lda #$0C  : sta.w obj.active,X
    lda.w weapon_current
    pha
    inc
    sta.w obj.type,X
    lda #$00
    xba
    pla ;weapon_current
    asl
    ora.w weapon_double_jump_boost
    tay
    lda.w weapon_damage,Y : sta.w obj.hp,X
    jsr _01DD90
    lda $0009,X : ora #$08 : sta $0009,X
    lda.w weapon_double_jump_boost
    tay
    lda.w sprite_shimmer_bit,Y : ora $0008,X : sta $0008,X
    lda.b obj.facing : sta.w obj.direction,X : sta.w obj.facing,X
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

    lda #$0C : sta.w obj.active,X
    lda #$08 : sta $0009,X
    lda $1F25 : sta $002B,X
    lda $0000 : sta.w obj.type,X
    jsr _01DD90
    lda.b obj.facing : sta.w obj.direction,X : sta.w obj.facing,X
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
    ldx.b obj.facing
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

    lda.w armor_state
    cmp #!arthur_state_gold
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

    lda #$80      : sta $0008,X
    lda #$0C      : sta.w obj.active,X
    lda #!id_seek : sta.w obj.type,X
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

    lda.w open_magic_slots
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
    lda #$0C : sta.w obj.active,X
    lda #!id_shield_magic : sta.w obj.type,X
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
    lda #$0C : sta.w obj.active,X
    lda #!id_nuclear : sta.w obj.type,X
    lda #$80 : sta $0008,X
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.w obj.pos_x+1,X
    sec : lda.w !obj_arthur.pos_y+1 : sbc #$0040 : sta.w obj.pos_y+1,X
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

    lda #$0C : sta.w obj.active,X
    lda #!id_tornado : sta.w obj.type,X
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.w obj.pos_x+1,X
    lda.w !obj_arthur.pos_y+1 : sta.w obj.pos_y+1,X
    lda $0000 : sta.w obj.direction,X : sta.w obj.facing,X
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
    stz.w !obj_upgrade.active
    stz.w !obj_upgrade2.active
    lda.b obj.hp
    bpl .D791

    ;0 hp
    stz $02AC
    stz.w armor_state
    lda $08 : and #$EF : sta $08
    jsr _01DA88
    jmp .D819

.D791:
    lda.w transform_armor_state_stored : sta.w armor_state
    ldy #$01 : jsr set_arthur_palette_D9DB
    lda #!sfx_armor_shatter : jsl _018049_8053
    lda #$05 : sta $0000 ;armor piece count
    jsr _019697_96CA
    stz $0332
    inc $0331
.D7B0:
    jsr get_magic_slot
    lda #$0C : sta.w obj.active,X ;0C: "create" enum value of sorts
    lda #!id_armor_piece : sta.w obj.type,X
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
    lda.b obj.pos_x+1 : adc.w _00BA8A+0,Y : sta.w obj.pos_x+1,X
    clc
    lda.b obj.pos_y+1 : adc.w _00BA8A+2,Y : sta.w obj.pos_y+1,X
    !AX8
    dec $0000
    bpl .D7B0

    brk #$00

;----- D7F1

    stz.w armor_state
    stz.w transform_armor_state_stored
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
    lda #!arthur_state_steel : sta.w arthur_state_stored
    stz.w upgrade_state_stored
    stz.w shield_state_stored
    stz.w shield_type_stored
    lda.w weapon_current : and #$FE : sta.w current_weapon_stored
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
    lda.w !obj_arthur.pos_y+2
    bmi .D8D4

    !A16
    clc
    lda $19E8
    adc #$0100
    cmp.w !obj_arthur.pos_y+1
    !A8
    bcc .D8D5

.D8D4:
    rts

.D8D5:
    pla : pla
    stz.w !obj_upgrade2.active
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
    lda.b obj.speed_y+2
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
    lda $14C1 : sta.b obj.pos_y+1
    stz.w !obj_arthur.speed_y
    !A8
    stz.w !obj_arthur.speed_y+2

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
    lda $14BE : sta.b obj.pos_x+1
    lda $14BF : sta.b obj.pos_x+2
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
    lda.b obj.speed_y+2
    bpl .D985
    lda #$00
    rts

.D985:
    !A16
    clc
    lda $19E8
    adc #$00E0
    cmp.b obj.pos_y+1
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
    ldy.w open_weapon_slots
    bmi .D9D7

    !X16
    dec.w open_weapon_slots : dec.w open_weapon_slots
    ldx.w slot_list_weapons,Y
.D9D7:
    rts
}

{ ;D9D8 - D9F9
set_arthur_palette: ;a- x8
    ldy.w armor_state
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
    ldx.b #task[6].base
    ldy #$06
.D9FE:
    lda.w !task_offset.state,X : sta $1FCB,Y
    lda #$02 : sta.w !task_offset.state,X
    dey
    sec : txa : sbc.b #task.len : tax
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
    lda #$0C : sta.w !obj_upgrade2.active
    lda #!id_armor_up_vfx : sta.w !obj_upgrade2.type
    stz.w !obj_upgrade2.flags1
    stz.w !obj_upgrade2.flags2
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.w !obj_upgrade2.pos_x+1
    lda.w !obj_arthur.pos_y+1 : sta.w !obj_upgrade2.pos_y+1
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
    ldx.b #task[6].base
    ldy #$06
.DA77:
    lda $1FCB,Y : sta.w !task_offset.state,X
    dey
    sec : txa : sbc.b #task.len : tax
    bne .DA77

    jmp _01CCBD_CDC4
}

{ ;DA88 - DA98
_01DA88: ;a8 x8
    ;todo: name? update arthur sprite set?
    ldy.w armor_state
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
    lda.w !obj_arthur.hp
    bmi .DAB7

    stx.w !obj_arthur.state+1
    sty.w !obj_arthur.state+2
    jsr _01DDE6
    lda #$FF : sta.w !obj_arthur._0F
.DAB7:
    rtl
}

{ ;DAB8 - DB66
_01DAB8:
    lda #$16 : jsl _018049_8053
    stz $02AC
    stz.w !obj_upgrade2.active
    stz.w can_charge_magic
    stz.w is_shooting
    lda #$FF : sta $0F : sta $19EC
    lda #$01 : sta.b obj.direction : sta.b obj.facing
    stz $3C
    ldy #$00 : jsl set_speed_x
.DADF:
    brk #$00

;----- DAE1

    jsl update_animation_normal
    jsl update_pos_x
    !A16
    sec
    lda.b obj.pos_x+1
    sbc.w camera_x+1
    cmp #$0040
    !A8
    bcs .DADF

    stz.b obj.direction
    stz.b obj.facing
    lda #$03 : sta $3C
    lda #$1F : cop #$00

;----- DB04

    lda #!id_intro_cutscene_obj : ldx #$00 : ldy #$16 : jsl _018C55
    !AX16
    ldy.w open_object_slots
    ldx $13F3,Y : stx $35
    stz $002D,X
    clc : lda.w camera_x+1 : adc #$00C0 : sta.w obj.pos_x+1,X
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
    lda.w obj.pos_x+1,X
    sbc.b obj.pos_x+1
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
    stz.w !obj_upgrade2.active
    stz.w can_charge_magic
    stz.w is_shooting
    lda #$FF : sta $19EC
    lda #$FF : sta $0F
    stz.w !obj_arthur.facing
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
    lda.w armor_state
    bne .DBB4

    inc.w armor_state
    lda #$01 : sta.w !obj_arthur.hp
.DBB4:
    jsr _01DA88
    jsr set_arthur_palette
    jsl _01DCCF
    lda #$0E : sta $3C
    lda.w !obj_upgrade.flags1 : and #$F7 : sta.w !obj_upgrade.flags1
.DBCA:
    brk #$00

;----- DBCC

    lda $1F9F
    beq .DBCA

    lda.w !obj_upgrade.flags1 : ora #$08 : sta.w !obj_upgrade.flags1
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
    inc.b obj.pos_x+1
    brk #$00

;----- DBF0

    lda.w stage
    tay ;unused?
    asl
    tax
    lda.w _00BAB3,X
    cmp.b obj.pos_x+1
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
    ldx.w armor_state
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
    lda.w armor_state : asl : tax
    jmp (+,X) : +: dw _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4, _01CCBD_CDC4, arthur_baby_DF31, arthur_seal_E0AA, arthur_bee_E195, arthur_maiden_DFE8
}

{ ;DC56 - DCCE
_01DC56: ;a8 x8
    ;hit by water crash
    inc $14D1
    lda $09 : and #$CF : sta $09
    inc.w hit_by_water_crash
    lda #$FF : sta $0F
    lda.w armor_state
    cmp #$05
    bcs .DC77

    lda #$1D : sta $3C
    lda #!id_water_crash_splash : jsl prepare_object
.DC77:
    lda #$3F : sta $2D
    lda #!sfx_arthur_death : jsl _018049_8053
.DC81:
    clc
    lda.b obj.pos_y+0 : adc $006D : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : adc $006E : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : adc $006F : sta.b obj.pos_y+2
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
    lda #!arthur_state_steel : sta.w arthur_state_stored
    lda.w weapon_current : and #$FE : sta.w current_weapon_stored
    stz.w shield_state_stored
    stz.w shield_type_stored
    stz.w upgrade_state_stored
.DCCB:
    brk #$00

;----- DCCD

    bra .DCCB ;unreachable
}

{ ;DCCF - DD00
_01DCCF: ;a8 x-
    ;store armor / upgrades / weapon across stages
    stz.w shield_state_stored
    stz.w shield_type_stored
    stz.w upgrade_state_stored
    lda.w armor_state : sta.w arthur_state_stored
    lda.w weapon_current : sta.w current_weapon_stored
    lda.w !obj_upgrade.active
    beq .DD00

    lda.w !obj_upgrade.type : sta.w upgrade_state_stored
    lda.w !obj_shield.active
    beq .DD00

    lda.w !obj_shield.type : sta.w shield_state_stored
    lda.w !obj_shield.init_param : sta.w shield_type_stored
.DD00:
    rtl
}

{ ;DD01 - DD44
_01DD01: ;a8 x8
    inc.w jump_counter
    ldx.w armor_state
    lda.w _00BACE,X : sta $3C
    ldy #$01 : jsl set_speed_xyg
    lda #$FF : sta $0F
    stz.w is_shooting
.DD19:
    brk #$00

;----- DD1B

    jsl update_pos_xyg_add
    lda.b obj.speed_y+2
    bmi .DD19

    jsr _01D97E_D985
    beq .DD19

    stz.w jump_counter
    lda.w armor_state : asl : tax
    jmp (+,X)

+:
    dw _01CCBD_CDBE, _01CCBD_CDBE, _01CCBD_CDBE, _01CCBD_CDBE, _01CCBD_CDBE ;armors
    dw arthur_baby_DF31, arthur_seal_E0AA, arthur_bee_E195, arthur_maiden_DFE8 ;transformations
}

{ ;DD45 - DD5B
arthur_cap_fall_speed: ;a8 x-
    jsl update_pos_xyg_add
    lda.b obj.speed_y+2
    bmi .DD5B

    lda.b obj.speed_y+1
    cmp #$07
    bcc .DD5B

    stz.b obj.speed_y
    lda #$06 : sta.b obj.speed_y+1
    stz.b obj.gravity
.DD5B:
    rts
}

{ ;DD5C - DD79
_01DD5C: ;a8 x?
    inc $14D1
    lda #$FF : sta $0F
    lda.b obj.hp
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
    lda.b #_01DA99    : sta.w !obj_arthur.state+1
    lda.b #_01DA99>>8 : sta.w !obj_arthur.state+2
    stz.w !obj_arthur._0F
    rtl
}

{ ;DDAE - DDCD
_01DDAE: ;a9 x-
    lda.b #_01DB67    : sta.w !obj_arthur.state+1
    lda.b #_01DB67>>8 : sta.w !obj_arthur.state+2
    stz.w !obj_arthur._0F
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
    lda.w !obj_arthur.flags1 : ora #$80 : sta.w !obj_arthur.flags1
    rts
}

{ ;DDDA - DDE5
    ;unused
    jsr _01DDE6
    lda.w !obj_arthur.flags1 : ora #$80 : sta.w !obj_arthur.flags1
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
    ldx.w armor_state
    lda.w _00BADD,X : sta $3C
.DE04:
    brk #$00

;----- DE06

    jsr _01D263_D2D4
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
    inc.b obj.pos_x+1
    brk #$00

;----- DEBC

    dec.b obj.pos_x+1
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

    lda.w !obj_upgrade2.active+$35 ;todo
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
    lda.b obj.facing : sta.b obj.direction
.DF41:
    lda #$02 : jsr _01CCBD_CE9C
    lda #$02 : jsr _01D1C4_D1C5
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
    lda.b obj.facing : sta.b obj.direction
.DF66:
    jsr _01CCBD_CE85
    lda #$02 : jsr _01CCBD_CE9C
    lda #$02 : jsr _01D1C4_D1C5
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
    jsr _01D263_D2D4
    ldy.w _00BA2A,X : jsl set_speed_xyg
    lda.b obj.facing : sta.b obj.direction
.DFA1:
    brk #$00

;----- DFA3

    jsr _01D263_D2D4
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
    lda.b obj.facing : sta.b obj.direction
.DFF8:
    brk #$00

;----- DFFA

    lda #$08 : jsr _01CCBD_CE9C
    lda #$08 : jsr _01D1C4_D1C5
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
    lda.b obj.facing : sta.b obj.direction
.E02C:
    jsr _01CCBD_CE85
    lda #$08 : jsr _01CCBD_CE9C
    lda #$08 : jsr _01D1C4_D1C5
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
    jsr _01D263_D2D4
    lda.w _00BB0E_BB0E,X : sta $3C
    ldy.w _00BB0E_BB12,X : jsl set_speed_xyg
    lda.b obj.facing : sta.b obj.direction
.E072:
    brk #$00

;----- E074

    jsr _01D263_D2D4
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
    lda.b obj.facing : sta.b obj.direction
.E0BA:
    brk #$00

;----- E0BC

    lda #$04 : jsr _01CCBD_CE9C
    lda #$04 : jsr _01D1C4_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    beq .E0BA

    lda #$01 : sta $3C
    ldy #$5A : jsl set_speed_x
    lda.b obj.facing : sta.b obj.direction
.E0DB:
    jsr _01CCBD_CE85
    lda #$04 : jsr _01CCBD_CE9C
    lda #$04 : jsr _01D1C4_D1C5
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
    jsr _01D263_D2D4
    ldy.w _00BB16,X : jsl set_speed_xyg
    lda.b obj.facing : sta.b obj.direction
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

    jsr _01D263_D2D4
    ldy.w _00BB16,X : jsl set_speed_xyg
    lda.b obj.facing : sta.b obj.direction
    lda #$02 : sta $3C
.E14E:
    brk #$00

;----- E150

    jsr .E155
    bra .E14E

;-----

.E155:
    jsr _01D263_D2D4
    jsr arthur_cap_fall_speed
    jsr _01D8F1
    jsr _01D91C
    jsr _01D97E
    bne .E16F

    lda.b obj.speed_y+2
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
    lda.b obj.facing : sta.b obj.direction
.E1A5:
    brk #$00

;----- E1A7

    lda #$06 : jsr _01CCBD_CE9C
    lda #$06 : jsr _01D1C4_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    beq .E1A5

    ldy #$60 : jsl set_speed_x
    lda.b obj.facing : sta.b obj.direction
.E1C2:
    jsr _01CCBD_CE85
    lda #$06 : jsr _01D1C4_D1C5
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
    lda $14BE : sta.w !obj_arthur.pos_x+1
    lda $14BE : sta.w !obj_arthur.pos_x+1 ;duplicate load+store
    !A8
.E1EB:
    brk #$00

;----- E1ED

    bra .E1C2

;-----

.jump:
    inc.w jump_counter
    lda #$2B : jsl _018049_8053
    jsr _01D263_D2D4
    ldy #$33 : jsl set_speed_xyg
    lda.b obj.facing : sta.b obj.direction
.E205:
    brk #$00

;----- E207

    jsr _01D263_D2D4
    jsr arthur_cap_fall_speed
    jsr _01D8F1
    jsr _01D91C
    jsr _01D97E
    bne .E221

    lda.b obj.speed_y+2
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

{
    incsrc "objects/lance.asm"             ;E2AB - E350
    incsrc "objects/knife.asm"             ;E351 - E533
    incsrc "objects/knife2_shimmer.asm"    ;E534 - E559
    incsrc "objects/bowgun.asm"            ;E55A - E656
    incsrc "objects/scythe.asm"            ;E657 - E6FC
    incsrc "objects/torch.asm"             ;E6FD - E75D
    incsrc "objects/torch_flame.asm"       ;E75E - E8F8
    incsrc "objects/lance2_fire_trail.asm" ;E8F9 - E966
}

{ ;E967 - E98C
_01E967: ;knife related
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
    lda #$06 : sta.b obj.hp
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

    stz.b obj.facing
    jsr .EA36
    lda #$01 : sta.b obj.facing
    jsr .EA36
    stz.b obj.facing
    ldy #$7E : ldx #$21 : jsl set_sprite
    lda #$10 : cop #$00

;----- EA14

    lda $08 : and #$77 : sta $08
    !A16
    clc : lda.w camera_x+1 : adc #$0080 : sta.b obj.pos_x+1
    clc : lda.w camera_y+1 : adc #$0080 : sta.b obj.pos_y+1
    !A8
    brk #$00

;----- EA32

    jml _028B0E

;-----

.EA36:
    jsr get_magic_slot
    bmi .EA53

    lda #$0C : sta.w obj.active,X
    lda #$AA : sta.w obj.type,X
    stz $0007,X
    lda.b obj.facing : sta.w obj.facing,X
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

    lda #$0C : sta.w obj.active,X
    lda #$80 : ora $0008,X : sta $0008,X
    lda #!id_nuclear_projectile : sta.w obj.type,X
    lda $07 : inc : sta $0007,X
    lda.b obj.facing : sta.w obj.facing,X
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
    incsrc "objects/bracelet.asm"
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
    lda #!id_lightning : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    stz $0007,X
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    !AX8
    lda #$07 : sta $30
.EC92:
    brk #$00

;----- EC94

    jsr _01D957
    dec $30
    bne .EC92

    lda #$3F : sta $14EB
    lda #$0C : sta.w !obj_upgrade2.active
    stz.w !obj_upgrade2.init_param
    lda #!id_magic_charge : sta.w !obj_upgrade2.type
    stz.w !obj_upgrade2.flags1
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
    lda.b obj.facing : sta $0005
    lda.w frame_counter : sta $0006
.ECE1:
    jsr get_magic_slot
    bmi .ED35

    lda #!id_lightning : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda $0000 : sta $0007,X
    lda $0001 : sta.w obj.direction,X
    lda $0004 : sta $000F,X
    lda #$01 : sta.b obj.facing
    jsl set_spawn_offset
    lda #$01 : sta.w obj.facing,X
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
    lda $0005 : sta.b obj.facing
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
    lda #$02 : sta.b obj.hp
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
    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    lda.w !obj_arthur.pos_y+1 : sta.b obj.pos_y+1
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
    lda #$0C : sta.w obj.active,X
    lda #!id_thunder : sta.w obj.type,X
    lda $0000 : sta $0007,X
    !A16
    lda.w camera_y+1 : sta.w obj.pos_y+1,X
    lda.w !obj_arthur.pos_x+1 : sta.w obj.pos_x+1,X
    !AX8
    inc $0000
    lda $0000
    cmp #$04
    bne .EDBF

    lda #$3F : sta $14EB
    lda #$0C : sta.w !obj_upgrade2.active
    stz.w !obj_upgrade2.init_param
    lda #$82 : sta.w !obj_upgrade2.type
    stz.w !obj_upgrade2.flags1
.EE06:
    brk #$00

;----- EE08

    jsr _01D957
    lda.w open_magic_slots
    cmp #$08
    bne .EE06

    lda #$04 : sta $0000
.EE17:
    jsr get_magic_slot
    bmi .EE69

    lda #$0C : sta.w obj.active,X
    lda #!id_thunder : sta.w obj.type,X
    lda $0000 : sta $0007,X
    !A16
    lda.w !obj_arthur.pos_y+1 : sta.w obj.pos_y+1,X
    lda.w !obj_arthur.pos_x+1 : sta.w obj.pos_x+1,X
    !A8
    lda $0000
    and #$08
    bne .EE51

    !A16
    lda.w obj.pos_x+1,X : clc : adc #$000E : sta.w obj.pos_x+1,X
    bra .EE5D

.EE51:
    !A16
    lda.w obj.pos_x+1,X : sec : sbc #$000E : sta.w obj.pos_x+1,X
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
    lda #$02 : sta.b obj.hp
    lda $08 : ora #$10 : sta $08
    lda $09 : ora #$88 : sta $09
    !A16
    lda #$0008 : sta.b obj.speed_x+1 : sta.b obj.speed_y+1
    lda #$0050 : sta $29
    !A8
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    lda $07
    sec
    sbc #$08
    bcc .EEE3

    inc.b obj.direction
    inc.b obj.facing
.EEE3:
    brk #$00

;----- EEE5

    lda $07 : asl : tax
    jmp (+,X) : +: dw .EF04, .EF04, .EF04, .EF04, .EF23, .EF23, .EF23, .EF23, .EF2F, .EF2F, .EF2F, .EF2F

;-----

.EF04:
    jsl update_pos_y
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    lda.b obj.pos_y+1
    clc
    adc #$0020
    sec
    sbc.w !obj_arthur.pos_y+1
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
    lda.w open_magic_slots
    cmp #$08
    bne .EF56

    lda #$07 : sta $0000
.EF67:
    jsr get_magic_slot
    bmi .EF9F

    lda #$0C : sta.w obj.active,X
    lda #!id_fire_dragon : sta.w obj.type,X
    lda $0000 : sta $0007,X
    lda.b obj.direction : sta.w obj.direction,X
    lda.b obj.facing : sta.w obj.facing,X
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.w obj.pos_x+1,X
    lda.w !obj_arthur.pos_y+1 : sec : sbc #$001C : sta.w obj.pos_y+1,X
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
    lda #$02 : sta.b obj.hp
    lda $09 : ora #$88 : sta $09
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    !A16
    lda #$0008 : sta.b obj.speed_x+1 : sta.b obj.speed_y+1
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
    dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1
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
    dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1
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
    inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1
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
    inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1 : inc.b obj.pos_y+1
    !A8
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F0F7

    lda #$05 : sta.b obj.direction
    bra .F0D2

.F0F7:
    lda #$03 : sta.b obj.direction
    bra .F0D2

;-----

.F0FD:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F115

    inc.b obj.direction
    bra .F0D2
.F115:

    dec.b obj.direction
    bra .F0D2

;-----

.F119:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F0D2

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F131

    inc.b obj.direction
    bra .F0D2

.F131:
    dec.b obj.direction
    bra .F0D2


;-----

.F135:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$09 : sta $2D
    lda.b obj.facing
    beq .F14D

    inc.b obj.direction
    bra .F18B

.F14D:
    dec.b obj.direction
    bra .F18B

;-----

.F151:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F169

    inc.b obj.direction
    bra .F18B

.F169:
    lda #$0F : sta.b obj.direction
    bra .F18B

;-----

.F16F:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F187

    inc.b obj.direction
    bra .F18B

.F187:
    dec.b obj.direction
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
    lda.b obj.facing
    beq .F1A6

    inc.b obj.direction
    bra .F18B

.F1A6:
    dec.b obj.direction
    bra .F18B

;-----

.F1AA:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    inc $0F
    lda #$0D : sta $2D
    lda.b obj.facing
    beq .F1C2

    inc.b obj.direction
    bra .F18B

.F1C2:
    dec.b obj.direction
    bra .F18B

;-----

.F1C6:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F18B

    lda.b obj.facing : eor #$01 : sta.b obj.facing
    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F1E4

    dec.b obj.direction
    bra .F220

.F1E4:
    inc.b obj.direction
    bra .F220

;-----

.F1E8:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F200

    dec.b obj.direction
    bra .F220

.F200:
    inc.b obj.direction
    bra .F220

;-----

.F204:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda #$03 : sta $2D
    lda.b obj.facing
    beq .F21C

    dec.b obj.direction
    bra .F220

.F21C:
    inc.b obj.direction
    bra .F220

.F220:
    jmp .F038

;-----

.F223:
    ldx #$48 : jsl update_pos_xy_2
    dec $2D
    bne .F220

    inc $0F
    lda.b obj.facing
    beq .F237

    dec.b obj.direction
    bra .F220

.F237:
    stz.b obj.direction
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
    lda.b obj.facing
    bne .F254

    !A16
    inc.b obj.pos_x+1
    bra .F258

.F254:
    !A16
    dec.b obj.pos_x+1
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
    lda.b obj.facing
    bne .F279

    dec
.F279:
    sta $2D
    lda #$06 : sta.b obj.hp
    lda $09 : ora #$C2 : sta $09
    stz $40
    ldy #$9A : ldx #$20 : jsl set_sprite
    lda #$04 : sta.b obj.direction
    lda #$08 : sta $3B
    lda #$10 : sta $2E
.F29B:
    brk #$00

;----- F29D

    lda $09 : ora #$40 : sta $09
    dec $3B
    bne .F2C2

    lda.b obj.direction : clc : adc $2D : and #$0F : sta.b obj.direction
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
    lda.w frame_counter
    and #$0F
    bne .F2E9

    inc $40
.F2E9:
    rtl

.F2EA:
    jml _028B17
}

{
    incsrc "objects/axe.asm"      ;F2EE - F3FB
    incsrc "objects/triblade.asm" ;F3FC - F4D6
}

{ ;F4D7 - F4F6
get_magic_slot: ;a8 x8
    ldy #$07
    !X16
    ldx.w #!obj_magic.base
.F4DE:
    lda.w obj.active,X
    beq .F4F3

    !A16
    clc : txa : adc.w #obj.ext.len : tax
    !A8
    dey
    bpl .F4DE

    !X8
    rts ;no slots available (return -1)

.F4F3:
    dec.w open_magic_slots
    rts
}

{ ;F4F7 -
_01F4F7:

.create:
    lda #$03 : sta.b obj.hp
    ldx $07
    lda.w shield_magic_data_BCF8,X : sta.b obj.direction
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

    lda.b obj.direction : inc : and #$3F : sta.b obj.direction
    lda.w frame_counter
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
    lda.w armor_state
    cmp #$04
    bne .F59F

    jsr _01DD7A
    jsl update_animation_normal
    !A16
    lda.w !obj_arthur.pos_x+0 : sta.b obj.pos_x+0
    lda.w !obj_arthur.pos_x+2 : sta.b obj.pos_x+2
    lda.w !obj_arthur.pos_y+1 : sec : sbc #$0004 : sta.b obj.pos_y+1
    !A8
    clc
    lda $2E
    ldx #$06 : jsl _0189D9
    lda.w frame_counter
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
    ldx.w #!obj_objects.base
.F5C1:
    lda.w obj.active,X
    beq .F606

    lda.w obj.type,X
    cmp #!id_chest
    beq .F5D1

    cmp #!id_chest2
    bne .F606

.F5D1:
    lda $0031,X
    bne .F606

    !A16
    lda.w obj.pos_x+1,X
    adc #$0030
    sbc.w camera_x+1
    cmp #$0160
    bcs .F606

    lda.w obj.pos_y+1,X
    sbc.w camera_y+1
    cmp #$0100
    bcs .F606

    !A8
    ldy.w #chest_create_B6DE
    lda.w obj.type,X
    cmp #!id_chest
    beq .F600

    ldy.w #chest2_create_B691
.F600:
    !A16
    tya : sta.w obj.state+1,X
.F606:
    !A16
    clc
    txa
    adc.w #obj.ext.len
    cmp.w #obj_start+obj[50] ;end of obj_object
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
    lda.w stage : asl : tax
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
    tdc : clc : adc #$0010 : tcd
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
