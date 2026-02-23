{
_019757: ;a8 x8
    lda #$0F : sta $02F2
    lda $0055,Y
    lsr
    bne .9763

    inc
.9763:
    sta $0055,Y
.9766:
    lda $0055,Y : jsl current_task_suspend
    dec $02F2
    bne .9766

    jml current_task_remove
}
