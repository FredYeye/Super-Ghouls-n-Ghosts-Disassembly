namespace arremer

{
_A5D7:
    jml _0281A8_81B5

create:
    lda $07 : sta $33
    ldx.w stage
    cpx #$07
    bne .A5EE

    ldx #$02 : jsl _018D5B
    bra .A604

.A5EE:
    !A16
    lda #$0120
    cpx #$08
    bne .A5FA

    lda #$0190
.A5FA:
    sta $29
    !A8
    lda.w obj_type_count+!id_arremer
    dec
    bne _A5D7 ;remove new arremer if one already exists

.A604:
    ldx.w stage
    lda.w arremer_data_CF0E,X : sta $32
    jsl set_hp
    stz $39
    inc $08
    ldx $33
    lda.w arremer_data_CF04,X : sta $09
    lda #$FF : sta $26
    !A16
    lda.w _00ED00+$12 : sta $27
    stz $2D
    stz $2F
    lda.w #arremer_data_CFD5 : sta $13
    !A8
    ldy #$E4 : ldx #$21 : jsl set_sprite
    stz $31
    lda #$03 : sta $3A
    jsl _02F9DA
.A643:
    brk #$00

;----- A645

    bit $09
    bvc .A643

    jsr _AAB3_AAD5
    ldy #$1A : jsl arthur_range_check
    bcs .A643

.A654:
    lda #$02
    sta $39
    ldy #$AC : ldx #$21 : jsl set_sprite
    stz $31
    stz $3A
    lda #$03 : sta.b obj.direction
    lda #$0A : sta $3B
.A66C:
    brk #$00

;----- A66E

    ldx #$42 : jsl update_pos_xy_2
    dec $3B
    bne .A66C

.A678:
    lda #$04 : sta $39
    lda #$03 : sta.b obj.direction
    lda #$0A : sta $3B
.A684:
    brk #$00

;----- A686

    ldx #$42 : jsl update_pos_xy_2
    jsr _AAB3_AAD5
    dec $3B
    bne .A684

    bra .A6AB

.A695:
    lda #$06 : sta $39
    stz $3A
    lda #$09 : sta $3B
.A69F:
    brk #$00

;----- A6A1

    ldx #$42 : jsl update_pos_xy_2
    dec $3B
    bne .A69F

.A6AB:
    lda #$08 : sta $39
    jsl get_rng_16
    ldy.w arremer_data_CF17,X
    lda.w arremer_data_CF27,Y
    ldx.w difficulty
    clc
    adc.w arremer_data_CF2F,X
    sta $3B
.A6C2:
    brk #$00

;----- A6C4

    jsr _AAB3_AAD5
    dec $3B
    bne .A6C2

    lda $2D : inc : and #$03 : sta $2D
    jsl _01963E
    ldx $2D
    and.w arremer_data_CF33,X
    beq .A6E0

    jmp .A7EF
.A6E0:
    lda $2E : inc : and #$01 : sta $2E
    jsl _01963E
    ldx $2E
    and.w arremer_data_CF37,X
    beq .A710

    lda #$0A : sta $39
    jsl _01909B : sta.b obj.direction
    ldy #$30 : jsl set_speed_xyg
    lda #$42 : sta $3B
.A706:
    brk #$00

;----- A708

    jsl update_pos
    dec $3B
    bne .A706

.A710:
    lda #$0C : sta $39
    stz $3B
    stz $0000
    !A16
    clc
    lda.b obj.pos_y+1 : adc #$0010 : sta $0001
    cmp.w !obj_arthur.pos_y+1
    !A8
    bcc .A72E

    jmp .A678
.A72E:
    lda #$38 : jsl _0187E5
.A734:
    inc $3B
    clc
    lda.b obj.speed_y : adc.b obj.gravity : sta.b obj.speed_y
    !A16
    lda.b obj.speed_y+1 : adc #$0000 : sta.b obj.speed_y+1
    clc
    lda $0000 : adc.b obj.speed_y : sta $0000
    !A8
    lda $0002 : adc.b obj.speed_y+2 : sta $0002
    !A16
    lda $0001
    cmp.w !obj_arthur.pos_y+1
    !A8
    bcc .A734

    jsl _01909B : sta.b obj.direction
    !A16
    bne .A785

    clc
    lda.b obj.pos_x+1
    adc #$0100
    sta $0006
    clc
    lda.w !obj_arthur.pos_x+1
    adc #$0100
    sec
    sbc $0006
    bne .A78B

.A785:
    lda.b obj.pos_x+1
    sec
    sbc.w !obj_arthur.pos_x+1
.A78B:
    stz $0000
    sta $0001
    beq .A7B5

    ldy $3B
    jsl _018A7E : sta.b obj.speed_x+1 : sty $0001
    lda $0001
    ldy $3B
    jsl _018A7E
    clc
    adc.b obj.speed_x
    sta.b obj.speed_x
    lda #$0004
    cmp.b obj.speed_x+1
    bcs .A7B5

    sta.b obj.speed_x+1
.A7B5:
    !A8
.A7B7:
    brk #$00

;----- A7B9

    jsl update_pos
    lda.b obj.speed_y+2
    bpl .A7B7

    lda #$0E : sta $39
    jsl get_rng_16
    ldy.w arremer_data_CF39,X
    !A16
    lda.w arremer_data_CF49,Y : sta.b obj.speed_x
    !A8
    stz.b obj.speed_x+2
    ldy #$1A
    jsl get_rng_bool
    beq .A7E1

    ldy #$18
.A7E1:
    sty $3B
.A7E3:
    brk #$00

;----- A7E5

    jsl update_pos
    dec $3B
    bne .A7E3

    bra .A817

.A7EF:
    lda #$10 : sta $39
    ldy #$B0 : ldx #$21
    stz $31
    jsl set_sprite
.A7FD:
    brk #$00

;----- A7FF

    lda $24
    cmp #$0A
    bne .A7FD

    lda #$12 : sta $39
    lda #$A8 : sta $1D
    jsr _AA87
.A810:
    brk #$00

;----- A812

    lda $24
    dec
    bne .A810

.A817:
    lda #$14 : sta $39
    ldy #$AC : ldx #$21 : jsl set_sprite
    stz $31
    lda #$80 : sta $3B
.A829:
    brk #$00

;----- A82B

    jsr _AAB3_AAD5
    dec $3B
    bne .A829

    lda #$16 : sta $39
    lda #$2D : sta $3B
    ldy #$36 : jsl set_speed_y
.A840:
    brk #$00

;----- A842

    jsr _AAB3_AAD5
    jsl update_pos_y
    dec $3B
    bne .A850

    jmp .A654

.A850:
    jsl _01A559
    beq .A840

.A856:
    lda #$18 : sta $39
    ldy #$A6 : ldx #$21 : jsl set_sprite
    stz $31
    lda #$03 : sta $3A
    jsl get_rng_bool : sta.b obj.direction
    !A16
    lda.b obj.pos_x+1
    sbc #$0014
    sta.b obj.speed_y+1
    !A8
    ldy #$4E : jsl set_speed_x
.A87F:
    jsl get_rng_16
    lda.w arremer_data_CF51,X
    ldx.w difficulty
    clc
    adc.w arremer_data_CF71,X
    sta $3B
.A88F:
    brk #$00

;----- A891

    jsl update_pos_x
    jsr _AAB3_AAD5
    jsl _01A593
    bne .A8A1

    jmp .A654

.A8A1:
    !A16
    lda.b obj.pos_x+1
    sec
    sbc.b obj.speed_y+1
    cmp #$0028
    !A8
    bcs .A8B5

    dec $3B
    bne .A88F

    bra .A8BD

.A8B5:
    lda.b obj.direction : eor #$01 : sta.b obj.direction
    bra .A88F

.A8BD:
    lda #$1A : sta $39
    lda.b obj.direction : eor #$01 : sta.b obj.direction
    jsl get_rng_16
    lda.w arremer_data_CF61,X
    ldx.w difficulty
    clc
    adc.w arremer_data_CF71,X
    sta $3B
.A8D7:
    brk #$00

;----- A8D9

    jsr _AAB3_AAD5
    dec $3B
    bne .A8D7

    jsl get_rng_16
    clc
    adc $2F
    tax
    clc : lda $2F : adc #$10 : and #$30 : sta $2F
    lda.w arremer_data_CF75,X
    tax
    jmp (+,X) : +: dw .A87F, .A8FE, .A929

;-----

.A8FE: ;shoot projectile or killers
    lda #$1C : sta $39
    ldy #$B2 : ldx #$21 : jsl set_sprite
    stz $31
.A90C:
    brk #$00

;----- A90E

    lda.b obj.anim_timer
    cmp #$0A
    bne .A90C

    lda #$1E : sta $39
    lda #$54 : sta $1D
    jsr _AA87
.A91F:
    brk #$00

;----- A921

    lda.b obj.anim_timer
    dec
    bne .A91F

    jmp .A856

;-----

.A929: ;charge towards arthur
    lda #$20 : sta $39
    ldy #$54 : jsl set_speed_x
    lda.b obj.facing : sta.b obj.direction
    inc $30
.A939:
    !A8
    brk #$00

;----- A93D

    jsl update_pos_x
    jsl update_animation_normal
    jsl _01A593
    bne .A950

    stz $30
    jmp .A654

.A950:
    !A16
    lda.w !obj_arthur.pos_x+1
    ldx.b obj.direction
    bne .A962

    adc #$0050
    cmp.b obj.pos_x+1
    bcs .A939

    bra .A969

.A962:
    adc #$FFB0
    cmp.b obj.pos_x+1
    bcc .A939

.A969:
    !A8
    stz $30
    jmp .A856

.A970:
    lda #$22 : sta $39
    ldy #$AC : ldx #$21 : jsl set_sprite
    stz $31
    stz.b obj.direction
    !A16
    lda.b obj.pos_x+1
    cmp #$FF00
    !A8
    bcs .A996

    jsl _01918E_set_direction16
    inc
    and #$0F
    lsr #2
    sta.b obj.direction
.A996:
    brk #$00

;----- A998

    ldx #$42 : jsl update_pos_xy_2
    lda $02C3
    and #$0F
    beq .A9AC

    bit $09
    bvc .A996

    jmp .A695

.A9AC:
    lda #$24 : sta $39
    jsl _01909B
    asl
    sta.b obj.direction
.A9B7:
    brk #$00

;----- A9B9

    ldx #$42 : jsl update_pos_xy_2
    jsl _01A593
    beq .A970

    bit $09
    bvc .A9B7

    lda #$26 : sta $39
    lda.b obj.facing : sta.b obj.direction
    ldy #$4E : jsl set_speed_x
    lda #$20 : sta $3B
.A9DB:
    brk #$00

;----- A9DD

    dec $3B
    beq .A9F1

    jsl update_pos_x
    jsr _AAB3_AAD5
    jsl _01A593
    bne .A9DB

    jmp .A654

.A9F1:
    jmp .A856

;-----

.A9F4:
    ldy #$51 : jsl set_speed_x
.A9FA:
    brk #$00

;----- A9FC

    jsl update_pos_x
    jsl _01A593
    lda $24
    dec
    bne .A9FA

    jmp .A929

;-----

destroy:
    lda.b obj.hp
    bne .AA14

    jml _028BEC

.AA14:
    ldy #$E2 : ldx #$21 : jsl set_sprite
    inc $31
    jsl _02F9DA_F9E0
    ldx $39
    jmp (+,X)

+:
    dw create_A643, create_A66C, create_A684, create_A69F, create_A6C2, create_A706, create_A7B7, create_A7E3
    dw create_A7FD, create_A810, create_A829, create_A840, create_A88F, create_A8D7, create_A90C, create_A91F
    dw create_A9F4, create_A996, create_A9B7, create_A9DB

;-----

thing:
    lda $31
    beq .AA67

    lda $24
    dec
    bne .AA67

    ldx $39
    ldy.w arremer_data_CFD9+0,X
    lda.w arremer_data_CFD9+1,X
    tax
    jsl set_sprite
    stz $31
.AA67:
    lda $30
    bne .AA71

    jsl _01909B : sta.b obj.facing
.AA71:
    jsl update_animation_normal
    ldx $32
    jsl _018E32
    jsl _02F9BA
    jsl _02F9B6
    jml _02F9B2

;-----

_AA87:
    lda #$60 : jsl _018049_8053
    jsl get_rng_bool
    bne .AA9A

    lda #!id_arremer_projectile : jsl prepare_object
    rts

.AA9A:
    jsl set_direction32
    inc
    and #$1F
    lsr
    sta.b obj.facing
    lda #$02 : sta $07
.AAA8:
    lda #!id_arremer_killers : jsl prepare_object
    dec $07
    bpl .AAA8

    rts

;-----

_AAB3:
    pla
    pla
    lda #$03 : sta.b obj.direction
    lda $3A
    beq .AAC5

    ldy #$AC : ldx #$21 : jsl set_sprite
.AAC5:
    brk #$00

;----- AAC7

    ldx #$42 : jsl update_pos_xy_2
    bit $09
    bvs .AAC5

    jml _0281A8_81B5

.AAD5:
    ldx $33
    !A16
    lda.w camera_x+1
    cmp.w arremer_data_CF08,X
    !A8
    bcs _AAB3

    ldy #$0A
    !AX16
    ldx.w #!obj_weapons.base
.AAEA:
    lda.w obj.active,X
    and #$000D
    beq .AB15

    lda $0007,X
    bmi .AB15

    sec
    lda.b obj.pos_x+1
    sbc.w obj.pos_x+1,X
    clc
    adc #$0030
    cmp #$0060
    bcs .AB15

    sec
    lda.b obj.pos_y+1
    sbc.w obj.pos_y+1,X
    clc
    adc #$0020
    cmp #$0040
    bcc .AB25

.AB15:
    txa : clc : adc.w #obj.ext.len : tax
    dey
    bne .AAEA

    !AX8
    bit $09
    bvc .AB3B

    rts

.AB25:
    jsl set_direction32_custom_obj
    tax
    lda.w arremer_data_CFB5,X : sta.b obj.direction
    pla
    pla
    lda $3A
    beq .AB38

    jmp create_A654
.AB38:
    jmp create_A695

.AB3B: ;move back into screen after getting scrolled off
    pla
    pla
    lda $3A
    bne .AB44

    jmp create_A970

.AB44:
    jmp create_A9AC
}

namespace off
