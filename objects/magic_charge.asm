namespace magic_charge

{
create:
    lda $07 : asl : tax
    jmp (+,X) : +: dw .F802, .F850, .F85E

;-----

.F802:
    stz $35
    stz $29
    stz $2A
    lda.w !obj_arthur.facing : sta.b obj.facing
    ldy #$44 : ldx #$21 : jsl set_sprite
.F815:
    jsl update_animation_normal
    jsr .F841
    lda $08
    and #$F7
    tax
    lda $35
    and #$07
    cmp #$02
    beq .F831

    cmp #$03
    beq .F831

    txa : ora #$08 : tax
.F831:
    stx $08
    inc $35
    brk #$00

;----- F837

    lda $14EB
    bne .F815

    stz $00
    jmp _02821B_827A

;-----

.F841:
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    lda.w !obj_arthur.pos_y+1 : sta.b obj.pos_y+1
    !A8
    rts

;-----

.F850:
    lda #$10 : cop #$00

;----- F854

    ldy #$16 : ldx #$21 : jsl set_sprite
    bra .F866

.F85E:
    ldy #$18 : ldx #$21 : jsl set_sprite
.F866:
    !A16
    lda.w _00ED00+$36 : sta $27
    lda #$0050 : sta $29
    !A8
    lda #$FF : sta $26
.F878:
    jsr .F841
    jsl update_animation_normal
    jsl _018E32_8E79
    brk #$00

;----- F885

    bra .F878
}

namespace off
