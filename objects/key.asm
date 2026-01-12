namespace key

{
create:
    !AX8
    lda #$90 : sta $09
    ldy #$FA : ldx #$20 : jsl set_sprite
    stz.b obj.facing
    lda $08 : ora #$03 : sta $08
    stz $0000
    lda.w stage
    cmp #$08
    bne .EBF7

    stz $0000
    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    bne .EBF7

    inc $0000
.EBF7:
    lda.w stage
    clc
    adc $0000
    asl #2
    tax
    stz $37
    stz $3A
    !A16
    lda.w key_data_CE81,X : sta $38
    inx #2
    lda.w key_data_CE81,X : sta $3B
    lda.w #key_data_CEA9 : sta $13
    lda.w _00ED00+$2C : sta $27
    lda #$00BC : sta $29
    !A8
    stz $15
    stz $32
    sec
    lda $3A : sbc.b obj.pos_y+0 : sta $35
    lda $3B : sbc.b obj.pos_y+1 : sta $36
    lda $3C : sbc.b obj.pos_y+2 : sta $0001
    bcs .EC54

    ;unused branch? what does it do?
    sec
    lda.b obj.pos_y+0 : sbc $3A : sta $35
    lda.b obj.pos_y+1 : sbc $3B : sta $36
    lda.b obj.pos_y+2 : sbc $3C : sta $0001
    inc $32
.EC54:
    stz $31
    sec
    lda $37 : sbc.b obj.pos_x+0 : sta $33
    lda $38 : sbc.b obj.pos_x+1 : sta $34
    lda $39 : sbc.b obj.pos_x+2 : sta $0000
    bcs .EC82

    sec
    lda.b obj.pos_x+0 : sbc $37 : sta $33
    lda.b obj.pos_x+1 : sbc $38 : sta $34
    lda.b obj.pos_x+2 : sbc $39 : sta $0000
    inc $31
.EC82:
    !A16
    lda $0000
    lsr
    lda $33
    ror
    lsr #5
    sta $33
    bne .EC99

    lda #$0001 : sta $33
.EC99:
    lda $0001
    lsr
    lda $35
    ror
    lsr #5
    sta $35
    bne .ECAE

    lda #$0001 : sta $35
.ECAE:
    !A8
    lda #$FF : sta $26
    brk #$00

;----- ECB6

    jsl get_object_slot
    bmi .ECAE

    !X16
    stx $2D
    stz $0007,X
    lda #!id_key_message : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    !X8
    ldy #$2C : jsl set_speed_xyg
    stz $0F
.ECD7:
    brk #$00

;----- ECD9

    jsl update_animation_normal
    jsl _018E32_8E73
    lda $0F
    cmp #$07
    beq .ECD7

    lda $31
    bne .ED00

    clc
    lda.b obj.pos_x+0 : adc $33  : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : adc $34  : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : adc #$00 : sta.b obj.pos_x+2
    bra .ED13

.ED00:
    sec
    lda.b obj.pos_x+0 : sbc $33  : sta.b obj.pos_x+0
    lda.b obj.pos_x+1 : sbc $34  : sta.b obj.pos_x+1
    lda.b obj.pos_x+2 : sbc #$00 : sta.b obj.pos_x+2
.ED13:
    lda $32
    bne .ED2C

    clc
    lda.b obj.pos_y+0 : adc $35  : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : adc $36  : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : adc #$00 : sta.b obj.pos_y+2
    bra .ED3F

.ED2C: ;unused branch? gets reached if previous unused(?) branch is taken
    sec
    lda.b obj.pos_y+0 : sbc $35 : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : sbc $36 : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : sbc #$00 : sta.b obj.pos_y+2
.ED3F:
    jsl update_pos_xyg_add
    lda $1B
    bmi .ECD7

    !A16
    lda.b obj.pos_y+1
    sec
    sbc $3B
    !A8
    bcs .ED55

    jmp .ECD7

.ED55:
    lda #$07 : sta $0F
    jmp .ECD7

;-----

thing:
    lda.w jump_counter
    bne .ED8A

    lda $0F
    cmp #$07
    bne .ED8A

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .ED8A

    lda.w !obj_arthur.hp
    bmi .ED8A

    inc $1F9E
    jsl _01DDAE
    lda.w stage : asl : tax
    jsr (.ED8B,X)
    lda #$8C : sta.b obj.active
    lda $09 : and #$7F : sta $09
.ED8A:
    rts

.ED8B: dw .ED9D, .ED9E, .ED9D, .ED9D, .ED9D, .ED9D, .EDB5, .EDB5, .EDA7

;-----

.ED9D:
    rts

;-----

.ED9E:
    ldy #$90 : lda.b #_01FF00_44 : jsl _01A6FE
    rts

;-----

.EDA7:
    lda.w loop
    beq .EDBB

    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    bne .EDBB

.EDB5:
    lda #!id_gate2 : jsl prepare_object
.EDBB:
    rts

;-----

destroy:
    lda.w stage
    cmp #$08
    bne .EDE4

    lda.w loop
    beq .EDD1

    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    beq .EDE4

.EDD1:
    !AX16
    ldy $2D : jsr remove_child_object
    !AX8
    lda #!id_princess_dialogue : jsl prepare_object
    jml _0281A8_81B5

.EDE4:
    !AX16
    ldy $2D : jsr remove_child_object
    !AX8
    lda.w p1_button_hold+1
    and #!up
    beq .EE0D

    ;nice catch
    jsl get_object_slot
    !X16
    stx $2D
    lda #$02 : sta $0007,X
    lda #!id_key_message : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    !X8
.EE0D:
    jsl get_object_slot
    !X16
    stx $2D
    lda #$01 : sta $0007,X
    lda #!id_key_message : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    !X8
    ldy #$57 : jsl update_score
    lda #$72 : sta $1D
    lda.w stage
    beq .EE3C

    cmp #$05
    beq .EE3C

    jmp _0281A8_81B5

.EE3C:
    lda #!id_gate : jsl prepare_object
    jmp _0281A8_81B5
}

namespace off
