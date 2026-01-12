namespace arthur_map

{
_CCE7: ;game over
    lda $1FB5
    bne .CCFD

.CCEC:
    lda #!id_game_over_text_flames : jsl prepare_object
    inc $07
    lda $07
    cmp #$10
    bne .CCEC

    jmp _0281A8_81B5

.CCFD:
    lda #$04
.CCFF:
    sta $2D
    tay
    !AX16
    lda.w _00C919+0,Y : ldx #$0394 : jsr .CD4A
    lda.w _00C919+2,Y : ldx #$0414 : jsr .CD4A
    !AX8
    inc.w layer3_needs_update
.CD1B:
    brk #$00

;----- CD1D

    lda.w p1_button_press+1
    bit #!start
    bne .CD37

    bit #!down|!up|!select
    beq .CD1B

    lda #$37 : jsl _018049_8053
    lda $2D
    clc
    adc #$04
    and #$07
    bra .CCFF

.CD37:
    lda $2D : sta $1FB3
    beq .CD44

    lda #$63 : jsl _018049_8053
.CD44:
    inc $1FB4
    jmp _0281A8_81B5

;-----

.CD4A:
    sta $7F9000,X
    cmp #$2045
    beq .CD54

    inc
.CD54:
    inx #2
    sta $7F9000,X
    rts

;-----

_CD5B: ;time over
    ldy #$02 : ldx #$20 : jsl set_sprite
    stz $14D2
.CD66:
    brk #$00
    bra .CD66

.CD6A: ;"to be continued..." unused
    ldy #$04 : ldx #$20 : jsl set_sprite
    stz $0290
    stz $14D2
    bra .CD66

;-----

create:
    lda $07
    bne .CD8C

    ;reached from game over, time over. anything else...?
    lda $14D2
    asl
    tax
    jmp (+, X) : +: dw _CCE7, _CD5B, _CD5B_CD6A

;-----

.CD8C:
    lda #$01 : sta.w OBSEL
    lda.w stage
    asl
    adc.w checkpoint
    asl #2
    tax
    !A16
    lda.w arthur_map_offsets+0,X : sta.b obj.pos_x+1
    lda.w arthur_map_offsets+2,X : sta.b obj.pos_y+1
    !A8
    ldy #$06 : ldx #$20 : jsl set_sprite
.CDB1:
    brk #$00

;----- CDB3

    jsl update_animation_normal
    clc
    lda.w camera_x+0 : adc #$00 : sta.w camera_x+0
    lda.w camera_x+1 : adc #$01 : sta.w camera_x+1
    lda.w camera_x+2 : adc #$00 : sta.w camera_x+2
    jsl _01B90E
    bra .CDB1
}

namespace off
