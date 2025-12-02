namespace raft_pulley

{
create:
    lda #$01 : sta $08
    ldy #$A0 : ldx #$21 : jsl set_sprite
    stz $2D
    stz $2E
    stz $2F
    stz $30
    stz $31
    stz $32
    stz $33
    stz $34
    stz $35
    stz $36
    stz $37
    stz $38
    stz $39
    stz $3A
    lda #$20 : sta $3B
    stz $3C
    jsl get_object_slot
    bpl .CF4D

    jmp _0281A8_81B5

.CF4D:
    !X16
    lda #$0C : sta.w obj.active,X
    lda #!id_raft_hanging : sta.w obj.type,X
    stx $2D
    ldy #$0002 : jsl set_spawn_offset_8C8A
    !X8
    lda #$05 : sta.b obj.speed_x
    lda #$02 : sta.b obj.speed_y
    !A16
    stz.b obj.speed_x+1
    stz.b obj.speed_y+1
    lda.w _00ED00+$18 : sta $27
    lda #$0120 : sta $29
    !A8
    lda.b obj.pos_y+1 : clc : adc #$10 : sta.b obj.pos_y+1
    stz $0F
    lda $09 : ora #$80 : sta $09
.CF8D:
    brk #$00

;----- CF8F

    jsr _0281A8
    lda $20
    cmp #$08
    bcc .CF8D

    !X16
    ldy $2D : jsr remove_child_object
    !X8
    jmp _0281A8_81B5

;-----

thing:
    !AX8
    jsr _0281A8
    lda $0F : asl : tax
    jmp (+,X) : +: dw .CFBA, .CFFB, .D0EC, .D0FF, .D1B9

;-----

.CFBA:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda.w jump_counter
    beq .CFF6

    lda.w !obj_arthur.speed_y+2
    bmi .CFF6

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .CFF6

    lda #$3D : jsl _018049_8053
    inc $0F
    stz $30
    inc $14C3
    lda.b obj.pos_y+1 : sec : sbc #$10 : sta.w !obj_arthur.pos_y+1
    lda.b obj.pos_x : sta.w !obj_arthur.pos_x
    lda.b obj.pos_y : sta.w !obj_arthur.pos_y
    lda #$20 : sta $3B
    stz $3A
.CFF6:
    lda #$FF : sta $26
    rts

;-----

.CFFB:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda.w jump_counter
    beq .D026

    lda.w !obj_arthur.speed_y+2
    bpl .D026

    !A16
    lda.b obj.pos_x+1
    and #$07FF
    cmp #$0540
    bcc .D01F

    !A8
    inc $30
    bra .D02E

.D01F:
    !A8
    stz $30
    jmp .D0CE

.D026:
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .D02E

    inc $14C3
.D02E:
    inc $39
    lda $3A
    beq .D04B

    cmp #$01
    beq .D045

    cmp #$02
    beq .D040

    lda $39
    bra .D050

.D040:
    lda $39
    lsr
    bra .D050

.D045:
    lda $39
    lsr #2
    bra .D050

.D04B:
    lda $39
    lsr #3
.D050:
    and #$03
    sta $25
    lda.b obj.speed_x+1
    cmp #$04
    beq .D06C

    !A16
    lda #$0005 : adc.b obj.speed_x : sta.b obj.speed_x
    lda #$0002 : adc.b obj.speed_y : sta.b obj.speed_y
    !A8
.D06C:
    lda $3B
    beq .D074

    dec $3B
    bra .D07A

.D074:
    lda #$20 : sta $3B
    inc $3A
.D07A:
    !A16
    lda.b obj.pos_x+1
    cmp #$0738
    bcc .D086

    jmp .D1AB

.D086:
    !A8
    stz.b obj.direction
    jsl update_pos_xy
    lda $30
    bne .D0BB

    clc
    lda.w !obj_arthur.pos_x+0 : adc.b obj.speed_x+0 : sta.w !obj_arthur.pos_x+0
    lda.w !obj_arthur.pos_x+1 : adc.b obj.speed_x+1 : sta.w !obj_arthur.pos_x+1
    lda.w !obj_arthur.pos_x+2 : adc #$00           : sta.w !obj_arthur.pos_x+2
    lda.b obj.pos_y : sta.w !obj_arthur.pos_y
    !A16
    lda.b obj.pos_y+1 : sec : sbc #$0010 : sta.w !obj_arthur.pos_y+1
.D0BB:
    !AX16
    ldx $2D : ldy #$0002 : jsl set_spawn_offset_8C8A
    !AX8
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .D0CE

    rts

.D0CE:
    lda $30
    beq .D0D3
    rts

.D0D3:
    !A16
    stz.b obj.speed_x
    stz.b obj.speed_y
    !A8
    stz.b obj.speed_x+2
    stz.b obj.speed_y+2
    inc $0F
    lda #$18 : sta $3C
    lda #$F1 : jsl _018049_8053
    rts

;-----

.D0EC:
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    dec $3C
    bne .D0FE

    inc $0F
.D0FE:
    rts

;-----

.D0FF:
    !A16
    sec
    lda.b obj.pos_x+1
    cmp #$0464
    bcs .D10C

    jmp .D198

.D10C:
    !A8
    lda.w jump_counter
    beq .D159

    lda.w !obj_arthur.speed_y+2
    bmi .D159

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .D159

    lda #$3D : jsl _018049_8053
    lda #$01 : sta $0F
    inc $14C3
    lda.b obj.pos_y+1 : sec : sbc #$10 : sta.w !obj_arthur.pos_y+1
    lda.b obj.pos_x : sta.w !obj_arthur.pos_x
    lda.b obj.pos_y : sta.w !obj_arthur.pos_y
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    stz.b obj.speed_x+1
    stz.b obj.speed_y+1
    stz.b obj.speed_x+2
    stz.b obj.speed_y+2
    stz $30
    lda #$20 : sta $3B
    stz $3A
    jsl update_animation_normal
    jsl _018E32_8E73
    rts

.D159:
    lda $39
    inc
    sta $39
    lsr #2
    eor #$FF
    and #$03
    sta $25
    !A16
    lda #$0050 : sta.b obj.speed_x
    lda #$0020 : sta.b obj.speed_y
    !A8
    lda #$01 : sta.b obj.direction
    ldy #$03 : jsl set_speed_y
    jsl update_pos_xy
    !AX16
    ldx $2D : ldy #$0002 : jsl set_spawn_offset_8C8A
    !AX8
    jsl update_animation_normal
    jsl _018E32_8E73
    rts

.D198:
    !A16
    stz.b obj.speed_x
    stz.b obj.speed_y
    !A8
    stz.b obj.speed_x+2
    stz.b obj.speed_y+2
    jsl update_animation_normal
    stz $0F
    rts

;-----

.D1AB:
    !A8
    lda #$80 : sta.b obj.gravity
    stz.b obj.direction
    clc
    lda #$04 : sta $0F
    rts

;-----

.D1B9:
    jsl update_pos_xyg_add
    !AX16
    ldx $2D : ldy #$0002 : jsl set_spawn_offset_8C8A
    !AX8
    jsl update_animation_normal
    jsl _018E32_8E73
    lda #$F1 : jsl _018049_8053
    lda $09
    and #$40
    bne + : +: ;useless branch

    rts
}

namespace off
