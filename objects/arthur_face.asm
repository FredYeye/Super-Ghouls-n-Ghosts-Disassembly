namespace arthur_face

{ ;D4AD - D53C
create:
    brk #$00

;----- D4AF

    jsl _01CCAF
    ldy #$66 : ldx #$20 : jsl set_sprite
    !A16
    lda.w #arthur_face_data_CA48 : sta $13
    lda.w _00ED00+$22 : sta $27
    lda #$0010 : sta $29
    !A8
    lda #$FF : sta $2D : sta $26
.D4D4:
    lda.w armor_state
    cmp #$02
    beq .D4E2

    cmp #$03
    beq .D4E2

    jmp .D538
.D4E2:
    lda $0461 ;$25
    tay
    lda.w arthur_face_data_sprite_idx,Y : sta $3C
    lda $08 : and #$F8 : sta $37
    lda.w arthur_face_data_CA6A,Y
    ldx.w current_cage
    clc
    adc.w arthur_face_data_CA67,X
    ora $37
    sta $08
    tya
    asl #2
    tay
    lda.w !obj_arthur.facing : sta.b obj.facing
    !A16
    bne .D517

    clc : lda.w !obj_arthur.pos_x+1 : adc.w arthur_face_data_offset+0,Y : sta.b obj.pos_x+1
    bra .D520

.D517:
    sec : lda.w !obj_arthur.pos_x+1 : sbc.w arthur_face_data_offset+0,Y : sta.b obj.pos_x+1
.D520:
    clc : lda.w !obj_arthur.pos_y+1 : adc.w arthur_face_data_offset+2,Y : sta.b obj.pos_y+1
    !A8
    jsl set_sprite_84A7
    jsl _018E32_8E73
    brk #$00

;----- D535

    jmp .D4D4

;-----

.D538:
    stz.b obj.active
    jmp _02821B_827A
}


namespace off
