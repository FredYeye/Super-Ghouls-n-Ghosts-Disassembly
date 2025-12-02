namespace nebiroth_flame

{
create:
    inc $1EBF
    ldy #$DA : ldx #$21 : jsl set_sprite
    !A16
    lda.w #nebiroth_flame_data_D541 : sta $13
    !A8
    lda #$14 : sta $37
.D7D4:
    brk #$00

;----- D7D6

    jsl update_animation_normal
    dec $37
    bne .D7D4

    jsl _02F9DA_F9E0
    lda #$59 : jsl _018049_8053
.D7E8:
    brk #$00

;----- D7EA

    jsl _01A559
    beq .D7E8

    ldx #$00
    lda.b obj.direction
    dec
    beq .D7F9

    ldx #$08
.D7F9:
    stx.b obj.direction
    ldy #$EA : ldx #$21 : jsl set_sprite
    lda #$06 : sta $37
.D807:
    brk #$00

;----- D809

    jsl _01A593
    beq destroy

    dec $37
    bne .D807

;-----

destroy:
    dec $1EBF
    jml _0281A8_81B5

;-----

thing:
    ldx #$3C : jsl update_pos_xy_2
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$1A : jsl _02F9CE
    jml _02F9B2
}

namespace off
