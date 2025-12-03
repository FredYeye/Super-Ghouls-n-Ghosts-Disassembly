namespace magician

{
create:
    !AX8
    lda #$84 : ora $09 : sta $09
    ldy #$9E : ldx #$20 : jsl set_sprite
    !A16
    dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1
    lda.w _00ED00+$0C : sta $27
    lda #$0100 : sta $29
    !A8
    stz $33
    stz $34
    jsl set_hp
    jsl get_arthur_relative_side : sta.b obj.facing
    lda #$FF : sta $26
    lda #$00 : sta $1D
    lda $08 : and #$F8 : ora #$10 : ora #$02 : sta $08
.B871:
    brk #$00

;----- B873

    inc $34
    lda $34
    cmp #$20
    bne .B871

    lda $08 : and #$EF : sta $08
    lda #$01 : sta $33
    stz $34
.B887:
    brk #$00

;----- B889

    inc $34
    lda $34
    cmp #$20
    bne .B887

    lda $08 : ora #$10 : sta $08
    stz $33
    stz $34
.B89B:
    brk #$00

;----- B89D

    inc $34
    lda $34
    cmp #$18
    bne .B89B

    jmp _0281A8_81B5

;-----

thing:
    lda $24
    cmp #$0E
    beq .B8B0

    bra .B8B6

.B8B0:
    lda #!id_magician_orb : jsl prepare_object
.B8B6:
    jsl get_arthur_relative_side : sta.b obj.facing
    jsl update_animation_normal
    jsl _018E32_8E73
    lda $33
    beq .B8D1

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
.B8D1:
    rts

;-----

destroy:
    !AX8
    lda $08 : and #$08 : ora #$12 : sta $08
    lda #$04 : sta $2D
    lda #$66 : sta $1D
.B8E4:
    lda #!id_small_explosion : jsl prepare_object
    lda #$0A : cop #$00

;----- B8EE

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053 ;explosion sfx
    dec $2D
    bne .B8E4

    lda $08 : and #$F7 : sta $08
    lda #$04 : sta $2D
    lda #$66 : sta $1D
.B90D:
    lda #!id_small_explosion : jsl prepare_object
    lda #$0A : cop #$00

;----- B917

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053 ;explosion sfx
    dec $2D
    bne .B90D

    ldy #$0F : jsl update_score
    jmp _0281A8_81B5
}

namespace off
