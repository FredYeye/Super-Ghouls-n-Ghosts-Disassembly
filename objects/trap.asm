namespace trap

{
create:
    !AX8 ;unnecessary
    ldy #$4A : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+$1E : sta $27 ;todo
    lda #$00BC : sta $29
    !A8
    lda $08 : and #$F8 : ora #$02 : sta $08
    lda $09 : ora #$04 : sta $09
    lda #$FF : sta $26
    lda #$04 : clc : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
.BF04:
    brk #$00

;----- BF06

    jsl update_animation_normal
    jsl _018E32_8E73
    jsr _02FD62_FD7C
    lda $24
    cmp #$7E
    bne .BF04

.BF17:
    brk #$00

;----- BF19

    jsr _0281A8
    jsl _018E32_8E73
    jsr _02FD62_FD7C
    bra .BF17
}

namespace off
