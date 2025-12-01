namespace silk_platform

{
create:
    !A16
    clc : lda.b obj.pos_x+1 : adc #$0010 : sta.b obj.pos_x+1
    !A8
    lda #$38 : sta $10
    lda #$07 : sta $08
    lda #$30 : sta $09
    lda $07 : asl : ldy #$FE : ldx #$21 : jsl set_sprite_8480
.C38A:
    brk #$00

;----- C38C

    jsl _028166
    bra .C38A
}

namespace off
