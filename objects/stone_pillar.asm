namespace stone_pillar

{
create:
    !A16
    lda.w #_00BFD5 : sta $13 ;offset into rom for collision? seems to go unused
    !A8
    lda $07
    and #$03
    pha
    asl #2
    sta $15
    pla
    clc
    adc #$05
    sta $2D
    lda #$03 : sta $08
    lda $09 : and #$CF : ora #$20 : sta $09
.9120:
    brk #$00

;----- 9122

    ldy #$04 : jsl arthur_range_check_x
    bcs .912F

    lda $2D : jsr _02FE1E_FE27
.912F:
    lda $2D : jsr _02FB9C_FBAF
    jsr _0281A8
    bra .9120
}

namespace off
