{
_019735_eu:
    lda #$01 : pha : plb
    ldy #$06
.973B:
    lda.w .9752,Y
    phy
    jsl _01A8CD
    ply
    lda.w .9759,Y : jsl current_task_suspend
    dey : bpl .973B

    jml current_task_remove

.9752: db $00, $01, $02, $03, $02, $01, $00
.9759: db 1, 5, 2, 4, 2, 5, 1
}
