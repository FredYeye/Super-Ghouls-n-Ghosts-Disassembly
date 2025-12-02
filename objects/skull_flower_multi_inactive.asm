namespace skull_flower_multi_inactive

{
create:
    jsl _03B114
.AD54:
    brk #$00

;----- AD56
    bit $09
    bvc .AD54

    lda #$06 : jsl _0195E4
    bcc .AD86

    !X16
    jsl _028B1E
    lda #!id_skull_flower_multi : jsl _029713_97F8
    lda #$04 : sta $07
.AD72:
    jsl _028B1E
    lda #!id_skull_flower_multi : jsl _029713_97F8
    inc $07
    lda $07
    cmp #$07
    bcc .AD72

    !X8
.AD86:
    jml _0281A8_81B5
}

namespace off
