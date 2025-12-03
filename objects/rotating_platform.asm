namespace rotating_platform

{
create:
    lda #$01 : sta $08
    lda #$80 : sta $09
    stz $2D
    !A16
    lda.w _00ED00+$38 : sta $27
    lda #$01D8 : sta $29
    !A8
    lda #$FF : sta $26
.F5CE:
    ldy #$C4 : ldx #$21 : jsl set_sprite
.F5D6:
    brk #$00

;----- F5D8

    lda $2D
    bne .F5D6

    lda #$09 : jsr _02FE1E_local
    bit $09
    bvc .F5D6

    lda $07
    cmp $1F93
    bne .F5D6

    lda.w !obj_arthur.hp
    bmi .F5D6

    lda.w jump_counter
    bne .F5D6

    lda $14C3
    beq .F5D6

    ldy #$18 : jsl arthur_range_check
    bcs .F5D6

    inc $2D
    lda.b #_01DDFC    : sta.w !obj_arthur.state+1
    lda.b #_01DDFC>>8 : sta.w !obj_arthur.state+2
    inc $14F5
    lda $0276 : ora #$04 : sta $0276
    lda.w !obj_arthur.flags1 : ora #$80 : sta.w !obj_arthur.flags1
    ldy #$C6 : ldx #$21 : jsl set_sprite
    !A16
    lda.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
    !A8
    lda #$1F : cop #$00

;----- F537

    ldx #$03
    lda $07
    cmp #$01
    bne .F641

    ldx #$02
.F641:
    stx $19E9
    asl
    tax
    lda.w rotating_platform_data_CED0+0,X : sta $1F92
    lda.w rotating_platform_data_CED0+1,X : sta $1F91
    lda #$02 : sta $1F94
    lda #$5B : jsl _018049_8053
.F65D:
    brk #$00

;----- F65F

    !A16
    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    clc : lda.w !obj_arthur.pos_y+1 : adc #$0018 : sta.b obj.pos_y+1
    !A8
    lda $1F91
    bne .F65D

    inc $1F93
    lda #$5C : jsl _018049_8053
    ldy #$C8 : ldx #$21 : jsl set_sprite
    lda #$1F : cop #$00

;----- F68B

    lda.w !obj_arthur.hp
    bmi .F6A1

    lda !armor_state : asl : tax
    lda.w rotating_platform_data_CED8+0,X : sta.w !obj_arthur.state+1
    lda.w rotating_platform_data_CED8+1,X : sta.w !obj_arthur.state+2
.F6A1:
    lda $0276 : and #$FB : sta $0276
    stz $14F5
    jmp .F5CE

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda $1F91
    bne .F6C5

    lda $2D
    beq .F6C5

    lda #$09 : jsr _02FE1E_local
.F6C5:
    rts
}

namespace off
