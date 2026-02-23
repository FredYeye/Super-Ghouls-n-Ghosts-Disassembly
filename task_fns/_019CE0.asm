{
_019CE0: ;a8 x8
    stz $006D
    lda.b #255 : jsl current_task_suspend
.9CE9:
    lda #$A0 : sta $006E
.9CEE:
    ldx #$00 : ldy #$00 : jsr .9D8A
    jsr .9D1F
    lda.b #1 : jsl current_task_suspend
    dec $006E
    bne .9CEE

    lda #$A0 : sta $006E
.9D08:
    ldx #$00 : ldy #$03 : jsr .9D8A
    jsr .9D1F
    lda.b #1 : jsl current_task_suspend
    dec $006E
    bne .9D08

    bra .9CE9

;-----

.9D1F:
    ldx #$00 : ldy #$00 : jsr .9DA7
    bcc .9D31

    ldx #$01 : ldy #$08 : jsr .9DA7
    bcs .9D89

.9D31:
    phx
    lda #!sfx_ship_creak : jsl _018049_8053
    stz $1A84
    lda #$02 : sta $1A80
    plx
    inc $1EE6,X
    lda.w _00AAD8,X
    tax
.9D48: ;raise water level
    clc
    lda $1EAD : adc #$90 : sta $1EAD
    lda $1EAE : adc #$00 : sta $1EAE
    lda $1EAF : adc #$00 : sta $1EAF
    clc
    lda $1EB0 : adc #$50 : sta $1EB0
    lda $1EB1 : adc #$00 : sta $1EB1
    lda $1EB2 : adc #$00 : sta $1EB2
    lda.b #1 : jsl current_task_suspend
    dex
    bne .9D48

    lda.b #1 : jsl current_task_suspend
.9D89:
    rts

;-----

.9D8A:
    clc
    lda $1EAA,X : adc.w boat_rocking_speed+0,Y : sta $1EAA,X
    lda $1EAB,X : adc.w boat_rocking_speed+1,Y : sta $1EAB,X
    lda $1EAC,X : adc.w boat_rocking_speed+2,Y : sta $1EAC,X
    rts

;-----

.9DA7:
    lda $1EE6,X
    bne .9DE3

    !A16
    lda.w boat_AB46+4,Y : sta $0000
    asl                 : sta $0002
    lda.w boat_AB46+6,Y : sta $0004
    asl                 : sta $0006
    sec
    lda.w !obj_arthur.pos_x+1
    sbc.w boat_AB46+0,Y
    clc
    adc $0000
    cmp $0002
    bcs .9DE0

    sec
    lda.w !obj_arthur.pos_y+1
    sbc.w boat_AB46+2,Y
    clc
    adc $0004
    cmp $0006
.9DE0:
    !A8
    rts

.9DE3:
    sec
    rts
}
