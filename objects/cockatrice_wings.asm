namespace cockatrice_wings

{
create:
    ldy #$08 : ldx #$22 : jsl set_sprite
    jsr _02EBA8
    !A16
    lda.w _00ED00+$3E : sta $27
    lda #$0120 : sta $29
    !A8
    lda #$FF : sta $26
    lda $08 : ora #$01 : sta $08
    lda $09 : ora #$C0 : sta $09
    stz $3C
    jsl update_animation_normal
    jsl _018E32_8E73
.E1C8:
    brk #$00

;----- E1CA

    jsr _02EBA8
    !A16
    lda #$002C
    clc
    adc.b obj.pos_x+1
    sta.b obj.pos_x+1
    !A8
    lda $25
    cmp #$02
    bne .E1C8

    bra .E1C8

;-----

thing:
    lda $3C
    bne .E1EF

    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
    jsl update_animation_normal
.E1EF:
    jsl _018E32_8E73
    !A8
    rts

;-----

destroy: ;unused?
    jmp _0281A8_81B5
}

namespace off
