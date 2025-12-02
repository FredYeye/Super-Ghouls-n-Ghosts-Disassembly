namespace raft

{
_C6FC:
    lda #$02 : sta $08
    ldy #$AC : ldx #$21 : jsl set_sprite
.C708:
    brk #$00

;----- C70A

    lda $1AD4
    beq .C708

    jsl update_animation_normal
    jsr _028074
    bra .C708

create:
    stz $2D
    lda #$03 : sta $08
    ldy #$BA : ldx #$21 : jsl set_sprite
    lda $07 : asl : tax
    !A16
    lda.w raft_data_C8DA,X : sta $2F ;the raft with $07 = 7 stores skulls cooldown values in 2F here
    !A8
    lda $07
    beq .C757

    dec
    beq .C741

    cmp #$06
    beq _C6FC

    jmp .C8AE

.C741:
    jsl _02F9DA_F9E0
.C745:
    brk #$00

;----- C747

    jsr _CA00
    jsr _C96C
    jsr _C90B
    lda $2D
    beq .C745

    jmp .C7FB

.C757:
    lda.w checkpoint
    beq .C777

    inc $006D
    !A16
    lda $009F : sta.b obj.pos_y+1
    !A8
    jsr _C96C
    inc $1F98 ;todo: bowgun magic bool? reuse?
    jsr _C9E7
    jsl _02F9DA_F9E0
    bra .C7E4

.C777:
    brk #$00

;----- C779

    jsr _C96C
    lda $2D
    beq .C777

    lda #$01 : sta.w checkpoint
    inc $1AD4
    ldy #$1C : jsl set_speed_xyg
    inc $006D
    jsr _CA00_CA05
.C794:
    brk #$00

;----- C796

    jsr _CA00_CA05
    jsr _C96C
    jsl update_pos_xyg_add
    jsr _C9E7
    !A16
    lda #$0600
    cmp.b obj.speed_y
    bcs .C7AE

    sta.b obj.speed_y
.C7AE:
    lda $009F
    cmp.b obj.pos_y+1
    !A8
    bcs .C794

    !A16
    sta.b obj.pos_y+1
    !A8
    lda #$04 : sta $1D
    lda #!id_splash : jsl prepare_object
    inc $1F98
    jsr _C9E7
    jsl _02F9DA_F9E0
    lda #$0C : sta $3B
.C7D5:
    brk #$00

;----- C7D7

    jsr _CA00_CA05
    jsr _C96C
    jsr _C90B
    dec $3B
    bne .C7D5

.C7E4:
    brk #$00

;----- C7E6

    jsr _CA00_CA05
    jsr _C96C
    jsr _C90B
    lda $2D
    beq .C7E4

    lda #$02 : sta $19EB : sta $19EC
.C7FB:
    brk #$00

;----- C7FD

    jsr _C9BB
    jsr _C96C
    jsr _CA41
    jsr _C90B
    !A16
    lda.b obj.pos_x+1
    cmp $2F
    !A8
    bcc .C7FB

    stz.b obj.direction
    !A16
    lda.b obj.pos_x+1 : sta.b obj.speed_x+1
    lda.b obj.pos_y+1 : sta.b obj.speed_y+1
    !A8
    lda #$14 : sta $35
    ldx #$1C : jsl _0189D9
    jsr _CA00_CA05
    !AX16
    lda.b obj.pos_x+1
    ldx.b obj.speed_x+1 : stx.b obj.pos_x+1
    sta.b obj.speed_x+1
    lda.b obj.pos_y+1
    ldx.b obj.speed_y+1 : stx.b obj.pos_y+1
    sta.b obj.speed_y+1
    !AX8
    jsr _C9E7
    lda #$1F : sta.b obj.direction
    lda #$05 : sta $36
.C84D:
    lda $36 : sta $3B
.C851:
    brk #$00

;----- C853

    !A16
    lda $009F : sta.b obj.speed_y+1
    !A8
    jsr _CA00
    jsr _C96C
    jsr _CA41
    lda $35 : ldx #$1C : jsl _018B25
    jsr _C9E7
    dec $3B
    bne .C851

    lda.b obj.direction
    inc
    and #$3F
    sta.b obj.direction
    and #$0F
    bne .C84D

    dec $35
    beq .C88D

    lda $35
    and #$03
    bne .C88B

    dec $36
.C88B:
    bra .C84D

.C88D:
    ldy #$BC : ldx #$21 : jsl set_sprite
    ldy #$1C : jsl set_speed_xyg
    lda #$1E : sta $3B
.C89F:
    brk #$00

;----- C8A1

    jsl update_pos_xyg_add
    dec $3B
    bne .C89F

    jmp _0281A8_81B5

.C8AC:
    brk #$00

;----- C8AE

.C8AE:
    bit $09
    bvc .C8AC

    jsl _02F9DA_F9E0
    !A16
    lda.b obj.pos_x+1 : sta $31
    !A8
.C8BE:
    brk #$00

;----- C8C0

    jsr _C96C
    jsr _C90B
    lda $2D
    beq .C8BE

.C8CA:
    brk #$00

;----- C8CC

    jsr _C9BB
    !A16
    lda $31
    cmp.b obj.pos_x+1
    bcc .C8DD

    beq .C8DD

    sta.b obj.pos_x+1
    bra .C8E6

.C8DD:
    lda $2F
    cmp.b obj.pos_x+1
    bcs .C8F9

    inc
    sta.b obj.pos_x+1
.C8E6:
    !A8
    jsr _CA00
    jsr _028074
    jsr _C96C
    jsr _CA41
    jsr _C90B_C90E
    bra .C8CA

.C8F9:
    !A8
    jsr _C96C
    jsr _CA41
    jsr _C90B
    bra .C8CA

;-----

thing:
    jsl update_animation_normal
    rts

;-----

_C90B:
    jsr .C927
.C90E:
    !A16
    lda $009F : sec : sbc #$0001 : sta.b obj.pos_y+1
    ldx $2D
    beq .C924

    sec
    sbc #$0018
    sta.w !obj_arthur.pos_y+1
.C924:
    !A8
    rts

;-----

.C927:
    ldx $2D
    beq .C96B

    lda $19EC
    and #$02
    beq .C96B

    lda #$40 : clc : adc.w camera_x            : sta.w !obj_arthur.pos_x+0
    lda #$00 :       adc.w !obj_arthur.pos_x+1 : sta.w !obj_arthur.pos_x+1
    lda #$00 :       adc.w !obj_arthur.pos_x+2 : sta.w !obj_arthur.pos_x+2
    !A16
    lda.w !obj_arthur.pos_x+1
    cmp #$15B0
    !A8
    bcs .C96B

    lda #$40 : clc : adc.w camera_x    : sta.b obj.pos_x+0
    lda #$00       : adc.b obj.pos_x+1 : sta.b obj.pos_x+1
    lda #$00       : adc.b obj.pos_x+2 : sta.b obj.pos_x+2
.C96B:
    rts

;-----

_C96C:
    !AX16
    lda.b obj.pos_x+1
    clc
    adc #$0015
    sec
    sbc.w !obj_arthur.pos_x+1
    cmp #$002C
    bcs .C9B6

    lda.w !obj_arthur.pos_y+1
    clc
    adc #$0018
    sec
    sbc.b obj.pos_y+1
    cmp #$0010
    bcs .C9B6

    eor #$FFFF
    inc
    adc.w !obj_arthur.pos_y+1
    sta.w !obj_arthur.pos_y+1
    !AX8
    lda #$80 : sta $14C3
    !A16
    lda.w !obj_arthur.pos_x+1 : sec : sbc.b obj.pos_x+1 : sta $37
    lda.w !obj_arthur.pos_y+1 : sec : sbc.b obj.pos_y+1 : sta $39
    !A8
    lda #$FF : sta $2D
    rts

.C9B6:
    !AX8
    stz $2D
    rts

;-----

_C9BB:
    stz $2E
    !A16
    lda.b obj.pos_x+1
    clc
    adc #$000A
    sec
    sbc $045B
    sec
    sbc #$0015
    bcc .C9E4

    beq .C9E4

    bpl .C9D7

    clc
    adc #$0015
.C9D7:
    eor #$FFFF
    inc
    clc
    adc.b obj.pos_x+1
    sta.b obj.pos_x+1
    !A8
    inc $2E
.C9E4:
    !A8
    rts

;-----

_C9E7:
    lda $2D
    beq .C9FF

    !A16
    clc
    lda $37 : adc.b obj.pos_x+1 : sta.w !obj_arthur.pos_x+1
    clc
    lda $39 : adc.b obj.pos_y+1 : sta.w !obj_arthur.pos_y+1
    !A8
.C9FF:
    rts

;-----

_CA00:
    lda.w jump_counter
    bne .CA3E

.CA05:
    !AX16
    lda.b obj.pos_x+1
    clc
    adc #$0015
    sec
    sbc.w !obj_arthur.pos_x+1
    cmp #$002B
    bcs .CA3C

    lda.b obj.pos_x+1
    clc
    adc #$000A
    sec
    sbc.w !obj_arthur.pos_x+1
    sec
    sbc #$0015
    bcc .CA3C

    beq .CA3C

    bpl .CA2E

    clc
    adc #$0015
.CA2E:
    clc
    adc.w !obj_arthur.pos_x+1
    sta.w !obj_arthur.pos_x+1
    !AX8
    lda #$01 : sta $2E
    rts

.CA3C:
    !AX8
.CA3E:
    stz $2E
    rts

;-----

_CA41:
    lda $2D
    beq .CA4F

    stz $14D5
    lda $2E
    beq .CA4F

    inc $14D5
.CA4F:
    rts
}

namespace off
