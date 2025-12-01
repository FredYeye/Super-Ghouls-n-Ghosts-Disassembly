namespace bars

{
create:
    !A16
    lda.b obj.pos_x+1 : sta $2D
    lda.b obj.pos_y+1 : sta $2F
    !A8
    stz $32
    lda $07
    and #$03
    sta $36
    and #$01
    bne .B512

    ldy #$12 : ldx #$22 : jsl set_sprite
    bra .B51A

.B512:
    ldy #$14 : ldx #$22 : jsl set_sprite
.B51A:
    lda $08 : and #$F8 : ora #$04 : sta $08
    lda #$20 : sta $09
    stz.b obj.direction
    stz.b obj.facing
.B52A:
    stz $32
.B52C:
    brk #$00

;----- B52E

    jsr _0281A8
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .B52C

    lda $07
    and #$02
    beq .B55F

    lda.w jump_counter
    bne .B52C

    lda.w current_cage
    beq .B52C

    lda $07
    and #$01
    bne .B55C

    lda.b #_01DD01    : sta.w !obj_arthur.state+1
    lda.b #_01DD01>>8 : sta.w !obj_arthur.state+2
    lda #$44 : jsl _018049_8053 ;bars sfx
.B55C:
    jmp .B5DE

.B55F:
    lda.w current_cage
    bne .B52C

.B564:
    brk #$00

;----- B566

    clc
    inc $32
    lda $36
    and #$01
    bne .B579

    !A16
    dec.b obj.pos_x+1 : dec.b obj.pos_x+1
    !A8
    bra .B581

.B579:
    !A16
    inc.b obj.pos_x+1 : inc.b obj.pos_x+1
    !A8
.B581:
    lda $32
    cmp #$08
    bne .B564

    lda $07
    and #$10
    bne .B591

    lda #$01
    bra .B593

.B591:
    lda #$02
.B593:
    sta.w current_cage
    lda.w !obj_arthur.flags2  : and #$CF : ora #$20 : sta.w !obj_arthur.flags2
    lda.w !obj_upgrade.flags2 : and #$CF : ora #$20 : sta.w !obj_upgrade.flags2
    lda.w !obj_shield.flags2  : and #$CF : ora #$20 : sta.w !obj_shield.flags2
    lda.b #coord_offsets_arthur_cage    : sta.w !obj_arthur._13
    lda.b #coord_offsets_arthur_cage>>8 : sta.w !obj_arthur._13+1
    !A16
    lda $2D : sta.b obj.pos_x+1
    !A8
    clc
    lda #$2C : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
.B5CD:
    brk #$00

;----- B5CF

    dec.b obj.pos_y+1 : dec.b obj.pos_y+1
    inc $32
    lda $32
    cmp #$1E
    bne .B5CD

    jmp .B52A

;-----

.B5DE:
    stz $32
.B5E0:
    brk #$00

;----- B5E2

    inc.b obj.pos_y+1 : inc.b obj.pos_y+1
    inc $32
    lda $32
    cmp #$18
    bne .B5E0

    stz.w current_cage
    lda.w !obj_arthur.flags2  : and #$CF : ora #$10 : sta.w !obj_arthur.flags2
    lda.w !obj_upgrade.flags2 : and #$CF : ora #$10 : sta.w !obj_upgrade.flags2
    lda.w !obj_shield.flags2  : and #$CF : ora #$10 : sta.w !obj_shield.flags2
    lda.b #coord_offsets_arthur    : sta.w !obj_arthur._13
    lda.b #coord_offsets_arthur>>8 : sta.w !obj_arthur._13+1
    stz $32
    !A16
    lda $2F : sta.b obj.pos_y+1
    !A8
    lda $36
    and #$01
    beq .B637

    !A16
    clc
    lda.b obj.pos_x+1 : adc #$0010 : sta.b obj.pos_x+1
    !A8
    bra .B643

.B637:
    !A16
    sec
    lda.b obj.pos_x+1 : sbc #$0010 : sta.b obj.pos_x+1
    !A8
.B643:
    brk #$00

;----- B645

    inc $32
    lda $36
    and #$01
    bne .B657

    !A16
    inc.b obj.pos_x+1 : inc.b obj.pos_x+1
    !A8
    bra .B65F

.B657:
    !A16
    dec.b obj.pos_x+1 : dec.b obj.pos_x+1
    !A8
.B65F:
    lda $32
    cmp #$08
    bne .B643

    stz $32
    jmp .B52A

;-----

    ;unused, probably belongs to the bars code
    jmp _0281A8_81B5
}

namespace off
