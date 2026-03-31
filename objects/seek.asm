namespace seek

{
create:
    lda $08 : ora #$80 : sta $08
    lda #$20 : cop #$00

;----- F5B3

    jsr _F65E
    lda #!sfx_magic_seek : jsl _018049_8053
    !X16
    ldx.w #!obj_objects.base
.F5C1:
    lda.w obj.active,X
    beq .F606

    lda.w obj.type,X
    cmp #!id_chest
    beq .F5D1

    cmp #!id_chest2
    bne .F606

.F5D1:
    lda $0031,X
    bne .F606

    !A16
    lda.w obj.pos_x+1,X
    adc #$0030
    sbc.w camera_x+1
    cmp #$0160
    bcs .F606

    lda.w obj.pos_y+1,X
    sbc.w camera_y+1
    cmp #$0100
    bcs .F606

    !A8
    ldy.w #chest_create_B6DE
    lda.w obj.type,X
    cmp #!id_chest
    beq .F600

    ldy.w #chest2_create_B691
.F600:
    !A16
    tya : sta.w obj.state+1,X
.F606:
    !A16
    clc
    txa
    adc.w #obj.ext.len
    cmp.w #obj_start+obj[50] ;end of obj_object
    tax
    !A8
    bcc .F5C1

    !X8
    lda #$40 : cop #$00

;----- F61B

    jsr _F648
    cop #$00

;----- F620

    jsr _F65E
    cop #$00

;----- F625

    jsr _F648
    cop #$00

;----- F62A

    jsr _F65E
    cop #$00

;----- F62F

    jsr _F648
    cop #$00

;----- F634

    jsr _F65E
    cop #$00

;----- F639

    jsr _F648
    cop #$00

;----- F63E

    jsr _F653
    stz $14E3
    jml _028B0E

;-----

_F648:
    lda #$03 : sta $0332
    inc $0331
    lda #$04
    rts

;-----

_F653:
    lda #$00 : sta $0332
    inc $0331
    lda #$04
    rts

;-----

_F65E:
    lda #$06 : sta $0332
    inc $0331
    lda #$04
    rts

;-----

thing: ;unused
    rtl
}

namespace off
