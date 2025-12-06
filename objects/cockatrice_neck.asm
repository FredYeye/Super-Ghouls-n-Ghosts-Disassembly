namespace cockatrice_neck

{
create:
    ldy #$0A : ldx #$22 : jsl set_sprite
    lda $08 : ora #$04 : sta $08
    lda $08 : and #$F7 : sta $08
    lda $09 : ora #$C0 : sta $09
    jsr _02EBA8
    !A16
    lda #$010E : sta $29
    stz $31
    stz.b obj.speed_x
    stz.b obj.speed_y
    !A8
    stz.b obj.speed_x+2
    stz.b obj.speed_y+2
    stz $3B
    stz $3C
.DC2F:
    !AX8
    brk #$00

;----- DC33

    lda $3B
    bne .DC3C

    jsr _02EBA8
    bra .DC2F

.DC3C:
    lda $0F : asl : tax
    jmp (+,X) : +: dw .DC55, .DC7B, .DCBC, .DCDA, .DD03, .DD21, .DD3E, .DD50, .DD76

;-----

.DC55:
    !X16
    ldx $2D
    lda $1EC6
    sta.b obj.direction
    sta.w obj.direction,X
    !X8
    stz $33
    stz $31
    inc $0F
    lda #$04 : cop #$00

;----- DC6D

    !X16
    ldx $2D
    lda #$02 : sta $003B,X
    !X8
    jmp .DC2F

;-----

.DC7B:
    inc $31
    lda $31
    and #$03
    cmp #$03

    bne .DCA7

    lda $33
    bne .DC99

    !A16
    lda.b obj.pos_x+1 : clc : adc #$0002 : sta.b obj.pos_x+1
    !A8
    inc $33
    bra .DCA7

.DC99:
    !A16
    lda.b obj.pos_x+1 : sec : sbc #$0002 : sta.b obj.pos_x+1
    !A8
    stz $33
.DCA7:
    lda $31
    cmp #$40
    bne .DCB9

    lda $08 : ora #$08 : sta $08
    lda #$20 : sta $31
    inc $0F
.DCB9
    jmp .DC2F

;-----

.DCBC:
    ldx #$2A : jsl update_pos_xy_2
    dec $31
    bne .DCD7

    !X16
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$30 : sta $31
    inc $0F
.DCD7:
    jmp .DC2F

;-----

.DCDA:
    dec $31
    bne .DD00

    !X16
    ldx $2D
    lda #$07 : sta $000F,X
    lda #$80 : sta $0031,X
    !X8
    lda.b obj.direction
    lsr
    sec
    sbc #$05
    tax
    lda.w _00CA45,X
    sta.b obj.direction
    lda #$40 : sta $31
    inc $0F
.DD00:
    jmp .DC2F

;-----

.DD03:
    dec $31
    beq .DD16
    lda $08 : and #$F7 : sta $08
    ldx #$28 : jsl update_pos_xy_2
    jmp .DC2F

.DD16:
    lda $08 : and #$F7 : sta $08
    inc $0F
    jmp .DC2F

;-----

.DD21:
    !X16
    ldx $2D
    lda #$05 : sta $000F,X
    !X8
    lda $08 : and #$F7 : sta $08
    stz $1EC5
    stz $31
    stz $3B
    stz $0F
    jmp .DC2F

;-----

.DD3E:
    !X16
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$08 : sta $0F
    jmp .DC2F

;-----

.DD50:
    lda #$08 : cop #$00

;----- DD54

    !X16
    ldx $2D
    lda #$07 : sta $000F,X
    !X8
    lda.b obj.direction
    lsr
    sec
    sbc #$05
    tax
    lda.w _00CA45,X : sta.b obj.direction
    lda #$38 : sta $31
    lda #$04 : sta $0F
    jmp .DC2F

;-----

.DD76:
    jmp .DC2F

;-----

thing:
    lda $3C
    bne .DD83

    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
.DD83:
    rts

;-----

destroy:
    inc $3C
    lda $08 : ora #$10 : sta $08
    !X16
    ldx $2D
    lda #$8C : sta $0000,X
    !X8
    lda #$77 : cop #$00

;----- DD9B

    lda #$46 : jsl prepare_object
    jmp _0281A8_81B5
}

namespace off
