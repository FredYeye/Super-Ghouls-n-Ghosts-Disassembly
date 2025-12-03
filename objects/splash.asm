namespace splash

{
create:
    !AX8
    lda $07 : ldy #$D0 : ldx #$21 : jsl set_sprite_8480
    !A16
    lda $009F : sta.b obj.pos_y+1
    !A8
    lda #$10 : sta $2D
.B3C3:
    brk #$00

;----- B3C5

    !A16
    lda $009F : sta.b obj.pos_y+1
    !A8
    jsl update_animation_normal
    dec $2D
    bne .B3C3

    jmp _0281A8_81B5
}

namespace off
