namespace stage4_transform

{
create:
    lda #$80 : sta $08
    !X16
.F6CC:
    brk #$00

;----- F6CE

    ldx.w !obj_arthur.pos_x+1
    cpx #$01C0
    bcc .F6CC

    jsr .F71A
.F6D9:
    brk #$00

;----- F6DB

    lda $1F2B
    cmp #$20
    bne .F6D9

    ldx.w !obj_arthur.pos_x+1
    cpx #$0300
    bcs .F6D9

    jsr .F71A
.F6ED:
    brk #$00

;----- F6EF

    lda $1F2B
    cmp #$80
    bne .F6ED

    ldx.w !obj_arthur.pos_x+1
    cpx #$0100
    bcs .F6ED

    jsr .F71A
.F701:
    brk #$00

;----- F703

    lda $1F2B
    cmp #$40
    bne .F701

    ldx.w !obj_arthur.pos_x+1
    cpx #$0100
    bcs .F701

    jsr .F71A
    !X8
    jmp _0281A8_81B5

;-----

.F71A:
    !X8
    inc $1F97
    stz $31
    pla
    sta $2F
    pla
    sta $30
    lda #$08 : sta $2D
.F72B:
    lda #$8D : sta $031E
    lda #$07 : cop #$00

;----- F734

    lda #$8A : sta $031E
    lda #$07 : cop #$00

;----- F73D

    dec $2D
    bne .F72B

    jsr .F7A1
    stz $0326
    lda #$13 : sta $0327
.F74C:
    lda #$8B : sta $031E
    lda #$07 : cop #$00

;----- F755

    lda #$8C : sta $031E
    lda #$07 : cop #$00

;----- F75E

    lda $31
    bne .F76B

    lda $1F91
    beq .F74C

    inc $31
    bra .F74C

.F76B:
    lda $1F91
    bne .F74C

    jsl _0190B9 ;set palette back to normal
    lda #$10 : sta $0326
    lda #$03 : sta $0327
    lda #$8B : sta $031E
    lda #$07 : cop #$00

;----- F787

    lda #$8A : sta $031E
    lda #$07 : cop #$00

;----- F790

    lda #$8D : sta $031E
    lda $30 : pha
    lda $2F : pha
    !X16
    stz $1F97
    rts

;-----

.F7A1:
    !A16
    ldx #$1E
.F7A5:
    lda.l palette_cycling_84EC+$00,X : sta $7EF462,X
    lda.l palette_cycling_84EC+$1E,X : sta $7EF4E2,X ;copies one value too much (non palette data)
    dex #2
    bpl .F7A5

    !A8
    inc $0331
    rts
}

namespace off
