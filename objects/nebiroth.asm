namespace nebiroth

{
_D36F:
    jsl get_rng_16
    stx $0000
    lda.w difficulty
    asl #4
    clc
    adc $0000
    tax
    lda.w astaroth_nebiroth_data_D4C5,X : sta $31
    rts

;-----

create:
    lda #$28 : cop #$00

;----- D38C

    lda #$01 : sta.b obj.direction : sta.b obj.facing
    !A16
    lda #$04D0 : sta.b obj.pos_x+1
    !A8
    ldy #$90 : lda.b #_01FF00_5C : ldx #$23 : jsl _01A6FE
.D3A5:
    brk #$00

;----- D3A7

    lda $00DE
    bne .D3A5

    !A16
    lda.w _00ED00+$66 : sta $27
    lda #$0140 : sta $29
    !A8
    lda #$00 : jsl _018E32_8E81
.D3C0:
    brk #$00

;----- D3C2

    jsr astaroth__D1FE
    bcc .D3C0

    ldx #$1C : jsl _028000
    stz $3C
    inc $08
    jsl set_hp
    lda #$FF : sta $26
    !A16
    lda.w _00ED00+$64 : sta $27
    lda #$0100 : sta $29
    !A8
    ldy #$D4 : ldx #$21 : jsl set_sprite
    ldx #$1E : jsl _018E32
    ldx #$14 : jsl _028048
    lda #$78 : cop #$00

;----- D3FF

    jsl _02F9DA_F9E0
    !A16
    lda.b obj.pos_x+1 : sta $35
    stz $33
    !A8
    stz $32
    jsr _D36F
    ldy #$D6 : ldx #$21 : jsl set_sprite
.D41A:
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D445,X : sta $37
    ldy #$66 : jsl set_speed_x
    jsl get_rng_bool : sta.b obj.direction
    cmp $33
    bne .D440

    inc $34
    inc
    cmp #$03
    bcc .D444

    lda.b obj.direction : eor #$01 : sta.b obj.direction
.D440:
    sta $33
    stz $34
.D444:
    stz $2D
.D446:
    brk #$00

;----- D448

    jsl get_arthur_relative_side : sta.b obj.facing
    dec $31
    beq .D4A8

    lda.w !obj_arthur.flags2
    and #$01
    beq .D461

    ldy #$2C : jsl arthur_range_check
    bcc .D472

.D461:
    jsl update_pos_x
    lda $02C3
    and #$1F
    bne .D472

    lda #$39 : jsl _018049_8053
.D472:
    !A16
    lda $35
    sec
    sbc.b obj.pos_x+1
    cmp #$0080
    !A8
    bcc .D488

    lda.b obj.direction : eor #$01 : sta.b obj.direction
    bra .D446

.D488:
    dec $37
    bne .D446

    lda #$02 : sta $2D
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D455,X : sta $37
.D499:
    brk #$00

;----- D49B

    jsl get_arthur_relative_side : sta.b obj.facing
    dec $37
    bne .D499

    jmp .D41A

.D4A8:
    lda #$04 : sta $2D
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D475,X : sta $30
    lda #$BE : sta $1D
    ldx #$01 : lda.b obj.facing
    beq .D4C1

    ldx #$07
.D4C1:
    stx $39
.D4C3:
    lda #!id_nebiroth_flame : ldx $39 : ldy #$00 : jsl _018C55
    lda #$06 : sta $31
.D4D1:
    brk #$00

;----- D4D3

    dec $31
    bne .D4D1

    dec $30
    bne .D4C3

    jsr _D36F
    jsl get_rng_bool
    bne .D4EF

    inc $3C
    lda $3C
    cmp #$03
    beq .D4EF

    jmp .D444

.D4EF:
    lda #$06 : sta $2D
    ldx.w difficulty
    lda.w astaroth_nebiroth_data_D505,X : sta $37
.D4FB:
    brk #$00

;----- D4FD

    dec $37
    bne .D4FB

    lda #$08 : sta $2D
    stz $3C
    lda #$C0 : sta $1D
    lda #!id_nebiroth_laser : ldx $12 : ldy #$00 : jsl _018C55
    ldx.w difficulty
    lda.w astaroth_nebiroth_data_D509,X : sta $37
.D51D:
    brk #$00

;----- D51F

    dec $37
    bne .D51D

    jmp .D444

;-----

destroy:
    lda.b obj.hp
    beq .D557

    ldx #$03 : jsl _028048
    jsl _02F9DA_F9E0
    ldy #$D8 : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- D540

    ldy #$D6 : ldx #$21 : jsl set_sprite
    ldx $2D
    jmp (+,X) : +: dw create_D444, create_D499, create_D4D1, create_D4FB, create_D51D

;-----

.D557:
    inc $1ED7
    inc $1EB7
    lda #$04 : sta $1D
    ldx #$00 : ldy #$02 : lda #!id_explosion_spawner : jsl _018C55
    jsl _018E32_8E73
    lda $08 : ora #$10 : sta $08
    lda #$30 : cop #$00

;----- D579

    stz $08
    stz $09
    lda #$20 : cop #$00

;----- D581

.D581:
    brk #$00

;----- D583

    lda $1EBF
    bne .D581

    jsl _018049
    lda #!id_key : jsl prepare_object
    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    bne .D5A1

    lda #$10 : jsl _018049_8053
.D5A1:
    jml _0281A8_81B5

;-----

thing:
    !A16
    lda.b obj.pos_x+1 : sta $1EBB
    lda.b obj.pos_y+1 : sta $1EBD
    !A8
    jsl update_animation_normal
    jsl _02F9BA
    jsl _02F9B6
    jsl _02F9B2
    ldx #$1E : jml _018E32
}

namespace off
