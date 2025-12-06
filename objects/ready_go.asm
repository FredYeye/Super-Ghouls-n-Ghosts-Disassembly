namespace ready_go

{
create:
    lda $0277
    ora $0292
    bne .928C

    lda #$80 : sta $08
    !A16
    clc : lda.w camera_x+1 : adc #$0080 : sta.b obj.pos_x+1
    clc : lda.w camera_y+1 : adc #$0068 : sta.b obj.pos_y+1
    lda.w _00ED00+$28 : sta $27
    lda #$0020 : sta $29
    !A8
    lda #$00 : jsl _018E32_8E81
    ldy #$F4 : ldx #$20 : jsl set_sprite
.928C:
    lda #$3F : cop #$00

;----- 9290

    jmp _0280C5
}

namespace off
