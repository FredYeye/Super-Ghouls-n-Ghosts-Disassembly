namespace flower_part

{
create:
    jsr _02F13E_F15F
    lda $07
    stz $0F
    pha
    and #$0F
    sta $38
    pla
    lsr #4
    cmp $38
    bne .F18B

    inc $0F
.F18B:
    stz $31
    stz $32
    lda #$08 : sta $33
    ldy #$0C : jsl set_speed_y
    ldy #$21 : jsl set_speed_x
    lda $0F
    asl
    tax
    jmp (+,X) : +: dw .F1AA, .F1CD

;-----

.F1AA:
    brk #$00

;----- F1AC

    lda $32 ;wake up bool?
    beq .F1AA

    jsr .F256
.F1B3:
    brk #$00

;----- F1B5

    lda $31
    beq .F1B3

.F1B9:
    jsl update_pos_y
    jsr _02F13E
    brk #$00

;----- F1C2

    lda $31
    bne .F1B9

.F1C6:
    jsr _02F13E
    brk #$00

;----- F1CB

    bra .F1C6

;-----

.F1CD:
    brk #$00

;----- F1CF

    !A16
    lda.w #_00CEB6 : sta $13
    !A8
    stz $15
    ldy #$B4    ;bug: should be ldx!
    jsl _0196EF ;x will always be 8 for this call!
    sta $2D     ;possible values: 2, 4, 6
.F1E2:
    brk #$00

;----- F1E4

    ;intended ranges: $006E, $0060, $0080, $0020
    ;possible ranges: $0200, $0040, $0090
    ldy $2D : jsl arthur_range_check_x
    bcs .F1E2

    jsr .F256
    !X16
    lda $38 : sta $3B
    ldy $2F
.F1F7:
    tyx
    inc $0032,X
    ldy $002F,X
    dec $3B
    bne .F1F7

    stx $39
    !X8
    ldx #$5C : jsl _0196EF
    cop #$00

;----- F20E

    lda #!sfx_grow : jsl _018049_8053
    !X16
    lda $38 : sta $3B
    ldx $39
    inc $0031,X
    ldy $002D,X
    sty $39
    lda #$10 : cop #$00

;----- F228

    dec $3B
.F22A:
    ldx $39
    inc $0031,X
    ldy $002D,X
    sty $39
    lda #$13 : cop #$00

;----- F238

    dec $3B
    bne .F22A

    ldy $2F
    lda $38 : sta $3B
.F242:
    tyx
    stz $0031,X
    ldy $002F,X
    dec $3B
    bne .F242

    !X8
.F24F:
    brk #$00

;----- F251

    jsr _02F13E
    bra .F24F

;-----

.F256:
    ldy #$92 : ldx #$22 : jsl set_sprite
    rts

;-----

thing:
    lda.b obj.gravity ;not used as gravity
    cmp.w current_cage
    bne .F26C

    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C

.F26C:
    jsl update_animation_normal
    lda $07
    beq + : +: ;leftover branch
    rts

;-----

flower_head_destroy:
    jsr _02F13E_F151
    jsr _028BDE_local
    lda $07 : ldy #$08 : ldx #$08 : jsr _028B7E
    bra destroy_F28A

destroy:
    lda $31 : cop #$00
.F28A:
    lda #$3B : jsl _018049_8053
    ldy #$76 : ldx #$20 : jsl set_sprite
    lda #$1F : sta $2D
.F29C:
    brk #$00

;----- F29E

    jsl update_animation_normal
    dec $2D
    bne .F29C

    jmp _0281A8_81B5
}

namespace off
