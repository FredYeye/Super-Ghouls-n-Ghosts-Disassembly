namespace weapon

{
_BB9C:
    db $00, $00, $00, $00, $00, $00, $01, $01, $02, $00

create:
    lda $07
    cmp #$FE
    beq .BBCE

    lda.w loop
    beq .BBD2

    lda.w weapon_current
    cmp #!weapon_bracelet
    bcs .BBD2

    lda.w armor_state
    cmp #!arthur_state_gold
    bcc .BBD2

    jsr _0280E9
    lda #!id_bracelet_item : sta.b obj.type
    lda #$0C : sta.b obj.active
    jml _02821B_827A

.BBCE:
    lda #$FF : sta $07
.BBD2:
    ldx.w stage
    lda.l _BB9C,X
    tax
    jsl _018D5B
    !A16
    lda #_00C2D7 : sta $13 ;collision offset, unused?
    !A8
    stz $33
    lda #$FF : sta $26
    lda $07 : sta $37
    cmp #$FF
    beq .BBF8

    jmp .BC87

.BBF8:
    brk #$00

;----- BBFA

    lda.w stage : asl : tax
    jmp (+,X) : +: dw .stage1, .stage2, .stage3, .stage4, .stage4, .stage4, .stage5, .stage6, .stage7, .stage8

;-----

.BC16:
    lda.w weapon_current
    lsr
    tax
    beq .BC25

    lda #$00
.BC1F:
    clc
    adc #$10
    dex
    bne .BC1F

.BC25:
    sta $0000
    lda $02C3
    and #$0F
    ora $0000
    tax
    rts

;-----

.stage1:
    jsr .BC16
    lda.w weapon_table_s1,X
    jmp .BC75

;-----

.stage2:
    jsr .BC16
    lda.w weapon_table_s2,X
    jmp .BC75

;-----

.stage3:
    jsr .BC16
    lda.w weapon_table_s3,X
    jmp .BC75

;-----

.stage4:
    jsr .BC16
    lda.w weapon_table_s4,X
    bra .BC75

;-----

.stage5:
    jsr .BC16
    lda.w weapon_table_s5,X
    bra .BC75

;-----

.stage6:
    jsr .BC16
    lda.w weapon_table_s6,X
    bra .BC75

;-----

.stage7:
    jsr .BC16
    lda.w weapon_table_s7,X
    bra .BC75

;-----

.stage8:
    jsr .BC16
    lda.w weapon_table_s8,X
    bra .BC75

;-----

.BC75:
    and #$0F
    sta $37
    lda.w weapon_current
    and #$0E
    cmp $37
    bne .BC85 ;branch if weapon isn't the same as current

.BC82:
    jmp .BBF8 ;reroll drop

.BC85:
    lda $37
.BC87:
    cmp.w existing_weapon_type
    beq .BC82 ;also reroll if this weapon is dropped currently

    and #$0E
    sta.w existing_weapon_type
    sta $37
    tax
    jmp (+,X) : +: dw .lance, .knife, .bowgun, .scythe, .torch, .axe, .triblade, .BD04

;-----

.lance:
    stz $38
    lda #!weapon_lance : sta $37
    ldy #$A6 : ldx #$20
    jmp .BD11

;-----

.knife:
    stz $38
    lda #!weapon_knife : sta $37
    ldy #$A8 : ldx #$20
    jmp .BD11

;-----

.bowgun:
    lda #$01 : sta $38
    lda #!weapon_bowgun : sta $37
    ldy #$AA : ldx #$20
    jmp .BD11

;-----

.scythe:
    stz $38
    lda #!weapon_scythe : sta $37
    ldy #$AC : ldx #$20
    jmp .BD11

;-----

.torch:
    stz $38
    lda #!weapon_torch : sta $37
    ldy #$AE : ldx #$20
    jmp .BD11

;-----

.axe:
    stz $38
    lda #!weapon_axe : sta $37
    ldy #$B0 : ldx #$20
    jmp .BD11

;-----

.triblade:
    stz $38
    lda #!weapon_triblade : sta $37
    ldy #$B2 : ldx #$20
    jmp .BD11

;-----

.BD04: ;unused, would have been bracelet
    stz $38
    lda #!weapon_triblade : sta $37
    ldy #$B2 : ldx #$20
    jmp .BD11

;-----

.BD11:
    jsl set_sprite
    inc.w weapon_item_count
    !A16
    lda.w _00ED00+$1A : sta $27
    !A8
    lda $09 : ora #$94 : sta $09
    lda $08 : and #$F8 : ora #$22 : sta $08
    stz $33
.BD31:
    brk #$00

;----- BD33

    lda $33
    cmp #$10
    bcs .BD59

    cmp #$08
    bcs .BD4B

    !A16
    lda.b obj.pos_y+1
    sec
    sbc #$0002
    sta.b obj.pos_y+1
    !A8
    bra .BD57

.BD4B:
    !A16
    lda.b obj.pos_y+1
    clc
    adc #$0002
    sta.b obj.pos_y+1
    !A8
.BD57:
    inc $33
.BD59:
    jsr _028176
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .BD31

    lda.w current_cage
    bne .BD31

    lda.w armor_state
    cmp #!arthur_state_transformed ;do nothing if transformed
    bcs .BD31

    lda $14E3
    bne .BD31

    lda.w !obj_arthur.hp
    bpl .BD7A

    jmp .BD31

.BD7A:
    lda #$F1 : jsl _018049_8053 ;F1: cancel other sounds maybe?
    lda #$30 : jsl _018049_8053 ;pickup sfx
    lda $37
    cmp #$09
    bne +

    lda #$00
+:
    sta.w weapon_current
    lda.w armor_state
    cmp #$02 ;todo: bronze is 3. 2 is maybe some leftover armor state. define?
    bcc +

    inc.w weapon_current ;upgraded weapon
+:
    lda $38
    beq .BDA6

    lda #$0C ;leftover lda
    lda $37
    and #$01
    tax
.BDA6:
    dec.w weapon_item_count
    bne .BDB3

    lda.w weapon_current : and #$0E : sta.w existing_weapon_type
.BDB3:
    jmp _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts
}

namespace off
