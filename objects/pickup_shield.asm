namespace pickup_shield

{
create:
    lda.w !obj_shield.active
    beq .BDCE

    ldy #$7A : ldx #$21 : jsl set_sprite
    bra .BDD6

.BDCE:
    ldy #$B4 : ldx #$20 : jsl set_sprite
.BDD6:
    !A16
    lda.w _00ED00+$1A : sta $27
    lda #$00E6 : sta $29
    !A8
    lda $08 : and #$F8 : ora #$02 : sta $08
    lda $09 : ora #$84 : sta $09
    stz $33
    lda #$FF : sta $26
.BDF8:
    brk #$00

;----- BDFA

    lda $33
    cmp #$10
    bcs .BE1E

    cmp #$08
    bcs .BE10

    !A16
    lda.b obj.pos_y+1 : sec : sbc #$0002 : sta.b obj.pos_y+1
    bra .BE1A

.BE10:
    !A16
    lda.b obj.pos_y+1 : clc : adc #$0002 : sta.b obj.pos_y+1
.BE1A:
    !A8
    inc $33
.BE1E:
    jsr _0281A8
    lda.w jump_counter
    bne .BDF8

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .BDF8

    lda.w armor_state
    cmp #$05
    bcs .BDF8

    lda $14E3
    bne .BDF8

    lda.w !obj_arthur.hp
    bmi .BDF8

    lda #$2E : jsl _018049_8053
    lda.w !obj_shield.active
    bne .BE8F

    lda.w armor_state
    bne .BE5A

    lda #$01 : sta.w !obj_arthur.hp
    inc.w armor_state
    inc.w transform_armor_state_stored
    jmp _0281A8_81B5

.BE5A:
    dec
    bne .BE8F

    ldx.b #_01D9FA    : stx.w !obj_arthur.state+1
    ldx.b #_01D9FA>>8 : stx.w !obj_arthur.state+2
    stz.w !obj_upgrade.flags1
    stz.w !obj_upgrade.flags2
    ldx #!id_arthur_face : stx.w !obj_upgrade.type
    ldx #$0C : stx.w !obj_upgrade.active
    lda.w weapon_current : ora #$01 : sta.w weapon_current
    lda #$01 : sta.w !obj_arthur.hp
    lda #$03 : sta.w armor_state : sta.w transform_armor_state_stored
    jmp _0281A8_81B5

.BE8F:
    ldx.w armor_state
    lda.w _00C2A4,X
    bmi .BEC1

    lda #$01 : sta.w !obj_arthur.hp
    lda.w !obj_shield.active
    beq .BEA8

    lda #$01 : sta.w !obj_shield.init_param
    bra .BEAB

.BEA8:
    stz.w !obj_shield.init_param
.BEAB:
    lda #$0C : sta.w !obj_shield.active
    lda #$1E : sta.w !obj_shield.type
    stz.w !obj_shield.flags1
    stz.w !obj_shield.flags2
    stz.w !obj_shield._0F_10
    jmp _0281A8_81B5

.BEC1: ;not sure this is reachable? picking up shield while transformed...?
    lda.w _00C2A4_C2B2,X : sta.w transform_armor_state_stored ;todo
    jmp _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts
}

namespace off
