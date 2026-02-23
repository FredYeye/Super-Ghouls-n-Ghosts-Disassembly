{
_019C86: ;a- x-
    !AX16
.9C88:
    lda.w #1 : jsl current_task_suspend
    sec
    lda $1EAE : sbc #$0004 : sta $1EAE
    bpl .9C88

    stz $1EAD
    stz $1EAE
    lda.w #1 : jsl current_task_suspend
.9CA8:
    sec
    lda $1EB1 : sbc #$0004 : sta $1EB1
    bpl .9CA8

    stz $1EB0
    stz $1EB1
    jml current_task_remove
}
