namespace hannibal_projectile

{ ;C1B6 - C1E9
create: ;a8 x8
    inc $08
    ldy #$B4 : ldx #$21 : jsl set_sprite
    jsl _02F9DA
    ldy #$5D : jsl set_speed_x
.C1CA:
    brk #$00

;----- C1CC

    jsl update_pos_x
    jsl update_animation_normal
    bit $09
    bvs .C1CA

    jml _0281A8_81B5

;-----

thing:
    jsl _02F9BE
    ldy #$0C : jsl _02F9CE
    jml _02F9B2
}

namespace off
