{
struct guillotine extends obj
    ._2D: skip 2 ;2D
    ._2F: skip 2 ;2F
endstruct
}

namespace guillotine

{
create:
    lda $0292
    beq .D436

    jmp destroy

.D436:
    lda #$10 : sta $10
    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$80 : sta $09
    !A16
    lda.b obj.pos_x+1 : sta.b obj.guillotine._2D
    lda.b obj.pos_y+1 : sta.b obj.guillotine._2F
    lda #$0038 : clc : adc.b obj.guillotine._2D : sta.b obj.pos_x+1
    lda #$003C : clc : adc.b obj.guillotine._2F : sta.b obj.pos_y+1
    !AX8
.D46A:
    lda.w difficulty
    asl
    clc
    adc $07
    tax
    lda.w guillotine_data_C9BB,X : cop #$00

;----- D477

    jsl update_animation_normal
    lda $25 : asl : tax ;25 gets updated to the animation frame ID
    !A16
    lda.w guillotine_data_C97B,X : clc : adc.b obj.guillotine._2D : sta.b obj.pos_x+1
    lda.w guillotine_data_C99B,X : clc : adc.b obj.guillotine._2F : sta.b obj.pos_y+1
    !A8
    txa
    cmp #$08
    bne .D46A

    lda #!sfx_guillotine : jsl _018049_8053
    bra .D46A

;-----

thing:
    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
    jsr _028144
    rts

;-----

destroy:
    jmp _0281A8_81B5
}

namespace off
