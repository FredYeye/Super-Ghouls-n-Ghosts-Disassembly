namespace explosion_spawner

{
create:
    ldx $07
    jmp (+,X) : +: dw .C1F9, .C24F, .C22F, .C229, .C25F

;-----

.C1F9:
    lda #$04 : jsr _C2B2
.C1FE:
    ldx $0F
    !A16
    lda.b obj.speed_x+1 : adc.w explosion_spawner_data+0,X : sta.b obj.pos_x+1
    lda.b obj.speed_y+1 : adc.w explosion_spawner_data+2,X : sta.b obj.pos_y+1
    !A8
    lda #!id_explosion_spawner : jsl prepare_object
    lda #$06 : cop #$00

;----- C21C

    lda $0F : clc : adc #$04 : sta $0F
    cmp #$28
    bne .C1FE

    bra .C24B

;-----

.C229:
    ldy #$18 : ldx #$22
    bra .C233

;-----

.C22F:
    ldy #$76
    ldx #$20

.C233:
    jsl set_sprite
    lda #$16 : sta $3B
    lda #$3B : jsl _018049_8053
.C241:
    brk #$00

;----- C243

    jsl update_animation_normal
    dec $3B
    bne .C241

.C24B:
    jml _0281A8_81B5

;-----

.C24F:
    lda #$14 : sta $2D
    stz $2E
    stz $2F
    lda #$07 : sta $30
    lda #$06
    bra .C26F

.C25F:
    lda #$40 : sta $2D
    lda #$10 : sta $2E : sta $2F
    lda #$0F : sta $30
    lda #$06
.C26F:
    jsr _C2B2
.C272:
    jsl get_rng_16
    and $30
    asl
    clc
    adc $2E
    tax
    !A16
    lda.b obj.speed_x+1 : adc.w explosion_spawner_data_D295,X : sta.b obj.pos_x+1
    !A8
    jsl get_rng_16
    and $30
    asl
    clc
    adc $2F
    tax
    !A16
    lda.b obj.speed_y+1 : adc.w explosion_spawner_data_D2C9,X : sta.b obj.pos_y+1
    !A8
    lda #!id_explosion_spawner : jsl prepare_object
    lda #$04 : cop #$00

;----- C2A8

    inc $0F
    lda $0F
    cmp $2D
    bne .C272

    bra .C24B

;-----

_C2B2:
    sta $07
    lda #$04 : sta $1D
    !A16
    lda.b obj.pos_x+1 : sta.b obj.speed_x+1
    lda.b obj.pos_y+1 : sta.b obj.speed_y+1
    !A8
    rts
}

namespace off
