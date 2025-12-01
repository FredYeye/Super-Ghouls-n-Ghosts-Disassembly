namespace grilian_projectile

{
create:
    ldy #$F8 : ldx #$21 : jsl set_sprite
    lda $07
    bne .B14D

    ldy #$FA : ldx #$21 : jsl set_sprite
    lda #$10 : sta $3B
.B143:
    brk #$00

;----- B145

    jsl update_animation_normal
    dec $3B
    bne .B143

.B14D:
    jsl _02F9DA
    ldx.w difficulty
    lda.w grilian_projectile_data_D129,X : sta $3C
    lda #$12 : cop #$00

;----- B15D

    ldy #$FA : ldx #$21 : jsl set_sprite
    lda #$10 ;leftover lda
    lda $3C : cop #$00

;----- B16B

    ldy #$C6 : ldx #$21 : jsl set_sprite
    lda $3C : cop #$00

;----- B177

    jml _0281A8_81B5

;-----

thing:
    ldx #$3C : jsl update_pos_xy_2
    bit $09
    bvc .B197

    jsl _02F9BE
    ldy #$08 : jsl _02F9CE
    jsl _02F9B2
    jml update_animation_normal

.B197:
    pla
    pla
    pla
    jml _0281BB
}

namespace off
