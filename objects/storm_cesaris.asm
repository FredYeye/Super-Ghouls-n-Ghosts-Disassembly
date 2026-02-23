namespace storm_cesaris

{
create:
    lda $07
    cmp #$0D
    beq .929C

    jmp .92DA

.929C:
    brk #$00

;----- 929E

    jsr _947F
    lda #$18 : jsl _0195E4
    bcc .929C

    !X16
    jsr _028B1E_8B24
    lda #!id_storm_cesaris : jsr .92C8
.92B3:
    jsr _028B1E_8B24
    lda #!id_storm_cesaris_parts : jsr .92C8
    bne .92B3

    !X8
    lda #!mus_stage_2_boss : jsl _018049_8053
    jmp _0281A8_81B5

;-----

.92C8:
    !A8
    sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    dec $07
    lda $07 : sta $0007,X
    rts

;-----

.92DA:
    lda #$01 : sta.b obj.facing : sta $37
    jsl set_hp : sta $1EBA
    stz.b obj.pos_x
    lda #$04 : sta $1D
    !A16
    lda #$15B0 : sta.b obj.pos_x+1 : sta $1EBB
    lda #$0340 : sta.b obj.pos_y+1 : sta $1EBD
    lda #$1400 : sta.w screen_boundary_left
    !A8
    inc.b obj.direction
    inc.b obj.facing
    stz $3A
    ldy #$EE : ldx #$21 : jsl set_sprite
.9315:
    brk #$00

;----- 9317

    jsr _947F
    !A16
    lda.w camera_x+1
    cmp #$1440
    !A8
    bcc .9315

    ldy #$27 : jsl set_speed_y
.932C:
    brk #$00

;----- 932E

    jsl update_animation_normal
    jsl update_pos_y
    jsr _947F
    !A16
    lda.b obj.pos_x+1 : sta $1EBB
    lda.b obj.pos_y+1 : sta $1EBD
    lda #$0280
    cmp $22
    !A8
    bcc .932C

    ldx #$08 : jsr _028000_local
    stz $0C
    inc $1EB9
    jsl get_rng_bool
    stz $35
    sta $36 ;store direction bool
    lda #$40
.9362:
    sta $3B
    jsl _02F9DA_F9E0
    lda #$02 : sta $3A
.936C:
    brk #$00

;----- 936E

    dec $3B
    bne .936C

    jsr _946E
    lda #$02 : sta $3A
    ldy #$39 : jsl set_speed_y
    lda $36 : sta.b obj.direction
    jsl get_rng_16
    lda.w storm_cesaris_data_BFE9,X : sta $3B
.938C:
    brk #$00

;----- 938E

    dec $34
    bne .93A5

    lda #$35 : jsl _018049_8053
    lda #$03 : sta $07
    lda.b #!id_storm_cesaris_projectile : jsl prepare_object
    jsr _946E
.93A5:
    lda.b obj.pos_y+1
    sec
    sbc #$50
    cmp #$60
    !A8
    bcc .93B8

    lda.b obj.direction : eor #$01 : sta.b obj.direction : sta $36
.93B8:
    jsl _01884B_8876
    dec $3B
    bne .938C

    lda #$03 : sta $3A
    lda #$40 : sta $3B
.93C8:
    brk #$00

;----- 93CA

    dec $3B
    bne .93C8

    lda #$04 : sta $3A
    jsl get_rng_16
    lda.w storm_cesaris_data_BFF9,X : sta $3B
    ldy #$2D : jsl set_speed_x
    lda $35 : sta.b obj.direction
.93E5:
    brk #$00

;----- 93E7

    !A16
    lda.b obj.pos_x+1
    sec
    sbc #$14B0
    cmp #$0100
    !A8
    bcc .93FE

    lda.b obj.direction : eor #$01 : sta.b obj.direction : sta $35
.93FE:
    jsl update_pos_x
    dec $3B
    bne .93E5

    lda #$20
    jmp .9362

;-----

destroy:
    lda.b obj.hp : sta $1EBA
    bne .944A

    lda #!sfx_death : jsl _018049_8053
    ldy #$EC : ldx #$21 : jsl set_sprite
.9420:
    brk #$00

;----- 9422

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .9420

    stz $08
    stz $09
    lda #$C8 : cop #$00

;----- 9434

    inc $1ED7
    lda #$59 : jsl prepare_object
    jsl _018049
    lda #$10 : jsl _018049_8053
    jmp _0281A8_81B5

.944A:
    jsl _02F9DA_F9E0
    ldx #$03 : jsr _028048_local
    lda #$08 : sta $24
.9457:
    brk #$00

;----- 9459

    dec $24
    bne .9457

    lda $3A : asl : tax
    jmp (+,X) : +: dw create_932C, create_936C, create_938C, create_93C8, create_93E5

;-----

_946E:
    jsl get_rng_16
    lda.w storm_cesaris_data_C009,X
    ldx.w difficulty
    clc
    adc.w storm_cesaris_data_C018,X
    sta $34
    rts

;-----

_947F:
    !A16
    lda.b obj.pos_y+1 : sta $1EBD
    lda.b obj.pos_x+1 : sta $1EBB
    cmp.w !obj_arthur.pos_x+1
    bcs .9493

    sta.w !obj_arthur.pos_x+1
.9493:
    !A8
    rts

;-----

thing:
    lda $37
    beq .94B4

    !A16
    lda.w camera_x+1
    clc
    adc #$0130
    cmp.b obj.pos_x+1
    bcs .94A9

    sta.b obj.pos_x+1
.94A9:
    !A8
    jsr _947F
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
.94B4:
    jmp _02FD62_FD7C
}

namespace off
