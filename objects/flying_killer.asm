namespace flying_killer

{
create:
    jsr pot_creation_local
    lda #$80 : sta $09
    ldy #$B0 : ldx #$21 : jsl set_sprite
    stz $30
    jsl set_hp
    jsl get_arthur_relative_side : sta.b obj.direction : sta.b obj.facing
    ldx #$28 : jsl _0196EF : sta $2F
    ldx #$7E : jsl _0196EF : sta $31
.D3A6:
    !A8
    brk #$00

;----- D3AA

    jsr _0281A8
    !A16
    clc
    lda.w !obj_arthur.pos_x+1
    adc $2F
    cmp.b obj.pos_x+1
    bcc .D3A6

    !A8
.D3BB:
    brk #$00

;----- D3BD

    jsr _0281A8
    !A16
    dec $22
    !A8
    dec $31
    bne .D3BB

    !AX8
    jsl _01918E_set_direction16 : sta.b obj.direction
    lda #$01 : sta.b obj.facing
    bra .D3EF

;-----

    ;unused code
    jsl get_arthur_relative_side
    beq .D3E0

    lda #$FF
.D3E0:
    eor #$FF
    and #$08
    sta.b obj.direction
    lsr #3
    sta.b obj.facing
    bra .D3EF

    stz.b obj.facing

;-----

.D3EF:
    ldy #$B2 : ldx #$21 : jsl set_sprite
    !AX8
.D3F9:
    brk #$00

;----- D3FB

    ldx #$14 : jsl update_pos_xy_2
    lda $09
    and #$40
    beq destroy_D428
    bra .D3F9

;-----

thing:
    ldy #$DA : jsr pot_spawn_offset_local
    jsl update_animation_normal
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jml _02FD62_FD7C

;-----

destroy:
    lda #$3B : jsl _018049_8053
    jsr drop_pot_local
    jmp _028BEC

;-----

.D428:
    jsr _028D09_local
    jmp _0281A8_81B5
}

namespace off
