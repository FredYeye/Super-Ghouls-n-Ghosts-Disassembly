namespace bowgun

{
create:
    lda #$21 : jsl _018049_8053 ;bowgun sfx
    lda $07 : sta.b obj.direction
    cmp #$01
    beq .E56E ;remove second bolt

    cmp #$04
    beq .E56E

    bra .E572

.E56E:
    jml _0280CB_remove_weapon

.E572:
    tax
    lda.w _00BB22_bowgun_facing,X : sta.b obj.facing
    lda.w _00BB22,X : ldy #$3A : ldx #$21 : jsl set_sprite_8480
.E583:
    brk #$00

;----- E585

    ldx #$20 : jsl update_pos_xy_2
    jsr _01E224_E26A
    bra .E583
}

{
upgraded_create:
    lda #$C0 : ora $09 : sta $09
    lda #$80 : sta $35
    lda #$28 : jsl _018049_8053
    ldx $07
    phx
    stz.b obj.facing
    lda.w _00BB22_BB3A,X : sta.b obj.direction
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
    lda.w obj.active,X
    beq .E5EC

    lda #$00
    xba
    lda.w obj.type,X : tay
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
    adc.w #!obj_size*3
    tax
    !A8
    cpx.w #!obj_upgrade.active
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
    sbc.b obj.direction
    and #$1F
    cmp #$10
    bcc .E621

    ldx #$FF
.E621:
    txa : clc : adc.b obj.direction : and #$1F : sta.b obj.direction
    lsr :                                        sta $3C
    !X16
    ldx $31
    lda.w obj.active,X
    beq .E5C8

    lda $0008,X
    bmi .E5C8

    bra .E600

;-----

upgraded_thing:
    ldx #$24 : jsl update_pos_xy_2
    jsl set_sprite_84A7
    jsl update_animation_normal
    jsr _01E285
    lda.b obj.direction : lsr : tax
    lda.w _00BB22_BB40,X : sta.b obj.facing
    rtl
}

namespace off
