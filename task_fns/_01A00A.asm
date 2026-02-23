{
_01A00A:
    ;4b handler?
    !A16
    !A8
    stz $0088
    stz $008A
    lda #$01 : sta $0089
    lda #$01 : sta $1F2F
.A01E:
    lda.b #189 : jsl current_task_suspend
    lda #$04
    bra .A02A

.A028:
    lda #$08
.A02A:
    jsr .A067
    lda #$08 : jsr .A084
    lda $0088
    bne .A047

    !A16
    lda.w !obj_arthur.pos_x+1
    cmp #$0190
    !A8
    bcs .A028

    lda #$01
    bra .A04C

.A047:
    cmp $008A
    beq .A028

.A04C:
    sta $008A
    lda #$04 : jsr .A067
.A054:
    lda.b #1 : jsl current_task_suspend
    lda $0087
    cmp $0089
    beq .A054

    sta $0089
    bra .A01E

;-----

.A067:
    sta $85
.A069:
    lda.b #6 : jsl current_task_suspend
    dec $1F2B
    dec $1F2D
    jsl _01B9A8_BA9C
    dec $85
    bne .A069

    lda.b #15 : jsl current_task_suspend
    rts

;-----

.A084:
    sta $85
.A086:
    lda.b #6 : jsl current_task_suspend
    inc $1F2B
    inc $1F2D
    jsl _01B9A8_BA9C
    dec $85
    bne .A086

    lda.b #15 : jsl current_task_suspend
    rts
}
