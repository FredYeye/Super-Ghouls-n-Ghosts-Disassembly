namespace veil_allocen_projectile

{
create:
    lda #$60 : jsl _018049_8053
    jsl _01918E_set_direction16 : sta.b obj.direction
    lda #$80 : sta $09
    ldy #$32 : ldx #$22 : jsl set_sprite
    lda #$33 : sta $2D
.E760:
    brk #$00

;----- E762

    ldx #$56 : jsl update_pos_xy_2
    dec $2D
    bne .E760

    ldy #$34 : ldx #$22 : jsl set_sprite
    lda #$1C : cop #$00

;----- E778

    lda #$07 : sta $000F
.E77D:
    jsl get_object_slot
    bmi .E7A3

    lda #$0C : sta.w obj.active,X
    lda #!id_freeze_splinter : sta.w obj.type,X
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    !A8
    lda $000F : sta.w obj.direction,X
    !X8
.E7A3:
    dec $000F
    bpl .E77D

    jml _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$10 : jsl _02F9CE
    rtl
}

namespace off
