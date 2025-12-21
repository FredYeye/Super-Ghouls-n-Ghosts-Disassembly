namespace _03C30E

{
create: ;unused?
    lda #$04 : sta $09
    ldy #$C4 : ldx #$21 : jsl set_sprite
    !A16
    lda.b obj.pos_x+1 : sta $39
    lda.b obj.pos_y+1 : sta $3B
    !A8
.C326:
    brk #$00

;----- C328

    bra .C326
}

namespace off
