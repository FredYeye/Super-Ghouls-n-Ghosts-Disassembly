namespace cockatrice_spawner

{
create:
    lda $0292
    bne .D548

    lda #!mus_stage_1_boss : jsl _018049_8053
.D548:
    ldx #$00 : ldy #$90 : lda.b #_01FF00_5C : jsl _01A6FE
.D552:
    brk #$00

;----- D554

    lda.w !obj_arthur.pos_x+1
    cmp #$48
    bcs .D560

    lda #$48 : sta.w !obj_arthur.pos_x+1
.D560:
    lda $00DE
    bne .D552

    ldx #$07 : ldy #$90 : lda.b #_01FF00_5C : jsl _01A6FE
.D56F:
    brk #$00

;----- D571

    lda.w !obj_arthur.pos_x+1
    cmp #$48
    bcs .D57D

    lda #$48 : sta.w !obj_arthur.pos_x+1
.D57D:
    lda $00DE
    bne .D56F

    inc $1EB7
    inc $1EB8
.D588:
    brk #$00

;----- D58A

    lda #$20 : jsl _0195E4
    bcc .D588

    stz $1EC5
    !X16
    phy
    phx
    !X8
    ldx #$00 : jsr _028000_local
    !X16
    plx
    ply
    !X8
    !AX16
    tya
    clc
    adc #$001C
    tay
    lda #$13C8 : sta $1EC0
    lda #$0038 : sta $1EC3

    !A8
    jsr _028B2A_local
    stx $1EB7
    lda #!id_cockatrice_legs : jsr _02EB57
    !A16
    phd
    pla
    sta $002D,X

    !A8
    jsr _028B2A_local
    stx $1EBD
    lda #!id_cockatrice_wings : jsr _02EB57
    !A16
    phd
    pla
    sta $002D,X

    !A8
    jsr _028B2A_local
    stx $1ECC
    lda #!id_cockatrice_neck_base : jsr _02EB57
    !A16
    phd
    pla
    sta $002D,X

    !A8
    lda #$07 : sta $07
.D5FC:
    phx
    jsr _028B2A_local
    lda #!id_cockatrice_neck
    dec $07
    jsr _02EB57
    !A16
    pla
    sta $002D,X

    !A8
    lda $07
    bne .D5FC

    phx
    jsr _028B2A_local
    stx $1EB9
    lda #!id_cockatrice_neck
    dec $07
    jsr _02EB57
    !A16
    pla
    sta $002D,X

    !A8
    phx
    jsr _028B2A_local
    stx $1EBB
    lda #!id_cockatrice_head : jsr _02EB57
    !A16
    pla
    sta $002D,X

    !A8
    jsr _028B2A_local
    lda #!id_cockatrice_body : jsr _02EB57
    !A16
    phx
    ldx $1ECC
    pla
    sta $002D,X

    !AX8
    brk #$00

;----- D653

    jmp _0281A8_81B5
}

namespace off
