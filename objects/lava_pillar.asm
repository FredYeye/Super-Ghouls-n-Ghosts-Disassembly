namespace lava_pillar

{
create:
    ldy #$3C : jsl set_speed_y
    stz $2D
    lda $07
    lsr
    adc #$0A
    sta $2E
.B759:
    brk #$00

;----- B75B

    !A16
    lda.w camera_y+1
    cmp #$0260
    !A8
    bcc .B759

    ldy #$22 : jsl arthur_range_check
    bcs .B759

    lda #$3C : cop #$00

;----- B773

    stz.b obj.direction
    ldy #$CA : ldx #$21 : jsl set_sprite
    lda #$90 : sta $09
    lda #$08 : cop #$00

;----- B785

    ldy #$CC : ldx #$21 : jsl set_sprite
    jsr _B89E
    lda #$08 : cop #$00

;----- B794

    ldy #$CE : ldx #$21 : jsl set_sprite
    jsr _B89E
    lda #$08 : cop #$00

;----- B7A3

    lda $07
    beq .B7B6
    ldy #$12 : ldx #$22 : jsl set_sprite
    jsr _B89E
    lda #$08 : cop #$00

;----- B7B6

.B7B6:
    inc $2D
    ldx $07
    ldy.w lava_pillar_data_D1AF+0,X : lda.w lava_pillar_data_D1AF+1,X : tax : jsl set_sprite
.B7C5:
    brk #$00

;----- B7C7

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .B7C5

    inc.b obj.direction
    ldx $07
    ldy.w lava_pillar_data_D1AF+4,X : lda.w lava_pillar_data_D1AF+5,X : tax : jsl set_sprite
    ldx.w difficulty
    lda.w lava_pillar_data_D1AB,X : sta $3B
    cop #$00

;----- B7EA

    lda $3B : cop #$00

;----- B7EE

    ldx $07
    ldy.w lava_pillar_data_D1AF+8,X : lda.w lava_pillar_data_D1AF+9,X : tax : jsl set_sprite
.B7FB:
    brk #$00

;----- B7FD

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .B7FB

    stz $2D
    lda $07
    beq .B81C

    ldy #$12 : ldx #$22 : jsl set_sprite
    lda #$08 : cop #$00

;----- B819

    jsr _B89E
.B81C:
    ldy #$CE : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- B828

    jsr _B89E
    ldy #$CC : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- B837

    jsr _B89E
    ldy #$CA : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- B846

    stz $08
    stz $09
    lda #$3C : cop #$00

;----- B84E

    jmp .B759

;-----

thing:
    !A16
    lda.b obj.pos_x+1
    cmp.w camera_x+1
    !A8
    bcs .B864

    bit $09
    bvs .B864

    jml _0281DD

.B864:
    lda $2D
    bne .B886

    lda $25 : clc : adc #$07 : sta $3C
    jsl _02FD62
    lda $25 : clc : adc #$0A : sta $3C
    jsl _02F9D2
    jsl _01884B_8876
    jml update_animation_normal

.B886:
    lda $25 : clc : adc #$0A : sta $3C
    jsl _02F9D2
    lda $2E : sta.w bowgun_magic_active
    jsl _02FE1E
    stz.w bowgun_magic_active
    rtl

;-----

_B89E:
    !A16
    lda #$0008
    ldx.b obj.direction
    beq .B8AA

    lda #$FFF8
.B8AA:
    clc
    adc.b obj.pos_y+1
    sta.b obj.pos_y+1
    !A8
    rts
}

namespace off
