namespace gate

{
create:
    lda $02D5 : and #$0F : sta $02D5
    lda #$20 : sta $09
    lda #$FF : sta $19EC
    lda #$48 : jsl _018049_8053
    ldx #$00
    !X16
    ldy.w _00ED00+$48 ;stage 1 gate
    lda.w stage
    beq .C45F

    ldx #$0006
    ldy.w _00ED00+$52 ;stage 4c gate, not sure if anything else gets here
.C45F:
    !A16
    lda.w gate_data_C7BA+0,X : sta.b obj.pos_x+1
    lda.w gate_data_C7BA+2,X : sta.b obj.pos_y+1
    lda.w gate_data_C7BA+4,X : sta $13
    sty $27
    lda #$0100 : sta $29
    stz $33
    !AX8
    lda #$80 : sta $02E6
    lda #$08 : sta $02E7
    lda #$02 : sta $02E8
    jsr _C4EC
    ldy #$1A : ldx #$22
    lda.w stage
    beq .C49A

    ldy #$BE : ldx #$21
.C49A:
    jsl set_sprite
    ldy #$12 : jsl set_speed_y
    ldx #$00
    lda.w stage
    beq .C4AD

    ldx #$04
.C4AD:
    !AX16
    lda.w gate_data_C7B2+0,X
    ldy.w gate_data_C7B2+2,X
    tax
    lda #$0010
.C4B9:
    pha
    lda $7EF400,X
    phx
    tyx
    sta $7EF400,X
    plx
    inx #2
    iny #2
    pla
    dec
    bne .C4B9

    !AX8
    inc $0331
    lda #$00 : jsl _018E32_8E81
    lda #$78 : sta $2D
.C4DC:
    brk #$00

;----- C4DE

    jsl update_pos_y
    dec $2D
    bne .C4DC

    inc $1F9F
    jmp _0281A8_81B5

;-----

_C4EC:
    !X16
    ldx $13 : stx !A1T7L
    !X8
    lda #$00
    stz !A1B7
    lda #$04 : sta !DMAP7
    lda #$26 : sta !BBAD7
    lda $02F0 : ora #$80 : sta $02F0
    rts
}

namespace off
