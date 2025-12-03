namespace mimic

{
create:
    ldx #$03 : jsl _018D5B
    jsl set_hp
    lda.w stage
    cmp #$08
    bne .F427

    clc
    lda.b obj.hp : sta.b obj.hp ;does nothing. maybe stage 7 mimics were meant to have more hp at some point?
.F427:
    ldy #$F4 : ldx #$21 : jsl set_sprite
    lda #$D0 : sta $09
    !A16
    lda.w _00ED00+$4A : sta $27
    lda.w #mimic_data_CEC3 : sta $13
    !A8
    lda #$04 : sta $1D
    lda #$FF : sta $26
    jsr _F53A
.F44C:
    brk #$00

;----- F44E

    ldy #$18 : jsl _0192AD
    bcs .F44C

.F456:
    lda.w stage
    dec
    beq .F477

    ;stage 7
.F45C:
    !A8
    brk #$00

;----- F460

    !A16
    clc
    lda.w camera_y+1
    adc #$0080
    sec
    sbc.b obj.pos_y+1
    clc
    adc #$00C0
    cmp #$0180
    bcs .F45C

    sep #$20

.F477:
    lda #!sfx_mimic_shake : jsl _018049_8053
    ldy #$F6 : ldx #$21 : jsl set_sprite
    lda #$40 : cop #$00

;----- F489

    lda #!sfx_mimic_jump : jsl _018049_8053
    ldy #$F8 : ldx #$21 : jsl set_sprite
    ldy #$13 : jsl set_speed_xyg
.F49D:
    brk #$00

;----- F49F

    jsr .F4EF
    beq .F49D

    lda #$02 : sta $0F
    lda.b obj.facing : asl ;does nothing
    ldy #$FA : ldx #$21 : jsl set_sprite_8482
    lda #$04 : sta $2E
.F4B7:
    ldy #$1D : jsl set_speed_xyg
.F4BD:
    brk #$00

;----- F4BF

    jsr .F4EF
    beq .F4BD

    dec $2E
    bne .F4B7

    bit $09
    bvc .F4D2

    lda #!id_mimic_ghost : jsl prepare_object
.F4D2:
    stz $0F
    ldy #$00 : ldx #$22 : jsl set_sprite
    lda #$3F : cop #$00

;----- F4E0

    ldy #$F4 : ldx #$21 : jsl set_sprite_8482
    lda #$78 : cop #$00

;----- F4EC

    jmp .F456

;-----

.F4EF:
    jsl update_pos_xyg_add
    lda.b obj.speed_y+2
    bmi .F4FC

    jsl _01A559
    rts

.F4FC:
    lda #$00
    rts

;-----

thing:
    jsl get_arthur_relative_side : sta.b obj.facing
    jsl update_animation_normal
    ldx $3C : jsl _018E32
    jsr _02FD62_FD7C
    ldx $0F
    jsr (.F52F,X)
    lda.w camera_x+2
    beq .F52E

    !A16
    sec
    lda.w camera_x+1
    sbc #$00A0
    cmp.b obj.pos_x+1
    !A8
    bcc .F52E

    jmp _0281BB

.F52E:
    rts

.F52F: dw _02FB9C_FBC0, .F533

;-----

.F533:
    jsr _02FC0E
    jsr _02F9FA_F9FE
    rts

;-----

_F53A: ;also used by mimic_ghost
    ldx.w stage
    lda.w mimic_data_CEC7,X : sta $3C
    rts
}

namespace off
