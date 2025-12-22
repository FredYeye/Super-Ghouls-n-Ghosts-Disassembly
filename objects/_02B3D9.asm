namespace _02B3D9

{
;unused

create:
    !AX8
    ldx #$02 : jsl _018D5B
    lda #$90 : ora $09 : sta $09
    lda #$01 : sta $08
    ldy #$D6 : ldx #$21 : jsl set_sprite
    ldy #$18 : jsl set_speed_x
    !A16
    lda.w _00ED00+$06 : sta $27 ;wolf? must have been something else at some point
    !A8
    lda #$FF : sta $26
    stz.b obj.direction
    jsl set_hp
.B40C:
    brk #$00

;----- B40E

    lda $0F
    beq .B40C

    ldx #$20 : jsl _0196EF : cop #$00

;----- B41A

    lda #$02 : sta $08
    ldy #$D8 : ldx #$21 : jsl set_sprite
    lda #$02 : sta $31 : sta $2D
    stz $34
    lda.b obj.pos_x+1 : sec : sbc.w !obj_arthur.pos_x+1 : sta $32
    lda #$18
    sec
    sbc $32
    bcs .B441

    lda #$01 : sta $34
.B441:
    !A16
    lda.w !obj_arthur.pos_y+1
    cmp.b obj.pos_y+1
    !A8
    bcs .B467

.B44C:
    brk #$00

;----- B44E

    lda #$01 : sta $2E
    jsl _02B102
    jsl update_pos_x
    !A16
    lda.w !obj_arthur.pos_y+1
    cmp.b obj.pos_y+1
    !A8
    bcc .B44C

    bra .B47E

.B467:
    brk #$00

;----- B469

    stz $2E
    jsl _02B102
    jsl update_pos_x
    !A16
    lda.w !obj_arthur.pos_y+1
    cmp.b obj.pos_y+1
    !A8
    bcs .B467

.B47E:
    lda #$01 : sta $31
    lda #$52 : sta $2D
    lda #$08 : sta $2F
.B48A:
    brk #$00

;----- B48C

    lda $2F
    cmp #$10
    beq .B496

    inc $2F
    bra .B4A4

.B496:
    lda $2E
    beq .B49E

    stz $2E
    bra .B4A2

.B49E:
    lda #$01 : sta $2E
.B4A2:
    stz $2F
.B4A4:
    jsl _02B102
    jsl update_pos_x
    lda $09
    and #$40
    bne .B48A

    jmp _0281A8_81B5

;-----

thing:
    lda $0F
    bne .B4CD

    jsl get_arthur_relative_side : sta.b obj.direction
    eor #$FF                     : sta.b obj.facing
    ldy #$06 : jsl arthur_range_check
    bcs .B4CD

    inc $0F
.B4CD:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda.w current_cage
    bne .B4E3

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jmp _02FD62_FD7C

.B4E3:
    rts

;-----

.destroy:
    lda #$3B : jsl _018049_8053
    jmp _028BEC

;-----

    jmp _0281A8_81B5 ;may or may not belong to this object
}

namespace off
