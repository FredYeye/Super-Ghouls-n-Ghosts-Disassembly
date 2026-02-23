{
_0197D1: ;a8 x8
    phd
    lda.b #96 : jsl current_task_suspend
    jsr .985F
    !AX16
    lda $007B
    asl #3
    and #$00FF
    tay
    ldx.w _00ABA8+0,Y
    lda.w _00ABA8+2,Y : sta $7EF700,X
    ldx.w _00ABA8+4,Y
    lda.w _00ABA8+6,Y : sta $7EF700,X
    lda #$15A2 : tcd
    ldx #$0900
    lda $007B
    and #$0003
    beq .980D

    ldx #$0B00
.980D:
    txa
    ldy #$0040
    ldx #$001E
    jsl _01C045_far
    !AX8
    lda #$0C : sta $1A77
.981F:
    ldy #$00 : jsl _01C386
    ldx #$1E : jsl _01C336
    ldy #$00 : jsl _01C386
    ldx #$1E : jsl _01C336
    lda.b #1 : jsl current_task_suspend
    dec $1A77
    bne .981F

    lda.w camera_x+2
    pha
    and #$03
    clc
    adc #$06
    sta $031E
if !version == 2
    lda.b #1 : jsl current_task_suspend
endif
    pla
    inc
    and #$03
    clc
    adc #$06
    sta $031F
    !AX8
    pld
    jml current_task_remove

;-----

.985F:
    ldx $007B
    lda.w _00AACA,X : sta $0000
    beq .98A3

    lda.w _00AACA_offset,X : sta $0001
    stz $0002
.9873:
    jsl get_object_slot
    bmi .989C

    lda #$0C : sta.w obj.active,X
    lda #!id_shell : sta.w obj.type,X
    !A16
    ldy $0001
    lda.w _00AACA_pos-3,Y : sta.w obj.pos_x+1,X
    lda.w _00AACA_pos-1,Y : sta.w obj.pos_y+1,X
    tya
    clc
    adc #$0004
    sta $0001
.989C:
    !A8
    dec $0000
    bne .9873

.98A3:
    rts
}
