{
_01A128:
    ;stage 5 handler
    lda.w camera_x+2
    bne .A155

    !A16
.A12F:
    lda.w #1 : jsl current_task_suspend
    lda.w camera_x+1
    cmp #$0400
    bcc .A12F

    !AX8
    ldy #$3F
    ldx $02D7
.A145:
    txa
    eor #$02
    tax
    sta $02D7
    lda.b #1 : jsl current_task_suspend
    dey
    bne .A145

.A155:
    lda #$15 : sta $02D5 : sta $02D6 : sta $02D7 : sta $02D8
    lda #$FF : sta $19DF : sta $19E3
    lda #$94 : sta $031E
    lda.b #1 : jsl current_task_suspend
    lda #$13 : sta $031E
    lda $02DD : and #$FC : ora #$01 : sta $02DD
    lda $02D9 : ora #$20 : sta $02D9
    jml current_task_remove
}
