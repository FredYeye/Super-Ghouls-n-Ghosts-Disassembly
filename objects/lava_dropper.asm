namespace lava_dropper

{
create:
    !AX8
    brk #$00

;----- C477

    jsl _028166
    !A16
    lda.w !obj_arthur.pos_y+1
    cmp.b obj.pos_y+1
    bcc create

    lda.w !obj_arthur.pos_y+1
    sec
    sbc #$0060
    cmp.b obj.pos_y+1
    bcs create

    !A8
    ldy #$24 : jsl arthur_range_check
    bcs create

    ldx #$9C : jsl _0196EF
    sta $35
    dec
    asl
    sta $34
    dec $35
    dec $35
    lda $34
    jsl _0195E4
    bcc create

    !X16
    jsl _028B1E
    stz $0007,X
    lda #$01 : sta $000F,X
    lda #!id_lava : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    sty $3C
    !AX8
    lda #$70 : sta $3E
.C4DD:
    !X8 ;this does nothing
    lda $3E : clc : adc #$10 : sta $3E
    !X16
    ldy $3C : jsl _028B1E
    lda #$01 : sta $0007,X
    lda $3E : sta $000F,X
    lda #!id_lava : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    sty $3C
    !AX8
    dec $35
    bne .C4DD

    lda $3E : clc : adc #$10 : sta $3E
    !X16
    ldy $3C : jsl _028B1E
    lda #$02 : sta $0007,X
    lda $3E : sta $000F,X
    lda #!id_lava : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    sty $3C
    !AX8
    lda #$7F : cop #$00

;----- C54D

    ldx #$9E : jsl _0196EF
    cop #$00

;----- C555

    jmp create

;-----

destroy: ;unused
    jml _0281A8_81B5
}

namespace off
