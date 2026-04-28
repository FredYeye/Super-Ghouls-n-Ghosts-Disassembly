namespace veil_allocen_claws

{
claw1_create:
    lda #$80 : sta $09
    !A16
    lda.w _00ED00+$6C : sta $27
    lda #$0120 : sta $29
    !A8
    lda #$FF : sta $26
.E564:
    stz $1EBF
.E567:
    brk #$00

;----- E569

    lda $1EC1
    beq .E567

    jsl set_direction32 : sta.b obj.direction
    inc $1EBF
    ldy #$3A : ldx #$22
    lda.b obj.facing
    bne .E583

    ldy #$3E : ldx #$22
.E583:
    jsl set_sprite
    jsr _E5C1
.E58A:
    brk #$00

;----- E58C

    ldx #$54 : jsl update_pos_xy_2
    jsr _E5B3
    dec $2D
    bne .E58A

    lda.b obj.direction : eor #$10 : sta.b obj.direction
.E59F:
    brk #$00

;----- E5A1

    ldx #$54 : jsl update_pos_xy_2
    jsr _E5B3
    dec $2E
    bne .E59F

    stz $1EC1
    bra .E564

;-----

_E5B3:
    lda.w frame_counter
    and #$0F
    bne .E5C0

    lda #$67 : jsl _018049_8053
.E5C0:
    rts

;-----

_E5C1:
    !A16
    sec
    lda.b obj.pos_y+1
    sbc.w !obj_arthur.pos_y+1
    bpl .E5D2

    eor #$FFFF
    inc
    sta $0000
.E5D2:
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    bpl .E5DE

    eor #$FFFF
    inc
.E5DE:
    cmp $0000
    bcs .E5E6

    lda $0000
.E5E6:
    clc
    adc #$0000
    lsr
    !A8
    sta $2D
    sta $2E
    rts

;-----

claw1_thing:
    lda $1EBF
    bne .E601

    ldy #$00 : jsr _E65E
    jsr _E62E
    bra .E609

.E601:
    jsl _02F9B2
    jsl _02F9C2
.E609:
    lda $08
    and #$F8
    ldx.b obj.facing
    bne .E613

    ora #$01
.E613:
    sta $08
    jsr _E734
    jsl update_animation_normal
    jsl _018E32_8E73
    rtl

;-----

_E621:
    !X16
    ldx $1EB7
    lda.w obj.facing,X : sta.b obj.facing
    !X8
    rts

;-----

_E62E:
    jsr _E621
    ldy #$3C : ldx #$22
    lda.b obj.facing
    beq .E63D

    ldy #$38 : ldx #$22
.E63D:
    jsl set_sprite
    rts

;-----

claw2_destroy:
    jsr _E720
    bra claw1_destroy_E64A

;-----

claw1_destroy:
    jsr _E62E
.E64A:
    ldy #$40 : jsl set_speed_xyg
.E650:
    brk #$00

;----- E652

    jsl update_pos_xyg_add
    bit $09
    bvs .E650

    jml _0281A8_81B5

;-----

_E65E:
    !AX16
    ldx $1EB7
    lda.w obj.facing,X
    and #$00FF
    beq .E671

    clc
    tya
    adc #$0008
    tay
.E671:
    clc : lda.w obj.pos_x+1,X : adc.w veil_allocen_data_D628+0,Y : sta.b obj.pos_x+1
    clc : lda.w obj.pos_y+1,X : adc.w veil_allocen_data_D628+2,Y : sta.b obj.pos_y+1
    !AX8
    rts

;-----

claw2_create:
    lda #$80 : sta $09
    !A16
    lda.w _00ED00+$6C : sta $27
    lda #$0100 : sta $29
    !A8
    lda #$FF : sta $26
.E69C:
    stz $1EC0
.E69F:
    brk #$00

;----- E6A1

    lda $1EC2
    beq .E69F

    lda #$67 : jsl _018049_8053
    jsl set_direction32 : sta.b obj.direction
    inc $1EC0
    ldy #$3A : ldx #$22
    lda.b obj.facing
    beq .E6C1

    ldy #$3E : ldx #$22
.E6C1:
    jsl set_sprite
    jsr _E5C1
.E6C8:
    brk #$00

;----- E6CA

    ldx #$54 : jsl update_pos_xy_2
    jsr _E5B3
    dec $2D
    bne .E6C8

    lda.b obj.direction : eor #$10 : sta.b obj.direction
.E6DD:
    brk #$00

;----- E6DF

    ldx #$54 : jsl update_pos_xy_2
    jsr _E5B3
    dec $2E
    bne .E6DD

    stz $1EC2
    bra .E69C

;-----

claw2_thing:
    lda $1EC0
    bne .E700

    ldy #$04 : jsr _E65E
    jsr _E720
    bra .E708

.E700:
    jsl _02F9B2
    jsl _02F9C2
.E708:
    lda $08
    and #$F8
    ldx.b obj.facing
    beq .E712

    ora #$01
.E712:
    sta $08
    jsl update_animation_normal
    jsl _018E32_8E73
    jsr _E734
    rtl

;-----

_E720:
    jsr _E621
    ldy #$38 : ldx #$22
    lda.b obj.facing
    beq .E72F

    ldy #$3C : ldx #$22
.E72F:
    jsl set_sprite
    rts

;-----

_E734:
    lda.w skip_tick_timer
    beq .E743

    lda $09 : and #$7F : sta $09
    lda #$8C : sta.b obj.active
.E743:
    rts
}

namespace off
