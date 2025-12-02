namespace moving_platform

{
create:
    inc $08
    lda $07 : lsr : tax
    lda.w moving_platform_data_D001,X : sta $09
    ldx $07
    !A16
    stz $27
    lda.w moving_platform_data_D0BB,X : sta $2D
    asl                               : sta $2F
    !A8
    ldy.w moving_platform_data_D0CF+0,X : lda.w moving_platform_data_D0CF+1,X : tax : jsl set_sprite
    ldx $07
    jmp (+,X) : +: dw .AB82, .AB82, .AB82, .ABD5, .ABD5, .ABD5, .ABC7, .ABC7

;-----

.AB82: ;stage 4b, appearing platforms?
    lda $08 : and #$F7 : sta $08
.AB88:
    brk #$00

;----- AB8A

    ldy #$24 : jsl _0192AD
    bcs .AB88

    lda #$20 : cop #$00

;----- AB96

    lda $08 : ora #$08 : sta $08
.AB9C:
    brk #$00

;----- AB9E

    jsl update_animation_normal
    lda $25
    beq .AB9C

    jsl _02F9DA_F9E0
.ABAA:
    brk #$00

;----- ABAC

    lda $27
    beq .ABAA

    ldx.w difficulty
    lda.w moving_platform_data_D009,X : cop #$00

;----- ABB8

.ABB8:
    brk #$00

;----- ABBA

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .ABB8

    jmp destroy

;-----

.ABC7: ;tower platforms
    !A16
    lda.b obj.pos_x+1 : sta $35
    lda.b obj.pos_y+1 : sta $37
    !A8
    bra .ABD7

.ABD5:
    inc.b obj.direction
.ABD7:
    lda $07
    sec
    sbc #$06
    tax
    !A16
    lda.w moving_platform_data_D00D,X : sta $13 ;not used for physics
    !A8
    jsr _AD20
.ABE9:
    brk #$00

;----- ABEB

    lda.w !obj_arthur.speed_y+2
    bmi .ABE9

    jsl thing
    lda $27
    beq .ABE9

    lda $07 : lsr : dec #2 : sta $0087
.AC00:
    brk #$00

;----- AC02

    lda.w stage
    cmp #$02
    bne .AC0D

    bit $09
    bvc _AC5E

.AC0D:
    jsl thing
    jsl update_pos_xy
    !A16
    lda.b obj.pos_x+1 : sta $02D1 : sta $1F33
    lda.b obj.pos_y+1 : sta $02D3 : sta $1F35
    jsr _ACC1
    !A16
    dec $3B
    !A8
    bne .AC00

    jsr _AD20
    bpl .AC00

    lda $07
    cmp #$0C
    bcs _AC5E_AC75

    ;stage 4b platforms melting
    inc $0088
.AC40:
    brk #$00

;----- AC42

    jsl update_animation_normal
    ldx $25
    lda.w moving_platform_data_D0CB,X : sta $2D
    asl         : sta $2F
    jsl thing
    lda $24
    cmp #$70
    bne .AC40

;-----

destroy:
    jml _0281A8_81B5

;-----

_AC5E:
    !A16
    lda $35 : sta.b obj.pos_x+1
    lda $37 : sta.b obj.pos_y+1
    !A8
    stz $08
.AC6C:
    brk #$00

;----- AC6E

    bit $09
    bvs .AC6C

    jmp create

;-----

.AC75:
    lda #$10 : sta $3B
.AC79:
    brk #$00

;----- AC7B

    jsl thing
    dec $3B
    bne .AC79

    !A16
    lda.b obj.pos_x+1 : sta.b obj.speed_x+1
    lda.b obj.pos_y+1 : sta.b obj.speed_y+1
    !A8
    lda #$30 : sta $3B
.AC93:
    brk #$00

;----- AC95

    jsl thing
    jsl skulls__CB0F ;shaking
    jsr _ACC1
    dec $3B
    bne .AC93

    lda #$28 : jsl _0187E5
.ACAA:
    brk #$00

;----- ACAC

    jsl thing
    jsl update_pos_xyg_add
    jsl _018911
    jsr _ACC1
    bit $09
    bvs .ACAA

    bra destroy

;-----

_ACC1:
    lda $27
    beq .ACD9

    !A16
    clc : lda $31 : adc.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
    clc : lda $33 : adc.b obj.pos_y+1 : sta.w !obj_arthur.pos_y+1
    !A8
.ACD9:
    rts

;-----

thing:
    stz $27
    !AX16
    lda.b obj.pos_x+1
    clc
    adc $2D
    sec
    sbc.w !obj_arthur.pos_x+1
    cmp $2F
    bcs .AD1D

    lda.w !obj_arthur.pos_y+1
    clc
    adc #$0017
    sec
    sbc.b obj.pos_y+1
    cmp #$0008
    bcs .AD1D

    eor #$FFFF
    inc
    adc.w !obj_arthur.pos_y+1
    sta.w !obj_arthur.pos_y+1
    lda.w !obj_arthur.pos_x+1 : sec : sbc.b obj.pos_x+1 : sta $31
    lda.w !obj_arthur.pos_y+1 : sec : sbc.b obj.pos_y+1 : sta $33
    !AX8
    lda #$80 : sta $14C3
    inc $27
.AD1D:
    !AX8
    rtl

;-----

_AD20:
    !AX16
    ldx $13
    lda $0001,X : sta $3B
    !A8
    lda $0000,X
    bmi .AD4D

    !A16
    and #$00FF
    tay
    lda.w moving_platform_data_D07F+0,Y : sta.b obj.speed_x
    lda.w moving_platform_data_D07F+2,Y : sta.b obj.speed_x+2
    lda.w moving_platform_data_D07F+4,Y : sta.b obj.speed_y+1
    inx #3
    stx $13
    lda #$0000
.AD4D:
    !AX8
    rts
}

namespace off
