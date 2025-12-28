namespace axe

{
create:
    lda #$67 : jsl _018049_8053
    jsl _02F9DA
    ldy #$4A : ldx #$21 : jsl set_sprite
    stz $32
    lda.b obj.direction : asl : tax
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
    lda $2F : clc : adc #$04 : and #$07 : sta.b obj.direction
    ldx #$38 : jsl update_pos_xy_2
    lda $2D : sta $2F : sta.b obj.direction
    ldx #$38 : jsl update_pos_xy_2
    lda.b obj.facing : sta.b obj.direction
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

upgraded_create:
    lda #$5F : jsl _018049_8053
    lda #$0C : sta $2D
    lda #$06 : sta $2F
    lda $09 : ora #$C2 : sta $09
    stz $40
    ldy #$4C : ldx #$21 : jsl set_sprite
    !A16
    lda.b obj.pos_y+1 : sec : sbc #$000C : sta.b obj.pos_y+1
    !A8
    ldx #$01
    lda.b obj.direction
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

upgraded_thing:
    jsl update_animation_normal
    lda $2F : clc : adc #$04 : and #$07 : sta.b obj.direction
    ldx #$0C : jsl update_pos_xy_2
    clc : lda $2F : adc $30 : and #$07 : sta $2F : sta.b obj.direction
    ldx #$0C : jsl update_pos_xy_2
    lda.b obj.facing : sta.b obj.direction

;-----

thing:
    jsr _01E285
    rtl
}

namespace off
