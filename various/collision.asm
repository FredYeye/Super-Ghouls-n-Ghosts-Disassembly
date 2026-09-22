{ ;A3ED - A4C8
get_tile_type:

.A3ED:
    lda $0000 : lsr #4 : and #$003F : sta $0010
    lda $0004
    asl #2
    and #$0FC0
    ora $0010
    clc
    adc $1F8D
    tax
    lda.l tile_array,X
    !AX8
    tax
    sec
    sbc $0326
    cmp $0327
    bcs +

    inc $14E9
+:
    lda.l tile_type,X
    tax
    rts

.A423:
    !AX8
    lda #$00
    rts

.entry: ;a- x-
    !AX16
..2: ;a16 x16
    lda $0002
    bmi .A423

    and #$FFF0
    sta $0004
    ldy $02DA
    bne .A3ED

    !A8
    sta $0010
    stz $0011
    asl $0010 : rol $0011
    asl $0010 : rol $0011
    lda $0000 : and #$F0 : lsr #3 : ora $0010 : sta $0010
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
.precalc_index: ;a16 x16
    lda.l tile_array+0,X
    bit #$4000
    beq +

    lda.l tile_array+2,X
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
    lda.l tile_type,X
    tax
    rts
}

{ ;A4C9 - A4E1
get_collision_offset: ;a- x-
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

.A4E2:
    !A16
    lda ($13),Y
    bra .A4F4

.A4E8: ;a- x8
    !A16
    lda ($13),Y
    ldx.b obj.direction
    beq .A4F4

    eor #$FFFF : inc
.A4F4:
    clc : adc.b obj.pos_x+1 : sta $0000
    iny #2
    clc : lda ($13),Y : adc.b obj.pos_y+1 : sta $0002
    !X16
    bra .A537

.A508: ;a- x8
    !A16
    lda ($13),Y
    bra .A516

.A50E: ;a- x8
    !A16
    lda ($13),Y : eor #$FFFF : inc
.A516:
    clc : adc $14BE : sta $0000
    iny #2
    clc : lda ($13),Y : adc.b obj.pos_y+1 : sta $0002
    !X16
    bra .A537

.A52B: ;a- x-
    ;weapon - tile collision check
    !AX16
    lda.b obj.pos_x+1 : sta $0000
    lda.b obj.pos_y+1 : sta $0002

.A537:
    stz $001E
    jsr get_tile_type_entry_2
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
    jsr get_collision_offset
    jsr _01A56B
    bne .ret

    jsr get_collision_offset_x_sub
    jsr _01A56B
.ret:
    rtl
}

{ ;A56B - A592
_01A56B: ;a- x-
    jsr get_tile_type_entry
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
get_collision_offset_x_sub: ;a- x-
    !A16
.2: ;a16 x-
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
    jsr get_collision_offset_x_sub_2
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
    jsr get_collision_offset
.A5FC: ;a16 x16
    jsr get_tile_type_entry_2
    bne .A632

    ldy $02DA
    bne .A643

    !AX16
    clc : lda $0004 : adc #$0010 : sta $0004
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
    jsr get_tile_type_precalc_index
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
    sec : lda $0004 : sbc #$0010 : sta $0004
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
    jsr get_tile_type_precalc_index
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
