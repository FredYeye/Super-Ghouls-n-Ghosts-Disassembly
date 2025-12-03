namespace icicle

{
create:
    lda #$01 : sta $08
    stz $34
    !A16
    lda #enemy_spawner_data_C15D : sta $13
    !A8
    ldx $07
    lda.w enemy_spawner_data_C096,X : sta $3B
    cpx #$00
    bne .9C29

    ldy #$F0 : ldx #$21 : jsl set_sprite
.9C1D:
    brk #$00

;----- 9C1F

    jsl update_animation_normal
    dec $3B
    bne .9C1D

    inc $3B
.9C29:
    brk #$00

;----- 9C2B

    dec $3B
    bne .9C29

    inc $0F
    ldy #$A8 : ldx #$21 : jsl set_sprite
    lda $07
    bne .9C4C

    jsl set_hp
    clc
    lda #$16 : adc $33 : jsl _019662 : sta $30
.9C4C:
    !X16
    ldx $31
    lda $0030,X
    !X8
    clc
    adc $07
    tax
    lda.w enemy_spawner_data_C0FD,X : sta.b obj.direction
    ldx #$08 : jsl _018BBF
    jsr .9CB0
    lda $07
    beq .9C7C

    jsr .9CC1
    jsl _02F9DA_F9E0
    lda #$30 : cop #$00

;----- 9C76

    inc $34
.9C78:
    brk #$00

;----- 9C7A

    bra .9C78

.9C7C:
    lda #!sfx_grow : jsl _018049_8053
    jsl _02F9DA_F9E0
    lda #$30 : cop #$00

;----- 9C8A

    inc $34
.9C8C:
    brk #$00

;----- 9C8E

    jsr _028053_local
    bcc .9C8C

    ;remove icicle
    dec $1AEF ;todo: obj_type_count + id_icicle + 4 (?)
    lda $2F : sta $0000 ;2F = parts count?
    phd
.9C9C:
    !X16
    ldx $2D
    phx
    pld
    !X8
    jsr _0281BB
    dec $0000
    bne .9C9C

    pld
    jmp _0281A8_81B5

;-----

.9CB0:
    lda.b obj.direction
    and #$07
    ldx #$0C
    jsl mulu
    !A16
    sta $0C
    !A8
    rts

;-----

.9CC1:
    !AX16
    ldx $2F
    lda.w obj.pos_x+1,X : clc : adc.w obj.speed_x+1,X : clc : adc.b obj.speed_x+1 : sta.b obj.pos_x+1
    lda.w obj.pos_y+1,X : clc : adc.w obj.speed_y+1,X : clc : adc.b obj.speed_y+1 : sta.b obj.pos_y+1
    !AX8
    rts

;-----

destroy:
    lda $07
    bne .9CF8

    ldy #$0F : jsl update_score
    lda #!sfx_shatter : jsl _018049_8053
.9CF0:
    dec $1AEF ;obj_type_count + id_icicle + 4 (?)
    lda $2F : jsr _028B52_local
.9CF8:
    lda $0F
    beq .9D34

    !X8
    bit $09
    bvc .9D34

    ldy #$AA : ldx #$21 : jsl set_sprite
    lda #$20 : jsl _0187E5
.9D10:
    brk #$00

;----- 9D12

    jsl update_animation_normal
    jsl update_pos_xyg_add
    jsl _01A559
    bne .9D2E

    lda $24
    cmp #$70
    bne .9D10

    bra .9D34

.9D28:
    brk #$00

;----- 9D2A

    jsl update_animation_normal
.9D2E:
    lda $24
    cmp #$70
    bne .9D28

.9D34:
    jmp _0281A8_81B5

;-----

thing:
    lda $1FAF
    bne .9D4A

    jsr _02FB2B
    jsr _02FAC0
    lda $34
    beq .9D49

    jmp _02FD62_FD7C

.9D49:
    rts

.9D4A:
    !AX16
    ldx $31
    stz $0008,X
    lda #destroy_9CF0 : sta.w obj.state+1,X
    !AX8
    rts
}

namespace off
