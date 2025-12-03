namespace mimic_ghost

{
create:
    ldx #$04 : jsl _018D5B
    lda #$C0 : sta $09
    ldy #$FE : ldx #$21 : jsl set_sprite
    !A16
    lda.w _00ED00+$4C : sta $27
    !A8
    lda #$FF : sta $26
    jsr mimic__F53A
    jsl set_direction32
    sta.b obj.direction
    stz.b obj.facing
    clc
    adc #$08
    and #$1F
    cmp #$11
    bcc .F578

    inc.b obj.facing
.F578:
    brk #$00

;----- F57A

    ldx #$34 : jsl update_pos_xy_2
    bra .F578

;-----

thing:
    jsl update_animation_normal
    ldx $3C : jsl _018E32
    jsr _02FD62_FD7C
    jsr _02FB62_FB69
    jsr _02F9FA_F9FE
    jmp _028074_8087
}

namespace off
