namespace shield_piece

{
create:
    ldx $07
    phx
    lda.w shield_piece_data_BFCF,X : ldy #$7A : ldx #$20 : jsl set_sprite_8480
    plx
    ldy.w shield_piece_data_BFD2,X : jsl set_speed_xyg
    lda #$BD : sta $2D
.90EF:
    brk #$00

;----- 90F1

    jsl update_pos_xyg_add
    dec $2D
    bne .90EF

    jmp _0281A8_81B5
}

namespace off
