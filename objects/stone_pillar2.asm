namespace stone_pillar2

{
create:
    lda #$02 : sta $08
    lda $07 : sta $2D
.9208:
    brk #$00

;----- 920A

    lda $2D
    pha
    jsr _02FE1E_FE27
    pla
    jsr _02FB9C_FBAF
    ldy #$08 : jsl arthur_range_check
    bcs .921F

    inc.w is_on_stone_pillar
.921F:
    jsr _0281A8
    bra .9208
}

namespace off
