{
_019735: ;a8 x8
    stz.w snes_reg.inidisp
    lda $0055,Y
    lsr
    bne .973F

    inc
.973F:
    sta $0055,Y
.9742:
    lda $0055,Y : jsl current_task_suspend
    inc.w snes_reg.inidisp
    lda.w snes_reg.inidisp
    cmp #$0F
    bne .9742

    jml current_task_remove
}
