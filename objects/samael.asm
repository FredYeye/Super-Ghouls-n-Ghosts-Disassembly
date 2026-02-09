namespace samael

{
create:
    lda #$03 : sta $08
    ldx $07
    jmp (+,X) : +: dw .E840, .E9B4, .E9FC, .E9F8, .EA33, .EA2D, .EA82, .EA7C, .EAB8

;-----

.E840:
    jsl set_hp
    ldx #$20 : jsl _028000
    lda #$FF : sta $19DC : sta $19DD
    lda #$D2 : sta $1D
    stz $35
    !A16
    lda #$0100 : sta.b obj.pos_x+1 : sta $1EB9
    lda #$010C : sta.b obj.pos_y+1 : sta $1EBB
    !A8
    stz $37
    lda #$0E : sta $38
    stz $1EBE
    jsl get_rng_bool
    sta.b obj.direction
    sta $39
    stz $3A
    sta $1EBD
    ldy #$AA : ldx #$21 : jsl set_sprite
    lda #$B4 : sta $3B
    stz $36
.E890:
    brk #$00

;----- E892

    jsl thing_EC0E
    dec $3B
    bne .E890

    jsl _02F9DA_F9E0
    ldy #$78 : jsl set_speed_x
.E8A4:
    stz $36
    jsl get_rng_16
    lda.w samael_data_D671,X : sta $3B
.E8AF:
    brk #$00

;----- E8B1

    jsr _EBDB
    lda $37
    cmp $1EBE
    beq .E8AF

    tax
    sta $1EBE
    jsr (.E8C4,X)
    bra .E8AF

.E8C4: dw .E8D0, .E8D4, .E8D5, .E8D4, .E8DB, .E8E0

;-----

.E8D0:
    dec $3B
    beq .E903

.E8D4:
    rts

;-----

.E8D5:
    lda #$39 : jsl _018049_8053
.E8DB:
    jsl update_pos_x
    rts

;-----

.E8E0:
    lda #$39 : jsl _018049_8053
    !A16
    lda.b obj.pos_x+1
    sec
    sbc #$0080
    cmp #$0100
    !A8
    bcc .E902

    lda.b obj.direction : eor #$01 : sta.b obj.direction : sta $1EBD
    pla : pla
    bra .E8AF

.E902:
    rts

.E903:
    pla : pla
    lda #$02 : sta $36 : sta $1EB8
    jsl get_rng_16
    lda.w samael_data_D682,X
    ldx.w difficulty
    clc
    adc.w samael_data_D692,X
    sta $3B
.E91C:
    brk #$00

;----- E91E

    dec $3B
    bne .E91C

    lda #$04 : sta $36 : sta $1EB8
    stz $3B
    lda #!id_samael_laser : ldx #$00 : ldy #$02 : jsl _018C55
    jsl get_rng_bool
    ldx #$00
    ldy #$01
    dec
    beq .E94B

    lda.w difficulty
    cmp #$02
    bcc .E94B

    ldx #$08
    ldy #$FF
.E94B:
    stx $33
    sty $34
.E94F:
    ldy #$AC : ldx #$21 : jsl set_sprite
.E957:
    ldx.w difficulty
    lda.w samael_data_D696,X : cop #$00

;----- E95F

    lda #!id_samael_laser : ldx $33 : ldy #$00 : jsl _018C55
    clc : lda $33 : adc $34 : and #$0F : sta $33
    inc $3B
    lda $3B
    cmp #$10
    bne .E957

    stz $1EB8
    lda #$06 : sta $36
    ldx.w difficulty
    lda.w samael_data_D69A,X : sta $3B
.E989:
    brk #$00

;----- E98B

    dec $3B
    bne .E989

    jsl get_rng_bool
    inc $3A
    sta.b obj.direction
    sta $1EBD
    cmp $39
    bne .E9B1

    lda $3A
    cmp #$03
    bne .E9B1

    lda $39 : eor #$01 : sta.b obj.direction : sta $1EBD : sta $39
    stz $3A
.E9B1:
    jmp .E8A4

;-----

.E9B4:
    lda #$D0 : sta $1D
.E9B8:
    brk #$00

;----- E9BA

    lda $1EB8
    cmp #$02
    bne .E9B8

    inc $1EB8
    jsl _EC3B

    ldy #$A0 : ldx #$21 : jsl set_sprite
    lda #!id_samael_platform : ldx #$00 : ldy #$00 : jsl _018C55
    lda #!id_samael_platform : ldx #$00 : ldy #$02 : jsl _018C55
    lda #$60 : jsl _018049_8053
.E9EA:
    brk #$00

;----- E9EC

    dec $24
    bne .E9EA

    lda #$02 : sta $08
    stz $09
    bra .E9B8

.E9F8:
    inc.b obj.direction
    inc.b obj.facing
.E9FC:
    ldy #$B0 : ldx #$21 : jsl set_sprite
    jsl _EC3B
.EA08:
    brk #$00

;----- EA0A

    lda $1EBE
    cmp $37
    beq .EA08

    sta $37
    lda $1EBD
    eor.b obj.facing
    clc
    adc $37
    tay
    ldx.w samael_data_D6A2,Y
    !A16
    clc : lda.w samael_data_D6B4,X : adc $33 : sta.b obj.speed_y+1
    !A8
    bra .EA08

.EA2D:
    lda #$02 : sta.b obj.direction
    inc.b obj.facing
.EA33:
    ldy #$B2 : ldx #$21 : jsl set_sprite
    jsl _EC3B
    lda.b obj.facing : eor #$01 : sta $28
.EA45:
    brk #$00

;----- EA47

    lda $1EBE
    cmp $37
    beq .EA45

    sta $37
    lda $1EBD
    eor $28
    clc
    adc $37
    tay
    lda.w samael_data_D6A2,Y : asl : tax
    !A16
    lda.w samael_data_D6BA+0,X
    ldy.b obj.facing
    beq .EA6B

    eor #$FFFF
    inc
.EA6B:
    clc
    adc $31
    sta.b obj.speed_x+1
    clc : lda.w samael_data_D6BA+2,X : adc $33 : sta.b obj.speed_y+1
    !A8
    bra .EA45

.EA7C:
    lda #$02 : sta.b obj.direction
    inc.b obj.facing
.EA82:
    jsl _EC3B
    ldy #$A4 : ldx #$21 : jsl set_sprite
    lda.b obj.facing : eor #$01 : sta $28
.EA94:
    brk #$00

;----- EA96

    lda $1EBE
    cmp $37
    beq .EA94

    sta $37
    lda $1EBD
    eor $28
    clc
    adc $37
    tay
    ldx.w samael_data_D6A2,Y
    ldy.w samael_data_D6AE+0,X : lda.w samael_data_D6AE+1,X : tax : jsl set_sprite
    bra .EA94

.EAB8:
    lda $0292
    bmi .EAE5

    lda #$0E : jsl _0195E4
    stz $07
    !X16
.EAC7:
    jsl _028B1E
    lda #$0C : sta.w obj.active,X
    lda #!id_samael : sta.w obj.type,X
    lda $07
    sta $0007,X
    clc
    adc #$02
    sta $07
    cmp #$10
    bne .EAC7

    !X8
.EAE5:
    jml _0281A8_81B5

;-----

destroy:
    ldy #$AE : ldx #$21 : jsl set_sprite
    lda.b obj.hp
    beq .EB1E

    lda #$FF : sta $35
    jsl _02F9DA_F9E0
    ldx.w difficulty
    lda.w samael_data_D69E,X : sta $24
.EB05:
    brk #$00

;----- EB07

    dec $24
    bne .EB05

    jsl _EC27
    stz $35
    ldx $36
    jmp (+,X) : +: dw create_E8AF, create_E91C, create_E94F, create_E989

.EB1E:
    jsl _018049
    stz $1500
    stz $150E
    stz $151C
    stz $152A
    stz $1538
    stz $1546
    stz $1554
    stz $1562
    jsl _0190B9_90CB
    inc $1EB7
    lda.w !obj_arthur.hp
    bmi .EB49

    inc $1ED7
.EB49:
    lda $08 : ora #$10 : sta $08
    lda #!id_explosion_spawner : ldx #$00 : ldy #$08 : jsl _018C55
    lda #$FF : sta $3B
.EB5D:
    jsl thing_EC0E
    brk #$00

;----- EB63

    ldx #$12
    lda.w frame_counter
    and #$01
    bne .EB6E

    ldx #$13
.EB6E:
    jsr .EBA8
    dec $3B
    bne .EB5D

    ldx #$12 : jsr .EBA8
    inc $1EB7
    stz $08
    stz $09
    lda #$FF : cop #$00

;----- EB85

    lda #$19 : sta $031E
    brk #$00

;----- EB8C

    !AX16
    lda #$0010 : jsl _019136_9153
.EB95:
    brk #$00

;----- EB97

    lda.w jump_counter
    bne .EB95

    ldx.b #_01DAB8 : ldy.b #_01DAB8>>8 : jsl _01DAA4
    jml _0281A8_81B5

;-----

.EBA8:
    stx $02D5
    stx $02D6
    stx $02D7
    stx $02D8
    rts

;-----

.EBB5:
    lda $07
    cmp #$02
    bne .EBC3

    ldy #$A2 : ldx #$21 : jsl set_sprite
.EBC3:
    lda $08 : ora #$10 : sta $08
    lda $09 : and #$7F : sta $09
.EBCF:
    brk #$00

;----- EBD1

    lda $1EB7
    dec
    beq .EBCF

    jml _0281A8_81B5

;-----

_EBDB:
    dec $38
    bne .EBEF
    lda #$0E : sta $38
    lda $37
    inc #2
    cmp #$0C
    bne .EBED

    lda #$00
.EBED:
    sta $37
.EBEF:
    rts

;-----

thing:
    lda $07
    bne _EC3B_EC55

    jsl _02F9B6
    jsl _02F9BA
    lda $1EB8
    ora $35
    bne .EC0E

    lda.w frame_counter
    and #$0F
    bne .EC0E

    jsl _EC27
.EC0E:
    !A16
    lda.b obj.pos_x+1
    sta $1EB9
    sec
    sbc #$0100
    eor #$FFFF
    inc
    clc
    adc $1733
    sta $19BD
    !A8
    rtl

;-----

_EC27:
    jsl _01918E_set_direction16
    lsr
    inc
    and #$06
    tax
    ldy.w samael_data_D64D+0,X : lda.w samael_data_D64D+1,X : tax : jml set_sprite

;-----

_EC3B:
    stz $37
    jsl _02F9DA_F9E0
    lda $07 : asl : tax
    !A16
    lda.w samael_data_D655-4,X : sta.b obj.speed_x+1 : sta $31
    lda.w samael_data_D655-2,X : sta.b obj.speed_y+1 : sta $33
.EC55:
    lda $1EB7
    beq .EC61

    !A16
    lda.w #destroy_EBB5 : sta.b obj.state+1
.EC61:
    !A16
    lda $1EBB : adc.b obj.speed_y+1 : sta.b obj.pos_y+1
    !A16
    lda $1EB9 : adc.b obj.speed_x+1 : sta.b obj.pos_x+1
    !A8
    rtl
}

namespace off
