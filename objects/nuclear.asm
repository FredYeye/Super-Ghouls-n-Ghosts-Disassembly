namespace nuclear

{
create:
    lda $08 : ora #$80 : sta $08
    lda #$80 : ora $09 : sta $09
    lda #$06 : sta.b obj.hp
    !A16
    lda #$0050 : sta $29
    !A8
    lda #$AA : sta $1D
    ldy #$12 : ldx #$21 : jsl set_sprite
    lda #$18 : cop #$00

;----- E9EE

    ldy #$14 : ldx #$21 : jsl set_sprite
    lda #$20 : cop #$00

;----- E9FA

    stz.b obj.facing
    jsr .EA36
    lda #$01 : sta.b obj.facing
    jsr .EA36
    stz.b obj.facing
    ldy #$7E : ldx #$21 : jsl set_sprite
    lda #$10 : cop #$00

;----- EA14

    lda $08 : and #$77 : sta $08
    !A16
    clc : lda.w camera_x+1 : adc #$0080 : sta.b obj.pos_x+1
    clc : lda.w camera_y+1 : adc #$0080 : sta.b obj.pos_y+1
    !A8
    brk #$00

;----- EA32

    jml _028B0E

;-----

.EA36:
    jsr get_magic_slot
    bmi .EA53

    lda #$0C : sta.w obj.active,X
    lda #$AA : sta.w obj.type,X
    stz $0007,X
    lda.b obj.facing : sta.w obj.facing,X
    jsl set_spawn_offset
    !X8
.EA53:
    rts

;-----

thing:
    jsl update_animation_normal
    rtl
}

namespace off
