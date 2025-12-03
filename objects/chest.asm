namespace chest

{
create:
    !AX8
    lda $09 : ora #$04 : sta $09
    !A16
    lda.b obj.pos_x+1 : sta $39
    lda.b obj.pos_y   : sta $3B
    !A8
    stz $31
    lda #$70 : sta $1D
.B6D4:
    brk #$00

;----- B6D6

    jsr _0281A8
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .B6D4

.B6DE:
    inc $31
    lda.w chest_counter : sta $37
    inc.w chest_counter
    lda $07
    !AX16
    and #$00FF
    asl #2
    tax
    lda.w chest_offset,X
    clc
    adc.b obj.pos_x+1
    sta.b obj.pos_x+1
    inx #2
    lda.w chest_offset,X
    clc
    adc.b obj.pos_y+1
    sta.b obj.pos_y+1
.B704:
    !AX8
    lda #$84 : ora $09 : sta $09
    lda $08 : ora #$02 : sta $08
    ldy #$58 : ldx #$20 : jsl set_sprite
    stz $2D
    stz $2E
    stz $2F
    stz $30
    lda #$20 : sta $2F
    jsl set_hp
.B72A:
    brk #$00

;----- B72C

    jsl update_animation_normal
    bra .B72A

;-----

thing:
    lda #$03
    jsr _02FE1E_local
    jsr _02FA37_FA6D
    jsr _02FB62_FB69
    jsr _028144
    rts

;-----

destroy:
    lda.b obj.hp
    beq .B769

    cmp #$01
    beq .B75B

    cmp #$02
    beq .B75B

    cmp #$03
    beq .B75B

    cmp #$04
    beq .B75B

    jsl _02F9DA_F9E0
    bra create_B72A

.B75B:
    ldy #$5A : ldx #$20 : jsl set_sprite
    jsl _02F9DA_F9E0
    bra create_B72A

.B769:
    brk #$00

;----- B76B

    ldy #$5C : ldx #$20 : jsl set_sprite
.B773:
    brk #$00

;----- B775

    jsl update_animation_normal
    lda.b obj.anim_timer
    cmp #$7A
    bne .B773

    lda $08 : and #$F7 : sta $08
    lda #$FF : sta $07
    lda.w !obj_shield.active
    beq .B796

    lda.w !obj_shield.init_param
    clc
    adc #$05
    bra .B799

.B796:
    lda !armor_state
.B799:
    asl #4
    clc
    adc $37 ;chest number of this chest
    tax
    lda.l .chest_order,X
    tax
    lda.l .B827,X
    jsr _0280E9
    sta.b obj.type
    lda #$0C : sta $00
    jml _02821B_827A

.chest_order: ;indexes into B827
if !version == 0 || !version == 1
    db 3, 1, 3, 0, 3, 0, 4, 3, 0, 4, 3, 0, 4, 0, 3, 0 ;underwear
elseif !version == 2
    db 0, 0, 3, 0, 1, 0, 0, 3, 0, 4, 3, 0, 4, 0, 3, 0 ;underwear
endif
    db 1, 0, 1, 4, 3, 0, 4, 1, 3, 0, 1, 4, 3, 0, 4, 1 ;steel armor
    db 3, 1, 0, 1, 0, 3, 1, 0, 1, 1, 0, 1, 0, 3, 1, 1 ;?
    db 3, 1, 0, 1, 0, 3, 1, 0, 1, 1, 0, 1, 0, 3, 1, 1 ;bronze armor
    db 3, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2 ;gold armor
    db 3, 1, 3, 2, 1, 3, 1, 2, 3, 1, 3, 2, 1, 3, 1, 2 ;red shield
    db 3, 1, 3, 1, 1, 4, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1 ;blue shield

.B827:
    db !id_armor, !id_weapon, !id_pickup_shield, !id_magician, $44, $7D
}

namespace off
