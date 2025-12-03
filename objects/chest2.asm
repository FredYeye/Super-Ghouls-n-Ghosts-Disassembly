namespace chest2

{
create:
    !AX8
    lda $09 : ora #$04 : sta $09
    !A16
    lda $1F : sta $39
    lda $22 : sta $3B
    !A8
    stz $31
    lda #$70 : sta $1D
.B687
    brk #$00

;----- B689

    jsr _0281A8
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .B687

.B691:
    inc $31
    lda.w chest_counter : sta $37
    inc.w chest_counter
    lda $07
    !AX16
    and #$00FF
    asl #2
    tax
    lda.w chest_offset_chest2,X : clc : adc.b obj.pos_x+1 : sta.b obj.pos_x+1
    inx #2
    lda.w chest_offset_chest2,X : clc : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
    jmp chest_create_B704
}

namespace off
