namespace hannibal

{
create: ;a8 x8
    jsr _02812E
    jsl set_hp
    lda #$04 : sta $1D
    jsl _02F9DA_F9E0
    lda #$01 : sta.b obj.direction : sta.b obj.facing
.9606:
    ldy #$FC : ldx #$21 : jsl set_sprite
    jsl get_rng_16
    lda.w hannibal_data_cooldown,X
    ldx.w difficulty
    clc
    adc.w hannibal_data_cooldown_difficulty,X
    sta $3B
.961E:
    brk #$00

;----- 9620

    lda.w frame_counter
    and #$0F
    bne .962F

    jsl get_arthur_relative_side
    cmp.b obj.facing
    bne .turn

.962F:
    dec $3B
    bne .961E

    ldy #$D6 : ldx #$21 : jsl set_sprite
.963B:
    brk #$00

;----- 963D

    lda.b obj.anim_timer
    cmp #$0C
    bne .963B

    lda #!id_hannibal_projectile : jsl prepare_object
.9649:
    brk #$00

;----- 964B

    lda.b obj.anim_timer
    dec
    bne .9649

    bra .9606

;----- 9652

.turn:
    ldy #$B6 : ldx #$21 : jsl set_sprite
    jsr .9674
    lda #$09
    cop #$00

;----- 9661

    lda.b obj.facing : eor #$01 : sta.b obj.facing
    lda #$09 : cop #$00

;----- 966B

    jsr .9674
    lda.b obj.facing : sta.b obj.direction
    bra .9606

;-----

.9674:
    lda.b obj.direction
    asl
    tax
    !A16
    lda.b obj.pos_x+1
    clc
    adc.w hannibal_data_pos_offset,X
    sta.b obj.pos_x+1
    !A8
    rts

;-----

destroy:
    lda $08 : ora #$10 : sta $08
    ldy #$17 : jsl update_score
    lda #$05 : sta $2D
    lda #$66 : sta $1D
.9699:
    lda #$46 : jsl prepare_object
    lda #$07 : cop #$00

;----- 96A3

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053
    dec $2D
    bne .9699

    lda $08 : and #$F7 : sta $08
    lda #$05 : sta $2D
    lda #$66 : sta $1D
.96C2:
    lda #$46 : jsl prepare_object
    lda #$07 : cop #$00

;----- 96CC

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053
    dec $2D
    bne .96C2
    jmp _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _0296FE
    rts
}

namespace off
