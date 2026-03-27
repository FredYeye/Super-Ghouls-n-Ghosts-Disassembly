{
_019776: ;a8 x8
    jsr .97AB

.9779:
    ldx #$1F
    jsr .97C3
    lda.b #1 : jsl current_task_suspend
    jsl set_max_brightness

    ldx #$1F
-:
    jsr .97C3
    dex : bpl -

    bra .97A4

.9792:
    jsr .97B0
    bra .9779

.9797: ;a8 x8
    jsr .97AB
    ldx #$00
-:
    jsr .97C3
    inx
    cpx #$20
    bne -

.97A4:
    stz.w snes_reg.wobjsel
    jml current_task_remove

.97AB:
    lda #$9F : sta.w snes_reg.cgadsub

.97B0:
    stz.w snes_reg.cgwsel
    lda #$80 : sta.w snes_reg.wobjsel
    lda $0055,Y
    lsr
    bne +

    inc
+:
    sta $0055,Y
    rts

;-----

.97C3:
    txa
    ora #$E0
    sta.w snes_reg.coldata
    lda $0055,Y : jsl current_task_suspend
    rts
}
