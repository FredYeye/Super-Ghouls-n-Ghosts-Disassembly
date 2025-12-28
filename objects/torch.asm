namespace torch

{
create:
    lda #$04 : sta $1D
    lda.b #coord_offsets_torch    : sta $13
    lda.b #coord_offsets_torch>>8 : sta $14
    ldy #$6A : ldx #$20
    lda.b obj.type
    cmp #!id_torch
    beq .E717

    ldy #$74 : ldx #$20 ;torch2
.E717:
    jsl set_sprite
    ldy #$0D : jsl set_speed_xyg
    brk #$00

;----- E723

.E723:
    brk #$00

;----- E725

    jsl update_animation_normal
    jsl update_pos_xyg_add
    jsr _01E224_E26A
    lda $1F91
    bne .E723

    jsl _01A559
    beq .E723

    ;ground collision
    lda #!id_torch_flame
    ldx.b obj.type
    cpx #!id_torch
    beq .E745

    lda #!id_torch2_flame ;torch2
.E745:
    ldy #$00
    jsr _01D371_D4D8
    bmi .E752

    jsl set_spawn_offset
    !X8
.E752:
    stz $08
    stz $09
    lda #$3F : cop #$00

;----- E75A

    jml _0280CB_remove_weapon
}

namespace off
