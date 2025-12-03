namespace armor_piece

{
create:
    ldy #$4C : ldx #$20 : jsl set_sprite_8482
    lda $3D : tax
    lda.w armor_piece_speed_direction+1,X : sta.b obj.direction
    ldy.w armor_piece_speed_direction+0,X : jsl set_speed_xyg
    lda #$3F : sta $2D
.9017:
    jsl update_pos_xyg_add
    brk #$00

;----- 901D

    dec $2D
    bne .9017

    jml _028B0E
}

namespace off
