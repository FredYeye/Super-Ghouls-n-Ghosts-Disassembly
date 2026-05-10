{
decompress: ;a- x-
    phd
    phb
    php
    !AX16
    sty $0000 : tya : asl #3 : sec : sbc $0000 : tay ;Y * 7
    bra .cont

.precalc: ;a- x-
    ;entry with y already precalculated (skip mult by 7)
    phd
    phb
    php
    !AX16
.cont:
    jsr setup_decompression
    beq + ;count is 0

-:
    jsr decompress_step
    bne - ;decompress until count is 0

+:
    plp
    plb
    pld
    rtl
}

{
setup_decompression: ;a16 x16
    ;(in)  Y.w                    : offset into compressed_data

    ;(out) X.w                    : ram dest (7Fxxxx)
    ;(out) Y.w                    : source offset
    ;(out) decompression_bank_ptr : source bank (xx0000)
    ;(out) decompression_size     : uncompressed size rounded up to mod 8, divided by 8

    lda #$0000 : tcd
    ldx.w compressed_data+0,Y
    stz.b decompression_bank_ptr+0
    lda.w compressed_data+4,Y : sta.b decompression_bank_ptr+2
    lda.w compressed_data+5,Y : clc : adc #$0007 : and #$FFF8 : lsr #3 : sta.b decompression_size
    lda.w compressed_data+2,Y
.own_data: ;a16 x16
    ;(in) A.w : uncompressed size
    tay
    !A8
    lda.b #$7F : pha : plb
    lda.b decompression_size+0 : ora.b decompression_size+1 ;set zero flag if decomp size is 0
    rts
}

{
macro decompress_part(offset) ;macro for decompress_step
    asl $00
    bcs ?+

    lda $01     ;if mask bit is 0, copy "stamp" byte
    bra ?store

?+:
    lda.b [decompression_bank_ptr],Y ;if mask bit is 1, load next byte
    iny : bne ?store

    ldy #$8000  ;bank crossing
    inc.b decompression_bank_ptr+2
?store:
    sta <offset>,X
endmacro
}

{
decompress_step: ;a8 x16
    lda.b [decompression_bank_ptr],Y : sta $00 ;mask
    iny : bne +

    ldy #$8000
    inc.b decompression_bank_ptr+2
+:
    lda.b [decompression_bank_ptr],Y : sta $01 ;"stamp" byte
    iny : bne +

    ldy #$8000
    inc.b decompression_bank_ptr+2
+:
    %decompress_part($0000)
    %decompress_part($0001)
    %decompress_part($0002)
    %decompress_part($0003)
    %decompress_part($0004)
    %decompress_part($0005)
    %decompress_part($0006)
    %decompress_part($0007)
    !A16
    clc : txa : adc #$0008 : tax
    dec.b decompression_size
    !A8
    rts
}

{
decompress_stage_data: ;a8 x8
    php
    phd
    ldx.w stage
    ldy.w compressed_stage_data,X
    !AX16
    lda #$0000 : tcd
    lda.w compressed_stage_data,Y   : and #$00FF : sta $10 ;count
    lda.w compressed_stage_data+1,Y : sta $12
.A357:
    lda.w compressed_stage_data+5,Y
    stz.b decompression_bank_ptr+0
    sta.b decompression_bank_ptr+2
    lda.w compressed_stage_data+6,Y : sta $14
    clc
    adc #$0007
    and #$FFF8
    lsr #3
    sta.b decompression_size
    lda.w compressed_stage_data+3,Y
    ldx $12
    phy
    php
    phb
    jsr setup_decompression_own_data
    beq +

-:
    jsr decompress_step
    bne -

+:
    plb
    plp
    ply
    iny #5
    clc
    lda $12 : adc $14 : sta $12
    dec $10
    bne .A357

    pld
    plp
    rtl
}

{
task_decompress: ;a- x8
    ;background decompression
    phd
    phb
    php
    ldy $00E5
    !AX16
    lda #$0000 : tcd
    lda.w task_decompression_data+4,Y : stz.b decompression_bank_ptr+0 : sta.b decompression_bank_ptr+2
    lda.w task_decompression_data+5,Y : clc : adc #$0007 : and #$FFF8 : lsr #3 : sta.b decompression_size
    lda.w task_decompression_data+2,Y
    ldx.w task_decompression_data+0,Y
    ldx.w task_decompression_data+0,Y ;repeated instruction
    jsr setup_decompression_own_data
    beq .A3E6

.decompress:
    jsr decompress_step
    beq .A3E6

    lda.l SLHV
    lda.l OPVCT
    cmp.b #240 : bcc .decompress ;decompress until scanline 240

    phb
    lda.b #bank00>>16 : pha : plb
    lda.b #1 : jsl current_task_suspend
    plb
    bra .decompress

.A3E6:
    plp
    plb
    pld
    jml current_task_remove
}
