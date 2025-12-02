namespace rosebud_chunk

{
create:
    lda.w stage
    bne .C09F

    inc $08
.C09F:
    lda #$10 : sta $09
    lda $07 : asl : tax
    jmp (+,X) : +: dw .C0AE, .C0E9

;-----

.C0AE: ;explosion sprites, i guess
    ldx.b obj.direction
    lda.w rosebud_chunk_data_explosion_timer,X : cop #$00

;----- C0B5

    lda.b obj.direction
    cmp #$04
    beq .C0C6

    asl
    sta.b obj.direction
    lda #$0C : ldx #$30 : jsl _0189D9
.C0C6:
    jsl _02F9DA
    lda #$19 : sta $3C
    ldy #$D0 : ldx #$21 : jsl set_sprite
    jsr _02C3FB
.C0D9:
    brk #$00

;----- C0DB

    lda $1EB8
    bne .C0E6

    lda $24
    cmp #$70
    bne .C0D9

.C0E6:
    jmp _0281A8_81B5

;-----

.C0E9:
    jsl _02F9DA
    ldy #$D2 : ldx #$21 : jsl set_sprite
    jsr _02C3FB
    lda #$C0 : sta $3B
.C0FC:
    brk #$00

;----- C0FE

    ldx #$2C : jsl update_pos_xy_2
    dec $3B
    bne .C0FC

    lda #$10 : ora $08 : sta $08
    lda #$40 : sta $3B
.C112:
    brk #$00

;----- C114

    ldx #$2C : jsl update_pos_xy_2
    dec $3B
    bne .C112

    jmp _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    lda $07
    bne .C139

    lda $25
    bne .C138

    ldy #$22 : jsr _02FF22
    jsr _02FA37_FA65
    jmp _02FD62_FD6A

.C138:
    rts

.C139:
    ldy #$02 : jsr _02FF22
    jsr _02FA37_FA65
    jsr _02FD62_FD7C
    jmp _028074_8087
}

namespace off
