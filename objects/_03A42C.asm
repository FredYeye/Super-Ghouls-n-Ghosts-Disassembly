namespace _03A42C

{
create:
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda $09 : ora #$B0 : sta $09
    !A16
    lda.b obj.pos_x+1 : sta $39
    lda.b obj.pos_y+1 : sta $3B
    !A8
    stz $32
.A448:
    brk #$00

;----- A44A

    lda.w !obj_arthur.hp
    bmi .A448

    lda $32
    bne .A448

    lda $07 : asl : tax
    jsr (.A45E,X)
    !A8
    bra .A448

.A45E: dw .A464, .A4AE, .A501

;-----

.A464:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    cmp #$0280
    bcs .A47E

    cmp #$0240
    bcs .A486

    cmp #$0100
    bcs .A494

    cmp #$00C0
    bcs .A49C

.A47E:
    sta.b obj.pos_x+1
    lda #$03C0 : sta.b obj.pos_y+1
    rts

.A486:
    sta.b obj.pos_x+1
    sec
    sbc #$0240
    lsr
    clc
    adc #$03A0
    sta.b obj.pos_y+1
    rts

.A494:
    sta.b obj.pos_x+1
    lda #$03A0 : sta.b obj.pos_y+1
    rts

.A49C:
    sta.b obj.pos_x+1
    sec
    sbc #$00C0
    lsr
    sta $2D
    lda #$03C0 : sec : sbc $2D : sta.b obj.pos_y+1
    rts

;-----

.A4AE:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    cmp #$0130
    bcc .A4F6

    cmp #$0280
    bcs .A4E4

    sec
    cmp #$0200
    bcs .A4D6

    sta.b obj.pos_x+1
    sec
    sbc #$0130
    lsr
    sta $2D
    lda #$02C0 : sec : sbc $2D : sta.b obj.pos_y+1
    rts

.A4D6:
    sta.b obj.pos_x+1
    sec
    sbc #$0200
    lsr
    clc
    adc #$0258
    sta.b obj.pos_y+1
    rts

.A4E4:
    sta.b obj.pos_x+1
    sec
    sbc #$0280
    lsr
    sta $2D
    lda #$0298 : sec : sbc $2D : sta.b obj.pos_y+1
    rts

.A4F6:
    lda #$0130 : sta.b obj.pos_x+1
    lda #$02C0 : sta.b obj.pos_y+1
    rts

;-----

.A501:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    cmp #$0290
    bcs .A510

    sta.b obj.pos_x+1
    bra .A515

.A510:
    lda #$0290 : sta.b obj.pos_x+1
.A515:
    lda #$0120 : sta.b obj.pos_y+1
    !A8
    rts

;-----

thing:
    jsl update_animation_normal
    jsl arthur_overlap_check_FED8_8bit
    bcs .A52C

    ldx $0F
    jmp (.A52D,X)

.A52C:
    rtl

.A52D: dw .A535, .A573, .A5A0, .A5CC

;-----

.A535:
    lda.w !obj_arthur.hp
    bmi .A544

    inc $32
    ldy #$B6 : ldx #$21 : jsl set_sprite
.A544:
    lda #$FF : sta.w !obj_arthur._0F
    inc $14C3
    inc $19EB
    stz $007E
    lda $09 : and #$FB : sta $09
    !A16
    lda.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
    lda.b obj.pos_y+1 : sec : sbc #$0008 : sta.w !obj_arthur.pos_y+1
    !A8
    lda #$50 : sta $31
    lda #$02 : sta $0F
    rtl

;-----

.A573:
    inc $19EB
    stz $007E
    lda $31
    cmp #$42
    bcc .A585

    !A16
    dec.b obj.pos_y+1 : dec.b obj.pos_y+1
.A585:
    !A16
    lda.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
    lda.b obj.pos_y+1 : sec : sbc #$0008 : sta.w !obj_arthur.pos_y+1
    !A8
    dec $31
    bne .A59F

    lda #$04 : sta $0F
.A59F:
    rtl

;-----

.A5A0:
    inc $19EB
    stz $007E
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda.w !obj_arthur.hp
    bmi .A5C7

    lda #$FF : sta.w !obj_arthur.hp : sta.w !obj_arthur._0F
    jsl _02FDCD
    lda.w !obj_arthur.flags1 : and #$EF : sta.w !obj_arthur.flags1
.A5C7:
    lda #$06 : sta $0F
    rtl

;-----

.A5CC:
    inc $19EB
    stz $007E
    rtl

;-----

destroy:
    jml _0281A8_81B5
}

namespace off
