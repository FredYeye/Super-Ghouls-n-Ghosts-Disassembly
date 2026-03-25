namespace tornado

{
create:
    jsr _01F5A9_F648
    lda #$04 : cop #$00

;----- F26B

    jsr _01F5A9_F653
    lda.b #!sfx_magic_tornado : jsl _018049_8053
    lda.b obj.facing
    bne .F279

    dec
.F279:
    sta $2D
    lda #$06 : sta.b obj.hp
    lda $09 : ora #$C2 : sta $09
    stz $40
    ldy #$9A : ldx #$20 : jsl set_sprite
    lda #$04 : sta.b obj.direction
    lda #$08 : sta $3B
    lda #$10 : sta $2E
.F29B:
    brk #$00

;----- F29D

    lda $09 : ora #$40 : sta $09
    dec $3B
    bne .F2C2

    lda.b obj.direction : clc : adc $2D : and #$0F : sta.b obj.direction
    ldx $0F
    lda.w tornado_data+0,X
    beq .F2CE

    sta $3B
    lda.w tornado_data+1,X : sta $2E
    inx #2
    stx $0F
.F2C2:
    lda $2E : ldx #$12 : jsl _0189D9
    bra .F29B

.F2CC:
    brk #$00

;----- F2CE

.F2CE:
    lda $2E : ldx #$12 : jsl _0189D9
    bra .F2CC

;-----

thing:
    bit $09
    bvc .F2EA

    jsl update_animation_normal
    lda.w frame_counter
    and #$0F
    bne .F2E9

    inc $40
.F2E9:
    rtl

.F2EA:
    jml _028B17
}

namespace off
