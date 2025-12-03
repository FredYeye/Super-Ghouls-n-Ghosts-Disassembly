namespace storm_cesaris_projectile

{
create:
    inc $08
    ldy #$F2 : ldx #$21 : jsl set_sprite
    ldy #$42 : jsl set_speed_x
    lda.w difficulty : asl : tax
    !A16
    clc : lda.b obj.speed_x : adc.w storm_cesaris_projectile_data_C07E,X : sta.b obj.speed_x
    !A8
.95C9:
    brk #$00

;----- 95CB

    jsl update_pos_x
    bit $09
    bvc .95C9

    jsl _02F9DA_F9E0
.95D7:
    brk #$00

;----- 95D9

    jsl update_pos_x
    jsr _028074
    bra .95D7

;-----

thing:
    jsl update_animation_normal
    ldy #$0E : jsr _02FF22
    jsr _02FA37_FA65
    jmp _02FD62_FD7C
}

namespace off
