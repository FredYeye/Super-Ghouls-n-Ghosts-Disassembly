namespace death_crawler

{
create:
    lda #$C0 : sta $09
    lda #$04 : sta $1D
    lda #$20 : sta $2D
    jsl set_hp
    lda.b obj.hp : sta $3C
    bra death_crawler_part_create_B5AB

;-----

thing:
    lda $1EC7
    beq .B620

    jsl _02F9B2
    jsl _02F9CA
    jsl _02F9FA
.B620:
    lda.b obj.hp
    cmp $3C
    beq .B634

    sta $3C
    ldx #$03 : jsl _028048
    lda #!sfx_hit : jsl _018049_8053
.B634:
    rtl

;-----

destroy:
    inc $1ED7
    jml _0281A8_81B5
}

namespace off
