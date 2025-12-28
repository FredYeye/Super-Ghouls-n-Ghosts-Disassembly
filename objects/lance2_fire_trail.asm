namespace lance2_fire_trail

{
create:
    lda $09 : ora #$80 : sta $09
    stz $2D
    lda #$02 : sta $2E
    ldy #$5A : ldx #$21 : jsl set_sprite
    lda #$06 : cop #$00

;----- E911

    ldy #$5C : ldx #$21 : jsl set_sprite
    lda #$06 : cop #$00

;----- E91D

    ldy #$5E : ldx #$21 : jsl set_sprite
    lda #$06 : cop #$00

;----- E929

    ldy #$E8 : ldx #$20 : jsl set_sprite
    lda #$02 : cop #$00

;----- E935

    jml _0280CB_remove_weapon

;-----

thing:
    jsl update_animation_normal
    dec $2E
    bne .E94B

    lda #$04 : sta $2E
    lda $2D : eor #$01 : sta $2D
.E94B:
    lda $2D : asl #2 : tax
    clc
    lda.w _00BC00+0,X : adc.b obj.pos_y+0 : sta.b obj.pos_y+0
    lda.w _00BC00+1,X : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
    lda.w _00BC00+2,X : adc.b obj.pos_y+2 : sta.b obj.pos_y+2
    rtl
}

namespace off
