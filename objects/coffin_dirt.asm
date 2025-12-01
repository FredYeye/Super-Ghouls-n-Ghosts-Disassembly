namespace coffin_dirt

{
create:
    ldy #$B8 : ldx #$21
    lda $2F
    beq +

    ldy #$AE : ldx #$21
+:
    jsl set_sprite
    ldx $2F
    lda.w coffin_dirt_data_burrow_timer,X : sta $30
.F2C0:
    ldy #$10
    !X16
    ldx $2D
    lda $003D,X ;check if parent object (zombie) is removed
    bne .F2ED

    !A16
    jsl _018CB3_8CD6
    !AX8
    jsl update_animation_normal
    brk #$00

;----- F2D9

    dec $30 ;burrow timer
    bne .F2C0

    lda $2F
    bne .F2ED

    ldy #$A8 : ldx #$21 : jsl set_sprite
    lda #$0A : cop #$00

;----- F2ED

.F2ED:
    !AX8
    jmp _0281A8_81B5
}

namespace off
