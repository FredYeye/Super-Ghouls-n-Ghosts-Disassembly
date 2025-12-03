namespace point_statue

{
create:
    inc.w point_statue_count
    ldx $07
    lda.w pot_data_graphics_offset-1,X : ldy #$00 : ldx #$20 : jsl set_sprite_8480
    lda $08 : ora #$20 : sta $08
    lda $09 : and #$30 : ora #$10 : sta $09
    lda $07
    cmp #$03
    beq + : +: ;probably disabled branch

.F395:
    brk #$00

;----- F397

    !A16
    lda.b obj.pos_x+1
    cmp.w screen_boundary_left
    !A8
    bcs .F3A8

    dec.w point_statue_count
    jmp _0281A8_81B5

.F3A8:
    lda.w !obj_arthur.hp
    bmi .F395

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .F395

    lda #$30 : jsl _018049_8053 ;pickup sfx
    lda $08 : and #$F8 : sta $08
    lda $07 : asl : tax
    jmp (.F3C5-2,X) : .F3C5: dw .F3CB, .F3E3, .F3FB

;-----

.F3CB: ;statue
    ldy #$0F : jsl update_score
    ldy #$30 : ldx #$20 : jsl set_sprite
    lda #$7E : cop #$00

;----- F3DD

    dec.w point_statue_count
    jmp _0281A8_81B5

;-----

.F3E3: ;armor statue
    ldy #$27 : jsl update_score
    ldy #$34 : ldx #$20 : jsl set_sprite
    lda #$7E : cop #$00

;----- F3F5

    dec.w point_statue_count
    jmp _0281A8_81B5

;-----

.F3FB: ;1up
    jsl add_extra_life
    ldy #$C2 : ldx #$20 : jsl set_sprite
    lda #$7E : cop #$00

;----- F40B

    dec.w point_statue_count
    jmp _0281A8_81B5
}

namespace off
