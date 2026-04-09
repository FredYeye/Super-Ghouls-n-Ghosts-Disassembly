namespace nuclear_projectile

{
create:
    lda #$3B : jsl _018049_8053
    lda #$80 : ora $08 : sta $08
    lda #$80 : ora $09 : sta $09
    ldy #$7C : ldx #$21 : jsl set_sprite
    lda #$AC : sta $1D
    !A16
    lda #$0050 : sta $29
    !A8
    lda #$07 : cop #$00

;----- EA84

    lda $07
    cmp #$08
    beq .EA8D

    jsr _EA9A
.EA8D:
    lda #$07 : cop #$00

;----- EA91

    jml _028B0E

;-----

thing:
    jsl update_animation_normal
    rtl

;-----

_EA9A:
    jsr get_magic_slot
    bmi .EAC2

    lda #$0C : sta.w obj.active,X
    lda #$80 : ora $0008,X : sta $0008,X
    lda #!id_nuclear_projectile : sta.w obj.type,X
    lda $07 : inc : sta $0007,X
    lda.b obj.facing : sta.w obj.facing,X
    jsl set_spawn_offset
    !X8
.EAC2:
    rts
}

namespace off
