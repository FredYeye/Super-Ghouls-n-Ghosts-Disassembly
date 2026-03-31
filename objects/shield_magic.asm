namespace shield_magic

{
create:
    lda #$03 : sta.b obj.hp
    ldx $07
    lda.w shield_magic_data_BCF8,X : sta.b obj.direction
    lda $09 : ora #$8A : sta $09
    stz $40
    lda #$04 : sta $2D
    lda #$20 : sta $2E
    ldy #$46 : ldx #$21 : jsl set_sprite
.F51A:
    brk #$00

;----- F51C

    lda $24
    cmp #$70
    bne .F51A

    ldy #$48 : ldx #$21 : jsl set_sprite
    stz $3B
.F52C:
    brk #$00

;----- F52E

    lda.b obj.direction : inc : and #$3F : sta.b obj.direction
    lda.w frame_counter
    and #$03
    bne .F549

    lda $2D : inc : and #$0F : sta $2D
    tax
    lda.w shield_magic_data_BCFB,X : sta $2E
.F549:
    dec $3B
    bne .F52C

    ldy #$4E : ldx #$21 : jsl set_sprite
.F555:
    brk #$00

;----- F557

    lda $24
    cmp #$7A
    bne .F555

    stz $14E7
    stz $14E3
    jml _028B0E

;-----

thing:
    lda.w armor_state
    cmp #$04
    bne .F59F

    jsr _01DD7A
    jsl update_animation_normal
    !A16
    lda.w !obj_arthur.pos_x+0 : sta.b obj.pos_x+0
    lda.w !obj_arthur.pos_x+2 : sta.b obj.pos_x+2
    lda.w !obj_arthur.pos_y+1 : sec : sbc #$0004 : sta.b obj.pos_y+1
    !A8
    clc
    lda $2E
    ldx #$06 : jsl _0189D9
    lda.w frame_counter
    and #$0F
    bne .F59E

    inc $40
.F59E:
     rtl

.F59F: ;not sure if this can be reached?
    stz $14E7
    stz $14E3
    jml _028B17
}

namespace off
