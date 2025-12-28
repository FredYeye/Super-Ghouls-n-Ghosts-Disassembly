namespace knife

{
create:
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

{
upgraded_create:
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
    lda.b obj.speed_x+2
    bpl .E3A4

    inc $3C
    lda.b obj.direction : asl : tax
    !A16
    lda.w _01BC08_BC08,X : sta $37
    lda.w _01BC08_BC0C,X : sta $35
    lda.b obj.pos_x+1 : sta $31
    lda #$262F : sta $39
    !A8
    jsr get_weapon_slot_local
    bmi .E408

    jsr _01DD90
    lda #$0C : sta.w obj.active,X
    lda #$80 : ora $0008,X : sta $0008,X
    lda #$08 : ora $0009,X : sta $0009,X
    lda #!id_knife2_shimmer : sta.w obj.type,X
    lda.b obj.facing : sta.w obj.facing,X
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_x+2 : sta.w obj.pos_x+2,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    lda.b obj.pos_y+2 : sta.w obj.pos_y+2,X
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
    lda.b obj.pos_x+1
    sbc $31
    bpl .E429

    eor #$FFFF
    inc
.E429:
    cmp #$0040
    bcc .E43A

    lda.b obj.direction
    asl
    tax
    clc : lda.w _01BB1A,X : adc.b obj.pos_x+1 : sta $31
.E43A:
    !A8
    jsr _E449_E44C
    lda $09
    and #$40
    bne .E416

    jml _0280CB_remove_weapon

;-----

_E449:
    !AX8
    rts

.E44C:
    !A16
    clc
    lda.w camera_y+1
    adc #$0080
    sec
    sbc.b obj.pos_y+1
    clc
    adc #$0088
    cmp #$0110
    bcs _E449

    sec : lda.b obj.pos_x+1 : sbc.w camera_x+1 : sec : sbc #$0004 : sta $2F
    sec : lda.b obj.pos_y+1 : sbc.w camera_y+1 : sec : sbc #$0004 : sta $33
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
    lda.b obj.pos_x+1
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

upgraded_destroy:
    lda $3C
    beq .E52E

    inc $3B
    lda.b obj.direction : asl : tax
    !A16
    lda #$2621 : sta $39
    clc
    lda $31
    adc.w _01BB1A_BB1E,X
    sta $31
    sec
    sbc.b obj.pos_x+1
    bpl .E521

    eor #$FFFF
    inc
.E521:
    !A8
    cmp #$08
    bcc .E52E

    jsr _E449_E44C
    brk #$00

;----- E52C

    bra upgraded_destroy

.E52E:
    !AX8
    jml _0280CB_remove_weapon
}

namespace off
