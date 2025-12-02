namespace satan_wings

{
create: ;a8 x8
    ldy #$AC : ldx #$21 : jsl set_sprite
    lda #$01 : sta.b obj.facing
.F89A:
    brk #$00

;----- F89C

    jsl update_animation_normal
    bra .F89A

;-----

thing: ;a- x-
    rtl
}

namespace off
