namespace boss_explosion

{
create:
    ldy #$18 : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    !A16
    lda.b obj.pos_x+1 : clc : adc.b obj.speed_x+1 : sta.b obj.pos_x+1
    lda.b obj.pos_y+1 : clc : adc.b obj.speed_y+1 : sta.b obj.pos_y+1
    !A8
    lda #$22 : sta $2D
.E29A:
    brk #$00

;----- E29C

    jsl update_animation_normal
    dec $2D
    bne .E29A

    bra destroy

;-----

thing:
    rts

;-----

destroy:
    jmp _0281A8_81B5
}

namespace off
