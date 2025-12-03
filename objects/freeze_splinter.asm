namespace freeze_splinter

{
create:
    lda #$80 : sta $09
    ldy #$36 : ldx #$22 : jsl set_sprite
.E7C7:
    brk #$00

;----- E7C9

    ldx #$58 : jsl update_pos_xy_2
    jsl _028074_807D
    bra .E7C7

;-----

thing:
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$12 : jsl _02F9CE
    jsl arthur_overlap_check_8bit
    bcs .E7FD

    lda #$01 : sta.w is_frozen
    lda #$04 : sta.w frozen_counter
    stz $14B3
    stz.w !obj_upgrade2.active
    jsl _0281DD
.E7FD:
    rtl
}

namespace off
