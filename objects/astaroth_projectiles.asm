namespace astaroth_projectiles

{
flame_create:
    inc $1EBF
    ldy #$DA : ldx #$21 : jsl set_sprite
    jsl _02F9DA_F9E0
    !A16
    stz.b obj.speed_x+1
    lda #$0026 : sta.b obj.speed_y+1
    !A8
    jsr _D66F
    lda #$1E : sta $37
.D613:
    brk #$00

;----- D615

    jsr _D66F
    dec $37
    bne .D613

    lda #$59 : jsl _018049_8053
    lda #$20 : sta $37
.D626:
    brk #$00

;----- D628

    jsr _D66F
    ldx #$3C : jsl update_pos_xy_2
    jsr _D684
    dec $37
    bne .D626

    ldy #$DC : ldx #$21 : jsl set_sprite
    lda #$0A : sta $37
.D644:
    brk #$00

;----- D646

    jsr _D66F
    ldx #$3C : jsl update_pos_xy_2
    jsr _D684
    dec $37
    bne .D644

    dec $1EBF
    jml _0281A8_81B5

;-----

flame_thing:
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$1A : jsl _02F9CE
    jml _02F9B2

;-----

_D66F:
    !A16
    clc : lda $1EBB : adc.b obj.speed_x+1 : sta.b obj.pos_x+1
    clc : lda $1EBD : adc.b obj.speed_y+1 : sta.b obj.pos_y+1
    !A8
    rts

;-----

_D684:
    !A16
    sec : lda.b obj.pos_x+1 : sbc $1EBB : sta.b obj.speed_x+1
    sec : lda.b obj.pos_y+1 : sbc $1EBD : sta.b obj.speed_y+1
    !A8
    rts

;-----

laser_create:
    lda $07 : asl : tax
    jmp (+,X) : +: dw .D6AC, .D723, _D783, _D783, _D783, _D783

;-----

.D6AC:
    inc $1EBF
    ldy #$DE : ldx #$21 : jsl set_sprite
    !A16
    stz.b obj.speed_x+1
    lda #$0005 : sta.b obj.speed_y+1
    !A8
    jsr _D66F
    lda #$30 : sta $37
.D6C9:
    brk #$00

;----- D6CB

    jsr _D66F
    jsl update_animation_normal
    dec $37
    bne .D6C9

    jsl set_direction32 : inc : and #$1F : lsr : sta.b obj.direction
    lda #$08 : jsl _0195E4
    bcc .D71F

    !X16
    stz $0000
.D6ED:
    jsl _028B1E
    lda #!id_astaroth_laser : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda.b obj.direction : sta.w obj.direction,X
    !A16
    lda $13ED,Y : sta $002F,X
    lda $13F1,Y : sta $002D,X
    !A8
    inc $0000
    lda $0000
    sta $0007,X
    cmp #$05
    bne .D6ED

    !X8
.D71F:
    jml _0281A8_81B5

;-----

.D723:
    lda #$58 : jsl _018049_8053
    ldx.b obj.direction
    lda.w astaroth_laser_data_D531,X : sta.b obj.facing
    txa : asl : tax
    ldy.w astaroth_laser_data_D511+0,X : lda.w astaroth_laser_data_D511+1,X : tax : jsl set_sprite
    !A16
    stz.b obj.speed_x+1
    lda #$0005 : sta.b obj.speed_y+1
    !A8
    jsr _D66F
    jsl _02F9DA_F9E0
.D750:
    brk #$00

;----- D752

    jsr _D66F
    ldx #$50 : jsl update_pos_xy_2
    jsr _D684
    jsl update_animation_normal
    lda $24
    cmp #$78
    bne .D750

.D768:
    brk #$00

;----- D76A

    ldx #$50 : jsl update_pos_xy_2
    bit $09
    bvc .D776

    bra .D768

.D776:
    lda #$04 : jsl _028B52

;-----

flame_destroy:
    dec $1EBF
    jml _0281A8_81B5

;-----

_D783:
    ldx $07
    lda.w astaroth_laser_data_D50D-2,X : cop #$00

;----- D78A

    jsl _02F9DA_F9E0
    lda.b obj.direction : clc : adc #$08 : and #$0F : sta.b obj.direction
.D797:
    !AX16
    ldx $2F
    lda.w obj.pos_x+0,X : sta.b obj.pos_x+0
    lda.w obj.pos_x+2,X : sta.b obj.pos_x+2
    lda.w obj.pos_y+1,X : sta.b obj.pos_y+1
    !AX8
    lda #$04 : ldx #$3C : jsl _0189D9
    brk #$00

;----- D7B6

    bra .D797

;-----

laser_thing:
    jml _02F9B2
}

namespace off
