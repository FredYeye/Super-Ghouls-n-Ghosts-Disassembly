{
_019EEA: ;a- x8
    ;stage 3 handler?
    !A16
    lda.w camera_x+1 : sta $B5
    stz $B7
.9EF3:
    !A16
    lda.w #1 : jsl current_task_suspend
    ldy #$00
    sec
    lda.w camera_x+1
    sbc $B5
    bpl .9F0C

    iny #2
    eor #$FFFF
    inc
.9F0C:
    cmp #$0008
    bcc .9EF3

    lda $B5 : adc.w stage3_data_AB3E,Y : sta $B5
    !A8
    tya
    lsr
    and #$01
    sta $1F9A
    lda $1F9B
    beq .9EF3

    clc
    lda $B7
    adc.w stage3_data_AB42,Y
    bpl .9F32

    lda #$0D
    bra .9F38

.9F32:
    cmp #$0E
    bcc .9F38

    lda #$00
.9F38:
    sta $B7
    inc
    sta $031C
    inc $1F99
    bra .9EF3
}
