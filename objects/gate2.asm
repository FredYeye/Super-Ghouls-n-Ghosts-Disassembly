namespace gate2

{
create:
    lda #$02 : sta $08
    lda #$48 : jsl _018049_8053
    lda.w stage
    sec
    sbc #$06
    asl #2
    tax
    !A16
    lda.w gate2_data_D551+0,X : sta.b obj.pos_x+1
    lda.w gate2_data_D551+2,X : sta.b obj.pos_y+1
    phd : pla : clc : adc #$0030 : sta $13
    !A8
    txa
    asl
    tax
    lda.w gate2_data_D563+0,X : sta $02E6
    lda.w gate2_data_D563+1,X : sta $02E7
    stz $02E8
    lda.w gate2_data_D563+2,X : sta $2F
    stz $31
    stz $32
    lda.w gate2_data_D563+3,X : sta $33
    stz $34
    stz $35
    lda.w gate2_data_D563+4,X : sta $36
    lda.w gate2_data_D563+5,X : sta $37
    lda.w gate2_data_D563+6,X : sta $38
    lda #$01 : sta $39
    stz $3A
    stz $3B
    stz $3C
    lda.w gate2_data_D563+7,X : sta $09
    lda.w stage : asl : tax
    ldy.w gate2_data_D55D-$0C,X : lda.w gate2_data_D55D-$0B,X : tax : jsl set_sprite
.DB1B:
    brk #$00

;----- DB1D

if !version == 0
    jsr _DB35
endif
    dec.b obj.pos_y+1
    inc $36
    dec $33
if !version == 1 || !version == 2
    jsr _DB35
endif
    lda $33
    dec
    bne .DB1B

    inc $1F9F
.DB2E:
    brk #$00

;----- DB30

    jsr _DB35
    bra .DB2E

;-----

_DB35:
    sec : lda $2F : sbc.w camera_y+1 : sec : sbc #$28 : sta $30
    !X16
    ldx $13 : stx !A1T7L
    !X8
    stz !A1B7
    lda #$01 : sta !DMAP7
    lda #$26 : sta !BBAD7
    lda $02F0 : ora #$80 : sta $02F0
    rts
}

namespace off
