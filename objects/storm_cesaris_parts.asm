namespace storm_cesaris_parts

{
create:
    lda $07 : asl #2 : tax
    !A16
    lda.w storm_cesaris_parts_data_C01C+0,X : sta.b obj.speed_x+1
    lda.w storm_cesaris_parts_data_C01C+2,X : sta.b obj.speed_y+1
    !A8
    jsr _9593
    ldy $07
    ldx.w storm_cesaris_parts_data_C04C,Y
    ldy.w storm_cesaris_parts_data_C058+0,X
    lda.w storm_cesaris_parts_data_C058+1,X
    tax
    jsl set_sprite
    jsl _02F9DA_F9E0
    lda $07
    cmp #$06
    bcc .9520

    lda $07
    asl #2
    sta $3B
    cop #$00

;----- 94EF

.94EF:
    brk #$00

;----- 94F1

    jsl update_animation_normal
    lda $1EBA
    beq destroy

    jsr _9593
    lda $07
    cmp #$06
    beq .94EF

    lda.w frame_counter
    lsr #3
    clc
    adc $3B
    and #$0F
    tax
    lda.w storm_cesaris_parts_data_C06E,X
    !A16
    and #$00FF
    clc
    adc.b obj.pos_x+1
    sta.b obj.pos_x+1
    !A8
    bra .94EF

.9520:
    brk #$00

;----- 9522

    jsr _9593
    lda $1EBA
    bne .9520

    jsl _02F9ED
    lda #$02 : sta $3B
.9532:
    ldx $07
    lda.w storm_cesaris_parts_data_C062,X : cop #$00

;----- 9539

    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$34 : jsl _018049_8053
.9547:
    brk #$00

;----- 9549

    jsr _9593
    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .9547

    dec $3B
    bne .9532

    stz $08
    stz $09
.955E:
    brk #$00

;----- 9560

    lda $1EBA
    bne .955E

destroy:
    jsl _02F9ED
    jsr _9593
    ldx $07
    lda.w storm_cesaris_parts_data_C062,X : cop #$00

;----- 9573

    ldy #$E6 : ldx #$21 : jsl set_sprite
    lda #$34 : jsl _018049_8053
.9581:
    brk #$00

;----- 9583

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .9581

    jmp _0281A8_81B5

;-----

thing:
    jmp _02FD62_FD7C

;-----

_9593:
    !A16
    lda $1EBB : clc : adc.b obj.speed_x+1 : sta.b obj.pos_x+1
    lda $1EBD : clc : adc.b obj.speed_y+1 : sta.b obj.pos_y+1
    !A8
    rts
}

namespace off
