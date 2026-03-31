namespace lightning

{
create:
    lda $07
    beq .ED4C

    bra .ED6C

.ED4C:
    ldy #$78 : ldx #$21 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    lda #$06 : cop #$00

;----- ED5E

    lda.b #!sfx_magic_lightning : jsl _018049_8053
    lda #$06 : cop #$00

;----- ED68

    jml _028B0E
.ED6C:
    lda #$02 : sta.b obj.hp
    lda $0F : dec : asl : ldy #$82 : ldx #$21 : jsl set_sprite_8480
.ED7C:
    brk #$00

;----- ED7E

    jsl update_animation_normal
    lda $2D : tax : jsl update_pos_xy_2
    lda $09
    and #$40
    bne .ED7C

    stz $14E3
    jml _028B0E

;-----

thing:
    jsl update_animation_normal
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    lda.w !obj_arthur.pos_y+1 : sta.b obj.pos_y+1
    !A8
    rtl

;-----

    jml _028B0E ;unused, probably belongs to this code
}

namespace off
