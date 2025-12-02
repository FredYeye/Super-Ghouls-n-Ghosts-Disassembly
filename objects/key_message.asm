namespace key_message

{
create:
    !AX8
    lda #$01 : sta $1F9B
    lda $07
    bne .EE70

    jsl _0190F1 ;get grayscale palette? not used here?
    !A16
    lda #$0004 : sta $0000
    ldx #$00
    lda #$FFFF
.EE61:
    lda _04984F_9879+$06,X : sta $7EF5A0,X ;palette
    inx #2
    dec $0000
    bne .EE61

.EE70:
    !A16
    lda.w camera_x+1 : clc : adc #$0080 : sta.b obj.pos_x+1
    lda.w camera_y+1 : clc : adc #$0060 : sta.b obj.pos_y+1
    lda.w _00ED00+$28 : sta $27
    lda #$0180 : sta $29
    !A8
    lda #$00 : jsl _018E32_8E81
    lda #$80 : sta $09
    lda #$FF : sta $26
    lda $07
    beq .EEBE

    cmp #$01
    beq .EEB4

    lda #$60 : sta.b obj.pos_y+1
    ldy #$64 : ldx #$20 : jsl set_sprite
    bra .EEC6

.EEB4:
    ldy #$F6 : ldx #$20 : jsl set_sprite
    bra .EEC6

.EEBE:
    ldy #$F8 : ldx #$20 : jsl set_sprite
.EEC6:
    !A16
.EEC8:
    brk #$00

;----- EECA

    lda.w camera_x+1 : clc : adc #$0080 : sta.b obj.pos_x+1
    lda.w camera_y+1 : clc : adc #$0060 : sta.b obj.pos_y+1
    bra .EEC8

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts

;-----

destroy: ;unused
    jmp _0281A8_81B5
}

namespace off
