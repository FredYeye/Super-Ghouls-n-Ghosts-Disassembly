{
_01B315: ;a- x8
    ;stage 1 handler?
    !A16
    lda.w #!task_offset[3].base : tcd
    stz.b task.memory+4 ;event counter? not sure what to call it
    ldx.w checkpoint
    ldy.w stage1_earthquake_start_offset,X : sty.b task.memory+4
.B325:
    !A8
    lda.b #1 : jsl current_task_suspend
    !A16
    lda.b task.memory+4 : asl : tax
    lda.w !obj_arthur.pos_x+1
    cmp.w stage1_earthquake_x_offset,X
    bcc .B325

    !A8
    inc.w stage1_earthquake_active
    lda.b task.memory+4
    cmp #$07
    bne .B350

    !A16
    lda #$0640 : sta.w screen_boundary_left
    !A8
.B350:
    sec
    txa
    sbc #$12
    cmp #$06
    bcs .B381

    ;gets here at the water crashes
    stz.w stage1_earthquake_active
    lsr
    sta $007B
    lda.b #31 : jsl current_task_suspend
    lda #$0C : sta $02DD
    !A16
    lda #$0272 : sta $19DE
    lda #$0272 : sta $19E2
    stz $19A5
    stz $19A9
    jmp .B436

.B381:
    sec
    txa
    sbc #$0C
    cmp #$04
    bcs + : +: ;unused branch

    phx
    lda $0292
    bne .B395

    lda #$34 : jsl _018049_8053 ;ground shake sfx
.B395:
    plx
    stz $1A84
    lda #$02 : sta $1A80 ;horizontal screen shake
    stz $1A8E
    lda #$04 : sta $1A8A
    lda.b #31 : jsl current_task_suspend
    txa
    asl
    tay
    ldx.w !obj_arthur.pos_x+2
    !AX16
    lda.w stage1_earthquake_tile_offset+0,Y : sta $07
    lda.w stage1_earthquake_tile_offset+2,Y
    pha
    and #$7FFF
    sta $09
    pla
    rol #3
    and #$0002
    sta $13 ;this will always be 0 and never 2
    ldy #$0000
    lda [$07],Y : and #$00FF : sta $0D
    iny
.B3D6:
    lda [$07],Y : and #$00FF : sta $0F
    iny
.B3DE:
    lda [$07],Y : and #$00FF : sta $11
    iny
    lda [$07],Y
    ldx $13
    clc
    adc.w stage1_earthquake_B62F,X
    tax
    iny #2
-:
    lda [$07],Y : sta $7EB000,X
    iny #2
    clc
    txa : adc #$0040 : tax
    dec $11
    bne -

    dec $0F
    bne .B3DE

    !A8
    lda $13
    beq +

    lda #$02 : sta $031E
    bra .B42A

+:
    lda.w camera_x+2
    pha
    and #$03
    clc
    adc #$06
    sta $031E
    pla
    inc
    and #$03
    clc
    adc #$06
    sta $031F
.B42A:
    lda $0A : jsl current_task_suspend
    !A16
    dec $0D
    bne .B3D6

.B436:
    !AX8
    stz.w stage1_earthquake_active
    inc $0B
    lda $0B
    cmp #$11
    bne +

    jml current_task_remove
+:
    sec
    sbc #$0A
    cmp #$03
    bcs .B46A

    tax
    bne +

    ldx #$16 : jsl _018DC0_8E0E
+:
    ldy.b #task[1].base : lda.b #_01FF00_30 : jsl _01A6FE
-:
    lda.b #1 : jsl current_task_suspend
    lda $0066
    bne -

.B46A:
    jmp .B325
}
