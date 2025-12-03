namespace samael_platform

{
create:
    ldy #$B6 : ldx #$21 : jsl set_sprite
    stz $13
    lda $07 : inc : sta $27
    stz.b obj.pos_y
.EC87:
    brk #$00

;----- EC89

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .EC87

    !A16
    lda #$0018 : sta $2D
    asl        : sta $2F
    !A8
    lda #$04 : sta.b obj.direction
    lda #$01 : sta $3B
.ECA7:
    brk #$00

;----- ECA9

    jsr _ED23
    ldx #$3C : jsl update_pos_xy_2
    jsr thing
    lda $28
    dec $3B
    bne .ECA7

    ldx $13
    lda.w samael_platform_data_D6C6+0,X : sta $3B
    lda.w samael_platform_data_D6C6+1,X
    ldy $07
    beq .ECCC

    eor #$FF
    inc
.ECCC:
    clc
    adc.b obj.direction
    and #$0F
    sta.b obj.direction
    txa
    inc #2
    sta $13
    cmp #$20
    bne .ECA7

    ldy #$BE : ldx #$21 : jsl set_sprite
    lda #$47 : jsl _018049_8053
.ECEA:
    brk #$00

;----- ECEC

    jsr _ED23
    jsr thing
    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .ECEA

;-----

destroy:
    stz $1EBF
    jml _0281A8_81B5

;-----

thing:
    lda $28
    beq .ED22

    !A16
    clc : lda $31 : adc.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
    clc : lda $33 : adc.b obj.pos_y+1 : sta.w !obj_arthur.pos_y+1
    clc :           adc $14D8        : sta $14DA
    !A8
.ED22:
    rts

;-----

_ED23:
    stz $28
    lda $1EBF
    beq .ED2E

    cmp $27
    bne .ED7A

.ED2E:
    !AX16
    lda.b obj.pos_x+1
    clc
    adc $2D
    sec
    sbc.w !obj_arthur.pos_x+1
    cmp $2F
    bcs .ED75

    lda.w !obj_arthur.pos_y+1
    clc
    adc #$0013
    sec
    sbc.b obj.pos_y+1
    cmp #$0008
    bcs .ED75

    eor #$FFFF
    inc
    adc.w !obj_arthur.pos_y+1
    sta.w !obj_arthur.pos_y+1
    lda.w !obj_arthur.pos_x+1 : sec : sbc.b obj.pos_x+1 : sta $31
    lda.w !obj_arthur.pos_y+1 : sec : sbc.b obj.pos_y+1 : sta $33
    !AX8
    lda #$80 : sta $14C3
    inc $28
    lda $27 : sta $1EBF
    rts

.ED75:
    !AX8
    stz $1EBF
.ED7A:
    rts
}

namespace off
