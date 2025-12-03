namespace samael_laser

{
create:
    lda $07
    bne .EDBE

    lda #$29 : jsl _018049_8053
    ldx.b obj.direction
    lda.w astaroth_laser_data_D531,X : sta.b obj.facing
    txa : asl : tax
    ldy.w astaroth_laser_data_D511+0,X
    lda.w astaroth_laser_data_D511+1,X
    tax
    jsl set_sprite
    jsl _02F9DA_F9E0
.ED9E:
    brk #$00

;----- EDA0

    ldx #$50 : jsl update_pos_xy_2
    jsl update_animation_normal
    lda $24
    cmp #$78
    bne .ED9E

.EDB0:
    brk #$00

;----- EDB2

    ldx #$50 : jsl update_pos_xy_2
    bit $09
    bvc destroy

    bra .EDB0

.EDBE:
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda #$1E : sta $3B
.EDCA:
    brk #$00

;----- EDCC

    jsl update_animation_normal
    dec $3B
    bne .EDCA

;-----

destroy:
    jml _0281A8_81B5

;-----

thing:
    ldy #$1C : jsl _02F9CE
    jml _02F9B2
}

namespace off
