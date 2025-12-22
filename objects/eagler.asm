namespace eagler

{
create:
    lda #$08 : sta $09
    lda $07
    cmp #$04
    bcc .9886

    jmp create2_9A1D

.9886:
    ldx #$01
    ldy #$16
    lda.w stage
    cmp #$03
    beq .9895

    ldx #$03
    ldy #$18
.9895:
    sty $37
    jsl _018D5B
    jsl set_hp
    stz.b obj.direction
    !A16
    lda.w _00ED00+$0A : sta $27
    stz $39
    !A8
    lda #$FF : sta $26
    ldy #$EA : ldx #$21 : jsl set_sprite
    lda $07
    cmp #$03
    bne .98C0

    inc.b obj.direction
.98C0:
    brk #$00

;----- 98C2

    jsl update_animation_normal
    ldx $37
    jsl _018E32
    lda $24
    cmp #$70
    bne .98C0

    jsl _02F9DA_F9E0
    ldy #$D4 : ldx #$21 : jsl set_sprite
    ldy #$2D : jsl set_speed_xyg
    lda $07 : asl : tax
    jmp (+,X) : +: dw .98F3, .991A, .9905, .991A

;-----

.98F3:
    jsl get_rng_bool
    bne .995A

    stz.b obj.speed_y+0
    stz.b obj.speed_y+1
    stz.b obj.speed_y+2
    lda #$28 : sta $3B
    bra .992A

.9905:
    jsl get_rng_16
    lda.w enemy_spawner_data_C0A2,X
    bne .9958

    stz.b obj.speed_y+0
    stz.b obj.speed_y+1
    stz.b obj.speed_y+2
    lda #$28 : sta $3B
    bra .9948

.991A:
    stz $3B
.991C:
    stz $39
.991E:
    brk #$00

;----- 9920

    jsl update_pos_xyg_add
    inc $3B
    lda $1B
    bmi .991E

.992A:
    lda #$02 : sta $39
.992E:
    brk #$00

;----- 9930

    jsl update_pos_xyg_add
    dec $3B
    bne .992E

    lda #$04 : sta $39
.993C:
    brk #$00

;----- 993E

    jsl update_pos_xyg_sub
    inc $3B
    lda $1B
    bpl .993C

.9948:
    lda #$06 : sta $39
.994C:
    brk #$00

;----- 994E

    jsl update_pos_xyg_sub
    dec $3B
    bne .994C

    bra .991C

.9958:
    inc.b obj.direction
.995A:
    ldy #$2E : jsl set_speed_xyg
    stz $3B
.9962:
    lda #$08 : sta $39
.9966:
    brk #$00

;----- 9968

    jsl _01884B
    inc $3B
    lda $18
    bpl .9966

    lda #$0A : sta $39
.9976:
    brk #$00

;----- 9978

    jsl _01884B
    dec $3B
    bne .9976

    lda #$0C : sta $39
.9984:
    brk #$00

;----- 9986

    jsl _01884B_8860
    inc $3B
    lda.b obj.speed_x+2
    bmi .9984

    lda #$0E : sta $39
.9994:
    brk #$00

;----- 9996

    jsl _01884B_8860
    dec $3B
    bne .9994

    bra .9962

;-----

destroy:
    lda $07
    cmp #$04
    bcs .99D6

    lda.b obj.hp
    beq .99CB

    ldy #$D8 : ldx #$21 : jsl set_sprite
    jsl _02F9DA_F9E0
.99B6:
    brk #$00

;----- 99B8

    lda $24
    cmp #$70
    bne .99B6

    ldy #$D4 : ldx #$21 : jsl set_sprite
    ldx $39
    jmp (.99D9,X)

.99CB:
    jsr _9A0A
    lda #$03 : jsr _028B52_local
    jmp _028BEC

.99D6:
    jmp _0281A8_81B5

.99D9: dw create_991E, create_992E, create_993C, create_994C, create_9966, create_9976, create_9984, create_9994

;-----

thing:
    jsl get_arthur_relative_side : sta.b obj.facing
    jsl update_animation_normal
    ldx $37 : jsl _018E32
    bit $09
    bvc .9A02

    jsl _0296E9
    rts

.9A02:
    jsr _9A0A
    lda #$03 : jmp _028B36_local

;-----

_9A0A:
    ldy #$03
    !AX16
    ldx $2D
.9A10:
    lda $0013,X : sta $002D,X
    tax
    dey
    bne .9A10

    !AX8
    rts

;-----

create2:

.9A1D:
    ldx $07
    lda.w enemy_spawner_data_C0B3-5,X : sta $24 ;loads a 1 from previous data (COB2)
    ldy #$36 : jsl set_speed_x
    stz $15
    !A16
    lda $2D : sta $13
    lda $2F : sta.b obj.speed_y
    lda.b obj.pos_x+1 : sta $2D : sta $31 : sta $35 : sta $39
    lda.b obj.pos_y+1 : sta $2F : sta $33 : sta $37 : sta $3B
    !A8
    lda #$28 : cop #$00

;----- 9A50

    ldy #$E8 : ldx #$21
    lda $07
    cmp #$06
    bne .9A5E

    ldy #$EE : ldx #$21
.9A5E:
    jsl set_sprite
.9A62:
    brk #$00

;----- 9A64

    lda $15
    tax
    clc
    adc #$04
    and #$0F
    sta $15
    !A16
    lda $2D,X : sta.b obj.pos_x+1
    lda $2F,X : sta.b obj.pos_y+1
    !X16
    ldy.b obj.speed_y
    lda.w obj.pos_x+1,Y : sta $2D,X
    lda.w obj.pos_y+1,Y : sta $2F,X
    !A8
    lda $07
    cmp #$04
    bne .9AA7

    lda.w obj.facing,Y
    asl
    !A16
    and #$0002
    tay
    lda $2D,X : adc.w enemy_spawner_data_C0B6,Y : sta $2D,X
    clc : lda $2F,X : adc #$0004 : sta $2F,X
.9AA7:
    !AX8
    jsl update_animation_normal
    bra .9A62
}

namespace off
