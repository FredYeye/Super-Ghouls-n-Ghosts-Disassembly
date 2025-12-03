namespace avalanche

{
create:
    brk #$00

;----- DF21

    lda $1FB1
    bne create

    inc $1FB1
    !A16
    clc : lda.w camera_x+1 : adc #$0110 : sta.b obj.pos_x+1
    lda #$FFF8 : sta $2D
    lda.w #avalanche_data_D5FC : sta $13
    !AX8
    lda #$01 : sta $1F32
    lda #$20 : sta $3C
.DF49:
    brk #$00

;----- DF4B

    !A16
    clc : lda.w camera_x+1 : adc #$0100 : sta.b obj.pos_x+1
    !A8
    jsl _01939D
    bne .DF65

    dec $3C
    bne .DF49

    jmp .E01E

.DF65:
    stz $35
    ldy #$69 : jsl set_speed_x
    ldx $07
    lda.w avalanche_data_direction,X : sta.b obj.direction
    stz $15
    stz $2D
    !A16
.DF7A:
    brk #$00

;----- DF7C

    lda.w !obj_arthur.pos_y+1
    cmp #$0427
    bcs .DF7A

    !A8
    lda #$15 : sta $02D7 : sta $02D8
    stz $1A84
    lda #$02 : sta $1A80
.DF96:
    brk #$00

;----- DF98

    lda $1A80
    bne .DF96

    lda #$68 : jsl _018049_8053
    lda $09 : ora #$80 : sta $09
    !A16
    clc : lda.b obj.pos_x+1 : adc #$0140 : sta.b obj.pos_x+1
    lda #$0200 : sta $19C5
    stz $19C9
    !A8
    brk #$00

;----- DFC0

    lda #$17 : sta $02D5 : sta $02D6 : sta $02D7 : sta $02D8
.DFCE:
    brk #$00

;----- DFD0

    jsl update_pos_x
    jsr .E036
    jsl _01A593
    bne .DFCE

    lda #$2A : sta $3C
.DFE1:
    brk #$00

;----- DFE3

    jsl update_pos_x
    jsr .E036
    dec $3C
    bne .DFE1

    lda #$2A : sta $2E
.DFF2:
    brk #$00

;----- DFF4

    jsl update_pos_x
    jsr .E036
    dec $2E
    bne .DFF2

    ldy #$3B : jsl set_speed_xyg
    inc $35
    stz $14EF
.E00A:
    brk #$00

;----- E00C

    jsl update_pos_xyg_add
    lda $2D
    bne .E00A

    rep #$02 ;mistake, supposed to be rep #$20
    sta $19C5
    stz $19C9
    !A8
.E01E:
    lda #$15 : sta $02D5 : sta $02D6 : sta $02D7 : sta $02D8
    stz $1FB1
    stz $14EF
    jml _0281A8_81B5

;-----

.E036:
    !A16
    clc
    lda.b obj.pos_x+1
    adc #$0100
    cmp.w camera_x+1
    !A8
    bcs .E049

    pla : pla
    bra .E01E

.E049:
    rts

;-----

_E04A:
    lda #$0200 : sta $19BD
    !AX8
    rts

.E053:
    !A16
    clc
    lda.w camera_x+1
    adc #$0080
    sec
    sbc.b obj.pos_x+1
    clc
    adc #$0180
    cmp #$0300
    bcs _E04A

    sec
    lda.b obj.pos_x+1
    sbc.w camera_x+1
    sta $0000
    eor #$FFFF
    inc
    clc
    adc #$0100
    and #$03FF
    sta $19C5
    clc
    lda.w camera_y+1
    adc #$0080
    sec
    sbc.b obj.pos_y+1
    clc
    adc #$0100
    cmp #$0200
    bcs _E04A

    sec : lda.b obj.pos_y+1 : sbc.w camera_y+1 : sta $0000
    clc : lda #$0080       : sbc $0000        : sta $19C9
    !AX8
    rts

;-----

_E0A8:
    !A16
    clc
    lda.w camera_x+1
    adc #$0080
    sec
    sbc.b obj.pos_x+1
    clc
    adc #$0180
    cmp #$0300
    bcs .E0D1

    clc
    lda.w camera_y+1
    adc #$0080
    sec
    sbc.b obj.pos_y+1
    clc
    adc #$0100
    cmp #$0200
    !AX8
    rts

.E0D1:
    !AX8
    rts

;-----

thing:
    jsr _E0A8
    bcc .E0E9

    !A16
    lda #$0200 : sta $19C5
    stz $19C9
    stz $2D
    !A8
    rtl

.E0E9:
    jsr _E108
    jsr _E04A_E053
    inc $2D
    lda $14D1
    bne .E107

    lda $14EF
    beq .E107

    !A16
    clc : lda.b obj.pos_x+1 : adc $31 : sta.w !obj_arthur.pos_x+1
    !A8
.E107:
    rtl

;-----

_E108:
    lda $14F6
    bne .E15F

    lda $14D1
    bne .E15F

    lda.w jump_counter
    ora $35
    bne .E15F

    lda $14EF
    bne .E15F

    !A16
    sec
    lda.w !obj_arthur.pos_x+1
    sbc.b obj.pos_x+1
    clc
    adc #$00C0
    cmp #$0180
    bcs .E15F

    sec
    lda.w !obj_arthur.pos_y+1
    sbc.b obj.pos_y+1
    clc
    adc #$0040
    cmp #$0080
    !A8
    bcs .E15F

    inc $14EF
    lda.b #_01DC19    : sta.w !obj_arthur.state+1
    lda.b #_01DC19>>8 : sta.w !obj_arthur.state+2
    stz $14B3
    stz.w !obj_upgrade2.active
    !A16
    sec : lda.w !obj_arthur.pos_x+1 : sbc.b obj.pos_x+1 : sta $31
    !A8
.E15F:
    rts
}

namespace off
