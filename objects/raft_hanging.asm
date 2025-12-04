namespace raft_hanging

{
create:
    lda #$02 : sta $08
    lda #$10 : sta $09
    ldy #$A2 : ldx #$21 : jsl set_sprite
    lda.b obj.pos_y+1 : clc : adc #$10 : sta.b obj.pos_y+1
.D1F6:
    brk #$00

;----- D1F8

    jsl update_animation_normal
    bra .D1F6
}

namespace off
