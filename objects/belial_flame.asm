namespace belial_flame

{
create:
    lda #$01 : sta $08
    lda #$10 : sta $09
    ldy #$C6 : ldx #$21 : jsl set_sprite
.B39E:
    brk #$00

;----- B3A0

    jsl set_sprite_84A7
    jsl update_animation_normal
    bra .B39E
}

namespace off
