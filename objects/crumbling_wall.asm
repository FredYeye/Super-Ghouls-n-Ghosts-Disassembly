namespace crumbling_wall

{
create:
    lda #$32 : cop #$00

;----- C396

    !A16
.C398:
    brk #$00

;----- C39A

    lda.w !obj_arthur.pos_x+1
    cmp #$01B0
    bcs .C398

    lda.w !obj_arthur.pos_y+1
    cmp #$0412
    bcs .C398

    !A16
    stz $31
    stz $33
if !version == 0 ;crumbling wall becomes non-solid immediately in JP version
    lda #$E580 : sta $7EF7C2
endif
    !A8
if !version == 0
    lda #$00 : sta $7EF090 : sta $7EF091 : sta $7EF092 : sta $7EF093
endif
.C3CB:
    !AX8
    lda #$39 : jsl _018049_8053
    !AX16
.C3D5:
    ldy $31
    ldx.w crumbling_wall_data_D377,Y : jsr .C428
    !AX8
    lda #$17 : sta $031E
    lda #$0C : cop #$00

;----- C3E6

    !AX16
    lda $33
    cmp #$0008
    bne .C3D5

    stz $33
    lda $31
    cmp #$0006
    beq .C407

    inc $31 : inc $31
    lda $31
    cmp #$0006
    beq .C3D5

    bra .C3CB

.C407:
    !A16
    lda #$E580 : sta $7EF7C2
    !A8
    lda #$00 : sta $7EF090 : sta $7EF091 : sta $7EF092 : sta $7EF093
if !version == 1 || !version == 2
.C411:
    brk #$00

;----- C413

    lda #$17 : sta $031E
    !A16
    lda.w !obj_arthur.pos_y+1
    cmp #$02E0
    !A8
    bcs .C411
endif

    jml _0281A8_81B5

;-----

.C428:
    !A16
    lda #$0004 : sta $2D
.C42F:
    ldy $33
    lda.w crumbling_wall_data_D37D,Y
    tay
    lda #$0004 : sta $35
.C43A:
    lda $0000,Y : iny #2 : sta $7ED800,X
    lda $0000,Y : iny #2 : sta $7ED802,X
    lda $0000,Y : iny #2 : sta $7ED804,X
    lda $0000,Y : iny #2 : sta $7ED806,X
    txa : clc : adc #$0040 : tax
    dec $35
    bne .C43A

    dec $2D
    bne .C42F

    inc $33 : inc $33
    !AX8
    rts
}

namespace off
