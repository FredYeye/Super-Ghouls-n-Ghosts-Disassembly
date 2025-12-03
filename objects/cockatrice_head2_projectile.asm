namespace cockatrice_head2_projectile

{
create:
    ldy #$0C : ldx #$22 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    jsl set_direction32 : sta.b obj.direction
.CBA8:
    brk #$00

;----- CBAA

    ldx #$46 : jsl update_pos_xy_2
    lda $09
    and #$40
    bne .CBA8

    jml _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$16 : jsl _02F9CE
    jsl _02F9B2
    rtl
}

namespace off
