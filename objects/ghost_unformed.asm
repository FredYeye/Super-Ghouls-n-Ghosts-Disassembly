namespace ghost_unformed

{
create:
    lda $07
    tax ;x = $07
    asl
    sta $07
    asl
    adc $07
    sta $07 ;$07 *= 6
    ldy.w ghost_data_CDB1,X
    lda.w ghost_data_CDB5,X : sta $08
    lda.w stage
    dec
    bne .E957

    inx #2
.E957:
    lda.w ghost_data_CDB9,X : sta $09
    jsl set_speed_x
    stz $2D
    jsl get_arthur_relative_side : sta.b obj.direction : sta.b obj.facing
    ldy #$C8 : ldx #$21 : jsl set_sprite
    jsr ghost__E929
    lda #$01 : sta $2D
    ldx #$88 : jsl _0196EF
    clc
    adc #$78
    sta $2E
.E984:
    brk #$00

;----- E986

    jsr ghost__E919
    jsl update_animation_normal
    jsl update_pos_xy
    dec $2E
    beq _E9C1

.E995:
    dec $2D
    bne .E99C

    jsr .E9A1
.E99C:
    jsr _028074
    bra .E984

;-----

.E9A1:
    clc
    lda $2D
    tay
    adc $07
    tax
    lda.w ghost_data_CDBF+0,X : sta $2D
    ldy.w ghost_data_CDBF+1,X : jsl set_speed_y
    lda $2D
    inc #2
    cmp #$05
    bcc .E9BE

    lda #$00
.E9BE:
    sta $2D
destroy:
thing:
    rts

;-----

_E9C1:
    ldy.w difficulty
    ldx.w ghost_data_CD5C,Y
    !A16
    lda.w camera_x+1
    cmp #$0500
    bcc .E9DA

    ldx #$00
    cmp #$0700
    bcc .E9DA

    ldx #$01
.E9DA:
    !A8
    cpx $1AF8
    bcc create_E995

    beq create_E995

    lda.w open_object_slots
    cmp #$02
    bcc create_E995

    inc $1AF8
    lda #$04 : sta $1D
    lda #!id_ghost : jsl prepare_object
    jmp _0281A8_81B5
}

namespace off
