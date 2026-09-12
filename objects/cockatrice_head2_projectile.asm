namespace cockatrice_head2_projectile

{
create:
    ldy #$0C : ldx #$22 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    jsl set_direction32_to_arthur : sta.b obj.direction
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
    jsl collision_check_magic2_bracelet_shield_magic_far
    ldy #$16 : jsl collision_check_shield_far
    jsl _02F9B2
    rtl
}

namespace off
