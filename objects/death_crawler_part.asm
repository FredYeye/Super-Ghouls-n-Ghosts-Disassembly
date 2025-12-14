namespace death_crawler_part

{
create:
    lda #$C0 : sta $09
    lda $07 : asl #4 : clc : adc #$70 : sta $2D
.B5AB:
    brk #$00

;----- B5AD

    lda $1ED7
    beq .B5B6

    jml _0281A8_81B5

.B5B6:
    !A16
    lda $1EB7 : sta.b obj.pos_x+1
    lda $1EB9 : sta.b obj.pos_y+1
    !A8
    clc
    lda $1F2B
    adc #$40
    sta $0000
    sec
    sbc $2D
    lsr #3
    sta.b obj.direction
    lda.b obj.type
    cmp #$AF
    beq .B5E3

    ldx #$3E : jsl update_pos_xy_2
    bra .B5AB

.B5E3:
    ldx #$52 : jsl update_pos_xy_2
    bra .B5AB

;-----

thing:
    lda $1EC7
    beq .B5F8

    jsl _02F9B2
    jsl _02F9C2
.B5F8:
    rtl
}

namespace off
