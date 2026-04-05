namespace _02B0CD

{
;unused. belial spawner?

create:
    stz $07
.B0CF:
    brk #$00

;----- B0D1

    jsl get_object_slot
    bmi .B0FF

    !X16
    lda $07 : asl : tay
    !A8
    lda.w _00C2BB,Y      : sta.w obj.pos_x+1,X
    lda.w _00C2BB_C2C5,Y : sta.w obj.pos_y+1,X
    !A8
    lda #$0C : sta.w obj.active,X
    lda #!id_belial : sta.w obj.type,X
    !X8
    inc $07
    cmp #$05
    bne .B0CF

.B0FF:
    jmp _0281A8_81B5
}

namespace off
