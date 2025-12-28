namespace knife2_shimmer

{
create:
    lda #$29 : jsl _018049_8053
    lda $08 : ora #$10 : sta $08
    ldy #$DE : ldx #$20 : jsl set_sprite
    lda #$18 : sta $2D
.E54C:
    brk #$00

;----- E54E

    jsl update_animation_normal
    dec $2D
    bne .E54C

    jml _0280CB_remove_weapon
}

namespace off
