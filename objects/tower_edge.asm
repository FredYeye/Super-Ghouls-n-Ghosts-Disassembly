namespace tower_edge

{
create:
    !X16
    ldx #$01E0
    lda $07
    pha
    and #$10
    beq .9E88

    ldx #$01E8
.9E88:
    stx $29
    !X8
    pla
    and #$EF
    sta $07
    lda $08 : ora #$07 : sta $08
    lda #$FF : sta $26
    lda #$80 : sta $09
    !A16
    lda.w _00ED00+$2E : sta $27
    lda.w #tower_edge_data_CEF0 : sta $13
    !A8
    lda $07
    pha
    lsr
    tax
    lda.w tower_edge_data_CEED,X : sta $15
    lda.w tower_edge_data_CEEA,X : ldy #$E8 : ldx #$21 : jsl set_sprite_8480
    pla
    and #$01
    sta.b obj.facing
.9EC7:
    brk #$00

;----- 9EC9

    !A16
    lda.b obj.pos_x+1 : sta $2D
    lda.b obj.pos_y+1 : sta $2F
    !A8
    lda $031C
    beq .9EDE

    jsl update_animation_normal
.9EDE:
    jsl _018E32_8E73
    lda $1F9B
    beq .9F2E

    lda $07
    and #$01
    beq .9EFC

    !A16
    clc
    lda.w camera_x+1
    adc #$001E
    sta.b obj.pos_x+1
    !A8
    bra .9F09

.9EFC:
    !A16
    clc
    lda.w camera_x+1
    adc #$00E2
    sta.b obj.pos_x+1
    !A8
.9F09:
    !A16
    lda.b obj.pos_x+1
    sta $31
    and #$FFFF
    sta.b obj.pos_x+1
    !A8
    jsl _01A593
    bne .9F28

    !A16
    lda $2D
    sta.b obj.pos_x+1
    lda $2F
    sta.b obj.pos_y+1
    bra .9F2E

.9F28:
    !A16
    lda $31 : sta.b obj.pos_x+1
.9F2E:
    !A16
    lda.w camera_x+1
    cmp.b obj.pos_x+1
    !A8
    bcc .9F39

.9F39:
    bra .9EC7

;-----

thing:
    jsl _028156
    rtl
}

namespace off
