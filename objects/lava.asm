namespace lava

{
create:
    lda $0F : cop #$00

;----- C560

    lda $07 : asl : ldy #$DA : ldx #$21 : jsl set_sprite_8480
    !A16
    lda.w #lava_data_D31B : sta $13
    stz $0C
    !A8
    stz $15
    lda $08 : ora #$00 : sta $08
    lda $09 : ora #$90 : sta $09
    lda $07
    bne .C59E

    lda #$20 : sta.b obj.speed_y+0
    stz.b obj.speed_y+1
    stz.b obj.speed_y+2
    lda #$7F : sta $35
.C594:
    brk #$00

;----- C596

    jsl update_pos_y
    dec $35
    bne .C594

.C59E:
    brk #$00

.C5A0:
    !A16
    inc.b obj.pos_y+1
    !A8
    jsl _01A559
    beq .C59E

    jml _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _02F9B2
    rtl
}

namespace off
