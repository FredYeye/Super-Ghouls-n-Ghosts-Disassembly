namespace _03A3E7

{
;unused?

create:
    lda $07
    bne .A3F5

    ldy #$A8 : ldx #$21 : jsl set_sprite
    bra .A3FD

.A3F5:
    ldy #$AA : ldx #$21 : jsl set_sprite
.A3FD:
    lda $09 : ora #$F4 : sta $09
    lda #$29 : sta $31
.A407:
    brk #$00

;----- A409

    lda $07
    bne .A415

    !A16
    dec $3B
    !A8
    bra .A41B

.A415:
    !A16
    inc $3B
    !A8
.A41B:
    dec $31
    bne .A407

    jml _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _02F9B2
    rtl
}

namespace off
