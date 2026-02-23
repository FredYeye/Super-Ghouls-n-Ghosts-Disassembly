{
_01A191: ;a8 x-
    !X16
.A193:
    lda.b #1 : jsl current_task_suspend
    ldx.w camera_x+1
    cpx #$0220
    bcc .A193

    stz $1A7F
.A1A4:
    lda.b #1 : jsl current_task_suspend
    ldx.w camera_x+1
    cpx #$0400
    bcc .A1A4

    !A16
    lda #$0500 : sta $19E8
    clc
    txa
    adc #$0100
    sta $1A7B
    !A8
.A1C4:
    lda.b #1 : jsl current_task_suspend
    ldx.w camera_x+1
    cpx #$1800
    bcc .A1C4

    ldx.w camera_y+1
    cpx #$0201
    bcc .A1C4

    lda #$01 : sta $19EB
.A1DF:
    lda.b #1 : jsl current_task_suspend
    dex
    stx.w camera_y+1
    stx $19E8
    cpx #$0200
    bne .A1DF

    jml current_task_remove
}
