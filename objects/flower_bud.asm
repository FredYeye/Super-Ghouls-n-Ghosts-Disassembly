namespace flower_bud

{
_EF6A:
    jmp _0281A8_81B5

create:
    lda $0292
    bne _EF6A

    brk #$00

;----- EF74

    lda.w stage
    beq .EF81

    ldy #$02 : jsl arthur_range_check_y
    bcs create

.EF81:
    brk #$00

;----- EF83

    lda $07 : asl : jsl _0195E4
    bcc create

    !X16
    lda $07 : sta $2D
    stz $2E
    jsr _028B1E_8B24
    lda #!id_flower_head : jsr _02E9FA_local
    jsr _EFC3
.EF9F:
    clc
    lda $07 : adc #$10 : sta $07
    jsr _028B1E_8B24
    lda #!id_flower_part : jsr _02E9FA_local
    jsr _EFC3
    lda $2E : eor #$01 : sta $2E : sta.w obj.direction,X
    dec $2D
    bne .EF9F

    !X8
    jmp _0281A8_81B5

;-----

_EFC3:
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    !A8
    rts
}

namespace off
