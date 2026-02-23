{
_019E1B: ;a8 x?
    stz $CD
    lda #$01 : sta $CE
    jsl _018049_8051
.9E25:
    lda.b #1 : jsl current_task_suspend
    jsl get_object_slot
    bmi .9E25

    lda #$0C : sta.w obj.active,X
    lda #!id_waterfall_end : sta.w obj.type,X
    !A16
    lda #$15B0 : sta.w obj.pos_x+1,X
    lda #$0228 : sta.w obj.pos_y+1,X
    !AX8
    lda.b #1 : jsl current_task_suspend
    ldx #$0F
    lda #$00
.9E55:
    sta $7F9800,X
    dex
    bpl .9E55

    !A16
    sec
    lda #$1490
    sbc.w camera_x+1
    !A8
    sta $7F9801
    clc
    adc #$40
    sta $7F9802
    lda #$01 : sta $7F9803 : sta $7F9806 : sta $7F9809
    lda #$02 : sta $02E6
    lda #$01 : sta !DMAP5
    lda #$26 : sta !BBAD5
    lda #$00 : sta !A1T5L
    lda #$98 : sta !A1T5H
    lda #$7F : sta !A1B5
    stz !DAS5B
    lda #$20 : ora $02F0 : sta $02F0
.9EA9:
    lda.b #1 : jsl current_task_suspend
    lda $CE
    cmp #$57
    bcc .9ECD

    sbc #$56
    sta $7F9803
    lda $7F9801 : sta $7F9804
    lda $7F9802 : sta $7F9805
    bra .9ED1

.9ECD:
    sta $7F9800
.9ED1:
    !A16
    clc : lda $CD : adc #$00F0 : sta $CD
    !A8
    lda $CE
    cmp #$C8
    bcc .9EA9

    inc $1F9F
    jml current_task_remove
}
