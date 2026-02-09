namespace killer

{
create: ;a8 x8
    lda $07
    bne .BFB8

    inc $07
    stz $2D
    lda #$04 : sta $1D
.BF71:
    lda $2D
    asl #2
    tax
    !A16
    lda.w killer_data_D24D+0,X : sta.b obj.pos_x+1
    lda.w killer_data_D24D+2,X : sta.b obj.pos_y+1
    !A8
    inc $2D
    lda $2D
    cmp #$08
    bne .BF90

    jml _0281A8_81B5
.BF90:
    brk #$00

;----- BF92

    !A16
    lda.b obj.pos_x+1
    adc #$0020
    sbc.w camera_x+1
    cmp #$0140
    bcs .BF90

    lda.b obj.pos_y+1
    adc #$0020
    sbc.w camera_y+1
    cmp #$0140
    bcs .BF90

    !A8
    lda #$93 : jsl prepare_object
    bra .BF71

;----- BFB8

.BFB8:
    !A16
    lda #$0120 ;blue killer
    ldx.w stage
    cpx #$02
    bne +

    lda #$0160 ;fire killer
+:
    sta $29
    !A8
.BFCB:
    brk #$00

;----- BFCD

    ldy #$2C : jsl _0192AD
    bcs .BFCB

    jsl set_hp
    stz $002D ;zeroes 0x2D in zero page! must be a mistake...?
    ldy #$A0 : ldx #$21 : jsl set_sprite
    jsl pot_creation
.BFE8:
    brk #$00

;----- BFEA

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .BFE8

    ldy #$A4 : ldx #$21 : jsl set_sprite
    jsl _02F9DA_F9E0
    jsl get_rng_16
    lda.w killer_data_D225,X : sta $2F
.C009:
    ldy #$45 : jsl set_speed_y
    lda $2F ;leftover?
    lda #$0C : sta $30
.C015:
    brk #$00

;----- C017

    dec $30
    bne .C039

    lda #$0C : sta $30
    ldy #$A2
    ldx #$21
    lda $2E
    and #$01
    beq .C033

    ldy #$A4
    ldx #$21
    lda.b obj.facing : eor #$01 : sta.b obj.facing
.C033:
    jsl set_sprite
    inc $2E
.C039:
    lda.w frame_counter
    and #$0F
    bne +

    jsl get_rng_16
    sta.b obj.direction
+:
    ldx #$04
    jsl update_pos_xy_2
    jsl update_pos_y
    dec $2F
    bne .C015

    jsl get_arthur_relative_side
    sta.b obj.direction
    sta.b obj.facing
    ldy #$A2 : ldx #$21 : jsl set_sprite
    lda $2D : adc #$02 : and #$06 : sta $2D
    lda #$0C : jsl _0187E5
    jsl _019649
    ldx $2D
    and.w killer_data_D235,X
    !A8
    bne .C083

    inc.b obj.speed_x+1
    bra .C08A

.C083:
    jsr _C116_C124
    lda.b obj.speed_y+2
    bmi .C0A4

.C08A:
    brk #$00

;----- C08C

    bit $09
    bvc .C0C6

    jsl update_pos_xyg_sub
    lda.b obj.speed_y+2
    bpl .C08A

    ldy #$14
    jsl get_rng_bool
    beq .C0A2

    ldy #$1E
.C0A2:
    sty $2F
.C0A4:
    brk #$00

;----- C0A6

    bit $09
    bvc .C0C6

    jsl update_pos_xyg_sub
    dec $2F
    bne .C0A4

    ldy #$A4 : ldx #$21 : jsl set_sprite
    jsl get_rng_16
    lda.w killer_data_D23D,X : sta $2F
    jmp .C009

.C0C6:
    jsl _028D09
    jml _0281A8_81B5

;-----

destroy:
    lda $0F
    bmi .C0DA

    jsl drop_pot
    jml _028C22

.C0DA: ;killed by shield
    stz $29
    stz $2A
    jsl drop_pot
    jml _028BB9

;-----

thing:
    lda.w stage
    cmp #$08
    bne .C0FA

    !A16
    lda #$0540
    cmp.b obj.pos_y+1
    bcc +

    sta.b obj.pos_y+1
+:
    !A8
.C0FA:
    ldy #$80 : jsl pot_spawn_offset
    jsl update_animation_normal
    jsl _02F9FA
    jsl _02F9CA
    ldy #$0A : jsl _02F9CE
    jml _02F9B2

;-----

_C116:
    lda #$FE80 : sta.b obj.speed_y
    !A8
    dec.b obj.speed_y+2
    lda #$30 : sta $2F
    rts

.C124:
    stz $2F
    stz $0000
    !A16
    lda.b obj.pos_y+1
    sta $0001
    cmp.w !obj_arthur.pos_y+1
    bcs _C116

    !A8
    lda #$0E : jsl _0187E5
.C13D:
    inc $2F
    clc
    lda.b obj.speed_y   : adc.b obj.gravity  : sta.b obj.speed_y
    !A16
    lda.b obj.speed_y+1 : adc #$0000         : sta.b obj.speed_y+1
    clc
    lda $0000          : adc.b obj.speed_y   : sta $0000
    !A8
    lda $0002          : adc.b obj.speed_y+2 : sta $0002
    !A16
    lda $0001
    cmp.w !obj_arthur.pos_y+1
    !A8
    bcc .C13D

    jsl get_arthur_relative_side : sta.b obj.direction
    !A16
    bne .C180

    sec
    lda.w !obj_arthur.pos_x+1
    sbc.b obj.pos_x+1
    bne .C186 ;supposed to be bra?

.C180:
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1

.C186:
    stz $0000
    sta $0001
    beq .C1B3

    ldy $2F
    jsl _018A7E
    sta.b obj.speed_x+1
    sty $0001
    lda $0001
    ldy $2F
    jsl _018A7E
    clc
    adc.b obj.speed_x
    sta.b obj.speed_x
    lda.b obj.speed_x+1
    cmp #$0003
    bcc .C1B3

    lda #$0003
    sta.b obj.speed_x+1
.C1B3:
    !A8
    rts
}

namespace off
