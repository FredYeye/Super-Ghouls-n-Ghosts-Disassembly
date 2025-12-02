namespace shell_pearl

{
create:
    lda #$00 : sta $08
    lda #$80 : sta $09
    ldy #$15 : jsl set_speed_x
    ldy #$4E : ldx #$22 : jsl set_sprite
    jsl get_arthur_relative_side : sta.b obj.direction : sta.b obj.facing
    lda #$C0 : sta $33
    lda #$F8 : sta $34
.D34A:
    brk #$00

;----- D34C

    jsl update_pos_x
    lda $09
    and #$40
    beq _D376

    dec $34
    beq _D376

    dec $33
    bne .D34A

    lda $08 : ora #$10 : sta $08
    bra .D34A

;-----

thing:
    jsl update_animation_normal
    ldy #$04 : jsr _02FF22
    jsr _02FA37_FA65
    jml _02FD62_FD7C

;-----

_D376: ;label this destroy?
    jmp _0281A8_81B5
}

namespace off
