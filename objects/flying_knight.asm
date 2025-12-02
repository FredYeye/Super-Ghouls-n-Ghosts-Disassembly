namespace flying_knight

{
_9DA9:
    !A16
    lda.b obj.pos_x+1
    adc #$00C0
    sbc.w camera_x+1
    cmp #$0280
    bcs .9DC3

    lda.b obj.pos_y+1
    adc #$0030
    sbc.w camera_y+1
    cmp #$0160
.9DC3:
    !A8
    rts

;-----

create:
    lda #$02 ;unused lda
    jsr pot_creation_local
    lda $07 : asl : tax
    !A16
    lda.w flying_knight_data_C175,X : clc : adc.w camera_x+1 : sta.b obj.pos_x+1
    lda.w camera_y+1 : adc #$00A0 : sta.b obj.pos_y+1
    !A8
    ldy #$2B : jsl set_speed_xyg
.9DEA:
    brk #$00

;----- 9DEC

    jsr _9DA9
    bcc .9DF4

    jmp _0281A8_81B5

.9DF4:
    jsl update_pos_x
    bit $09
    bvc .9DEA

    jsl _02F9DA_F9E0
    lda #$03 : sta $30
    ldy #$A2 : ldx #$21 : jsl set_sprite
.9E0C:
    lda #$46 : jsl _018049_8053
    jsr _9EC1

.9E15:
    brk #$00

;----- 9E17

    jsl update_pos_xyg_sub
    dec $31
    dec $2F
    bne .9E15

    ldy #$A0 : ldx #$21 : jsl set_sprite
.9E29:
    brk #$00

;----- 9E2B

    jsl update_pos_xyg_sub
    dec $31
    bne .9E29

    lda $32 : sta $31
.9E37:
    brk #$00

;----- 9E39

    jsl update_pos_xyg_add
    dec $31
    lda $31
    cmp #$03
    bne .9E37

    ldy #$A2 : ldx #$21 : jsl set_sprite
.9E4D:
    brk #$00

;----- 9E4F

    jsl update_pos_xyg_add
    dec $31
    bne .9E4D

    jsr _9EC1
.9E5A:
    brk #$00

;----- 9E5C

    jsl update_pos_xyg_add
    dec $31
    dec $2F
    bne .9E5A

    ldy #$A4 : ldx #$21 : jsl set_sprite
.9E6E:
    brk #$00

;----- 9E70

    jsl update_pos_xyg_add
    dec $31
    bne .9E6E

    lda $32 : sta $31
.9E7C:
    brk #$00

;----- 9E7E

    jsl update_pos_xyg_sub
    dec $31
    lda $31
    cmp #$03
    bne .9E7C

    ldy #$A2 : ldx #$21 : jsl set_sprite
.9E92:
    brk #$00

;----- 9E94

    jsl update_pos_xyg_sub
    dec $31
    bne .9E92

    jmp .9E0C

;-----

destroy:
    jsr drop_pot_local
    jmp _028BEC

;-----

thing:
    bit $09
    bvc .9EBB

    ldy #$84 : jsr pot_spawn_offset_local
    jsl update_animation_normal
    jsr _02FBF9
    jsr _02F9FA_F9FE
    jmp _02FD62_FD7C

.9EBB:
    jsr _028D09_local
    jmp _0281BB

;-----

_9EC1:
    lda #$03 : sta $2F
    lda $30 : inc : and #$03 : sta $30
    lda #$1A : sta $32 : sta $31
    rts
}

namespace off
