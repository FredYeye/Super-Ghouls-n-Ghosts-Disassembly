namespace siren_projectile

{
create:
    ldy #$AE : ldx #$21 : jsl set_sprite
    jsl _02F9DA
    lda $3C : ldx #$18 : jsl _018BBF
.E627:
    brk #$00

;----- E629

    !A16
    lda $00A3 : clc : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
    !A8
    jsl update_animation_normal
    jsl update_pos_xy
    bra .E627

;-----

thing:
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    ldy #$06 : jsr _02FF22
    jsr _02FD62_FD7C
    jmp _028074_8087
}

namespace off
