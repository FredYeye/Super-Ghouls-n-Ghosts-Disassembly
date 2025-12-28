namespace triblade

{
upgraded_create:
    lda #$5F : jsl _018049_8053
    lda #$10 : sta $2F
    lda $09 : ora #$02 : sta $09
    stz $40
    ldy #$E2 : ldx #$20
    bra create_F420

;-----

create:
    lda #$67 : jsl _018049_8053
    stz $2F
    ldy #$C0 : ldx #$20
.F420:
    jsl set_sprite
    ldx #$00
    lda.b obj.direction
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
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$000C
    sec
    sbc.b obj.pos_x+1
    cmp #$0010
    bcs .F476

    lda.w !obj_arthur.pos_y+1
    clc
    adc #$000C
    sec
    sbc.b obj.pos_y+1
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
    sta.b obj.direction
    ldx $2F
    bne .F49E

    asl : tax
    !A16
    lda.w triblade_data_BCD8,X : sta $0C
    !A8
    lda.b obj.direction : clc : adc #$02 : and #$07 : lsr #2 : sta.b obj.facing
.F49E:
    ldx #$32 : jsl update_pos_xy_2
    bra .F450

.F4A6:
    lda $2E : clc : adc $2D : tax
    lda.w triblade_data_BC79,X : sta.b obj.direction
    lda.w triblade_data_BC8B,X : sta.b obj.facing
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

upgraded_thing:
    jsl update_animation_normal

;-----

thing:
    rtl
}

namespace off
