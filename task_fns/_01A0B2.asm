{
_01A0B2:
    ;stage 5 handler
    !X16
    lda.w checkpoint
    beq .A0C6

    ldx #$0580 : stx $19E8
    stz $1A7F
    jml current_task_remove

.A0C6:
    lda.b #1 : jsl current_task_suspend
    ldx.w camera_y+1
    cpx #$0500
    bcs .A0C6

    inc $19EB
    ldx #$0500 : stx $19E8
.A0DD:
    lda.b #1 : jsl current_task_suspend
    ldx.w camera_x+1
    cpx #$0180
    bcc .A0DD

    stz $1A7F
.A0EE:
    lda.b #1 : jsl current_task_suspend
    ldx.w camera_x+1
    cpx #$0700
    bcc .A0EE

    ;stage 5-2
    lda #$05 : sta $19E9
    stz $19EB
    lda #$60 : sta $1EF0
    lda #$C0 : sta $1EF2
.A10E:
    lda.b #1 : jsl current_task_suspend
    dec $1EF0
    lda $1EF0
    pha
    asl
    sta $1EF2
    pla
    cmp #$10
    bne .A10E

    jml current_task_remove
}
