{
_01A397: ;a- x8
    phd
    phb
    php
    ldy $00E5
    !AX16
    lda #$0000 : tcd
    lda.w _00AFCC+4,Y
    stz $46
    sta $48
    lda.w _00AFCC+5,Y
    clc
    adc #$0007
    and #$FFF8
    lsr #3
    sta $4A
    lda.w _00AFCC+2,Y
    ldx.w _00AFCC+0,Y
    ldx.w _00AFCC+0,Y ;repeated instruction
    jsr decompress_graphics_offsets_A263
    beq .A3E6

.A3C7:
    jsr decompress_graphics_function
    beq .A3E6

    lda.l !SLHV
    lda.l !OPVCT
    cmp #$F0
    bcc .A3C7

    phb
    lda #$00 : pha : plb
    lda.b #1 : jsl current_task_suspend
    plb
    bra .A3C7

.A3E6:
    plp
    plb
    pld
    jml current_task_remove
}
