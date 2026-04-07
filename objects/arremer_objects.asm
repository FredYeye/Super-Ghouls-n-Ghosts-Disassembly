namespace arremer_objects

{
projectile_create:
    jsr _BF5C
    ldy #$B4 : ldx #$21 : jsl set_sprite
    jsl _02F9DA
    jsl set_direction32
    inc
    and #$1F
    lsr
    sta.b obj.direction
    ldx.w stage
    cpx.b #!stage_6
    bcc .BE4B

    lda.w arremer_projectile_data_D220-7,X : sta $29
.BE4B:
    brk #$00

;----- BE4D

    bit $09
    bvc _BE7D

    jsl update_animation_normal
    ldx #$44 : jsl update_pos_xy_2
    bra .BE4B

;-----

projectile_thing:
    ldx $2F
    !A16
    lda.w camera_x+1
    cmp.w arremer_data_CF08,X
    !A8
    bcs .BE79

    jsl _02F9BE
    ldy #$0A : jsl _02F9CE
    jml _02F9B2

.BE79:
    jml _0281DD

_BE7D:
    jml _0281A8_81B5

;-----

killers_create:
    jsr _BF5C
    ldy #$E0 : ldx #$21 : jsl set_sprite
    jsl _02F9DA
    lda.b obj.direction : sta $2D
    ldx $07
    lda.w arremer_projectile_data_D222,X : sta $2E
    ldx.w stage
    cpx.b #!stage_6
    bcc .BEA7

    lda.w arremer_projectile_data_D220-7,X : sta $29
.BEA7:
    !A16
    lda.b obj.pos_x+1 : sta.b obj.speed_x+1
    lda.b obj.pos_y+1 : sta.b obj.speed_y+1
    !A8
    lda #$60 : sta $3B
.BEB7:
    brk #$00

;----- BEB9

    inc $0F : inc $0F
    jsr .BEF3
    lda $0F : cmp #$10
    bne .BEB7

.BEC6:
    brk #$00

;----- BEC8

    lda $2E : inc #2 : and #$3F : sta $2E
    jsr .BEF5
    lda $2D : sta.b obj.direction
    dec $3B
    bne .BEC6

    lda #$06 : cop #$00

;----- BEDF

    jsl set_direction32
    inc
    and #$1F
    lsr
    sta.b obj.direction
.BEE9:
    brk #$00

;----- BEEB

    ldx #$14 : jsl update_pos_xy_2
    bra .BEE9

;-----

.BEF3:
    lda $2E
.BEF5:
    sta.b obj.direction
    lda $0F : ldx #$06 : jsl _018B25
    rts

;-----

killers_destroy:
    lda $0F
    bmi projectile_destroy

    ldy #$E6 : ldx #$21 : jsl set_sprite
    ldy #$07 : jsl update_score
    lda #!sfx_death : jsl _018049_8053
.BF18:
    brk #$00

;----- BF1A

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .BF18

    jml _0281A8_81B5

;-----

projectile_destroy:
    stz $29
    stz $2A
    jml _028BB9

;-----

killers_thing:
    bit $09
    bvc .BF58

    ldx $2F
    !A16
    lda.w camera_x+1
    cmp.w arremer_data_CF08,X
    !A8
    bcs .BF58

    jsl update_animation_normal
    jsl _02F9BA
    jsl _02F9B6
    ldy #$0A : jsl _02F9CE
    jml _02F9B2

.BF58:
    jml _0281DD

;-----

_BF5C:
    ldx.w stage
    lda.w arremer_projectile_data_D219-2,X : sta $2F
    rts
}

namespace off
