namespace flower_projectile

{
create:
    ldy #$90 : ldx #$22
    lda.w stage
    cmp.b #!stage_4
    bne .EF12

    ldy #$BA : ldx #$21
.EF12:
    jsl set_sprite
    stz $31
.EF18:
    brk #$00

;----- EF1A

    jsl update_animation_normal
    lda $31
    bpl .EF25

    jmp _0281A8_81B5
.EF25:
    beq .EF18

    ldy #$96 : ldx #$22
    lda.w stage
    cmp.b #!stage_4
    bne .EF36

    ldy #$C0 : ldx #$21
.EF36:
    jsl set_sprite
    lda $08 : and #$F8 : sta $08
    lda $09 : ora #$C0 : and #$CF : sta $09
    jsl set_direction16_to_arthur : sta.b obj.direction
.EF4E:
    brk #$00

;----- EF50

    ldx #$0A : jsl update_pos_xy_2
    jsl update_animation_normal
    bra .EF4E

;-----

thing:
    ldy #$00 : jsr collision_check_shield
    jsr _02FA37_FA65
    jsr _02FD62_FD7C
    jmp _028074_8087
}

namespace off
