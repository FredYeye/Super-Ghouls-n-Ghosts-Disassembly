namespace siren

{
create:
    ldx #$02 : jsl _018D5B
    jsl set_hp
    lda #$04 : sta $08
    !A16
    lda.w _00ED00+$2A : sta $27
    !A8
    lda #$20
    stz $38
    sta $10
    lda #$FF : sta $26
    lda #$60 : sta $09
    ldy #$C2 : ldx #$21 : jsl set_sprite
    jsl _018E32_8E73
    inc.b obj.direction
    inc.b obj.facing
    lda #$FF : sta $2D
.E463:
    brk #$00

;----- E465

    bit $09
    bvc .E463

.E469:
    brk #$00

;----- E46B

    lda $188D
    eor #$FF
    inc
    clc
    adc #$A0
    sta.b obj.pos_y+1
    adc #$08
    cmp $009F
    bcs .E485

    lda $08 : ora #$08 : sta $08
    bra .E48B

.E485:
    lda $08 : and #$F7 : sta $08
.E48B:
    dec $2D
    bne .E469

    lda $08
    and #$08
    beq .E499

    inc $2D
    bra .E469

.E499:
    stz $08
    stz $09
    !A16
    lda.b obj.pos_x+1 : adc #$0020 : sta.b obj.pos_x+1
    lda #$0320 : sta.b obj.pos_y+1
    !A8
    lda #$40 : cop #$00

;----- E4B1

    ldy #$0F : jsl set_speed_y
    jsl _02F9DA
.E4BB:
    ldy #$CA : ldx #$21 : jsl set_sprite
.E4C3:
    brk #$00

;----- E4C5

    jsl update_animation_normal
    jsl _018E32_8E73
    jsl update_pos_y
    lda $38
    beq .E4C3

.E4D5:
    ldy #$A6 : ldx #$21 : jsl set_sprite
.E4DD:
    brk #$00

;----- E4DF

    ldy #$14 : jsl arthur_range_check
    bcs .E4DD

    ldy #$21 : jsl set_speed_xyg
    lda #$04 : sta $38
    lda #$04 : sta $07
    lda #$04 : sta $1D
    lda #!id_splash : jsl prepare_object
.E4FF:
    ldy #$A4 : ldx #$21 : jsl set_sprite
.E507:
    brk #$00

;----- E509

    jsl update_pos_xyg_add
    lda $38
    cmp #$02
    bne .E507

    ldy #$A6 : ldx #$21 : jsl set_sprite
    lda #!id_splash : jsl prepare_object
    ldx.w difficulty
    lda.w siren_data_CD32,X : cop #$00 ;mistake: no base timer! it's using the difficulty modifier as a raw timer

;----- E529

    ldy #$A8 : ldx #$21 : jsl set_sprite
.E531:
    brk #$00

;----- E533

    lda $24
    cmp #$77
    bne .E531

    ldx #$5E : jsl _0196EF : sta $39
    lda #$0C : sta $1D
    lda #$35 : jsl _018049_8053
    lda #$03
.E54D:
    pha
    ldx $39
    inc $39
    lda.w siren_data_CD3A,X : sta $3C
    jsr _E5EF
    pla
    dec
    bne .E54D

    ldx.w difficulty
    lda.w siren_data_CD36,X : cop #$00

;----- E566

    jmp .E4D5

;-----

destroy:
    lda.b obj.hp
    bne .E570

    jmp _028BEC

.E570:
    ldy #$AA : ldx #$21 : jsl set_sprite
    jsl _02F9DA_F9E0
.E57C:
    brk #$00

;----- E57E

    lda $24
    cmp #$70
    bne .E57C

    ldx $38
    jmp (+,X) : +: dw create_E4BB, create_E4D5, create_E4FF

;-----

thing:
    jsl get_arthur_relative_side : sta.b obj.direction : sta.b obj.facing
    jsr .E5B0
    jsl update_animation_normal
    jsl _018E32_8E73
    ldy #$02 ;does nothing?
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
    jmp _028074_8087

;-----

.E5B0:
    ldx $38
    jmp (+,X) : +: dw .E5BB, .E5CB, .E5D9

.E5BB:
    !A16
    lda $009F
    clc
    adc #$FFF8
    cmp.b obj.pos_y+1
    !A8
    bcs .E5E9

    rts

.E5CB:
    !A16
    lda $009F
    clc
    adc #$FFF8
    sta.b obj.pos_y+1
    !A8
    rts

.E5D9:
    !A16
    lda $009F
    clc
    adc #$FFF8
    cmp.b obj.pos_y+1
    !A8
    bcc .E5E9

    rts

.E5E9:
    lda #$02 : sta $38
    bra .E5CB

;-----

_E5EF:
    jsl get_object_slot
    bmi .E612

    sta $0007,X
    lda #!id_siren_projectile : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda $3C : sta $003C,X
    lda.b obj.direction : sta.w obj.direction,X
    jsl set_spawn_offset
    !X8
.E612:
    rts
}

namespace off
