namespace astaroth_nebiroth_body

{
create:
    jsl _02F9DA_F9E0
.D5CD:
    brk #$00

;----- D5CF

    !A16
    lda $1EBB : sta.b obj.pos_x+1
    clc : lda $1EBD : adc #$002A : sta.b obj.pos_y+1
    !A16 ;mistake or unnecessary A16
    lda $1EB7
    beq .D5CD

    jml _0281A8_81B5

;-----

thing:
    jsl _02F9B2
    jml _02F9C2
}

namespace off
