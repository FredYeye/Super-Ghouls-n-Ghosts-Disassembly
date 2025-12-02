namespace armor

{
create:
    !AX8
    stz $30
    stz $3B
    stz $3C
    lda !armor_state : asl : tax
    jmp (.BA49,X)

    jmp _0281A8_81B5 ;unreachable?

.BA49: dw .BA53, .BA5E, .BA5E, .BA6D, .BA6D

;-----

.BA53:
    lda #!sfx_armor_1 : sta $3A
    ldy #$28 : ldx #$20
    jmp .BA98

;-----

.BA5E:
    lda #!sfx_armor_2 : sta $3A
    lda #!id_arthur_face : sta $3C ;loads face again later anyway
    ldy #$2C : ldx #$20
    jmp .BA98

;-----

.BA6D:
    lda #!sfx_armor_2 : sta $3A
    lda #$1B : sta $3C
    ldy #$2A : ldx #$20
    jmp .BA98

;-----

    ;unused shield drop
    lda #!sfx_armor_2 : sta $3A
    lda #!id_shield : sta $3C
    ldy #$B4 : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+$1A : sta $27
    !A8
    jmp .BAAB

;-----

.BA98:
    jsl set_sprite
    !A16
    dec.b obj.pos_y+1 : dec.b obj.pos_y+1 : dec.b obj.pos_y+1
    lda.w _00ED00+$0E : sta $27
    !A8
.BAAB:
    !A16
    lda #$00F1 : sta $29
    !A8
    lda $09 : ora #$94 : sta $09
    lda $08 : and #$F8 : ora #$02 : sta $08
    stz $33
    lda #$FF : sta $26
.BAC8:
    brk #$00

;----- BACA

    lda $33
    cmp #$10
    bcs .BAF0

    cmp #$08
    bcs .BAE2

    !A16
    lda.b obj.pos_y+1
    sec
    sbc #$0002
    sta.b obj.pos_y+1
    !A8
    bra .BAEE

.BAE2:
    !A16
    lda.b obj.pos_y+1
    clc
    adc #$0002
    sta.b obj.pos_y+1
    !A8
.BAEE:
    inc $33
.BAF0:
    lda.w jump_counter
    bne .BAC8

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .BAC8

    lda !armor_state
    cmp #$05
    bcs .BAC8

    lda.w !obj_arthur.hp
    bmi .BAC8

    lda $3A : jsl _018049_8053
    ldx !armor_state
    lda.w _00C2A4,X
    bmi .BB76

    sta.w transform_stored_armor_state
    sta !armor_state
    ldx #$01 : stx.w !obj_arthur.hp
    dec
    bne .BB2D

    stz.w !obj_shield.active
    lda #$1E : sta.w !obj_shield.type
    jmp _0281A8_81B5

.BB2D:
    ldx.b #_01D9FA    : stx.w !obj_arthur.state+1
    ldx.b #_01D9FA>>8 : stx.w !obj_arthur.state+2
    lda !armor_state
    cmp #$04
    bne .BB4E

    lda #$0C : sta.w !obj_shield.active
    lda #!id_shield : sta.w !obj_shield.type
    lda #!id_arthur_plume : sta $3C
    bra .BB52

.BB4E:
    lda #!id_arthur_face : sta $3C
.BB52:
    stz $10F6
    stz $10F7
    ldx $3C  : stx.w !obj_upgrade.type
    ldx #$0C : stx.w !obj_upgrade.active
    lda #$01 : ora.w weapon_current : sta.w weapon_current
    lda !armor_state
    cmp #!gold
    bne .BB90

    inc.w can_charge_magic
    bra .BB90

.BB76: ;picking up armor while transformed? unreachable?
    lda !armor_state
    cmp #$02
    bcc .BB85

    lda #$01 : ora.w weapon_current : sta.w weapon_current
.BB85:
    lda #$01 : sta.w !obj_arthur.hp
    lda.w _00C2A4_C2B2,X : sta.w transform_stored_armor_state

.BB90:
    jmp _0281A8_81B5

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts
}

namespace off
