namespace satan

{
create: ;a8 x8
    lda #$80 : sta $09
    ldy #$A6 : ldx #$21 : jsl set_sprite
    lda #$01 : sta.b obj.facing
    jsl get_object_slot
    !X16
    lda #$0C : sta.w obj.active,X
    lda #!id_satan_wings : sta.w obj.type,X
    stx $2D
    !X8
    lda #$78 : sta $2F
.F821:
    brk #$00

;----- F823

    dec $2F
    bne .F821

    !A16
    lda #$0754 : sta $35
    stz $37
    !A8
.F832:
    brk #$00

;----- F834

    clc
    lda.b obj.pos_x   : adc #$33 : sta.b obj.pos_x
    lda.b obj.pos_x+1 : adc #$03 : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : adc #$00 : sta.b obj.pos_x+2
    sec
    lda $35 : sbc #$C0 : sta $35
    lda $36 : sbc #$00 : sta $36
    lda $37 : sbc #$00 : sta $37
    clc
    lda.b obj.pos_y   : adc $35 : sta.b obj.pos_y
    lda.b obj.pos_y+1 : adc $36 : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : adc $37 : sta.b obj.pos_y+2
    bit $09
    bvs .F832

.F871:
    brk #$00

;----- F873

    bra .F871

;-----

_F875: ;a- x-
    !AX16
    ldx $2D
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    !AX8
    rts

;-----

thing:
    jsl update_animation_normal
    jsr _F875
    rtl
}

namespace off
