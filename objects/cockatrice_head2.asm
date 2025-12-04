namespace cockatrice_head2

{
create:
    stz $0F
    lda $07 : asl : tax
    jmp (+,X) : +: dw .C6B3, .C840, .C6B3, .C840, .C9AA

.C6B3:
    lda.w stage
    cmp #$07
    beq .C6C2

    ldx #$00 : jsl _018D5B
    bra .C6CB

.C6C2:
    !A16
    lda #$0120 : sta $29
    !A8
.C6CB:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$01 : sta $08
    lda $09 : ora #$C0 : sta $09
    !A16
    lda.w _00ED00+$40 : sta $27
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    lda.b obj.pos_x+1 : sta $36
    lda.b obj.pos_y+1 : sta $38
    !A8
    !X16
    stz $0033,X
    !X8
    stz.b obj.speed_x+2
    stz.b obj.speed_y+2
    lda #$FF : sta $26
    stz $31
    stz $32
    jsl set_hp
    lda $3C : and #$01
    beq .C723

    inc.b obj.facing
    !AX16
    ldx $2F
    lda.w obj.pos_x+1,X : sta.b obj.pos_x+1
    lda.w obj.pos_y+1,X : sta.b obj.pos_y+1
    !AX8
.C723:
    brk #$00

;----- C725

.C725:
    !AX16
    lda.w stage
    cmp #$0008
    beq .C73D

    lda.b obj.pos_x+1
    clc
    adc #$00F0
    sec
    sbc.w !obj_arthur.pos_x+1
    bcc .C755

    bra .C75A

.C73D:
    lda.b obj.pos_x+1
    clc
    adc #$0160
    sec
    sbc.w !obj_arthur.pos_x+1
    bcc .C755

    lda.w !obj_arthur.pos_y+1
    clc
    adc #$00E0
    sec
    sbc.b obj.pos_y+1
    bcs .C75A

.C755:
    !AX8
    jmp destroy_CB84

.C75A:
    !AX8
    lda $0F : asl : tax
    jmp (+,X) : +: dw .C771, .C781, .C7BF, .C7CA, .C7EA, .C803, .C813

;-----

.C771:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    bra .C723

;-----

.C781:
    lda $32
    bne .C79C

    lda $31
    beq .C723

    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$04 : sta $0F
    jmp .C723

.C79C:
    ldy #$CA : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$4E : sta $1D
    lda #$1F : cop #$00

;----- C7B0

    lda #!id_cockatrice_head2_projectile : jsl prepare_object
    lda #$10 : sta $35
    inc $0F
    jmp .C723

;-----

.C7BF:
    dec $35
    bne .C7C7

    stz $32
    stz $0F
.C7C7:
    jmp .C723

;-----

.C7CA: ;unused shoot code?
    dec $34
    beq .C7E5

    lda #!sfx_cockatrice_spew : jsl _018049_8053
    lda #!id_cockatrice_head2_projectile : jsl prepare_object
    lda #$30 : sta $35
    lda #$02 : sta $0F
    jmp .C723

.C7E5:
    stz $0F
    jmp .C723

;-----

.C7EA:
    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$02 : sta $31
    lda #$7F : sta $35
    inc $0F
    jmp .C723

;-----

.C803:
    lda $31
    beq .C80E

    dec $35
    beq .C80E

    jmp .C723

.C80E:
    stz $0F
    jmp .C723

;-----

.C813:
    dec $35
    bne .C83D

    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    sec
    lda.w stage
    sbc #$07
    tay
    ldx.w cockatrice_head2_data2_D375,Y : jsl _018E32
    lda $37 : sta $35
    lda $36 : sta $0F
.C83D:
    jmp .C723

;-----

.C840:
    brk #$00

;----- C842

    lda $31
    beq .C840

    ldy #$0A : ldx #$22 : jsl set_sprite
    lda $08 : ora #$04 : sta $08
    lda $0F
    cmp #$08
    beq .C860

    lda $09 : ora #$C0 : sta $09
.C860:
    !AX16
    ldx $2D
    lda $29 : sta $0029,X
    stz $0033,X
    lda #$0001 : sta $0031,X
    lda.w _00ED00+$68 : sta $27
    lda.b obj.pos_x+1 : sta $36
    lda.b obj.pos_y+1 : sta $38
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    !AX8
    stz.b obj.speed_x+2
    stz.b obj.speed_y+2
    stz $31
    stz $32
    stz $35
    lda $08 : and #$F7 : sta $08
    lda $3C : and #$01
    beq .C89D

    inc.b obj.facing
.C89D:
    brk #$00

;----- C89F

    lda $33
    beq .C8A6

    jmp destroy_CB69

.C8A6:
    lda $0F : asl : tax
    jmp (+,X) : +: dw .C8BD, .C8E1, .C903, .C921, .C94A, .C962, .C974, .C990

;-----

.C8BD:
    lda $31
    beq .C89D

    lda #$04 : cop #$00

;----- C8C5

    lda $08 : ora #$08 : sta $08
    !X16
    ldx $2D
    inc $0031,X
    lda.b obj.direction : sta.w obj.direction,X
    !AX8
    lda #$18 : sta $35
    inc $0F
    bra .C89D

;-----

.C8E1:
    ldx #$2A : jsl update_pos_xy_2
    dec $35
    bne .C89D

    !X16
    ldx $2F
    stz $0031,X
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$1F : sta $35
    inc $0F
    bra .C89D

;-----

.C903:
    dec $35
    bne .C91E

    lda.b obj.direction : ora #$10 : sta.b obj.direction
    !X16
    ldx $2D
    lda.b obj.direction : sta.w obj.direction,X
    !X8
    lda #$39 : sta $35
    inc $0F
.C91E:
    jmp .C89D

;-----

.C921:
    dec $35
    beq .C939

    !A16
    lda.b obj.pos_y+1
    sec
    sbc $38
    bcc .C939

    !A8
    ldx #$28 : jsl update_pos_xy_2
    jmp .C89D

.C939:
    !A16
    lda $36 : sta.b obj.pos_x+1
    lda $38 : sta.b obj.pos_y+1
    !A8
    inc $0F
    jmp .C89D

;-----

.C94A:
    !X16
    ldx $2D
    lda #$04 : sta $000F,X
    !X8
    lda $08 : and #$F7 : sta $08
    stz $31
    stz $0F
    jmp .C89D

;-----

.C962: ;unused?
    !X16
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$07 : sta $0F
    jmp .C89D

;-----

.C974:
    ldx #$2A : jsl update_pos_xy_2
    !X16
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$1F : sta $35
    lda #$07 : sta $0F
    jmp .C89D

;-----

.C990:
    dec $35
    bne .C9A7

    !X16
    ldx $2D
    lda.b obj.direction : sta.w obj.direction,X
    !X8
    lda #$7F : sta $35
    lda #$03 : sta $0F
.C9A7:
    jmp .C89D

;-----

.C9AA:
    lda #$02 : cop #$00

;----- C9AE

    ldy #$0A : ldx #$22 : jsl set_sprite
    lda $08 : ora #$05 : sta $08
    lda $09 : ora #$C0 : sta $09
    !A16
    lda.w _00ED00+$68 : sta $27
    lda.w stage
    cmp #$0008
    beq .C9D8

    lda #$012E : sta $29
    bra .C9DD

.C9D8:
    lda #$01CE : sta $29
.C9DD:
    lda.b obj.pos_x+1 : sta $36
    lda.b obj.pos_y+1 : sta $38
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    !A8
    stz.b obj.speed_x+2
    stz.b obj.speed_y+2
    lda #$FF : sta $26
    stz $31
    stz $32
    stz $35
    stz $33
    jsl update_animation_normal
    sec
    lda.w stage
    sbc #$07
    tay
    ldx.w cockatrice_head2_data2_D375,Y : jsl _018E32
    !AX16
    ldx $2D
    lda $29 : sta $0029,X
    stz $0033,X
    lda #$0001 : sta $0031,X
    !AX8
    lda $3C : and #$01
    beq .CA29

    inc.b obj.facing
.CA29:
    brk #$00

;----- CA29

    lda $33
    beq .CA32

    jmp destroy_CB69

.CA32:
    ldy #$38 : jsl _0192AD
    bcs .CA29

    lda $3C
    and #$02
    beq .CA6E

    ldx #$A4 : jsl _0196EF
    beq .CA6E

    ldx #$A2 : jsl _0196EF : sta $35
.CA50:
    !X16
    ldx $2F
    inc $0032,X
    !X8
    lda #$5F : sta $34
.CA5D:
    brk #$00

;----- CA5D

    lda $33
    beq .CA66

    jmp destroy_CB69

.CA66:
    dec $34
    bne .CA5D

    dec $35
    bpl .CA50

.CA6E:
    ldx #$A0 : jsl _0196EF : sta $35
.CA76:
    brk #$00

;----- CA78

    lda $33
    beq .CA7F

    jmp destroy_CB69

.CA7F:
    dec $35
    bne .CA76

    lda $3C : and #$01
    beq .CA93

    jsl set_direction32
    tax
    lda.w cockatrice_head2_data_D34A,X
    bra .CA9B

.CA93:
    jsl set_direction32 : tax
    lda.w cockatrice_head2_data_D32A,X
.CA9B:
    !X16
    ldx $2D : sta.b obj.direction : sta.w obj.direction,X
    !X8
    lda #$04 : cop #$00

;----- CAAA

    !X16
    ldx $2D
    inc $0031,X
    ldx $2F
    inc $0031,X
    !X8
    lda #$7F : sta $35
.CABC:
    brk #$00

;----- CABE

    lda $33
    beq .CAC5

    jmp destroy_CB69

.CAC5:
    dec $35
    bne .CABC

    !X16
    ldx $2F
    stz $0031,X
    !X8
    jmp .CA29

;-----

thing:
    jsl _02F9B2
    lda $07
    bne .CB14

    !AX16
    ldx $2F
    lda.w obj.pos_x+1,X : sta.b obj.pos_x+1
    lda.w obj.pos_y+1,X : sta.b obj.pos_y+1
    !AX8
    lda $0F
    cmp #$05
    beq .CB0B

    lda $09 : ora #$40 : sta $09
    jsl update_animation_normal
    sec
    lda.w stage
    sbc #$07
    tay
    ldx.w cockatrice_head2_data2_D375,Y : jsl _018E32
.CB0B:
    jsl _02F9B6
    jsl _02F9BA
    rtl

.CB14:
    jsl _02F9C2
    rtl

;-----

destroy:
    lda.b obj.hp
    beq .CB4A

    lda $0F
    cmp #$06
    beq .CB43

    lda $32
    bne .CB43

    ldy #$0E : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    lda $0F : sta $36
    lda $35 : sta $37
    lda #$16 : sta $35
    lda #$06 : sta $0F
.CB43:
    jsl _02F9DA_F9E0
    jmp create_C723

.CB4A:
    inc $33
    !X16
    ldx $3A
    inc $0033,X
    !X8
    inc $1FAD
    lda $1FAD
    cmp #$05
    bne .CB65

    lda #!id_crumbling_wall : jsl prepare_object
.CB65:
    jml magician_destroy

;-----

.CB69:
    !X16
    ldx $2D
    inc $0033,X
    !X8
    lda #$1F : cop #$00

;----- CB76

    lda #$04 : sta $1D
    lda #!id_small_explosion : jsl prepare_object
    jml _0281A8_81B5

;-----

.CB84:
    !X16
    ldx $3A
    inc $0033,X
    !X8
    inc $1FAD
    jml _0281A8_81B5
}

namespace off
