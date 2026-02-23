{
_019C0C: ;a8 x-
    !X16
.9C0E:
    lda.b #1 : jsl current_task_suspend
    ldx #$02B0
    cpx.w camera_x+1
    bcs .9C0E

    stx.w screen_boundary_left
.9C1F:
    lda.b #1 : jsl current_task_suspend
    ldx #$0800
    cpx.w camera_x+1
    bcs .9C1F

    stx.w screen_boundary_left
.9C30:
    lda.b #2 : jsl current_task_suspend
    ldx.w camera_x+1
    cpx #$08D6
    bcc .9C30

    !X8
    lda #$00 : sta $0066
    lda.w checkpoint
    bne .9C82

    ldy.b #task[1].base : lda.b #_01FF00_38 : jsl _01A6FE
    !AX16
    ldy #$0030
.9C57:
    clc
    lda $1EAB
    adc #$0002
    bmi .9C63

    lda #$0000
.9C63:
    sta $1EAB
    clc
    lda $1EEE
    adc #$0002
    cmp #$0080
    bcc .9C75

    lda #$0080
.9C75:
    sta $1EEE
    lda.w #1 : jsl current_task_suspend
    dey
    bne .9C57

.9C82:
    jml current_task_remove
}
