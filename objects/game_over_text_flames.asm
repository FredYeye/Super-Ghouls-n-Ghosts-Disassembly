namespace game_over_text_flames

{
create:
    lda $07 : and #$07 : tax
    lda.w game_over_text_flames_data_D309,X : sta.b obj.pos_x+1
    lda #$78 : sta.b obj.pos_y+1
    ldx $07
    cpx #$08
    bcs .C2F6

    lda.w game_over_text_flames_data_D311,X : cop #$00

;----- C2DE

    ldy #$00 : ldx #$20 : jsl set_sprite
.C2E6:
    brk #$00

;----- C2E8

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .C2E6

    jml _0281A8_81B5

.C2F6:
    lda.w game_over_text_flames_data_D311-$07,X : cop #$00

;----- C2FB

    lda $07 : asl : tax
    ldy.w game_over_text_flames_data_D2F9-$10,X : lda.w game_over_text_flames_data_D2F9-$0F,X : tax : jsl set_sprite
.C30A:
    brk #$00

;----- C30C

    bra .C30A
}

namespace off
