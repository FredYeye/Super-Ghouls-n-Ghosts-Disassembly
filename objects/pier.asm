namespace pier

{
create:
    lda #$03 : sta $08
    ldy #$DA : ldx #$21 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    lda #$30 : sta $10
    lda.b obj.pos_y+0 : sta $2D
    lda.b obj.pos_y+1 : sta $2E
    lda.b obj.pos_y+2 : sta $2F
    clc
    lda $2D : adc $1EAA : sta.b obj.pos_y+0
    lda $2E : adc $1EAB : sta.b obj.pos_y+1
    lda $2F : adc $1EAC : sta.b obj.pos_y+2
.CE0E:
    brk #$00

;----- CE10

    clc
    lda $2D : adc $1EAA : sta.b obj.pos_y+0
    lda $2E : adc $1EAB : sta.b obj.pos_y+1
    lda $2F : adc $1EAC : sta.b obj.pos_y+2
    lda.w !obj_arthur.pos_x+1
    cmp #$A0
    bcc .CE0E

    lda #$50 : sta.b obj.speed_y+0
    stz.b obj.speed_y+1
    stz.b obj.speed_y+2
    lda #$7F : sta $33
    lda #$08 : sta $34
    lda #$1E : sta $1D
.CE41:
    lda #$7C : jsl prepare_object
    lda $1D : clc : adc #$02 : sta $1D
    dec $34
    bne .CE41

.CE52:
    brk #$00

;----- CE54

    !A16
    dec.b obj.pos_x+1
    !A8
    jsl update_pos_y
    brk #$00

;----- CE60

    !A16
    inc.b obj.pos_x+1
    !A8
    jsl update_pos_y
    brk #$00

;----- CE6C

    !A16
    inc.b obj.pos_x+1
    !A8
    jsl update_pos_y
    brk #$00

;----- CE78

    !A16
    dec.b obj.pos_x+1
    !A8
    jsl update_pos_y
    dec $33
    bne .CE52

    jmp _0281A8_81B5

;-----

thing:
    lda.w jump_counter
    beq .CE94

    lda.w !obj_arthur.speed_y+2
    bpl .CE94

    rts

.CE94:
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .CEB3

    lda.w !obj_arthur.pos_x+1
    cmp #$A0
    bcs .CEB3

    stz.w !obj_arthur.speed_y+2
    !A16
    lda.b obj.pos_y+1 : sec : sbc #$002A : sta.w !obj_arthur.pos_y+1
    !A8
    inc $14C3
.CEB3:
    rts
}

namespace off
