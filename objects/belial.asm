namespace belial

{
thing:
    !AX8
    lda $2F
    beq .B16A

    lda.b obj.speed_x+1
    bne .B14C

    lda.b obj.speed_x+0
    sec
    cmp #$78
    bcs .B14C

    stz $32
    lda.b obj.speed_x+0
    sec
    cmp #$2D
    bcs .B150

    stz $33
    bra .B154

.B14C:
    lda #$01 : sta $32
.B150:
    lda #$01 : sta $33
.B154:
    !AX16
    ldy $30
    ldx $2D
    jsl set_spawn_offset_8C8A
    lda $32 : sta $003C,X
    lda $38 : sta $0012,X
    !AX8
.B16A:
    jmp _02FD62_FD7C

;-----

create:
    lda #$90 : sta $09
    lda $08 : and #$F8 : ora #$00 : sta $08
    stz $2F
    stz $32
    jsl get_object_slot
    bpl .B186

    jmp _0281A8_81B5

.B186:
    !X16
    lda #$0C : sta.w obj.active,X
    lda #!id_belial_flame : sta.w obj.type,X
    stx $2D
    !X8
    inc $2F
    lda #$48 : sta $1D : sta $30
    stz $31
    ldy #$C2 : ldx #$21 : jsl set_sprite
    lda #$01 : sta.b obj.facing
    !A16
    lda #belial_data_C2D3 : sta $13
    !A8
    lda #$0A : sta.b obj.speed_x+0
    lda #$01 : sta $35
    stz $3D
    stz $15
    stz $33
    stz $34
    stz $36
    stz $37
    stz $3A
    stz.b obj.speed_x+1
    stz.b obj.speed_x+2
    jsl _01A593
.B1D3:
    brk #$00

;----- B1D5

    lda.b obj.pos_y+1 : sta $38
    jsl _01A593
    lda $33
    beq .B1E5

    jsl update_animation_normal
.B1E5:
    jsr _02FB9C_FBC0
    lda $38
    cmp.b obj.pos_y+1
    beq .B1D3

    lda #$02 : sta $34
    stz $38
    lda $0011
    beq .B1FD

    lda #$01 : sta $38
.B1FD:
    !A8
    lda #$01 : sta $33
    lda #!sfx_impact : jsl _018049_8053
.B209:
    brk #$00

;----- B20B

    lda $34
    beq .B22C

    dec
    beq .B243

    clc
    lda.b obj.speed_x+0 : adc $35  : sta.b obj.speed_x+0
    lda.b obj.speed_x+1 : adc #$00 : sta.b obj.speed_x+1
    sec
    sbc #$02
    bcc .B277

    stz.b obj.speed_x+0
    lda #$02 : sta.b obj.speed_x+1
    bra .B277

.B22C:
    sec
    lda.b obj.speed_x+0 : sbc $35  : sta.b obj.speed_x+0
    lda.b obj.speed_x+1 : sbc #$00 : sta.b obj.speed_x+1
    bcs .B277

    stz $33
    stz.b obj.speed_x
    stz.b obj.speed_x+1
    bra .B277

.B243:
    lda $35
    cmp #$14
    bcc .B24E

    sec
    lda #$0F : sta $35
.B24E:
    inc $35 : inc $35
    sec
    lda.b obj.speed_x+0 : sbc $35  : sta.b obj.speed_x+0
    lda.b obj.speed_x+1 : sbc #$00 : sta.b obj.speed_x+1
    bcs .B277

    lda.b obj.speed_x+0 : eor #$FF : sta.b obj.speed_x+0
    lda.b obj.speed_x+1 : eor #$FF : sta.b obj.speed_x+1
    lda $38 : eor #$01 : sta $38
    lda #$02 : sta $34
.B277:
    lda $38
    bne .B290

    clc
    lda.b obj.pos_x+0 : adc.b obj.speed_x+0 : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : adc.b obj.speed_x+1 : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : adc #$00           : sta.b obj.pos_x+2
    bra .B2A3

.B290:
    sec
    lda.b obj.pos_x+0 : sbc.b obj.speed_x+0 : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : sbc.b obj.speed_x+1 : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : sbc #$00           : sta.b obj.pos_x+2
.B2A3:
    jsl _01A593
    beq .B2BA

    jsr _B2F9
    lda $33
    beq .B2B4

    jsl update_animation_normal
.B2B4:
    jsr _02FB9C_FBC0
    jmp .B209

.B2BA:
    lda #$0A : sta.b obj.speed_y+0
    lda #$01 : sta.b obj.speed_y+1
    stz.b obj.speed_y+2
    lda #$38 : sta.b obj.gravity
    lda $38 : sta.b obj.direction
.B2CC:
    brk #$00

;----- B2CE

    jsl update_pos_xyg_add
    jsl _01A559
    beq .B2DB

    jmp .B209

.B2DB:
    jsr _0281A8
    jsr _02FB9C_FBC0
    lda $09
    and #$40
    bne .B2CC

    !X16
    ldy $2D : jsr remove_child_object
    !X8
    lda #$F1 : jsl _018049_8053 ;todo: stop sound...?
    jmp _0281A8_81B5

;-----

_B2F9:
    !A8
    stx $39
    jsr _B36A
    lda $39
    and #$30
    cmp #$30
    beq .B321

    lda $0011
    bne .B331

    lda $3A
    cmp #$01
    beq .B343

    ldy #$C4 : ldx #$21 : jsl set_sprite
    lda #$01 : sta $3A
    bra .B343

.B321:
    lda $3A
    beq .B343

    ldy #$C2 : ldx #$21 : jsl set_sprite
    stz $3A
    bra .B343

.B331:
    lda $3A
    cmp #$02
    beq .B343

    ldy #$C0 : ldx #$21 : jsl set_sprite
    lda #$02 : sta $3A
.B343:
    lda $39
    and #$70
    cmp #$70
    beq .B367

    lda $0011
    bne .B359

    lda $38
    beq .B362

    lda #$02 : sta $34
    rts

.B359:
    lda $38
    bne .B362

    lda #$02 : sta $34
    rts

.B362:
    lda #$01 : sta $34
    rts

.B367:
    stz $34
    rts

;-----

_B36A:
    lda $0011
    beq .B375

    lda #$01 : sta.b obj.direction
    bra .B377

.B375:
    stz.b obj.direction
.B377:
    txa
    and #$70
    cmp #$70
    bne .B383

    lda #$02 : sta $35
    rts

.B383:
    lsr #4
    tax
    lda.w belial_data_slope_speed,X
    sta $35
    rts
}

namespace off
