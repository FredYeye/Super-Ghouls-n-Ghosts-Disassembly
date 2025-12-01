namespace gargoyle_statue

{
create:
    ldy #$BC : ldx #$21 : jsl set_sprite
    lda $08 : and #$F7 : ora #$05 : sta $08
    lda $09 : ora #$80 : sta $09
    jsl set_hp
    lda #$58 : sta $37
    stz $38
    stz $33
    stz $35
    stz $34
.9FC2:
    brk #$00

;----- 9FC4

    lda $19ED
    beq .9FC2

    lda $0F
    asl
    tax
    jmp (+,X) : +: dw .9FE8, .A00B, .A04E, .A090, .A0D4, .A118, .A16B, .A1AF, .A1F3, .A235, .A270, .A29C

;-----

.9FE8:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$005E
    sec
    sbc.b obj.pos_x+1
    bcs .9FFA

    !A8
    bra .9FC2

.9FFA:
    lda.b obj.pos_y+1
    sta $2F
    !A8
    lda $08 : ora #$08 : sta $08
    inc $0F
    jmp .9FC2

;-----

.A00B:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$005A
    sec
    sbc.b obj.pos_x+1
    bcc .A02B

    !A8
    ldy #$BE : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A02B:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$005E
    sec
    sbc.b obj.pos_x+1
    bcs .A046

    !A8
    lda $08 : and #$F7 : sta $08
    dec $0F
    jmp .9FC2

.A046:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A04E:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$0056
    sec
    sbc.b obj.pos_x+1
    bcc .A06E

    !A8
    ldy #$C0 : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A06E:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$005A
    sec
    sbc.b obj.pos_x+1
    bcs .A088

    !A8
    ldy #$BC : ldx #$21 : jsl set_sprite
    dec $0F
.A088:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A090:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$0045
    sec
    sbc.b obj.pos_x+1
    bcc .A0B2

    !A8
    ldy #$C2 : ldx #$21 : jsl set_sprite
    inc $34
    inc $0F
    jsr .A29F
    jmp .9FC2

.A0B2:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$0056
    sec
    sbc.b obj.pos_x+1
    bcs .A0CC

    !A8
    ldy #$BE : ldx #$21 : jsl set_sprite
    dec $0F
.A0CC:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A0D4:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$0030
    sec
    sbc.b obj.pos_x+1
    bcc .A0F4

    !A8
    ldy #$D6 : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A0F4:
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$0045
    sec
    sbc.b obj.pos_x+1
    bcs .A110

    !A8
    ldy #$C0 : ldx #$21 : jsl set_sprite
    stz $34
    dec $0F
.A110:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A118:
    jsl get_arthur_relative_side : eor #$01 : sta.b obj.direction : sta.b obj.facing
    !A16
    lda.w !obj_arthur.pos_x+1
    clc
    adc #$0030
    sec
    sbc.b obj.pos_x+1
    bcs .A145

    lda.b obj.pos_y+1 : sta $2F
    !A8
    ldy #$C2 : ldx #$21 : jsl set_sprite
    stz $33
    dec $0F
    jmp .9FC2

.A145:
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$0030
    sec
    sbc.b obj.pos_x+1
    bcc .A166

    lda.b obj.pos_y+1 : sta $2F
    !A8
    ldy #$C2 : ldx #$21 : jsl set_sprite
    inc $33
    inc $0F
    jmp .9FC2

.A166:
    !A8
    jmp .9FC2

;-----

.A16B:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$0045
    sec
    sbc.b obj.pos_x+1
    bcc .A18D

    !A8
    ldy #$C0 : ldx #$21 : jsl set_sprite
    stz $34
    inc $0F
    jsr .A29F
    jmp .9FC2

.A18D:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$0030
    sec
    sbc.b obj.pos_x+1
    bcs .A1A7

    !A8
    ldy #$D6 : ldx #$21 : jsl set_sprite
    dec $0F
.A1A7:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A1AF:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$0058
    sec
    sbc.b obj.pos_x+1
    bcc .A1CF

    !A8
    ldy #$BE : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A1CF:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$0045
    sec
    sbc.b obj.pos_x+1
    bcs .A1EB

    !A8
    ldy #$C2 : ldx #$21 : jsl set_sprite
    inc $34
    dec $0F
.A1EB:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A1F3:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$005C
    sec
    sbc.b obj.pos_x+1
    bcc .A213

    !A8
    ldy #$BC : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A213:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$0058
    sec
    sbc.b obj.pos_x+1
    bcs .A22D

    !A8
    ldy #$C0 : ldx #$21 : jsl set_sprite
    dec $0F
.A22D:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A235:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$0060
    sec
    sbc.b obj.pos_x+1
    bcc .A250

    !A8
    lda $08 : and #$F7 : sta $08
    inc $0F
    jmp .9FC2

.A250:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$005C
    sec
    sbc.b obj.pos_x+1
    bcs .A26A

    !A8
    ldy #$BE : ldx #$21 : jsl set_sprite
    dec $0F
.A26A:
    jsr .A29F
    jmp .9FC2

;-----

.A270:
    !A16
    lda.w !obj_arthur.pos_x+1
    sec
    sbc #$0060
    sec
    sbc.b obj.pos_x+1
    bcc .A283

    !A8
    jmp .9FC2

.A283:
    lda.b obj.pos_y+1 : sta $2F
    !A8
    ldy #$BC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$08 : sta $08
    dec $0F
    jmp .9FC2

;-----

.A29C: ;unused?
    jmp .9FC2

;-----

.A29F:
    !A16
    lda $2F : sta.b obj.pos_y+1
    !A8
    rts

;-----

thing:
    jsl update_animation_normal
    lda $34
    beq .A2BC

    jsl _02F9B2
    jsl _02F9B6
    jsl _02F9BA
.A2BC:
    jsl _028156
    rtl

;-----

destroy:
    lda.b obj.hp
    beq .A2CC

    jsl _02F9DA_F9E0
    jmp create_9FC2

.A2CC:
    lda #!sfx_shatter : jsl _018049_8053
    ldy #$AA : ldx #$21 : jsl set_sprite
    ldy #$0F : jsl update_score
    ldy #$1C : jsl set_speed_xyg
    lda #$18 : sta $2D
.A2EA:
    brk #$00

;----- A2EC

    jsl update_animation_normal
    jsl update_pos_xyg_add
    dec $2D
    bne .A2EA

    jml _0281A8_81B5
}

namespace off
