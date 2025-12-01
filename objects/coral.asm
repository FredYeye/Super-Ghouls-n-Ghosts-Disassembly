namespace coral

{ ;C32A - C34E
create: ;a8 x8
    lda #$80 : sta $09
    ldy #$04 : ldx #$22 : jsl set_sprite
    lda #$05 : sta.b obj.hp
.C33A:
    brk #$00

;----- C33C

    bra .C33A

;-----

thing:
    jsl _02F9CA
    jsl _02F9B2
    jsl _02F9BA
    jsl _028074_80A3
    rtl
}

namespace off
