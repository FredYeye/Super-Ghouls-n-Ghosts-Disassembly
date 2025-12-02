namespace cutscene_princess

{
create: ;a8 x8
    ldy #$A0 : ldx #$21
    lda $07
    beq .F7EC

    ldy #$B2 : ldx #$21
.F7EC:
    jsl set_sprite
    lda #$01 : sta.b obj.facing
.F7F4:
    brk #$00

;----- F7F6

    bra .F7F4

;-----

thing:
    rtl ;unused
}

namespace off
