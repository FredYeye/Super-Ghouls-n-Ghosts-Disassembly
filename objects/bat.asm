namespace bat

{
create:
    jsr pot_creation_local
    inc.w bat_count
    ldx #$76 : jsl _0196EF
    beq .EAE1

    stz.b obj.facing
    !A16
    lda.w camera_x+1 : clc : adc #$0110 : sta.b obj.pos_x+1
    !A8
    bra .EAF2

.EAE1:
    lda #$01 : sta.b obj.facing
    !A16
    lda.w camera_x+1 : clc : adc #$0002 : sta.b obj.pos_x+1
    !A8
.EAF2:
    ldx #$78 : jsl _0196EF
    clc
    adc.w camera_y+1
    sta.b obj.pos_y+1
    lda #$00 : adc.w camera_y+2 : sta.b obj.pos_y+2
    ldy #$EE : ldx #$21 : jsl set_sprite
    sta $09
    lda #$80 : sta $09
    jsl set_direction32 : sta.b obj.direction
    jsl set_hp
.EB1D:
    !A8
    brk #$00

;----- EB21

    ldx #$46 : jsl update_pos_xy_2
    !A16
    lda $09
    and #$0040
    bne .EB1D

    !A8
    dec.w bat_count
    jsr _028D09_local
    jmp _0281A8_81B5

;-----

thing:
    ldy #$86 : jsr pot_spawn_offset_local
    jsl update_animation_normal
    jsr _02FA37_FA6D
    jsr _02FB62_FB69
    jsr _02FD62_FD7C
    rts

;-----

destroy:
    dec.w bat_count
    jsr drop_pot_local
    jmp _028BEC
}

namespace off
