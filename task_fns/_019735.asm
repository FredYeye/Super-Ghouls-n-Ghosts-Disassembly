{
_019735: ;a8 x8
    stz.w ppu_vars.inidisp
    lda $0055,Y
    lsr
    bne .973F

    inc
.973F:
    sta $0055,Y
.9742:
    lda $0055,Y : jsl current_task_suspend
    inc.w ppu_vars.inidisp
    lda.w ppu_vars.inidisp
    cmp #$0F
    bne .9742

    jml current_task_remove
}
