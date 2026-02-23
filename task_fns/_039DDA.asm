{
_039DDA:
    lda #$00
    xba
    clc
    tya
    adc #$4E
    tcd
    !AX16
    lda #$0020 : sta $0B
.9DE9:
    stz $09
    ldx #$0000
.9DEE:
    lda $07
    and #$00FF
    asl
    tay
    lda.w _00CDD7_CDD7,Y : sta $0D
    lda $09
    lsr #4
    asl
    clc
    adc $0D
    tay
    lda.w _00CDD7_CDE1,Y
    beq .9E56

    lda $7EF400,X : and #$001F :           jsr princess_dialogue__9CF2 :                                   sta $0000
    lda $7EF400,X : and #$03E0 : lsr #5  : jsr princess_dialogue__9CF2 : asl #5  :                         sta $0002
    lda $7EF400,X : and #$7C00 : lsr #10 : jsr princess_dialogue__9CF2 : asl #10 : ora $0000 : ora $0002 : sta $7EF400,X
.9E56:
    inx #2
    inc $09
    lda $09
    cmp #$0100
    bne .9DEE

    dec $0B
    beq .9E75

    !AX8
    inc $0331
    lda.b #3 : jsl current_task_suspend
    !AX16
    jmp .9DE9

.9E75:
    jml current_task_remove
}
