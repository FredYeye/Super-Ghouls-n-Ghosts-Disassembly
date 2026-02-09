namespace astaroth

{
create:
    stz $1EBF
    lda.w stage
    cmp #$07
    bne .D0EB

    !A16
    lda #$0340 : sta.w screen_boundary_left
    !A8
.D0EB:
    brk #$00

;----- D0ED

    ldy #$34 : jsl _0192AD
    bcs .D0EB

    lda.w stage
    cmp #$08
    bne .D104

    lda $0292
    beq .D104

    jmp destroy_D297

.D104:
    lda $0292
    bne .D10F

    lda #!mus_stage_6_7_boss : jsl _018049_8053
.D10F:
    brk #$00

;----- D111

    jsr _D1FE
    bcc .D10F

    ldx #$14 : jsl _028000
    inc $08
    stz $3A
    lda #$1A : clc : adc $07 : sta $3B
    jsl set_hp
    lda #$FF : sta $26
    lda.w stage : asl : tax
    !A16
    lda.w astaroth_nebiroth_data_D441-$0E,X : sta $2E
    lda.w _00ED00+$62 : sta $27
    lda #$0100 : sta $29
    !A8
    ldy #$CE : ldx #$21 : jsl set_sprite
    jsl get_arthur_relative_side : sta.b obj.facing
    ldx $3B : jsl _018E32
    ldx #$14 : jsl _028048
    lda #$78 : cop #$00

;----- D165

    jsl _02F9DA_F9E0
    inc.b obj.direction
    !A16
    lda.b obj.pos_x+1 : sta $35
    stz $33
    !A8
    stz $32
    jsr _D34E_D356
    ldy #$D0 : ldx #$21 : jsl set_sprite
.D182:
    stz $2D
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D445,X : sta $37
    ldy #$66 : jsl set_speed_x
    jsl get_rng_bool
    sta.b obj.direction
    cmp $33
    bne .D1AA

    inc $34
    inc
    cmp #$03
    bcc .D1AE

    lda.b obj.direction : eor #$01 : sta.b obj.direction
.D1AA:
    sta $33
    stz $34
.D1AE:
    brk #$00

;----- D1B0

    lda.w !obj_arthur.flags2 : and #$01
    beq .D1BF

    ldy #$2C : jsl arthur_range_check
    bcc .D1D0

.D1BF:
    jsl update_pos_x
    lda.w frame_counter
    and #$1F
    bne .D1D0

    lda #$39 : jsl _018049_8053
.D1D0:
    !A16
    lda $35
    sec
    sbc.b obj.pos_x+1
    cmp $2E
    !A8
    bcc .D1E5

    lda.b obj.direction : eor #$01 : sta.b obj.direction
    bra .D1AE

.D1E5:
    dec $37
    bne .D1AE

    lda #$02 : sta $2D
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D455,X : sta $37
.D1F6:
    brk #$00

;----- D1F8

    dec $37
    bne .D1F6

    bra .D182

;-----

_D1FE:
    clc
    lda.w open_object_slots
    adc #$02
    cmp #$02
    bcc .D220

    stz $1EB7
    lda #!id_astaroth_nebiroth_body : ldx #$00 : ldy #$00 : jsl _018C55
    !A16
    stz $1EBB
    stz $1EBD
    !A8
    sec
.D220:
    rts

;-----

destroy:
    lda.b obj.hp
    beq .D24A

    ldx #$03 : jsl _028048
    jsl _02F9DA_F9E0
    ldy #$D2 : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- D23B

    ldy #$D0 : ldx #$21 : jsl set_sprite
    ldx $2D
    bne create_D1F6

    jmp create_D1AE

.D24A:
    lda $07
    bne .D251

    inc $1ED7
.D251:
    inc $1EB7
    lda #$04 : sta $1D
    ldx #$00 : ldy #$02 : lda #!id_explosion_spawner : jsl _018C55
    jsl _018E32_8E73
    lda $08 : ora #$10 : sta $08
    lda #$30 : cop #$00

;----- D270

    stz $08
    lda $07
    bne .D290

    stz $08
    stz $09
    lda #$20 : cop #$00

;----- D27E

    lda #!id_key : jsl prepare_object
    jsl _018049
    lda #$10 : jsl _018049_8053
    bra .D2A5

.D290:
    brk #$00

;----- D292

    lda $1EBF
    bne .D290

.D297:
    lda #$04 : sta $1D
    lda #!id_nebiroth : ldx #$00 : ldy #$00 : jsl _018C55
.D2A5:
    jml _0281A8_81B5

;-----

thing:
    !A16
    lda.b obj.pos_x+1 : sta $1EBB
    lda.b obj.pos_y+1 : sta $1EBD
    !A8
    ldx $3A
    jsr (.D2DC,X)
    lda $3A
    bne .D2C6

    jsl get_arthur_relative_side : sta.b obj.facing
.D2C6:
    jsl update_animation_normal
    jsl _02F9BA
    jsl _02F9B6
    jsl _02F9B2
    ldx $3B : jml _018E32

.D2DC: dw _D2E8, _D30D, _D320, _D332, _D345, _D34E

;-----

_D2E8:
    dec $31
    bne .D307

    lda $32
    bne .D308

    lda #$02 : sta $3A
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D465,X : sta $30
    jsl set_direction32 : inc : and #$1F : lsr : sta $39
.D307:
    rts

.D308:
    lda #$06 : sta $3A
    rts

;-----

_D30D:
    lda #$04 : sta $3A
    lda #!id_astaroth_flame : ldx $39 : ldy #$00 : jsl _018C55
    lda #$06 : sta $31
.D31F:
    rts

;-----

_D320:
    dec $31
    bne _D30D_D31F

    lda #$02 : sta $3A
    dec $30
    bne _D30D_D31F

    stz $3A
    inc $32
    bra _D34E_D356

;-----

_D332:
    lda #$08 : sta $3A
    lda #$08 : sta $31
    lda #!id_astaroth_laser : ldx #$00 : ldy #$00 : jsl _018C55
    rts

;-----

_D345:
    lda #$0A : sta $3A
    lda #$60 : sta $31
.D34D:
    rts

;-----

_D34E:
    dec $31
    bne _D345_D34D

    stz $3A
    stz $32
.D356:
    jsl get_rng_16 : stx $0000
    lda.w difficulty
    asl #4
    clc
    adc $0000
    tax
    lda.w astaroth_nebiroth_data_D485,X : sta $31
    rts
}

namespace off
