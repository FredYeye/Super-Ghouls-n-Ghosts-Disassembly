namespace cockatrice_body

{
create:
    stz $1EC8
    stz $3C
    lda #$28 : sta $10
    ldy #$FE : ldx #$21 : jsl set_sprite
    !A16
    lda #cockatrice_body_data_CA1D : sta $13
    lda.w _00ED00+$44 : sta $27
    lda #$0100 : sta $29
    clc
    lda #$13C0 : sta.b obj.pos_x+1
    lda #$0038 : sta.b obj.pos_y+1
    lda #$0100 : sta $31
    !A8
    lda $08 : ora #$03 : sta $08
    stz $15
    lda #$FF : sta $26
    lda $09 : ora #$40 : sta $09
    jsl update_animation_normal
    jsl _018E32_8E73
.D6A4:
    !A8
    brk #$00

;----- D6A8

    jsl update_animation_normal
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$1330
    bcs .D6BB

    dec $31
    bne .D6A4

.D6BB:
    !A8
    ldy #$1F : jsl set_speed_xyg
    inc.b obj.direction
    !X16
    ldx $1EBB
    inc $003C,X
    !AX8
    lda #$30 : sta $31
.D6D3:
    !A8
    jsr _02EB8F
    brk #$00

;----- D6DA

    jsl update_pos_xyg_add
    dec $31
    bne .D6D3

    !X16
    ldx $1EB7
    lda #$02 : sta $003B,X
    !X8
.D6EE:
    jsr _02EB8F
    brk #$00

;----- D6F3

    jsl update_pos_xyg_add
    jsl _01A559
    beq .D6EE

    jsr _02EB8F
    lda #$20 : cop #$00

;----- D704

    jsr _02EB8F
    lda $09 : ora #$90 : sta $09
    stz $0F
    jsl set_hp
    stz $38
    stz $1EC7
    !A16
    stz $3A
    lda #$0001 : sta $33
    !A8 ;duplicate instruction
.D723:
    !A8
    brk #$00

;----- D727

    lda $0F
    cmp #$01
    beq .D723

    lda $0F
    cmp #$03
    beq .D73B

    bra .D747

    lda $0F   ;D735 - D73A: unused code
    cmp #$05  ;
    bne .D747 ;

.D73B:
    !A16
    dec $33
    bne .D747

    !A8
    inc $0F
    bra .D723

.D747:
    !AX8
    inc $3A
    lda $3A
    cmp #$80
    bne .D723

    ldx #$4C : jsl _0196EF
    cmp #$00
    beq .D723

    !X16
    ldx $1EB9
    lda $003B,X
    bne .D76D

    lda #$20 : sta $31
    lda #$08 : sta $0F
.D76D:
    !A8
    bra .D723

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda $3C
    bne .D780

    jsr _02FD62_FD7C
.D780:
    lda $0F : asl : tax
    jmp (+,X) : +: dw .D7A1, .D7B9, .D7E9, .D80B, .D8B3, .D8E7, .D915, .D974, .D99B, .D9B0, .D9C7, .DA28, .DA2B

;-----

.D7A1:
    stz $39
    stz $07
    lda #$50 : sta.b obj.speed_y+0
    lda #$FF : sta.b obj.speed_y+1 : sta.b obj.speed_y+2
    lda #$60 : sta $31
    inc $0F
    jsr _02EB8F
    rts

;-----

.D7B9:
    jsl update_pos_y
    lda $31
    cmp #$52
    bne .D7C6

    jsr .D7D8
.D7C6:
    dec $31
    bne .D7D4

    stz $38
    stz $37
    lda #$15 : sta.b obj.direction
    inc $0F
.D7D4:
    jsr _02EB8F
    rts

;-----

.D7D8:
    !X16
    ldx $1EBB
    stz $003C,X
    ldx $1EB7
    stz $003B,X
    !X8
    rts

;-----

.D7E9:
    ldx #$4A : jsl _0196EF
    ldx #$3F : jsl mulu
    !A16
    sta $33
    lda #$0060 : sta.b obj.speed_x
    lda #$0060 : sta.b obj.speed_y
    !A8
    inc $0F
    jsr _02EB8F
    rts

;-----

.D80B:
    lda $39
    and #$04
    cmp $07
    beq .D875

    sta $07
    lda $38
    bne .D841

    lda $37
    bne .D829

    lda.b obj.direction
    cmp #$0A
    bne .D835

    lda #$01 : sta $37
    bra .D875

.D829:
    lda.b obj.direction
    cmp #$16
    bne .D83D

    stz $37
    dec.b obj.direction
    bra .D875

.D835:
    lda.b obj.direction
    beq .D83D

    dec.b obj.direction
    bra .D875

.D83D:
    inc.b obj.direction
    bra .D875

.D841:
    lda $37
    bne .D85D

    lda.b obj.direction
    cmp #$06
    bne .D851

    lda #$01 : sta $37
    bra .D875

.D851:
    inc.b obj.direction
    lda.b obj.direction
    cmp #$20
    bne .D875

    stz.b obj.direction
    bra .D875

.D85D:
    lda.b obj.direction
    cmp #$1A
    bne .D869

    stz $37
    dec.b obj.direction
    bra .D875

.D869:
    lda.b obj.direction
    beq .D871

    dec.b obj.direction
    bra .D875

.D871:
    lda #$1F : sta.b obj.direction
.D875:
    ldx #$1A : jsl update_pos_xy_2
    !A16
    lda.b obj.pos_x+1
    sec
    sbc #$12B0
    bcc .D895

    lda.b obj.pos_x+1
    sec
    sbc #$1380
    bcs .D8A2

    !A8
    inc $39
    jsr _02EB8F
    rts

.D895:
    lda #$12B0 : sta.b obj.pos_x+1
    !A8
    lda #$04 : sta $36
    bra .D8AD

.D8A2:
    lda #$1380 : sta.b obj.pos_x+1
    !A8
    lda #$04 : sta $36
.D8AD:
    inc $0F
    jsr _02EB8F
    rts

;-----

.D8B3:
    ldx #$56 : jsl _0196EF
    sta $33
    ldx #$2A : jsl _0196EF
    beq .D8CD

.D8C3:
    stz $35
    lda #$07 : sta $0F
    jsr _02EB8F
    rts

.D8CD:
    lda $35
    cmp #$03
    bcs .D8C3

    inc $35
    inc $0F
    jsr _02EB8F
    !A16
    lda.b obj.pos_y : sta $1EC9
    stz $1ECB
    !A8
    rts

;-----

.D8E7:
    lda $1ECB
    inc
    and #$1F
    sta $1ECB
    asl
    tax
    bne .D904

    dec $33
    bne .D904

    !A16
    lda $1EC9 : sta.b obj.pos_y
    !A8
    inc $0F
    rts

.D904:
    !A16
    clc : lda.w cockatrice_body_data_C9C3,X : adc $1EC9 : sta.b obj.pos_y
    !A8
    jsr _02EB8F
    rts

;-----

.D915:
    lda $36
    sec
    cmp #$04
    bcc .D928

    stz $36
    lda $38
    pha
    eor #$01
    sta $38
    pla
    bra .D938

.D928:
    lda $38
    pha
    ldx #$4C : jsl _0196EF
    sta $38
    pla
    cmp $38
    beq .D958

.D938:
    cmp #$00
    bne .D949

    lda.b obj.direction
    sec
    sbc #$0A
    tax
    lda.w cockatrice_body_data_CA03,X
    sta.b obj.direction
    bra .D958

.D949:
    lda.b obj.direction
    cmp #$18
    bmi .D952

    sec
    sbc #$13
.D952:
    tax
    lda.w cockatrice_body_data_CA10,X
    sta.b obj.direction
.D958:
    inc $36
    ldx #$4A : jsl _0196EF
    ldx #$3F : jsl mulu
    !A16
    sta $33
    !A8
    lda #$03 : sta $0F
    jsr _02EB8F
    rts

;-----

.D974:
    jsl set_direction32
    tax
    lda.w cockatrice_body_data_CA25,X : sta $1EC6
    !X16
    ldx $1EB9
    lda #$02
    sta $3B
    sta $003B,X
    sta $1EC5
    ldx $1EBB
    sta $003B,X
    !X8
    lda #$0A : sta $0F
    rts

;-----

.D99B:
    !AX8
    lda $1EC7 ;miniwing count
    cmp #$04
    beq .D9AB

    dec $31
    bne .D9AA

    inc $0F
.D9AA:
    rts

.D9AB: ;gets here if there are 4 miniwings
    lda #$06 : sta $0F
    rts

;-----

.D9B0:
    !AX8
    lda #$03
    sta $3B
    !X16
    ldx $1EBB
    sta $003B,X
    !X8
    lda #$20 : sta $31
    inc $0F
    rts

;-----

.D9C7:
    lda $3B
    dec
    asl
    tax
    jmp (+,X) : +: dw .D9D9, .D9ED, .DA01, .DA15, .DA15

;-----

.D9D9: ;unused?
    !X16
    ldx $1EB7
    lda $003B,X
    bne .DA28

    !X8
    lda #$06 : sta $0F
    jsr _02EB8F
    rts

;-----

.D9ED:
    lda $1EC5
    bne .DA28

    !X16
    ldx $1EBB
    stz $003B,X
    !X8
    lda #$06 : sta $0F
    rts

;-----

.DA01:
    dec $31
    bne .DA28

    lda #$10 : sta $31
    inc $3B
    lda #!id_miniwing : jsl prepare_object
    inc $1EC7
    rts

;-----

.DA15:
    dec $31
    bne .DA28

    !X16
    ldx $1EBB
    stz $003B,X
    !X8
    lda #$06 : sta $0F
    rts

;-----

.DA28:
    !X8
    rts

;-----

.DA2B:
    rts

;-----

destroy:
    lda #$0C : sta $0F
    inc $3C
    lda #!mus_defeat_boss : jsl _018049_8053
    !X16
    ldx $1EB7
    lda $0008,X : ora #$10 : sta $0008,X
    inc $003C,X
    ldx $1EBD
    lda $0008,X : ora #$10 : sta $0008,X
    inc $003C,X
    !X8
    lda $08 : ora #$10 : sta $08
    lda #!id_boss_explosion_spawner : jsl prepare_object
    lda #$77 : sta $31
.DA68:
    brk #$00

;----- DA6A

    jsl update_animation_normal
    jsl _018E32_8E73
    dec $31
    bne .DA68

    lda #$72 : sta $1D
    lda #!id_key : jsl prepare_object
    !X16
    ldy $1EB7 : jsr remove_child_object
    ldy $1EBD : jsr remove_child_object
    !AX8
    inc $1ED7
    jmp _0281A8_81B5
}

namespace off
