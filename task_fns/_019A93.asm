{
_019A93: ;a8 x8
    ldx $0055,Y
    lda.w boat_AB62+12,X : sta $0063,Y
    stz $1ED7
    !AX16
    txa
    asl
    tax
    lda.w boat_AB62+0,X : tcd
    lda.w boat_AB62+4,X : sta $09 : sta $0B
    stz $0D
    !A8
    stz $16
    ldy.w boat_AB62+8,X
    bne .9ADA

.9ABA:
    lda.b #1 : jsl current_task_suspend
    jsr .9B12
    lda $006D
    beq .9ABA

.9AC8:
    lda.b #1 : jsl current_task_suspend
    lda $16
    beq .9AC8

    lda.b #80 : jsl current_task_suspend
    bra .9AEB

.9ADA:
    lda.b #1 : jsl current_task_suspend
    ldx.w camera_x+1
    cpx #$0B00
    bcc .9ADA

    ;shortly after vortex screen
    inc $00AC
.9AEB:
    stz $08
.9AED:
    lda.b #1 : jsl current_task_suspend
    jsr .9B34
    lda.b #1 : jsl current_task_suspend
    jsr .9BC8
    lda.b #1 : jsl current_task_suspend
    lda $1ED7
    beq .9AED

    stz $0D
    stz $0E
    jml current_task_remove

;-----

.9B12:
    php
    lda $14D1
    bne .9B32

    !A16
    sec
    lda #$02D0
    sbc $1EAE
    cmp.w !obj_arthur.pos_y+1
    bcs .9B32

    lda.w camera_y+1 : sta $19E8
    !AX8
    jsl _02FDCD
.9B32:
    plp
    rts

;-----

.9B34:
    jsr .9B78
.9B37:
    !A16
    lda.w #1 : jsl current_task_suspend
    sec
    lda $1736,Y : sbc $0F : sta $1736,Y
    lda $1738,Y : sbc $11 : sta $1738,Y
    jsr .9B94
    bcc .9B37

.9B56:
    !A16
    lda.w #1 : jsl current_task_suspend
    sec
    lda $1736,Y : sbc $0F : sta $1736,Y
    lda $1738,Y : sbc $11 : sta $1738,Y
    jsr .9BB4
    bmi .9B56

    !A8
    rts

;-----

.9B78:
    clc
    lda $08
    adc $15
    and #$0F
    tax
    lda.w boat_AB70,X
    tax
    stz $0F
    stz $10
    stz $11
    stz $12
    lda.w boat_AB80+3,X : sta $13 ;loads from AB83 (= 8) or AB87 (= 8)
    stz $14
    rts

;-----

.9B94:
    jsr _019CBE
    sec
    lda $0F : sbc $13 : sta $0F
    lda $11 : sbc #$0000 : sta $11
    sec
    lda.w boat_AB80+0,X : sbc $0F ;sets carry flag
    lda.w boat_AB80+2,X : ora #$FF00 : sbc $11 ;binary or turns bottom bits into signed negative number
    rts

;-----

.9BB4:
    jsr _019CBE
    clc
    lda $0F : adc $13 : sta $0F
    lda $11 : adc #$0000 : sta $11
    lda $11
    rts

;-----

.9BC8:
    jsr .9B78
.9BCB:
    !A16
    lda.w #1 : jsl current_task_suspend
    clc
    lda $1736,Y : adc $0F : sta $1736,Y
    lda $1738,Y : adc $11 : sta $1738,Y
    jsr .9B94
    bcc .9BCB

.9BEA:
    !A16
    lda.w #1 : jsl current_task_suspend
    clc
    lda $1736,Y : adc $0F : sta $1736,Y
    lda $1738,Y : adc $11 : sta $1738,Y
    jsr .9BB4
    bmi .9BEA

    !A8
    rts
}
