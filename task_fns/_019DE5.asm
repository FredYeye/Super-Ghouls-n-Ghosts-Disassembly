{
_019DE5: ;a8 x?
    lda.b #63 : jsl current_task_suspend
.9DEB:
    lda #$40 : sta $0086
.9DF0:
    ldx #$06 : ldy #$06 : jsr _019CE0_9D8A
    lda.b #1 : jsl current_task_suspend
    dec $0086
    bne .9DF0

    lda #$40 : sta $0086
.9E07:
    ldx #$06 : ldy #$09 : jsr _019CE0_9D8A
    lda.b #1 : jsl current_task_suspend
    dec $0086
    bne .9E07

    bra .9DEB
}
