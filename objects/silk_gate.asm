namespace silk_gate

{
create:
    lda $07
    bne .9F54

    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda $08 : ora #$06 : sta $08
    bra .9F62

.9F54:
    ldy #$BA : ldx #$21 : jsl set_sprite
    lda $08 : ora #$05 : sta $08
.9F62:
    lda $09 : ora #$30 : sta $09
.9F68:
    brk #$00

;----- 9F6A

    jsl update_animation_normal
    lda $07
    bne .9F68

    lda $1F9E
    beq .9F68

    lda #$32 : sta $2D
    lda #!sfx_gate_open : jsl _018049_8053
.9F81:
    brk #$00

;----- 9F83

    jsl update_animation_normal
    !A16
    inc.b obj.pos_x+1
    !A8
    dec $2D
    bne .9F81

    inc $1F9F
.9F94:
    brk #$00

;----- 9F96

    jsl update_animation_normal
    bra .9F94
}

namespace off
