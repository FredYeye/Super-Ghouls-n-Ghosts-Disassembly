{
_019F43: ;a8 x8
    lda #$00
    xba
    clc
    tya
    adc #$4E
    tcd
    ldx $07
    stz $02E2
    lda #$FF : sta $02E3
    !A16
.9F57:
    lda.w stage3_data_AAE4,X : sta $0B
.9F5C:
    lda #$0100 : sta $19C5
    lda #$0001 : sta $031D
.9F68:
    lda.w #1 : jsl current_task_suspend
    stz $031D
    lda.w camera_x+1
    cmp.w stage3_data_AB0C,X
    bcc .9F84

    lda.w stage3_data_AADA,X
    tax
    bpl .9F57

    jml current_task_remove

.9F84:
    sec
    lda.w camera_x+1
    sbc.w stage3_data_AB20,X
    adc.w stage3_data_AB02,X
    cmp.w stage3_data_AAF8,X
    bcs .9F68

    stz $1F9B
    sec
    lda.w camera_x+1
    sbc.w stage3_data_AAEE,X
    cmp.w stage3_data_AAF8,X
    bcs .9F5C

    cmp #$0100
    bcc .9FB4

    cmp.w stage3_data_AB16,X
    bcs .9FB4

    inc $1F9B
    lda.w camera_x+1 : sta $0B
.9FB4:
    sec : lda.w camera_x+1 : sbc $0B : sta $19C5
    clc : lda $0B : adc #$0028 : sta $0000
    sec
    sbc.w stage3_data_AB2A,X
    cmp.w stage3_data_AB34,X
    bcs .9FDB

    sec
    lda $0000
    sbc.w camera_x+1
    cmp #$0100
    bcc .9FDE

.9FDB:
    lda #$0000
.9FDE:
    tay
    sty $02E2
    clc : lda $0B : adc #$00D8 : sta $0000
    sec
    sbc.w stage3_data_AB2A,X
    cmp.w stage3_data_AB34,X
    bcs .A000

    sec
    lda $0000
    sbc.w camera_x+1
    cmp #$0100
    bcc .A003

.A000:
    lda #$FFFF
.A003:
    tay
    sty $02E3
    jmp .9F68
}
