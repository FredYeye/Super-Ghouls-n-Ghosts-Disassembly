namespace pier_splinter

{
create:
    ldx #$7A : jsl _0196EF : sta $2D
    lda #$50 : sta.b obj.speed_y
    stz.b obj.speed_y+1
    stz.b obj.speed_y+2
.CEC4:
    brk #$00

;----- CEC6

    jsl update_pos_y
    dec $2D
    bne .CEC4

    ldx #$7C : jsl _0196EF : asl : tax
    jmp (+,X) : +: dw .CEE1, .CEEB, .CEF5, .CEF5 ;last offset is unused

;-----

.CEE1:
    ldy #$DC : ldx #$21 : jsl set_sprite
    bra .CEFD

.CEEB:
    ldy #$DE : ldx #$21 : jsl set_sprite
    bra .CEFD

.CEF5:
    ldy #$E0 : ldx #$21 : jsl set_sprite
.CEFD:
    ldy #$1D : jsl set_speed_xyg
.CF03:
    brk #$00

;----- CF05

    jsl update_animation_normal
    jsl update_pos_xyg_add
    lda $09
    and #$40
    bne .CF03

    jmp _0281A8_81B5
}

namespace off
