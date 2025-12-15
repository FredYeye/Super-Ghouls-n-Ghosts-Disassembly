namespace _02EEEA

{
;unused

create:
    ldy #$94 : ldx #$22 : jsl set_sprite
    ldy #$FC : jsl set_speed_xyg
.EEF8:
    brk #$00

;----- EEFA

    jsl update_pos_xyg_add
    jsr _028074
    bra .EEF8
}

namespace off
