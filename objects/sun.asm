namespace sun

{
create:
    ldy #$BE : ldx #$21 : jsl set_sprite
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    !A16
    lda #$0100 : sta $2D
    !A8
.FC17:
    brk #$00

;----- FC19

    jsl update_animation_normal
    !A16
    dec $2D
    !A8
    bne .FC17
.FC25:
    !A8
    lda #$78 : cop #$00

;----- FC2B

    jsl update_animation_normal
    !A16
    lda.b obj.pos_y+1
    cmp #$007A
    beq .FC25

    dec.b obj.pos_y+1
    bra .FC25

    jml _0281A8_81B5 ;unreachable
}

namespace off
