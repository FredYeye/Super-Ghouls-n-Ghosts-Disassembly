namespace nebiroth_laser

{
create:
    inc $1EBF
    lda.b obj.direction : sta.b obj.facing
    ldy #$F2 : ldx #$21 : jsl set_sprite
    lda #$08 : sta $37
    jsr .D89C
.D848:
    brk #$00

;----- D84A

    jsl update_animation_normal
    dec $37
    bne .D848

    lda #$10 : cop #$00

;----- D856

    jsr .D89C
    jsl _02F9DA_F9E0
    ldy #$08 : ldx #$22 : jsl set_sprite
    ldy #$75 : jsl set_speed_x
    lda #$58 : jsl _018049_8053
.D871:
    brk #$00

;----- D873

    lda $25
    cmp $0F
    beq .D87F

    sta $0F
    jsl update_pos_x
.D87F:
    lda $25
    cmp #$08
    bne .D871

    ldy #$6F : jsl set_speed_x
.D88B:
    brk #$00

;----- D88D

    jsl update_pos_x
    bit $09
    bvs .D88B

    dec $1EBF
    jml _0281A8_81B5

;-----

.D89C:
    clc
    !A16
    lda.b obj.pos_y+1 : adc #$000B : sta.b obj.pos_y+1
    !A8
    rts

;-----

;unused, not sure what it's meant to do
    clc
    !A16
    lda.b obj.pos_x+1 : adc #$0008 : sta.b obj.pos_y+1
    !A8
    rts

;-----

thing:
    jsl update_animation_normal
    clc : lda $25 : adc #$10 : sta $3C
    jml _02FD62
}

namespace off
