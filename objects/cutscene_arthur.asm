namespace cutscene_arthur

{
create: ;a8 x8
    lda #$02 : sta $08
    lda $09 : ora #$80 : sta $09
    ldy #$06 : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+2 : sta $27
    !A8
    lda #$FF : sta $26
    lda $07
    cmp #$02
    beq .F79D

.F799:
    brk #$00

;----- F79B

    bra .F799

.F79D:
    lda #$98
    cop #$00

;----- F7A1

    ldy #$00 : ldx #$20 : jsl set_sprite
    lda #$28 : sta $2D
.F7AD:
    brk #$00

;----- F7AF

    clc
    lda.b obj.pos_x   : adc #$00 : sta.b obj.pos_x
    lda.b obj.pos_x+1 : adc #$02 : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : adc #$00 : sta.b obj.pos_x+2
    lda #$FE : jsl update_animation_custom_timer
    dec $2D
    bne .F7AD

    inc $1EC7
    ldy #$06 : ldx #$20 : jsl set_sprite
.F7D7:
    brk #$00

;----- F7D9

    bra .F7D7

;-----

thing: ;a8 x8
    jsl _018E32_8E79
    rtl
}

namespace off
