namespace conveyor_belt

{
create:
    lda $07 : lsr : and #$01 : clc : adc #$0E : sta $3C
    lda $07
    and #$01
    sta.b obj.facing
    asl
    tax
    lda.w conveyor_belt_data_D54D+1,X : sta.b obj.speed_x+2
    !A16
    lda.w conveyor_belt_data_D54D+0,X : sta.b obj.speed_x+0
    !A8
    lda $07
    and #$02
    tax
    lda.w conveyor_belt_data_D545+0,X : sta $2D
    dec #2
    sta $2F
    stz $30
    asl
    sta $31
    stz $32
    lda.w conveyor_belt_data_D545+1,X : sta $2E
    ldy.w conveyor_belt_data_D549+0,X
    lda.w conveyor_belt_data_D549+1,X
    tax
    jsl set_sprite
    jsl _02F9DA_F9E0
    lda $07
    cmp #$08
    bcs .D95C

    cmp #$04
    bcs .D922

.D918:
    brk #$00

;----- D91A

    jsr _D9CB
    jsr _DA65
    bra .D918

.D922:
    lda #$80 : sta $37
    ldy #$3F : jsl set_speed_y
.D92C:
    brk #$00

;----- D92E

    jsr _D9CB
    jsl _01884B_8876
    jsr _D9CB_D9CD
    jsr _DA65
    dec $37
    beq .D944

    jsr _D998_D9B3
    bra .D92C

.D944:
    lda #$28 : sta $37
.D948:
    brk #$00

;----- D94A

    jsr _D9CB
    jsr _DA65
    dec $37
    bne .D948

    lda.b obj.direction : eor #$01 : sta.b obj.direction
    bra .D92C

.D95C:
    brk #$00

;----- D95E

    jsr _D9CB
    jsr _DA65
    lda $3A
    beq .D95C

    lda #$20 : jsl _0187E5
.D96E:
    brk #$00

;----- D970

    jsr _D9CB
    jsl update_pos_xyg_add
    jsl _018911
    jsr _D9CB_D9CD
    jsr _DA65
    jsr _D998
    bit $09
    bvs .D96E

    jml _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _02FD62_FD66
    jml _028156

;-----

_D998:
    lda $3A
    beq .D9CA

    !A16
    lda #$04E0
    cmp.w !obj_arthur.pos_y+1
    bcs .D9B9

    sta.w !obj_arthur.pos_y+1
    clc
    adc $14D8
    sta $14DA
    !A8
    rts

.D9B3:
    lda $3A
    beq .D9CA

    !A16
.D9B9:
    lda.b obj.pos_y+1
    clc
    adc $27
    sta.w !obj_arthur.pos_y+1
    clc
    adc $14D8
    sta $14DA
    !A8
.D9CA:
    rts

;-----

_D9CB:
    stz $3A
.D9CD:
    bit $09
    bvc .DA32

    lda $2D : sta $1F1D
    asl : sta $1F1F
    lda $2E : sta $1F21 : dec $1F21
    asl : sta $1F23
    !AX16
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .DA62

    sec
    lda.b obj.pos_y+1
    sbc.w !obj_arthur.pos_y+1
    clc
    adc $1F21
    cmp $1F23
    bcs .DA62

    lda.b obj.pos_y+1
    cmp.w !obj_arthur.pos_y+1
    bcs .DA33

    adc $1F21
    sta.w !obj_arthur.pos_y+1
    lda.w !obj_arthur.speed_y
    bmi .DA1D

    cmp #$0080
    bcs .DA23

.DA1D:
    lda #$0080 : sta.w !obj_arthur.speed_y
.DA23:
    clc
    lda.w !obj_arthur.pos_y+1 : adc $14D8 : sta $14DA
    !AX8
    stz.w !obj_arthur.speed_y+2
.DA32:
    rts

.DA33:
    sbc $1F21
    cmp.w !obj_arthur.pos_y+1
    beq .DA4C

    tax
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    clc
    adc $2F
    cmp $31
    bcs .DA62

    stx.w !obj_arthur.pos_y+1
.DA4C:
    lda.w !obj_arthur.pos_y+1
    sec
    sbc.b obj.pos_y+1
    sta $27
    clc
    lda.w !obj_arthur.pos_y+1
    adc $14D8
    sta $14DA
    !AX8
    inc $3A
.DA62:
    !AX8
    rts

;-----

_DA65:
    lda $3A
    beq .DA98

    clc
    lda.b obj.speed_x+0 : adc.w !obj_arthur.pos_x+0 : sta.w !obj_arthur.pos_x+0
    lda.b obj.speed_x+1 : adc.w !obj_arthur.pos_x+1 : sta.w !obj_arthur.pos_x+1
    lda.b obj.speed_x+2 : adc.w !obj_arthur.pos_x+2 : sta.w !obj_arthur.pos_x+2
    !A16
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    !A8
    bcs .DA99

    inc $14C3
.DA98:
    rts

.DA99:
    stz.w !obj_arthur.speed_x+0
    stz.w !obj_arthur.speed_x+1
    rts
}

namespace off
