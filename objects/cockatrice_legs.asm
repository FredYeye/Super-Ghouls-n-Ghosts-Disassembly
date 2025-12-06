namespace cockatrice_legs

{
create:
    ldy #$02 : ldx #$22 : jsl set_sprite
    lda $08 : ora #$01 : sta $08
    lda $09 : ora #$90 : sta $09
    jsr _02EBA8
    !A16
    lda.w _00ED00+$42 : sta $27
    lda #$018E : sta $29
    !A8
    lda #$FF : sta $26
    stz $3B
    stz $3C
    lda $09 : ora #$40 : sta $09
    jsl update_animation_normal
    jsl _018E32_8E73
.DAD1:
    brk #$00

;----- DAD3

    lda $08
    and #$10
    bne .DAEF

    lda $14D1
    bne .DAEF

    !A16
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    bcs .DAED

    lda.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
.DAED:
    !A8
.DAEF:
    jsr _02EBA8
    !A16
    lda #$002C
    clc
    adc.b obj.pos_x+1
    sta.b obj.pos_x+1
    !A8
    lda $3B
    cmp #$02
    beq .DB18

    cmp #$03
    beq .DB18

    ldy #$0E : jsl arthur_range_check_x
    bcs .DB16

    lda #$01 : sta $3B
    bra .DAD1

.DB16:
    stz $3B
.DB18:
    bra .DAD1

;-----

thing:
    lda $3C
    bne .DB8C

    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
    jsl update_animation_normal
    jsl _018E32_8E73
    lda $3B
    beq .DB56

    cmp #$02
    beq .DB72

    cmp #$03
    beq .DB8C

    ;lower legs when arthur is close
    lda $0F
    bne .DB8C

    ldy #$04 : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    lda #$01 : sta $0F
    bra .DB8C

.DB56:
    lda $0F
    beq .DB8C

    ldy #$02 : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    stz $0F
    bra .DB8C

.DB72:
    ldy #$00 : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    lda #$01 : sta $0F
    inc $3B
.DB8C:
    rts

;-----

destroy: ;unused?
    jmp _0281A8_81B5
}

namespace off
