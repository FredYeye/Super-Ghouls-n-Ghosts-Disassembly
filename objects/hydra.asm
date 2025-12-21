namespace hydra

;also contains hydra_genie and hydra_fireball

{
create:
    lda $07
    cmp #$0F
    beq .9EFA

    asl
    tax
    jmp (+,X)

+:
    dw create2_A239, create2_A60F, create2_A819, create2_A357, create2_A9CD
    dw create2_A473, create2_AADB, create2_ABED, create2_A728, create2_A8FC

.9EFA:
    stz $1EC9
    stz $1ECB
    ldx #$10 : jsr _028000_local
.9F05:
    brk #$00

;----- 9F07

    lda #$34 : jsl _0195E4
    bcc .9F05

    !AX16
    tya
    clc
    adc #$0032
    tay
    !A8
    lda #$01 : sta $07
    jsr _028B2A_local
    stx $1EBD
    lda.b obj.type : jsr _02EB57
    stz $0F
    stz $07
    lda #$02 : sta $31
.9F30:
    jsr _028B2A_local
    lda.b obj.type
    inc $0F
    jsr _02EB57
    dec $31
    bne .9F30

    jsr _028B2A_local
    stx $1EB7
    stz $0F
    lda.b obj.type : jsr _02EB57
    lda #$08 : sta $07
    lda #$06 : sta $0F
    jsr _028B2A_local
    lda.b obj.type : jsr _02EB57
    jsr _028B2A_local
    dec $0F
    lda.b obj.type : jsr _02EB57
    jsr _028B2A_local
    dec $0F
    lda.b obj.type : jsr _02EB57
    lda #$02 : sta $07
    lda #$02 : sta $31
.9F77:
    jsr _028B2A_local
    dec $0F
    lda.b obj.type : jsr _02EB57
    dec $31
    bne .9F77

    phx
    lda #$09 : sta $07
    jsr _028B2A_local
    stx $1EC7
    dec $0F
    lda.b obj.type : jsr _02EB57
    !A16
    pla : sta $002D,X
    !A8
    jsr _028B2A_local
    stx $1EC5
    stz $0F
    lda.b obj.type : jsr _02EB57
    lda #$04 : sta $07
    jsr _028B2A_local
    stx $1EBF
    lda.b obj.type : jsr _02EB57
    stz $0F
    lda #$03 : sta $07
    lda #$02 : sta $31
.9FC5:
    jsr _028B2A_local
    lda.b obj.type
    inc $0F
    jsr _02EB57
    dec $31
    bne .9FC5

    jsr _028B2A_local
    stx $1EB9
    stz $0F
    lda.b obj.type : jsr _02EB57
    lda #$06 : sta $07
    jsr _028B2A_local
    stx $1EC1
    lda.b obj.type : jsr _02EB57
    stz $0F
    lda #$05 : sta $07
    lda #$02 : sta $31
.9FF9:
    jsr _028B2A_local
    lda.b obj.type
    inc $0F
    jsr _02EB57
    dec $31
    bne .9FF9

    jsr _028B2A_local
    stx $1EBB
    stz $0F
    lda.b obj.type : jsr _02EB57
    lda #$07 : sta $07
    jsr _028B2A_local
    lda.b obj.type : jsr _02EB57
    !A16
    !AX8
    brk #$00

;----- A026

    jmp _0281A8_81B5
}

namespace hydra_genie

{
create:
    inc $1ED4
    inc $1ED5
    lda $07 : asl : ldy #$E6 : ldx #$21 : jsl set_sprite_8480
    !A16
    lda.w _00ED00+$56 : sta $27
    lda $07
    and #$000F
    asl
    tax
    lda.w hydra_data_C291,X : sta $29
    lda.w #hydra_data_C29D : sta $13
    lda.b obj.pos_y+0 : sta $36
    stz $0C
    !A8
    lda.b obj.pos_y+2 : sta $38
    lda $09 : ora #$D0 : sta $09
    lda #$FF : sta $26
    stz $15
    lda $1ECA : eor #$01 : sta.b obj.facing
    lda #$02 : sta $31
.A075:
    lda $1ECA
    beq .A082

    ldy #$35 : jsl set_speed_xyg
    bra .A088

.A082:
    ldy #$34 : jsl set_speed_xyg
.A088:
    brk #$00

;----- A08A

    jsl update_pos_xyg_add
    jsl _01A559
    beq .A088

    lda $07 : asl : ldy #$CC : ldx #$21 : jsl set_sprite_8480
    dec $31
    bne .A075

    lda $07 : asl : ldy #$C0 : ldx #$21 : jsl set_sprite_8480
    lda #$1F : cop #$00

;----- A0B2

    lda.b obj.facing : eor #$01 : sta.b obj.facing
    lda #$1F : cop #$00

;----- A0BC

    stz $31
    stz $32
    sec
    lda $33 : sbc.b obj.pos_x+0 : sta $39
    lda $34 : sbc.b obj.pos_x+1 : sta $3A
    lda $35 : sbc.b obj.pos_x+2 : sta $0000
    bcs .A0EC

    sec
    lda.b obj.pos_x+0 : sbc $33 : sta $39
    lda.b obj.pos_x+1 : sbc $34 : sta $3A
    lda.b obj.pos_x+2 : sbc $35 : sta $0000
    inc $31
.A0EC:
    sec
    lda $36 : sbc.b obj.pos_y+0 : sta $3B
    lda $37 : sbc.b obj.pos_y+1 : sta $3C
    lda $38 : sbc.b obj.pos_y+2 : sta $0001
    bcs .A118

    sec
    lda.b obj.pos_y+0 : sbc $36 : sta $3B
    lda.b obj.pos_y+1 : sbc $37 : sta $3C
    lda.b obj.pos_y+2 : sbc $38 : sta $0001
    inc $32
.A118:
    !A16
    lda $0000
    lsr
    lda $39
    ror
    lsr #5
    sta $39
    bne .A12F

    lda #$0001 : sta $39
.A12F:
    lda $0001
    lsr
    lda $3B
    ror
    lsr #5
    sta $3B
    bne .A144

    lda #$0001 : sta $3B
.A144:
    !A8
    lda $07 : asl : ldy #$D8 : ldx #$21 : jsl set_sprite_8480
    ldy #$2C : jsl set_speed_xyg
.A157:
    brk #$00

;----- A157

    lda $31
    bne .A172

    clc
    lda.b obj.pos_x+0 : adc $39  : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : adc $3A  : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : adc #$00 : sta.b obj.pos_x+2
    bra .A185

.A172:
    sec
    lda.b obj.pos_x+0 : sbc $39  : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : sbc $3A  : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : sbc #$00 : sta.b obj.pos_x+2
.A185:
    lda $32
    bne .A19E

    clc
    lda.b obj.pos_y+0 : adc $3B  : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : adc $3C  : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : adc #$00 : sta.b obj.pos_y+2
    bra .A1B1

.A19E:
    sec
    lda.b obj.pos_y+0 : sbc $3B  : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : sbc $3C  : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : sbc #$00 : sta.b obj.pos_y+2
.A1B1:
    jsl update_pos_xyg_add
    lda.b obj.speed_y+2
    bmi .A157

    !A16
    lda.b obj.pos_y+1
    sec
    sbc $37
    !A8
    bcs .A1C7

    jmp .A157

.A1C7:
    lda $07 : asl : ldy #$DE : ldx #$21 : jsl set_sprite_8480
    lda #$5F : cop #$00

;----- A1D6

    dec $1ED5
.A1D9:
    brk #$00

;----- A1DB

    lda $1ED5
    bne .A1D9

    lda $07 : asl : ldy #$A0 : ldx #$21 : jsl set_sprite_8480
    !A16
    lda.w _00ED00+$4E : sta $27
    lda $07
    and #$000F
    asl
    tax
    lda.w hydra_data_C291,X : sta $29
    !A8
    stz $1ED4
    lda #$05 : sta $31
.A207:
    lda #$03 : sta $0332
    inc $0331
    lda #$02 ;leftover lda
    brk #$00

;----- A213

    lda #$00 : sta $0332
    inc $0331
    brk #$00

;----- A21D

    dec $31
    bne .A207

    jmp _0281A8_81B5

;-----

thing:
    lda $09 : ora #$40 : sta $09
    jsl update_animation_normal
    jsl _018E32_8E73
    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
    rts
}

namespace hydra

{
create2: ;cont'd from create

.A239:
    ldy #$B6 : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    lda $08 : ora #$05 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $3B
    lda #$04 : sta $3C
    lda #$04 : sta.b obj.direction
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx $0F
    lda.w hydra_data_C27F,X : sta $31
    stz $35
    stz $39
.A26F:
    !X8
    brk #$00

;----- A273

    !X16
    ldx $1EBD
    lda $0034,X
    beq .A280

    jmp .A58F

.A280:
    lda $0033,X
    bne .A26F

    !X8
    lda $1EC9
    beq .A2C5

    lda $1EC9
    cmp #$01
    beq .A26F

    lda $39
    bne .A26F

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    jsr _AF17
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A2B6:
    brk #$00

;----- A2B8

    lda $1ECC
    bne .A2B6

    lda $08 : ora #$08 : sta $08
    bra .A26F

.A2C5:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    stz $39
    lda $0F
    beq .A310

    lda $35
    bne .A2FA

    dec $31
    bne .A34E

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A34E

.A2FA:
    dec $35
    lda $35
    and #$07
    bne .A30E

    jsr .A5B6
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A30E:
    bra .A34E

.A310:
    lda $35
    bne .A338

    dec $31
    bne .A34E

    ldx #$2C : jsl _0196EF : sta $32 : sta $38
    ldx #$2E : jsl _0196EF : sta $35 : sta $37
    ldx #$30 : jsl _0196EF : sta $31 : sta $36
    bra .A34E

.A338:
    dec $35
    lda $35
    and #$07
    bne .A34C

    jsr .A5B6
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A34C:
    bra .A34E

.A34E:
    ldx #$3A : jsl update_pos_xy_2_child_obj
    jmp .A26F

;-----

.A357:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    lda $08 : ora #$02 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $3B
    lda #$04 : sta $3C
    lda #$04 : sta.b obj.direction
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx $0F
    lda.w hydra_data_C27F,X : sta $31
    stz $35
    stz $39
.A38D:
    !X8
    brk #$00

;----- A391

    !X16
    ldx $1EBF
    lda $0034,X
    beq .A39E

    jmp .A58F

.A39E:
    lda $0033,X
    bne .A38D

    !X8
    lda $1EC9
    beq .A3E3

    lda $1EC9
    cmp #$01
    beq .A38D

    lda $39
    bne .A38D

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    jsr _AF17
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A3D4:
    brk #$00

;----- A3D6

    lda $1ECC
    bne .A3D4

    lda $08 : ora #$08 : sta $08
    bra .A38D

.A3E3:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $0F
    beq .A42C

    lda $35
    bne .A416

    dec $31
    bne .A46A

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A46A

.A416:
    dec $35
    lda $35
    and #$07
    bne .A42A

    jsr .A5B6
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A42A:
    bra .A46A

.A42C:
    lda $35
    bne .A454

    dec $31
    bne .A46A

    ldx #$2C : jsl _0196EF : sta $32 : sta $38
    ldx #$2E : jsl _0196EF : sta $35 : sta $37
    ldx #$30 : jsl _0196EF : sta $31 : sta $36
    bra .A46A

.A454:
    dec $35
    lda $35
    and #$07
    bne .A468

    jsr .A5B6
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A468:
    bra .A46A

.A46A:
    ldx #$3A : jsl update_pos_xy_2_child_obj
    jmp .A38D

;-----

.A473:
    ldy #$EE : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    lda $08 : ora #$02 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $3B
    lda #$04 : sta $3C
    lda #$04 : sta.b obj.direction
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx $0F
    lda.w hydra_data_C27F,X : sta $31
    stz $35
    stz $39
.A4A9:
    !X8
    brk #$00

;----- A4AD

    !X16
    ldx $1EC1
    lda $0034,X
    beq .A4BA

    jmp .A58F

.A4BA:
    lda $0033,X
    bne .A4A9

    !X8
    lda $1EC9
    beq .A4FF

    lda $1EC9
    cmp #$01
    beq .A4A9

    lda $39
    bne .A4A9

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    jsr _AF17
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A4F0:
    brk #$00

;----- A4F2

    lda $1ECC
    bne .A4F0

    lda $08 : ora #$08 : sta $08
    bra .A4A9

.A4FF:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $0F
    beq .A548

    lda $35
    bne .A532

    dec $31
    bne .A586

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A586

.A532:
    dec $35
    lda $35
    and #$07
    bne .A546

    jsr .A5B6
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A546:
    bra .A586

.A548:
    lda $35
    bne .A570

    dec $31
    bne .A586

    ldx #$2C : jsl _0196EF : sta $32 : sta $38
    ldx #$2E : jsl _0196EF : sta $35 : sta $37
    ldx #$30 : jsl _0196EF : sta $31 : sta $36
    bra .A586

.A570:
    dec $35
    lda $35
    and #$07
    bne .A584

    jsr .A5B6
    ldx.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A584:
    bra .A586

.A586:
    ldx #$3A : jsl update_pos_xy_2_child_obj
    jmp .A4A9

;-----

.A58F:
    !X8
    lda $08 : ora #$10 : sta $08
    lda #$10 : sta $31
.A59B:
    brk #$00

;----- A59D

    ldx #$3A : jsl update_pos_xy_2_child_obj
    dec $31
    bne .A59B

    lda #!id_small_explosion : jsl prepare_object
    lda #$3B : jsl _018049_8053
    jmp _0281A8_81B5

;-----

.A5B6:
    !A8
    lda $32
    beq .A5CE

    lda.b obj.direction
    cmp #$02
    beq .A5EC

    lda.b obj.direction
    cmp #$07
    beq .A5DE

    lda.b obj.facing
    beq .A5E6

    bra .A5E9

.A5CE:
    lda.b obj.direction
    cmp #$06
    beq .A5EC

    lda.b obj.direction
    beq .A5E1

    lda.b obj.facing
    beq .A5E9

    bra .A5E6

.A5DE:
    stz.b obj.direction
    rts

.A5E1:
    lda #$07
    sta.b obj.direction
    rts

.A5E6:
    dec.b obj.direction
    rts

.A5E9:
    inc.b obj.direction
    rts

.A5EC:
    rts

;-----

.A5ED:
    !A8
    lda $32
    beq .A600

    lda $1ECA
    bne .A5FB

    stz.b obj.direction
    rts

.A5FB:
    lda #$04 : sta.b obj.direction
    rts

.A600:
    lda $1ECA
    beq .A60A

    lda #$05 : sta.b obj.direction
    rts

.A60A:
    lda #$07 : sta.b obj.direction
    rts

;-----

.A60F:
    ldy #$A4 : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    !A16
    lda.w _00ED00+$4E : sta $27
    lda #$0100 : sta $29
    !A8
    lda #$FF : sta $26
    lda $08 : and #$F8 : ora #$01 : sta $08
    lda $09 : ora #$90 : sta $09
    stz $0F
    jsl set_hp
    stz $31
    stz $34
    stz $3B
    stz $39
.A649:
    !A16
    lda.b obj.pos_x+1 : sta $1ECE
    !A8
    lda $09 : ora #$40 : sta $09
    brk #$00

;----- A65A

    lda $1EC9
    beq .A6DE

    lda $1EC9
    cmp #$01
    beq .A649

    lda $39
    bne .A649

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    jsr _AF1F
    jsl get_object_slot
    bmi .A6B6

    !X16
    lda #!id_hydra_genie : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda #$02 : sta $0007,X
    lda.b obj.pos_x+2 : sta $0035,X
    !A16
    lda #$0001 : sta $0008,X
    lda.b obj.pos_x : sta $0033,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    lda $1ECE : sta.w obj.pos_x+1,X
    !AX8
    lda $09 : and #$BF : sta $09
.A6B6:
    brk #$00

;----- A6B8

    lda $1ECC
    bne .A6B6

    lda $09 : ora #$40 : sta $09
    ldy #$A4 : ldx #$21 : jsl set_sprite
    jsl update_animation_normal
    jsl _018E32_8E73
    brk #$00

;----- A6D5

    lda $08 : ora #$08 : sta $08
    jmp .A649

.A6DE:
    stz $39
    lda $31
    bne .A70B

    lda $33
    bne .A6EB

    jmp .A649

.A6EB:
    ldy #$B0 : ldx #$21 : jsl set_sprite
    lda #$5F : sta $31
    lda #$4E : sta $1D
    lda $08 : and #$07 : sta $1ED6
    lda #$38 : jsl prepare_object
    jmp .A649

.A70B:
    dec $31
    beq .A712

    jmp .A649

.A712:
    stz $33
    ldy #$A4 : ldx #$21 : jsl set_sprite
    jmp .A649

;-----

    ;unused?
    ldy #$D8 : ldx #$21 : jsl set_sprite
    rts

;-----

.A728:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    lda #$05 : sta $3C
    stz $3B
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $0C
    stz.b obj.direction
    ldx $0F
    lda.w hydra_data_C27F,X : sta $31
    stz $3B
    stz $35
    stz $39
.A757:
    brk #$00

;----- A759

    lda $1ECB
    cmp #$07
    bne .A763

    jmp .A80C

.A763:
    lda $1EC9
    beq .A7B3

    lda $1EC9
    cmp #$01
    beq .A757

    lda $39
    bne .A757

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    jsr _AF17
    ldx #$00
    lda.b obj.direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    lda $0F
    cmp #$06
    beq .A79A

    ldx #$3A : jsl update_pos_xy_2_child_obj
.A79A:
    brk #$00

;----- A79C

    lda $1ECB
    cmp #$07
    bne .A7A6

    jmp $A80C

.A7A6:
    lda $1ECC
    bne .A79A

    lda $08 : ora #$08 : sta $08
    bra .A757

.A7B3:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $35
    bne .A7E2

    dec $31
    bne .A7F6

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A7F6

.A7E2:
    dec $35
    lda $35
    bne .A7F6

    jsr .A5ED
    ldx #$00
    ldx.b obj.direction
    lda.w hydra_data_C277,X : sta $0C
    stz $0D
.A7F6:
    lda $0F
    cmp #$06
    beq .A802

    ldx #$3A : jsl update_pos_xy_2_child_obj
.A802:
    lda $1ECB
    cmp #$07
    beq .A80C

    jmp .A757

.A80C:
    lda $08 : ora #$10 : sta $08
    lda #$5F : cop #$00

;----- A816

    jmp _0281A8_81B5

;-----

.A819:
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    lda #$05 : sta $3C
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $0C
    stz.b obj.direction
    ldx $0F
    lda.w hydra_data_C288,X : sta $31
    stz $3B
    stz $39
    stz $35
.A846:
    brk #$00

;----- A848

    lda $1ECB
    cmp #$07
    bne .A852

    jmp .A8EF

.A852:
    lda $1EC9
    beq .A89A

    lda $1EC9
    cmp #$01
    beq .A846

    lda $39
    bne .A846

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    jsr _AF17
    ldx.b obj.direction
    lda.w hydra_data_C26F,X : sta $0C
    stz $0D
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A881:
    brk #$00

;----- A883

    lda $1ECB
    cmp #$07
    bne .A88D

    jmp .A8EF

.A88D:
    lda $1ECC
    bne .A881

    lda $08 : ora #$08 : sta $08
    bra .A846

.A89A:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $35
    bne .A8C9

    dec $31
    bne .A8DF

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A8DF

.A8C9:
    dec $35
    lda $35
    bne .A8DD

    jsr .A5ED
    ldx #$00
    ldx.b obj.direction
    lda.w hydra_data_C26F,X : sta $0C
    stz $0D
.A8DD:
    bra .A8DF

.A8DF:
    ldx #$3A : jsl update_pos_xy_2_child_obj
    lda $1ECB
    cmp #$07
    beq .A8EF

    jmp .A846

.A8EF:
    lda $08 : ora #$10 : sta $08
    lda #$5F : cop #$00

;----- A8F9

    jmp _0281A8_81B5

;-----

.A8FC:
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    ldx $0F
    lda.w hydra_data_C288,X : sta $31
    stz $3B
    stz $39
    stz $35
.A921:
    brk #$00

;----- A923

    lda $1ECB
    cmp #$07
    bne .A92D

    jmp .A9C0

.A92D:
    lda $1EC9
    beq .A970

    lda $1EC9
    cmp #$01
    beq .A921

    lda $39
    bne .A921

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    lda $0F
    beq .A957

    jsr _AF27
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A957:
    brk #$00

;----- A959

    lda $1ECB
    cmp #$07
    bne .A963

    jmp .A9C0

.A963:
    lda $1ECC
    bne .A957

    lda $08 : ora #$08 : sta $08
    bra .A921

.A970:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $35
    bne .A9A6

    !A8
    dec $31
    bne .A9AC

    lda $32
    bne .A98A

    inc $32
    bra .A98C

.A98A:
    stz $32
.A98C:
    lda $32 : sta $38
    ldx #$32 : jsl _0196EF : sta $35 : sta $37
    ldx #$32 : jsl _0196EF : sta $31 : sta $36
    bra .A9AC

.A9A6:
    dec $35
    lda $35
    bne .A9AC

.A9AC:
    lda $0F
    beq .A9B6

    ldx #$3A : jsl update_pos_xy_2_child_obj
.A9B6:
    lda $1ECB
    cmp #$07
    beq .A9C0

    jmp .A921

.A9C0:
    lda $08 : ora #$10 : sta $08
    lda #$5F : cop #$00

;----- A9CA

    jmp _0281A8_81B5

;-----

.A9CD:
    ldy #$A0 : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    !A16
    lda.w _00ED00+$4E : sta $27
    lda #$0120 : sta $29
    !A8
    lda #$FF : sta $26
    lda $08 : ora #$00 : sta $08
    lda $09 : ora #$90 : sta $09
    stz $3B
    lda #$01 : sta $0F
    jsl set_hp
    stz $31
    stz $34
    stz $39
.AA07:
    !A16
    lda.b obj.pos_x+1 : sta $1ED0
    !A8
    lda $09 : ora #$40 : sta $09
    brk #$00

;----- AA18

    lda $1EC9
    beq .AA9A

    lda $1EC9
    cmp #$01
    beq .AA07

    lda $39
    bne .AA07

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    jsr _AF1F
    jsl get_object_slot
    bmi .AA72

    !X16
    lda #!id_hydra_genie : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    stz $0007,X
    lda.b obj.pos_x+2 : sta $0035,X
    !A16
    lda #$0001 : sta $0008,X
    lda.b obj.pos_x : sta $0033,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    lda $1ED0 : sta.w obj.pos_x+1,X
    !AX8
    lda $09 : and #$BF : sta $09
.AA72:
    brk #$00

;----- AA74

    lda $1ECC
    bne .AA72

    lda $09 : ora #$40 : sta $09
    ldy #$A0 : ldx #$21 : jsl set_sprite
    jsl update_animation_normal
    jsl _018E32_8E73
    brk #$00

;----- AA91

    lda $08 : ora #$08 : sta $08
    jmp .AA07

.AA9A:
    stz $39
    lda $31
    bne .AAC7

    lda $33
    bne .AAA7

    jmp .AA07

.AAA7:
    ldy #$AC : ldx #$21 : jsl set_sprite
    lda #$5F : sta $31
    lda #$4E : sta $1D
    lda $08 : and #$07 : sta $1ED6
    lda #$38 : jsl prepare_object ;todo
    jmp .AA07

.AAC7:
    dec $31
    beq .AACE

    jmp .AA07

.AACE:
    stz $33
    ldy #$A0 : ldx #$21 : jsl set_sprite
    jmp .AA07

;-----

.AADB:
    !AX8
    ldy #$A2 : ldx #$21 : jsl set_sprite
    lda #$0F : sta.b obj.pos_x+2
    !A16
    lda.w _00ED00+$4E : sta $27
    lda #$0140 : sta $29
    !A8
    lda #$FF : sta $26
    lda $08 : ora #$00 : sta $08
    lda $09 : ora #$90 : sta $09
    lda #$02 : sta $0F
    jsl set_hp
    stz $31
    stz $34
    stz $3B
    stz $39
.AB17:
    !A16
    lda.b obj.pos_x+1 : sta $1ED2
    !A8
    lda $09 : ora #$40 : sta $09
    brk #$00

;----- AB28

    lda $1EC9
    beq .ABAC

    lda $1EC9
    cmp #$01
    beq .AB17

    lda $39
    bne .AB17

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta.b obj.facing
    jsr _AF1F
    jsl get_object_slot
    bmi .AB84

    !X16
    lda #!id_hydra_genie : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda #$01 : sta $0007,X
    lda.b obj.pos_x+2 : sta $0035,X
    !A16
    lda #$0001 : sta $0008,X
    lda.b obj.pos_x : sta $0033,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    lda $1ED2 : sta.w obj.pos_x+1,X
    !AX8
    lda $09 : and #$BF : sta $09
.AB84:
    brk #$00

;----- AB86

    lda $1ECC
    bne .AB84

    lda $09 : ora #$40 : sta $09
    ldy #$A2 : ldx #$21 : jsl set_sprite
    jsl update_animation_normal
    jsl _018E32_8E73
    brk #$00

;----- ABA3

    lda $08 : ora #$08 : sta $08
    jmp .AB17

.ABAC:
    stz $39
    lda $31
    bne .ABD9

    lda $33
    bne .ABB9

    jmp .AB17

.ABB9:
    ldy #$AE : ldx #$21 : jsl set_sprite
    lda #$5F : sta $31
    lda #$4E : sta $1D
    lda $08 : and #$07 : sta $1ED6
    lda #$38 : jsl prepare_object
    jmp .AB17

.ABD9:
    dec $31
    beq .ABE0

    jmp .AB17

.ABE0:
    stz $33
    ldy #$A2 : ldx #$21 : jsl set_sprite
    jmp .AB17

;-----

.ABED:
    !AX8
    ldy #$B2 : ldx #$21 : jsl set_sprite
    !A16
    lda #$0180 : sta.b obj.pos_x+1
    lda #$0088 : sta.b obj.pos_y+1
    !A8
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    lda #$FF : sta.b obj.direction
    lda #$80 : sta.b obj.speed_x+0
    stz.b obj.speed_x+1
    stz.b obj.speed_x+2
    lda #$06 : sta $3C
    stz $38
    stz $31
    stz $36
    stz $35
    stz $3B
    stz $39
    stz $1ECB
.AC30:
    lda $1ECB
    cmp #$07
    bne .AC3A

    jmp .AE07

.AC3A:
    brk #$00

;----- AC3C

    lda $1EC9
    beq .AC97

    jsr _B03C
    bne .AC3A

    lda $1ECB
    cmp #$07
    bne .AC50

    jmp .AE07

.AC50:
    inc $1ECC
    lda $08 : and #$F7 : sta $08
    brk #$00

;----- AC5B

    inc $1EC9
    jsr _B04C
    lda $1ECA : sta.b obj.facing
    stz $39
    jsr _AF2F
    lda #$03 : cop #$00

;----- AC6F

.AC6F:
    brk #$00

;----- AC71

    lda $1ED4
    bne .AC6F

    stz $1ECC
    lda $08 : ora #$08 : sta $08
.AC7F:
    brk #$00

;----- AC81

    jsr _B03C
    bne .AC7F

    stz $39
    lda #$66 : jsl _018049_8053
    !A8
    stz $3B
    stz $1EC9
    bra .AC30

.AC97:
    !A8
    lda $1ECA
    beq .ACAF

    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc.b obj.pos_x+1
    bcs .ACBE

    lda.b obj.pos_x+1
    sta.w !obj_arthur.pos_x+1
    bra .ACBE
.ACAF:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc.b obj.pos_x+1
    bcc .ACBE

    lda.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
.ACBE:
    !A8
    jsr _02FB9C
    jsr _02FD62_FD6A
    dec $36
    beq .ACCD

    jmp .ADDA

.ACCD:
    !X8
    lda #$5F : sta $31
.ACD3:
    brk #$00

;----- ACD5

    lda $1ECB
    cmp #$07
    bne .ACDF

    jmp .AE07

.ACDF:
    dec $31
    bne .ACD3

    sec
    lda #$03 : sta $31
    stz $1ECD
.ACEB:
    brk #$00

;----- ACED

    lda $1ECB
    cmp #$07
    bne .ACF7

    jmp .AE07

.ACF7:
    ldx #$36 : jsl _0196EF
    sta $0000
    and $1ECB
    bne .ACEB

    lda $0000 : asl : tax
    jsr (.AD9A,X)
    lda $1ECD
    beq .ACEB

    stz $1ECD
    !X8
    ldx #$38 : jsl _0196EF : sta $37
.AD1F:
    brk #$00

;----- AD21

    lda $1ECB
    cmp #$07
    beq .AD53

    lda $1ECA
    beq .AD3E

    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc.b obj.pos_x+1
    bcs .AD4D

    lda.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
    bra .AD4D

.AD3E:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc.b obj.pos_x+1
    bcc .AD4D

    lda.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
.AD4D:
    !A8
    dec $37
    bne .AD1F

.AD53:
    dec $31
    bne .ACEB

    lda #$3F : sta $31
.AD5B:
    brk #$00

;----- AD5D

    lda $1ECB
    cmp #$07
    bne .AD67

    jmp .AE07

.AD67:
    dec $31
    bne .AD5B

    lda $38
    bne .AD79

    ldx #$3A : jsl _0196EF : sta $38
    bra .AD8A

.AD79:
    ldx #$2C : jsl _0196EF : sta $38
    inc $1EC9
    lda #$65 : jsl _018049_8053
.AD8A:
    lda.b obj.direction : eor #$FF : sta.b obj.direction
    ldx #$34 : jsl _0196EF : sta $36
    bra .ADDA

;-----

.AD9A: dw .ADA4, .ADA4, .ADB2, .ADC0, .ADC0

.ADA4:
    lda $1ECB
    and #$01
    bne .ADD7

    !X16
    ldx $1EBD
    bra .ADCC

.ADB2:
    lda $1ECB
    and #$02
    bne .ADD7

    !X16
    ldx $1EBF
    bra .ADCC

.ADC0:
    lda $1ECB
    and #$04
    bne .ADD7

    !X16
    ldx $1EC1
.ADCC:
    lda $0034,X
    bne .ADD7

    inc $0033,X
    inc $1ECD
.ADD7:
    !X8
    rts

;-----

.ADDA:
    jsl update_pos_x
    !A16
    lda.b obj.pos_x+1
    cmp #$0040
    bcs .ADED

    !A8
    stz.b obj.direction
    bra .ADF8

.ADED:
    lda.b obj.pos_x+1
    cmp #$01C0
    bcc .ADF8

    !A8
    inc.b obj.direction
.ADF8:
    !A8
    jsr _AF2F
    lda $1ECB
    cmp #$07
    beq .AE07

    jmp .AC30

.AE07:
    brk #$00

;----- AE09

    lda #$10 : jsl _018049_8053
    lda $08 : ora #$10 : sta $08
    lda #$70 : jsl prepare_object
    lda #$5F : sta $31
.AE1F:
    brk #$00

;----- AE21

    dec $31
    bne .AE1F

    lda #$72 : sta $1D
    lda #!id_key : jsl prepare_object
    inc $1ED7
    jmp _0281A8_81B5

;-----

    rts ;unused rts

;-----

thing:
    lda $1EC9
    bne .AE51

    lda $1ECA : sta.b obj.facing
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
    jsl update_animation_normal
    jsl _018E32_8E73
.AE51:
    rts

;-----

destroy:
    lda.b obj.hp
    beq .AE80

    lda $33
    bne .AE6A

    sec
    lda $0F : asl : ldy #$A6 : ldx #$21 : jsl set_sprite_8480
    lda #$20 : sta $31
.AE6A:
    ldx #$02 : jsr _028048_local
    jsl _02F9DA_F9E0
    lda $0F : asl : tax
    jmp (+,X) : +: dw create2_A649, create2_AA07, create2_AB17

.AE80:
    lda $08 : ora #$10 : sta $08
    lda #$10 : cop #$00

;----- AE8A

    ldx $0F
    lda.w hydra_data_C2A1,X : ora $1ECB : sta $1ECB
    lda #$05 : sta $31
    inc $34
    lda #$66 : sta $1D
.AE9F:
    lda #!id_small_explosion : jsl prepare_object
    lda #$0A : cop #$00

;----- AEA9

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053
    dec $31
    bne .AE9F

    jmp _0281A8_81B5
}

namespace hydra_fireball

{
create:
    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda $08 : ora $1ED6 : sta $08
    lda $09 : ora #$80 : sta $09
    lda #$26 : jsl _018049_8053
    lda #$24 : sta $31
.AEDC:
    brk #$00

;----- AEDE

    jsl update_animation_normal
    dec $31
    bne .AEDC

    ldy #$BA : ldx #$21 : jsl set_sprite
    jsl _01918E_set_direction16 : sta.b obj.direction
.AEF4:
    brk #$00

;----- AEF6

    lda $09
    and #$40
    beq destroy

    ldx #$4E : jsl update_pos_xy_2
    bra .AEF4

;-----

thing:
    jsr _02FA37_FA65
    ldy #$14 : jsr _02FF22
    jsr _02FD62_FD7C
    jsl update_animation_normal
    rts

;-----

destroy: ;only used from fireball_create
    jmp _0281A8_81B5
}

namespace hydra

{
_AF17:
    ldx.b obj.direction
    lda.w hydra_data_C21F,X
    sta.b obj.direction
    rts

;-----

_AF1F:
    ldx.b obj.direction
    lda.w hydra_data_C23F,X : sta.b obj.direction
    rts

;-----

_AF27:
    ldx.b obj.direction
    lda.w hydra_data_C25F,X
    sta.b obj.direction
    rts

;-----

_AF2F:
    !AX8
    phy
    lda $1ECA
    bne .AF3E

    !AX16
    ldy #$0000
    bra .AF44

.AF3E:
    !AX16
    lda #$0014
    tay
.AF44:
    ldx $1EC5
    clc : lda.b obj.pos_x+1 : adc.w hydra_data_C1F7,Y : sta.w obj.pos_x+1,X
    iny #2
    clc : lda.b obj.pos_y+1 : adc.w hydra_data_C1F7,Y : sta.w obj.pos_y+1,X
    lda #$00D8 : sta $000C,X
    iny #2
    ldx $1EC7
    clc : lda.b obj.pos_x+1 : adc.w hydra_data_C1F7,Y : sta.w obj.pos_x+1,X
    iny #2
    clc : lda.b obj.pos_y+1 : adc.w hydra_data_C1F7,Y : sta.w obj.pos_y+1,X
    lda #$0024 : sta $000C,X
    iny #2
    !A8
    lda $1ECB
    and #$01
    bne .AFA8

    !A16
    ldx $1EB7
    sec : lda.b obj.pos_x+1 : sbc.w hydra_data_C1F7,Y : sta.w obj.pos_x+1,X
    iny #2
    sec : lda.b obj.pos_y+1 : sbc.w hydra_data_C1F7,Y : sta.w obj.pos_y+1,X
    iny #2
    bra .AFAC

.AFA8:
    iny #4
.AFAC:
    !A8
    lda $1ECB
    and #$02
    bne .AFD2

    !A16
    ldx $1EB9
    sec : lda.b obj.pos_x+1 : sbc.w hydra_data_C1F7,Y : sta $001F,X
    iny #2
    sec : lda.b obj.pos_y+1 : sbc.w hydra_data_C1F7,Y : sta.w obj.pos_y+1,X
    iny #2
    bra .AFD6

.AFD2:
    iny #4
.AFD6:
    !A8
    lda $1ECB
    and #$04
    bne .AFFC

    !A16
    ldx $1EBB
    clc : lda.b obj.pos_x+1 : adc.w hydra_data_C1F7,Y : sta $001F,X
    iny #2
    sec : lda.b obj.pos_y+1 : sbc.w hydra_data_C1F7,Y : sta.w obj.pos_y+1,X
    iny #2
    bra .B000

.AFFC:
    iny #4
.B000:
    !AX8
    ply
    rts

;-----

    ;unused?
    lda.b obj.direction
    bne .B022

    clc
    lda.w obj.pos_x+0,X : adc #$80 : sta.w obj.pos_x+0,X
    lda.w obj.pos_x+1,X : adc #$00 : sta.w obj.pos_x+1,X
    lda.w obj.pos_x+2,X : adc #$00 : sta.w obj.pos_x+2,X
    rts

.B022:
    sec
    lda.w obj.pos_x+0,X : sbc #$80 : sta.w obj.pos_x+0,X
    lda.w obj.pos_x+1,X : sbc #$00 : sta.w obj.pos_x+1,X
    lda.w obj.pos_x+2,X : sbc #$00 : sta.w obj.pos_x+2,X
    rts

;-----

_B03C:
    lda $39
    bne .B049

    ldx #$12 : jsr _028048_local
    lda #$62 : sta $39
.B049:
    dec $39
    rts

;-----

_B04C:
    !A8
    lda $1ECA
    beq .B060

    !A16
    lda #$01C0 : sta.b obj.pos_x+1
    !A8
    stz $1ECA
    rts

.B060:
    !A16
    lda #$0040 : sta.b obj.pos_x+1
    !A8
    inc $1ECA
    rts
}

namespace off
