namespace shield

{
_9025:
    lda $08 : ora #$80 : sta $08
    jmp destroy

create:
    ldy #$7C : ldx #$20
    lda.b obj.init_param
    beq .903A

    ldy #$60 : ldx #$21
.903A:
    jsl set_sprite
    jsl _01CCAF
    !A16
    lda.w _00ED00+$1C : sta $27
    lda #$001A : sta $29
    !A8
    ldx.b obj.init_param
    lda.w shield_data_hp,X : sta.b obj.hp
    lda #$FF : sta $2D : sta $26
.905D:
    lda.w armor_state
    beq _9025

    lda.w !obj_arthur._25 : tay
    lda.w shield_data_BF27,Y : sta $3C
    ldx.w current_cage
    lda $08 : and #$F8 : ora.w shield_data_BF43,Y : ora.w shield_data_BF24,X : sta $08
    tya : asl #2 : tay
    lda.w !obj_arthur.facing : sta.b obj.facing
    !A16
    bne .9092

    clc : lda.w !obj_arthur.pos_x+1 : adc.w shield_data_BF5F+0,Y : sta.b obj.pos_x+1
    bra .909B

.9092:
    sec : lda.w !obj_arthur.pos_x+1 : sbc.w shield_data_BF5F+0,Y : sta.b obj.pos_x+1
.909B:
    clc : lda.w !obj_arthur.pos_y+1 : adc.w shield_data_BF5F+2,Y : sta.b obj.pos_y+1
    !A8
    jsl set_sprite_84A7
    jsl _018E32_8E73
    brk #$00

;----- 90B0

    bra .905D

;-----

destroy:
    lda #!sfx_armor_shatter : jsl _018049_8053
    stz.w shield_state_stored
    stz.b obj.init_param
    lda #$03 : sta $2D
.90C1:
    lda #!id_shield_piece : jsl prepare_object
    inc.b obj.init_param
    dec $2D
    bne .90C1

    stz.b obj.init_param
    jsr _0280E9_80EE
    jmp _02821B_827A
}

namespace off
