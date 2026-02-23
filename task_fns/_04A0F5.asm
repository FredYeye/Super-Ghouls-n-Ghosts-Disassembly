{
_04A0F5:
    lda #$08 : sta $F2FC
    lda #$FF : sta $F2FF
    lda #$00 : sta $F2FE
    lda !SLHV
    lda !STAT78
    lda !OPVCT : sta $F2FD
    lda $F31B : and #$3F : ora #$80 : sta $F31B
    lda.b #1 : jsl current_task_suspend
    bra _04A0F5
}
