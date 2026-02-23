{
_01A1F5:
    ;4b handler?
    lda #$00
    xba
    clc
    tya
    adc #$4E
    tcd
    !X16
    ldx.w camera_y+1
    stx $07
.A204:
    lda.b #1 : jsl current_task_suspend
    lda.w jump_counter
    bne .A21B

    ldx.w camera_y+1
    cpx $07
    bcs .A21B

    stx $07
    stx $19E8
.A21B:
    bra .A204
}
