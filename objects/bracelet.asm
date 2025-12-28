namespace bracelet

{
_01EB18:
    jsr get_weapon_slot_local
    bmi .EB4A

    lda $0008,X : ora #$81 : sta $0008,X
    lda #$0C : sta.w obj.active,X
    lda #!id_bracelet_tail : sta.w obj.type,X
    lda $07 : sta $0007,X
    lda.b obj.direction : sta.w obj.direction,X : sta.w obj.facing,X
    lda $34 : sta $0034,X
    stz $0031,X
    jsl set_spawn_offset
    !X8
.EB4A:
    rts

;-----

create:
    lda #$3A : jsl _018049_8053
    jsr _01DD90
    lda $09 : ora #$42 : sta $09
    stz $40
    lda $09 : ora #$80 : sta $09
    lda #$12 : sta.b obj.hp
    stz $14F4
    stz $31
    ldy #$92 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $2D
    lda.w armor_state
    sta $07
    pha
    jsr _EC24
    jsr _EC30
    lda #$02 : jsl _019580
    lda #$D4 : sta $1D
    stz $07
    jsr _01EB18
    inc $07
    inc $1D : inc $1D
    jsr _01EB18
    inc $07
    inc $1D : inc $1D
    jsr _01EB18
    lda $35 : sta $2E
    pla : sta $07
.EBAB:
    brk #$00

;----- EBAD

    lda $14F4
    cmp $31
    bne .EBB8

    dec $2E
    bne .EBAB

.EBB8:
    lda #$0C : sta.b obj.hp
    lda #$01 : sta $14F4 : sta $31
    ldy #$94 : ldx #$21 : jsl set_sprite
    lda $35 : sta $2E
.EBCF:
    brk #$00

;----- EBD1

    lda $14F4
    cmp $31
    bne .EBDC

    dec $2E
    bne .EBCF

.EBDC:
    lda #$06 : sta.b obj.hp
    ldy #$94 : ldx #$21 : jsl set_sprite
    lda #$02 : sta $14F4 : sta $31
    lda $35 : sta $2E
.EBF3:
    brk #$00

;----- EBF5

    lda $14F4
    cmp $31
    bne .EC00

    dec $2E
    bne .EBF3

.EC00:
    ldy #$98 : ldx #$21 : jsl set_sprite
    lda #$03 : sta.b obj.hp
    lda #$03 : sta $14F4
    lda $35 : sta $2E
.EC15:
    brk #$00

;----- EC17

    dec $2E
    bne .EC15

    lda #$FF : sta $14F4
    jml _0280CB_remove_weapon

;-----

_EC24:
    ldx $07
    ldy.w bracelet_data_speed,X : sty $34
    jsl set_speed_x
    rts

;-----

_EC30:
    ldx $07
    lda.w bracelet_data_decay_rate,X : sta $35
    rts

;-----

thing:
    jsl update_pos_x
    jsl update_animation_normal
    jsl _01A4E2_A52B
    bcc .EC62

    lda $001E
    bne .EC62

    lda #$FF : sta $14F4
    lda #$8C : sta $00
    lda #$02 : sta $0F
    lda $08 : ora #$80 : sta $08
    asl $09 : lsr $09
.EC62:
    rtl
}

namespace off
