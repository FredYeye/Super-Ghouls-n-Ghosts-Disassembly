namespace small_explosion

{
create:
    ldy #$76 : ldx #$20 : jsl set_sprite
    lda $08 : and #$F8 : ora #$01 : sta $08
    lda #$14 : sta $2D
.B945:
    brk #$00

;----- B947

    jsl update_animation_normal
    dec $2D
    bne .B945

    jmp _0281A8_81B5
}

namespace off
