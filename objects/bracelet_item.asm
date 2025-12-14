namespace bracelet_item

{
create:
    ldx.w stage
    lda.l weapon__BB9C,X
    tax
    jsl _018D5B
    !A16
    lda.b obj.pos_x+1 : sta $31
    lda.b obj.pos_y+1 : sta $33
    lda.b obj.pos_y+1 : sec : sbc #$0008 : sta.b obj.pos_y+1
    lda.w #_00C2D7 : sta $13
    !A8
    ldy #$22 : ldx #$20 : jsl set_sprite
    inc $1FAB
    !A16
    lda.w _00ED00+$1A : sta $27
    !A8
    lda #$FF : sta $26
    lda $09 : ora #$94 : sta $09
    lda $08 : and #$F8 : sta $08
    lda #!id_bracelet_item_sparkle : jsl prepare_object
    lda #$C6 : sta $1D
    lda #$0A : sta $2F
    lda #$05 : sta $2D
    lda #$BF : sta $37
.BF84:
    brk #$00

;----- BF86

    jsr _C040
    dec $37
    lda $37
    and #$03
    bne .BF84

    !A16
    lda $31 : sta.b obj.pos_x+1
    lda $33 : sta.b obj.pos_y+1
    !A8
    lda #$2D
    jsl update_pos_xy_2
    lda.b obj.direction : inc : and #$0F : sta.b obj.direction
    lda $37
    bne .BF84

    !A16
    lda $31 : sta.b obj.pos_x+1
    lda $33 : clc : adc #$0008 : sta.b obj.pos_y+1
    !A8
    ldy #$E6 : ldx #$20 : jsl set_sprite
    stz $37
.BFC8:
    brk #$00

;----- BFCA

    lda $37
    cmp #$10
    bcs .BFF0

    cmp #$08
    bcs .BFE2

    !A16
    lda.b obj.pos_y+1 : sec : sbc #$0002 : sta.b obj.pos_y+1
    !A8
    bra .BFEE

.BFE2:
    !A16
    lda.b obj.pos_y+1 : clc : adc #$0002 : sta.b obj.pos_y+1
    !A8
.BFEE:
    inc $37
.BFF0:
    jsr _028176
    lda $14E3
    bne .BFC8

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .BFC8

    lda.w current_cage
    bne .BFC8

    lda.w !obj_arthur.hp
    bpl .C00A

    jmp .BFC8

.C00A:
    lda #$F1 : jsl _018049_8053
    lda #$30 : jsl _018049_8053
    brk #$00

;----- C018

    lda #$0E : sta.w weapon_current
    lda.w armor_state
    cmp #$02
    bcc .C027

    inc.w weapon_current
.C027:
    dec $1FAB
    bne .C034

    lda.w weapon_current : and #$0E : sta $02B3
.C034:
    jmp _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts

;-----

_C040:
    dec $2F
    bne .C061

    lda #!id_bracelet_item_sparkle : jsl prepare_object
    lda $1D : clc : adc #$02 : sta $1D
    lda #$0A : sta $2F
    dec $2D
    bne .C061

    lda #$C6 : sta $1D
    lda #$05 : sta $2D
.C061:
    rts
}

namespace off
