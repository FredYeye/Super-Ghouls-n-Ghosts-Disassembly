namespace magician_orb

{
create:
    !AX8
    lda #$29 : jsl _018049_8053 ;"laser" sfx
    ldy #$F2 : ldx #$20 : jsl set_sprite
    lda #$FF : sta $26
    lda $09 : ora #$84 : sta $09
    stz $33
    lda $08 : and #$F8 : ora #$01 : sta $08
    jsl _01918E_set_direction16 : sta.b obj.direction
.B97C:
    brk #$00

;----- B97E

    jsr arthur_overlap_check_8bit_local
    bcc .B98C

    lda $09
    and #$40
    bne .B97C

    jmp _0281A8_81B5

.B98C:
    stz.w shield_state_stored
    lda.w !obj_shield.active
    beq .B9A3

    stz.w !obj_shield.active
    lda.w !obj_shield.type       : sta.w shield_state_stored
    lda.w !obj_shield.init_param : sta $02B1
.B9A3:
    lda.w armor_state
    sta.w transform_armor_state_stored
    asl
    tax
    jsr (.B9E8,X) : sta.w armor_state
    lda #$7E : sta.w transform_timer
    lda #$01 : sta.w transform_timer+1
    lda #!sfx_transform : jsl _018049_8053
    ldy #$5C : ldx #$20 : jsl set_sprite
    lda #$10 : sta $32
.B9CD:
    brk #$00

;----- B9CF

    !A16
    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    lda.w !obj_arthur.pos_y+1 : sta.b obj.pos_y+1
    !A8
    jsl update_animation_normal
    dec $32
    bne .B9CD

    jmp _0281A8_81B5

;-----

.B9E8: dw .underwear, .steel, .bronze, .bronze, .gold

;-----

.underwear:
    lda.b #arthur_baby    : sta.w !obj_arthur.state+1
    lda.b #arthur_baby>>8 : sta.w !obj_arthur.state+2
    lda #!arthur_state_baby
    rts

;-----

.steel:
    lda.b #arthur_seal    : sta.w !obj_arthur.state+1
    lda.b #arthur_seal>>8 : sta.w !obj_arthur.state+2
    lda #!arthur_state_seal
    rts

;-----

.bronze:
    lda.b #arthur_bee    : sta.w !obj_arthur.state+1
    lda.b #arthur_bee>>8 : sta.w !obj_arthur.state+2
    lda #!arthur_state_bee
    rts

;-----

.gold:
    lda.b #arthur_maiden    : sta.w !obj_arthur.state+1
    lda.b #arthur_maiden>>8 : sta.w !obj_arthur.state+2
    lda #!arthur_state_maiden
    rts

;-----

thing:
    ldy #$18 : jsr _02FF22
    jsl update_animation_normal
    ldx #$0A : jsl update_pos_xy_2
    rts
}

namespace off
