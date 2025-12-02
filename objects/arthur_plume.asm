namespace arthur_plume

{
_C50D:
    stz.b obj.active
    jml _02821B_827A

create:
    brk #$00

;----- C515

    ldy #$C6 : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+$20 : sta $27
    lda #$0010 : sta $29
    !A8
    lda #$FF : sta $2D : sta $26
    jsl _01CCAF
.C535:
    lda !armor_state
    cmp #!gold
    bne _C50D

    lda.w !obj_arthur._25
.C53F:
    tay
    lda.w arthur_plume_data_C7F8,Y
    bpl .C55D

    and #$0F
    clc
    adc #$1B
    ldx.w jump_counter
    beq .C555

    ldx.w !obj_arthur.speed_y+2
    bmi .C555

    inc
.C555:
    pha
    jsl update_animation_normal
    pla
    bra .C53F

.C55D:
    sta $3C
    lda $08
    and #$F8
    ora.w arthur_plume_data_C81D,Y
    ldx.w current_cage
    beq .C56F

    ora #$04
    ldx #$01
.C56F:
    sta $08
    tya
    asl #2
    tay
    lda.w !obj_arthur.facing : sta.b obj.facing
    !A16
    bne .C587

    clc
    lda.w !obj_arthur.pos_x+1
    adc.w arthur_plume_data_C842+0,Y
    bra .C58E

.C587:
    sec
    lda.w !obj_arthur.pos_x+1
    sbc.w arthur_plume_data_C842+0,Y
.C58E:
    sta.b obj.pos_x+1
    clc : lda.w !obj_arthur.pos_y+1 : adc.w arthur_plume_data_C842+2,Y : sta.b obj.pos_y+1
    !A8
    jsl set_sprite_84A7
    jsl _018E32_8E73
    brk #$00

;----- C5A5

    bra .C535
}

namespace off
