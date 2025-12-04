namespace cockatrice_head2_spawner

{
create:
    lda $07 : sta $3C
    stz $07
    !A16
    lda.b obj.pos_x+1 : sta $0036 ;todo: does this do anything? mistake?
    lda.b obj.pos_y+1 : sta $0038
    !A8
    stz $1EBD
.C5D0:
    brk #$00

;----- C5D2

    lda #$10 : jsl _0195E4
    bcs .C5DD

    jmp .C5D0

.C5DD:
    !AX16
    tya
    clc
    adc #$0010
    tay
    !A8
    inc $07
    lda #$06 : sta $0F
    phd
    plx
.C5EF:
    phx
    jsl _028B2A
    lda #!id_cockatrice_head2 : jsl _02EB57_far
    jsr _C690
    pla : sta $002D,X
    lda $3C : sta $003C,X
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    stz $0031,X
    !A8
    dec $0F
    bne .C5EF

    stx $3A
    phx
    lda #$04 : sta $07
    jsl _028B2A
    lda #!id_cockatrice_head2 : jsl _02EB57_far
    jsr _C690
    pla : sta $002D,X
    lda $3C : sta $003C,X
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    stz $0031,X
    !A8
    stx $34
    stz $07
    jsl _028B2A
    lda #!id_cockatrice_head2 : jsl _02EB57_far
    !A16
    jsr _C690
    lda $3A : sta $002F,X
    lda $3C : sta $003C,X
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    lda $34 : sta $003A,X
    phx
    pla
    ldx $34
    sta $002F,X
    !AX8
    stz $33
.C67C:
    brk #$00

;----- C67E

    lda $33
    beq .C67C

    jml _0281A8_81B5

;-----

thing: ;unused
    rtl

;-----

destroy: ;unused
    inc $1FAD
    stz $33
    jml _0281A8_81B5

;-----

_C690:
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    stz $0024,X
    rts
}

namespace off
