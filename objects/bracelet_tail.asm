namespace bracelet_tail

{
_01EAC3:
    lda $07 : asl : ldy #$94 : ldx #$21
    jsl set_sprite_8480
    rts

;-----

create:
    jsr _01DD90
    lda $09 : ora #$80 : sta $09
    ldy $34 : jsl set_speed_x
.EADE:
    jsr _01EAC3
.EAE1:
    brk #$00

;----- EAE3

    lda $14F4
    bmi .EAFA

    cmp $31
    beq .EAE1

    sta $31
    inc $07
    lda $07
    cmp #$03
    bcc .EADE

.EAF6:
    jml _0280CB_remove_weapon

.EAFA:
    cmp #$F0
    bcc .EAF6

    lda $07
    cmp #$03
    bcs .EAF6

    jsr _01EAC3
    lda #$07 : cop #$00

;----- EB0B

    inc $07
    bra .EAFA

;-----

thing:
    jsl update_pos_x
    jsl update_animation_normal
    rtl
}

namespace off
