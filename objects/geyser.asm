namespace geyser

{
create:
    !A16
    lda.b obj.pos_x+1 : sta $39
    lda.b obj.pos_y+1 : sta $3B
    !A8
    stz $31
.A346:
    brk #$00

;----- A348

    ldy #$28 : jsl _0192AD
    bcs .A346

    lda $09 : ora #$B4 : sta $09
    inc $31
    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda #$54 : cop #$00

;----- A364

    ldy #$AA : ldx #$21 : jsl set_sprite
    bra .A38E

.A36E:
    brk #$00

;----- A370

    ldy #$28 : jsl _0192AD
    bcs .A36E

    inc $31
    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda #$54 : cop #$00

;----- A386

    ldy #$AA : ldx #$21 : jsl set_sprite
.A38E:
    lda #$0E : cop #$00

;----- A392

    inc $32
    ldy #$A8 : ldx #$21 : jsl set_sprite
    ldx #$92 : jsl _0196EF : cop #$00

;----- A3A4

    stz $32
    ldy #$B2 : ldx #$21 : jsl set_sprite
    lda #$0E : cop #$00

;----- A3B2

    stz $31
    ldx #$94 : jsl _0196EF : cop #$00

;----- A3BC

    lda $09
    and #$40
    bne .A36E

    jml _0281A8_81B5

;-----

thing:
    lda $31
    beq .A3D6

    lda $08 : ora #$08 : sta $08
    jsl update_animation_normal
    bra .A3DE

.A3D6:
    lda $08 : and #$F7 : sta $08
    bra .A3E6

.A3DE:
    lda $32
    beq .A3E6

    jsl _02F9B2
.A3E6:
    rtl
}

namespace off
