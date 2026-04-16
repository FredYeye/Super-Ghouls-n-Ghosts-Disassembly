;todo: there may be more code that should be incorporated here? from _01D8E6 and on

namespace arthur

{
create: ;a8 x8
    lda $0276 : and #$F8 : sta $0276
    lda.w armor_state
    beq .CCCC

    lda #$01
.CCCC:
    sta.b obj.hp
    lda #$FF : sta $0F
    stz.w chest_counter
    stz.w knife_rapid_timer
    stz.w knife_rapid_count
    stz.w hit_by_water_crash
    stz $0338
    stz $033E
    lda #$FF : sta $0339 : sta $033F
    ldy #$00 : ldx #$20 : jsl set_sprite
    stz.w transform_timer
    lda.b #coord_offsets_arthur
    ldx.b #coord_offsets_arthur>>8
    ldy $02DA
    beq .CD04

    lda.b #coord_offsets_arthur_B9FC
    ldx.b #coord_offsets_arthur_B9FC>>8
.CD04:
    sta $13
    stx $14
    lda #$FF : sta $26 : sta $14B8
    !A16
    lda.w _00ED00+$04 : sta $0313+$27 ;todo: what is 313? edit: mistaken assumption most likely, should be 33A & 33C?
    lda.w _00ED00+$34 : sta $0340
    lda #$0020 : sta $0313+$29
    lda #$0050 : sta $0342
    !A8
    lda.w stage
    cmp.b #!stage_4b
    bne .CD36

    lda #$01 : sta.b obj.facing ;make arthur face left initially in 4b
.CD36:
    jsl _01CCAF
    lda $09 : ora #$C0 : sta $09
    lda #$03 : sta $3C
    !A16
    lda.l _04984F_9879+0 : sta $7EF522
    lda.l _04984F_9879+2 : sta $7EF524
    lda.l _04984F_9879+4 : sta $7EF526
    !A8
    inc $0331
    lda #$02 : cop #$00

;----- CD67

    lda #$0C : sta.w !obj_weapons.active ;0C = "create" enum
    lda #!id_ready_go : sta.w !obj_weapons.type
    lda #$01 : sta.w ready_go_active
    brk #$00

;----- CD78

    lda $0292
    bpl .CD87

    lda #$12 : sta.w snes_reg.tm : sta $02D7
    bra .CD8B

.CD87:
    jsl _01DE0B

.CD8B:
    brk #$00

;----- CD8D

    lda.w !obj_weapons.active
    bne .CD8B

    lda #$FF : sta $0339
    !A16
    lda.l _04984F_9897+0 : sta $7EF522
    lda.l _04984F_9897+2 : sta $7EF524
    lda.l _04984F_9897+4 : sta $7EF526
    !A8
    inc $0331
    stz.w ready_go_active
    inc $02AC
    bra .CDC4

.CDBE:
    lda #!sfx_land : jsl _018049_8053

.CDC4:
    lda $09 : and #$FE : sta $09
    ldy #$00
    ldx #$20
    sty $3E
    stx $3F
    stz $1D
    stz $0F
    stz.w double_jump_state
    stz.w jump_state
    stz.w jump_counter
    stz $14F6
    lda.b obj.facing  : sta.b obj.direction
    lda #$03 : sta $3C
    lda #$FF : sta $3D
.CDEE:
    lda #$00
    jsr .CE9C
    jsr _01D263
    jsr _01D565
    jsr _01DE62_DE63
    lda #!down
    bit.w p1_button_hold+1
    beq .CE08

    brk #$00

;----- CE05

    jmp .CF8B

.CE08:
    lda #$00 : jsr _01D1C4_D1C5
    lda.w p1_button_hold+1
    bit #!right|!left
    beq .CE18

    brk #$00

;----- CE16

    bra .CE1C

.CE18:
    brk #$00

;---- CE1A

    bra .CDEE

.CE1C:
    ldy #$00
    lda.w bowgun_magic_active
    beq +

    ldy #$45
+:
    jsl set_speed_x
    lda.b obj.facing : sta.b obj.direction
    stz $3C
.CE2F:
    lda.w is_shooting
    bne .CE68

    lda $14D5
    beq +

    lda #$03 : sta $3C
+:
    jsr .CE85
    jsr _01DE62_DE63
    lda #$00 : jsr .CE9C
    lda #!down
    bit.w p1_button_hold+1
    beq .CE54

    brk #$00

;----- CE51

    jmp .CF8B

.CE54:
    lda #$00 : jsr _01D1C4_D1C5
    jsr _01D565
    lda.w p1_button_hold+1
    bit #!right|!left
    bne .CE79

    brk #$00

;----- CE65

    jmp .CDC4

.CE68:
    lda #$00 : jsr .CE9C
    lda #!down
    bit.w p1_button_hold+1
    beq .CE79

    brk #$00

;----- CE76

    jmp .CF8B

.CE79:
    lda.w stage1_earthquake_active
    beq +

    jsr _01D957
+:
    brk #$00

;----- CE83

    bra .CE2F

;-----

.CE85:
    lda.w p1_button_hold+1
    and #!right|!left
    tax
    lda.w _00BA22,X
    bmi .CE9B

    sta.b obj.direction
    sta.b obj.facing
    jsl update_pos_x
    jsr _01D91C_D94E

.CE9B:
    rts

;-----

.CE9C:
    sta.w jump_type
    lda.b obj.pos_y+1 : sta $39
    lda.b obj.pos_y+2 : sta $3A
    jsr _01D957
    bne .CECD

    lda $14D1
    bne .CEC1

    lda $14C3
    bne .CECC

    pla : pla
    stz $14C3
    ldx.w jump_type
    jmp (.CEDD,X)

.CEC1:
    stz $14D0
    lda.w obj.pos_x
    beq .CECC

    inc $14D0
.CECC:
    rts

.CECD:
    lda $14C3
    beq .CEDA

    lda $39 : sta.b obj.pos_y+1
    lda $3A : sta.b obj.pos_y+2
.CEDA:
    lda #$01
    rts

.CEDD: dw .CFC8, arthur_baby_fall, arthur_seal_fall, arthur_bee_jump, arthur_maiden_fall

;-----

    ;unused
    sta.w jump_type
    lda $14C3
    bne .CEFB

    lda $14BB
    bne .CEF9

    jsr _01D957
    bne .CEFB

.CEF9:
    lda #$00
.CEFB:
    rts

;-----

.arthur_jump:
    inc.w jump_counter
    lda #!sfx_jump : jsl _018049_8053
    jsr arthur_set_facing_get_pressed_direction
    lda.w _00BA26,X : sta $14B0
    ldy.w _00BA2A,X
    lda.w jump_state
    beq .CF22

    clc
    lda $14B0 : adc #$04 : sta $14B0
    ldy.w _00BA2E,X
.CF22:
    jsl set_speed_xyg
    lda.w bowgun_magic_active
    beq .CF3A

    tya
    and #$01 ;don't change speed if neutral jump?
    bne .CF3A

    lda #$50 : sta.b obj.speed_x   ;set custom speed if bowgun magic is active
    lda #$01 : sta.b obj.speed_x+1
               stz.b obj.speed_x+2
.CF3A:
    lda.b obj.facing : sta.b obj.direction
    lda $14B0 : sta $3C
    lda.w jump_state
    beq .CF53

.CF48:
    lda.w jump_hold
    beq .CF53

    brk #$00

;----- CF4F

    dec $2F ;jump stall timer
    bne .CF48

.CF53:
    lda.w double_jump_state
    bne +

    jsr arthur_set_facing_get_pressed_direction
+:
    jsr _01DE62_DE63
    jsr arthur_cap_fall_speed
    jsr _01D8F1
    jsr _01D91C
    jsr _01D97E
    beq .CF71

    brk #$00

;----- CF6E

    jmp .CDBE

.CF71:
    lda.w jump_state
    bne .CF87

    lda.w jump_press
    beq .CF87

    inc.w jump_state
    lda #$05 : sta $2F
    brk #$00

;----- CF84

    jmp .arthur_jump

.CF87:
    brk #$00

;----- CF89

    bra .CF53

.CF8B: ;crouch
    lda.b obj.facing : sta.b obj.direction
    lda #$04 : sta $3C
    lda #$02 : sta $1D
    lda #$01 : ora $09 : sta $09
.CF9D:
    jsr _01D263
    jsr _01D565
    lda #$00
    jsr .CE9C
    lda #!down
    bit.w p1_button_hold+1
    bne .CFB4

    brk #$00

;----- CFB1

    jmp .CDC4

.CFB4:
    lda $14C3
    bne +

    jsr _01D957
+:
    jsr arthur_set_facing_get_pressed_direction
    lda #$00 : jsr _01D1C4_D1C5
    brk #$00

;---- CFC6

    bra .CF9D

.CFC8:
    ldy #$0C : jsl set_speed_xyg
    lda #$03 : sta $3C
    inc.w jump_counter
.CFD5:
    jsr arthur_cap_fall_speed
    jsr _01D97E_D985
    bne .CFE1

    brk #$00

;----- CFDF

    bra .CFD5

.CFE1:
    brk #$00

;----- CFE3

    jmp .CDBE
}

{ ;CFE6 - CFF2
_01CFE6: ;a8 x-
    lda #$20 : sta $1EF0
    asl      : sta $1EF2
    inc $14F9
    rts
}

{ ;CFF3 -
;ladder stuff

_01CFF3:
    !A16
    sec : lda.b obj.pos_y+1 : sbc #$0010 : sta.b obj.pos_y+1
    !A8
    jsr _01CFE6
    jmp create_CDC4

.D005:
    lda #$0D : sta $3C
    lda #$07 : sta $2F
.D00D:
    brk #$00

;----- D00F

    dec $2F
    bne .D00D

.D013:
    brk #$00

;----- D015

    lda.w p1_button_hold+1
    bit #!up
    bne _01CFF3

    bit #!down
    beq .D013

.D020:
    lda #$0C : sta $3C
    lda #$07 : sta $2F
.D028:
    brk #$00

;----- D02A
    dec $2F
    bne .D028

.D02E:
    lda #$01 ;does nothing
    brk #$00

;----- D032

    lda.w p1_button_hold+1
    bit #!up
    bne .D005

    bit #!down
    beq .D02E

.D03D: ;a8 x8
    lda #$0B : sta $3C
.D041:
    brk #$00

;----- D043

    lda.w p1_button_hold+1
    bit #!up
    beq .D066

    jsl update_animation_normal
    !A16
    dec.b obj.pos_y+1
    !A8
    ldy #$08
    jsr _01D263_D2AB
    bcc .D041

    jsl _01A4E2_A52B
    jsr _01D263_D2C9
    bcc .D041

    bra .D020

.D066:
    bit #!down
    beq .D03D

    jsl update_animation_normal
    !A16
    inc.b obj.pos_y+1
    !A8
    ldy #$08
    jsr _01D263_D2BD
    bcc .D085

    ldy #$00
    jsr _01D263_D2BD
    bcc .D085

    jmp create_CFC8

.D085:
    ldy #$00
    jsl _01A4E2_A4E8
    bcc .D041

    jmp create_CDC4
}

{ ;D090 - D1C3
thing: ;a8 x8
    jsr .D184
    jsr .D16C
    jsr _01DEE7_DEE8
    lda $14C3 : sta $14BB
    stz $14C3
    stz.w is_on_stone_pillar
    lda $0F
    bne .D0B1

    lda.w armor_state : asl : tax
    jsr (.D114,X)
.D0B1:
    jsr _01D2E2
    jsr _01D30F
    jsr .D143
    lda $0F
    bmi .D0C3

    lda.w is_shooting
    bne .D0C7

.D0C3:
    jsl set_sprite_84A7
.D0C7:
    lda.w armor_state
    cmp $14B8
    beq .D0DC

    ;change sprite set and such for arthur
    sta $14B8
    jsr _01DA88
    lda #$FF : sta $26
    jsr set_arthur_palette ;unsure if this should be a local function or not
.D0DC:
    jsl _018E32_8E73
    jsr _01D1E1
    lda $08
    and #$7F
    ldx $0276
    beq +

    ora #$80
+:
    sta $08
    lda $1F9B
    beq +

    jsl _01C679_C67D
+:
    lda $0E
    bmi .D113

    lda $2E
    beq .D113

    dec $2E
    bne .D113

    lda $08   : and #$EF : sta $08
    lda $0276 : and #$FD : sta $0276
.D113:
    rtl

.D114: dw .D126, .D126, .D126, .D126, .D126, .D12A, .D12A, .D12A, .D12A

;-----

.D126:
    jsr .D133
    rts

;-----

.D12A:
    jsl update_animation_normal
    jsl set_sprite_84A7
    rts

;-----

.D133:
    lda.w is_shooting
    beq +

    jsr arthur_set_facing_get_pressed_direction
+:
    jsl update_animation_normal
    jsr _01D371_D3C4
    rts

;-----

.D143:
    lda.w armor_state
    sec
    sbc #$04
    bpl +

    lda #$00
+:
    asl
    sta $0000
    lda $09
    and #$01
    ora $0000
    asl #2
    tax
    !A16
    lda.w arthur_hitbox+0,X : sta $14D6
    lda.w arthur_hitbox+2,X : sta $14D8
    !A8
    rts

;-----

.D16C:
    lda $14F9
    beq .D183

    lda $1EF0 : dec : sta $1EF0
                asl : sta $1EF2
    cmp #$21
    bcs .D183

    stz $14F9

.D183:
    rts

;-----

.D184:
    lda.w stage
    bne .D1AE

    lda.w checkpoint
    beq .D1AE

    ;gets here if at stage 1b
    !A16
    lda.b obj.pos_y+1
    bmi .D199

    cmp #$0018
    bcs .D1AC

.D199:
    ldx #$00 : jsr .D1AF
    bcc .D1AC

    ldx #$06 : jsr .D1AF
    bcc .D1AC

    ldx #$0C : jsr .D1AF
.D1AC:
    !AX8
.D1AE:
    rts

;-----

.D1AF:
    sec
    lda.b obj.pos_x+1
    sbc.w _00BA32+0,X
    clc
    adc.w _00BA32+2,X
    cmp.w _00BA32+4,X
    bcs .D1C3

    lda $14BE : sta.b obj.pos_x+1
.D1C3:
    rts
}

{ ;D1C4 - D1E0
_01D1C4:
    rts

.D1C5: ;a8 x-
    sta.w jump_type
    lda.w jump_press
    beq _01D1C4

    pla : pla
    brk #$00

;----- D1D1

    ldx.w jump_type
    jmp (+,X) : +: dw create_arthur_jump, arthur_baby_jump, arthur_seal_jump, arthur_bee_jump, arthur_maiden_jump
}

{ ;D1E1 - D262
_01D1E1: ;transformation
    lda $14D1 : ora $14F5
    bne .D208

    lda.w transform_timer : ora.w transform_timer+1
    beq .D208

    !A16
    dec.w transform_timer
    lda.w transform_timer
    beq .undo_transformation

    cmp #$003F
    !A8
    bne .D208

    lda $08 : ora #$10 : sta $08 ;flicker
.D208:
    rts

.undo_transformation:
    !A8
    lda $08   : and #$EF : sta $08
    lda.b #create_CDC4    : sta.b obj.state+1
    lda.b #create_CDC4>>8 : sta.b obj.state+2
    lda.w transform_armor_state_stored : sta.w armor_state
    lda #$FF  : sta $3D
    stz.w is_shooting
    lda.w shield_state_stored
    beq .D239

    sta.w !obj_shield.type
    lda.w shield_type_stored : sta.w !obj_shield.init_param
    lda #$0C                 : sta.w !obj_shield.active
.D239:
    lda.w armor_state
    cmp #!arthur_state_bronze
    beq .D245

    cmp #!arthur_state_gold
    beq .D250

    rts

.D245:
    lda #!id_arthur_face : sta.w !obj_upgrade.type
    lda #$0C             : sta.w !obj_upgrade.active
    rts

.D250:
    lda #!id_arthur_plume : sta.w !obj_upgrade.type
    lda #$0C              : sta.w !obj_upgrade.active
    lda #$01              : sta.w can_charge_magic
    stz $14B3
    rts
}

{ ;D263 - D2D3
_01D263: ;a8 x? ;arthur code, called from arthur idle?
    lda $14C3
    bne .D2AA

    lda.w is_shooting
    ora.w current_cage
    bne .D2AA

    lda.w p1_button_hold+1
    bit #!up
    bne .D298

    bit #!down
    beq .D2AA

    ldy #$10
    jsr .D2AB
    bcs .D2AA

    !A16
    lda.b obj.pos_y+1 : adc #$0010 : sta.b obj.pos_y+1
    !A8
    jsr _01CFE6
    pla : pla
    inc $14F6
    jmp _01CFF3_D005

.D298:
    ldy #$0C
    jsr .D2AB
    bcs .D2AA

    jsr _01D957
    pla : pla
    inc $14F6
    jmp _01CFF3_D03D
.D2AA:
    rts

;-----

.D2AB:
    jsr .D2BD
    bcs .D2AA

    ;snap arthur's x position, ladder related
    lda #$FF : sta $0F
    lda.b obj.pos_x+1 : and #$F0 : ora #$08 : sta.b obj.pos_x+1
    rts

;-----

.D2BD: ;arthur at ladder check?
    lda $14E9
    pha
    jsl _01A4E2_A4E8
    pla
    sta $14E9
.D2C9:
    sec
    lda $001F
    sbc $0328
    cmp $0329
    rts
}

{ ;D2D4 - D2E1
set_facing_get_pressed_direction:
    lda.w p1_button_hold+1 : and #!right|!left : tax ;inputs stored in X. also used after return
    lda.w direction_left_or_right,X
    bmi .skip

    sta.b obj.facing ;update facing if only left or only right pressed
.skip:
    rts
}

{ ;D2E2 - D30E
_01D2E2:
    lda.w armor_state
    cmp #!arthur_state_bee
    beq .D30E

    lda.b obj.hp
    ora $08
    bmi .D30E

    lda $14E9
    beq .D30E

    jsl _02FDB3
    lda.b obj.direction : eor #$01 : sta.b obj.direction
    ldx.w stage
    sec : lda.b obj.hp : sbc.w _00BA5E,X : sta.b obj.hp
    bpl .D30E

    inc $14D1
.D30E:
    rts
}

{ ;D30F - D370
_01D30F:
    lda $14D1
    bne .D370

    lda.b obj.pos_y+2
    bmi .D343

    !A16
    clc
    lda $19E8
    adc #$0100
    cmp.b obj.pos_y+1
    !A8
    bcs .D343

    ;falling into a pit
    jsl _018049_8051
    inc $14D1
    lda.b #_01DD5C    : sta.b obj.state+1
    lda.b #_01DD5C>>8 : sta.b obj.state+2
    stz.w !obj_upgrade2.active
    stz.w can_charge_magic
    stz $02AC
    jsr _01DDE6
    rts

;-----

.D343:
    lda $14D2
    bne .D370

    lda.w timer_minutes
    bpl .D370

    ;time over
    stz.w armor_state
    lda.b #destroy    : sta.b obj.state+1
    lda.b #destroy>>8 : sta.b obj.state+2
    lda #$FF : sta.b obj.hp
    stz $0F
    stz $1170
    stz.w can_charge_magic
    stz $02AC
    jsr _01DDE6
    inc $14D2
    inc $14D1
.D370:
    rts
}

{ ;D371 - D564
_01D371:
    asl
    tax
    jmp (+,X) : +: dw .D3B7, .D384, .D392, .D3B8, .D3C3, .D3BC, .D3D1

;-----

.D384:
    stz.w skip_double_jump_boost
    ldy.b obj.speed_y+2
    bmi +

    inc.w skip_double_jump_boost
+:
    inc.w double_jump_state
    rts

;-----

.D392:
    lda $14B9
    cmp $0C
    bne .D3B7

    lda.b obj.anim_timer
    cmp #$07
    bne .D3B7

    lda.w skip_double_jump_boost
    beq .D3AA

    lda #$05 : sta.w double_jump_state
    rts

.D3AA:
    inc.w double_jump_state
    lda #$09 : sta $31 ;flip timer: cuts flip anim short
    lda #$0F : jsl set_sprite_84AF
.D3B7: ;will never jump here directly (double_jump_state is always > 0)
    rts

;-----

.D3B8:
    dec $31
    bne .D3C3

.D3BC:
    lda #$FF : sta $3D ;invalidate sprite
    stz.w double_jump_state
.D3C3:
    rts

;-----

.D3C4:
    lda $14EE
    ora $14B7
    bne .D3C3

    lda.w double_jump_state
    bne _01D371

.D3D1:
    lda.w weapon_cooldown
    beq +

    dec.w weapon_cooldown
+:
    lda.w is_shooting
    beq .D3F4

    lda.w shot_press
    bne .D3FC

    lda $14B9 : jsl _018DB8
    bne .D3F3

    lda #$FF : sta $3D
    stz.w is_shooting
.D3F3:
    rts

.D3F4:
    lda.w shot_press
    beq .D3F3

    inc.w is_shooting
.D3FC:
    lda.w jump_state
    beq .D417

    ;pressing shot while double jumping
    cmp #$02
    beq .D417

    inc.w jump_state
    inc.w double_jump_state
    lda.b obj.speed_y+2
    bpl .D414

    lda #$01 : sta.w weapon_double_jump_boost
.D414:
    stz.w is_shooting
.D417:
    ldx #$00
    lda $09
    and #$01
    beq .D42C

    inx
    lda.w jump_counter
    beq .D42C

    dex
    lda $09 : and #$FE : sta $09 ;clear crouch status bit
.D42C:
    lda.w _00BA7A+2,X : sta $14B9 ;store sprite offset to 2nd shot/crouch shot
    lda.w _00BA7A,X : jsl set_sprite_84AF ;load offset to shot/crouch shot
    ldx.w weapon_current
    lda.w obj_type_count+1,X
    cpx #$09 ;check if weapon is upgraded torch
    bne .D447

    clc
    adc $14CE
.D447:
    cmp.w weapon_limit,X
    bcs .D45C

    lda.w weapon_cooldown
    bne .D45C

    lda.w weapon_current : asl : tax
    jsr (.D45D,X)
    stz.w weapon_double_jump_boost

.D45C:
    rts

.D45D: dw .D50B, .D510, .D51C, .D51C, .D527, .D543, .D510, .D510, .D510, .D510, .D510, .D510, .D549, .D549, .D510, .D510

;-----

.D47D:
    lda.w weapon_current : sta $0000
    jsr get_weapon_slot_local
    bmi .D4D7

    lda $1F25 : sta $002B,X ;store weapon height / 2 in object
    lda #$0C  : sta.w obj.active,X
    lda.w weapon_current
    pha
    inc
    sta.w obj.type,X
    lda #$00
    xba
    pla ;weapon_current
    asl
    ora.w weapon_double_jump_boost
    tay
    lda.w weapon_damage,Y : sta.w obj.hp,X
    jsr _01DD90
    lda $0009,X : ora #$08 : sta $0009,X
    lda.w weapon_double_jump_boost
    tay
    lda.w sprite_shimmer_bit,Y : ora $0008,X : sta $0008,X
    lda.b obj.facing : sta.w obj.direction,X : sta.w obj.facing,X
    lda $07 : sta $0007,X
    phx
    ldx.w weapon_current
    inc.w obj_type_count+1,X
    plx
.D4D7:
    rts

;-----

.D4D8: ;torch
    sta $0000
    sty $0001
    jsr get_weapon_slot_local
    bmi .D50A

    lda #$0C : sta.w obj.active,X
    lda #$08 : sta $0009,X
    lda $1F25 : sta $002B,X
    lda $0000 : sta.w obj.type,X
    jsr _01DD90
    lda.b obj.facing : sta.w obj.direction,X : sta.w obj.facing,X
    lda $0001 : sta $0007,X
.D50A:
    rts

;-----

.D50B: ;lance (and others)
    lda #$0C : sta.w weapon_cooldown
.D510:
    jsr .D47D
    bmi .D51B

    jsl set_spawn_offset
    !X8
.D51B:
    rts

;-----

.D51C: ;knife
    jsr .D47D
    bmi .D526

    jsr .D54E
    !X8
.D526:
    rts

;-----

.D527: ;bowgun
    lda.w obj_type_count+!id_bowgun
    cmp #$04
    bcs .D542

.D52E: ;creates 3 bolts, (1 gets removed later for base bowgun)
    ldx.b obj.facing
    lda.w bowgun_facing_offset,X : sta $07
    jsr .D50B
    inc $07
    jsr .D50B
    inc $07
    jmp .D50B

.D542:
    rts ;unreachable?

;-----

.D543:
    lda.w obj_type_count+!id_bowgun2
    beq .D52E
    rts

.D549:
    stz $07
    jmp .D50B

;-----

.D54E:
    lda #$00 : xba : lda $1D
    lsr
    tay
    lda.w knife_rapid_count
    and #$03
    asl
    clc
    adc.w knife_base_offset,Y
    tay : jsl set_spawn_offset_custom_idx
    rts
}

{ ;D565 - D6F7
_01D565: ;a8 x?
    lda $14E3
    beq .D59E

    lda.w armor_state
    cmp #!arthur_state_gold
    bne .D59E

    pla : pla
    jsl _019697
    jsr _01DDE6
    lda #$FF : sta $0F
    stz.w is_shooting
    jmp .D59F

.D584:
    stz $0F
    jsr _01DDEF_local
    lda $0276 : ora #$02 : sta $0276
    lda $08 : ora #$90 : sta $08
    lda #$2D : sta $2E
    jmp create_CDC4

.D59E:
    rts

.D59F:
    lda.w magic_current : asl : tax
    jmp (+,X) : +: dw .thunder, .fire_dragon, .seek, .tornado, .shield, .lightning, .nuclear

;-----

.thunder:
    lda #$13 : sta $3C
    jsr _01EDAD
.D5BC:
    brk #$00

;----- D5BE

    jsr _01D957
    lda $14E3
    bne .D5BC

    lda #$21 : sta $30
.D5CA:
    brk #$00

;----- D5CC

    jsr _01D957
    dec $30
    bne .D5CA

    bra .D584

;-----

.fire_dragon:
    lda #$13 : sta $3C
    jsr _01EF44
.D5DC:
    brk #$00

;----- D5DC

    lda $14E3
    bne .D5DC

    lda #$21 : sta $30
.D5E7:
    brk #$00

;----- D5E9

    jsr _01D957
    dec $30
    bne .D5E7

    jmp .D584

;-----

.seek:
    lda.w bowgun_magic_active : sta $14F8
    lda #$01 : sta.w bowgun_magic_active
    jsr get_magic_slot
    bmi .D62C

    lda #$80      : sta $0008,X
    lda #$0C      : sta.w obj.active,X
    lda #!id_seek : sta.w obj.type,X
    !X8
    lda #$FF : sta $0F
    stz $14B1
    jsr _01DDE6
    lda #$13 : sta $3C
.D622:
    brk #$00

;----- D624

    jsr _01D957
    lda $14E3
    bne .D622

.D62C:
    lda $14F8 : sta.w bowgun_magic_active
    jmp .D584

;-----

.tornado:
    lda #$13 : sta $3C
    jsr _01D6F8
    lda #$3F : sta $30
.D640:
    brk #$00

;----- D642

    jsr _01D957
    dec $30
    bne .D640

    stz $14E3
    jmp .D584

;-----

.lightning:
    lda #$13 : sta $3C
    jsr _01EC63
.D656:
    brk #$00

;----- D658

    jsr _01D957
    lda $14E3
    bne .D656

    lda #$21 : sta $30
.D664:
    brk #$00

;----- D666

    jsr _01D957
    dec $30
    bne .D664

    jmp .D584

;-----

.shield:
    lda $14E7
    bne .D6B5

    lda.w open_magic_slots
    cmp #$03
    bcc .D6B5

    lda #$13 : sta $3C
    lda #$10 : sta $30
.D684:
    brk #$00

;----- D686

    jsr _01D957
    dec $30
    bne .D684

    inc $14E7
    lda.b #!sfx_magic_shield : jsl _018049_8053
    lda #$02 : sta $0000
.D69B:
    jsr get_magic_slot
    lda #$0C : sta.w obj.active,X
    lda #!id_shield_magic : sta.w obj.type,X
    lda $0000 : sta $0007,X
    !X8
    dec $0000
    bpl .D69B

.D6B5:
    stz $14E3
    jmp .D584

;-----

.nuclear:
    lda #$13 : sta $3C
    jsr get_magic_slot
    lda #$0C : sta.w obj.active,X
    lda #!id_nuclear : sta.w obj.type,X
    lda #$80 : sta $0008,X
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.w obj.pos_x+1,X
    sec : lda.w !obj_arthur.pos_y+1 : sbc #$0040 : sta.w obj.pos_y+1,X
    !AX8
    lda #$3F : sta $30
.D6E9:
    brk #$00

;----- D6EB

    jsr _01D957
    dec $30
    bne .D6E9

    stz $14E3
    jmp .D584
}

{ ;D6F8 - D72A
_01D6F8:
    lda #$01 : sta $0000
.D6FD:
    jsr get_magic_slot
    bmi .D725

    lda #$0C : sta.w obj.active,X
    lda #!id_tornado : sta.w obj.type,X
    !A16
    lda.w !obj_arthur.pos_x+1 : sta.w obj.pos_x+1,X
    lda.w !obj_arthur.pos_y+1 : sta.w obj.pos_y+1,X
    lda $0000 : sta.w obj.direction,X : sta.w obj.facing,X
    !AX8
.D725:
    dec $0000
    bpl .D6FD

    rts
}

{ ;D72B - D8B2
destroy: ;a8 x8
    lda.w is_frozen
    beq .D744

    !AX16
    ldx #$001E : lda #$0040 : ldy #$0100 : jsl _019136_9187
    !AX8
    stz.w is_frozen
.D744:
    ldy #$00
    ldx #$20
    sty $3E
    stx $3F
    stz.w transform_timer
    stz $14DF
    stz $14EF
    stz $14F5
    lsr.w weapon_current : asl.w weapon_current ;clear bit0
    inc $14F7
    inc.w jump_counter
    ldy #$00 : jsl set_speed_xyg ;knockback
    lda #$FF : sta $0F
    lda #$09 : sta $3C
    stz.w is_shooting
    stz.w !obj_upgrade.active
    stz.w !obj_upgrade2.active
    lda.b obj.hp
    bpl .D791

    ;0 hp
    stz $02AC
    stz.w armor_state
    lda $08 : and #$EF : sta $08
    jsr _01DA88
    jmp .D819

.D791:
    lda.w transform_armor_state_stored : sta.w armor_state
    ldy #$01 : jsr set_arthur_palette_D9DB
    lda #!sfx_armor_shatter : jsl _018049_8053
    lda #$05 : sta $0000 ;armor piece count
    jsr _019697_96CA
    stz $0332
    inc $0331
.D7B0:
    jsr get_magic_slot
    lda #$0C : sta.w obj.active,X ;0C: "create" enum value of sorts
    lda #!id_armor_piece : sta.w obj.type,X
    jsr _01DD90
    lda $0008,X : ora #$80 : sta $0008,X
    lda $0000
    asl
    sta $003D,X ;store current loop counter in obj to tell them apart
    asl
    !A16
    and #$00FF
    tay
    clc
    lda.b obj.pos_x+1 : adc.w _00BA8A+0,Y : sta.w obj.pos_x+1,X
    clc
    lda.b obj.pos_y+1 : adc.w _00BA8A+2,Y : sta.w obj.pos_y+1,X
    !AX8
    dec $0000
    bpl .D7B0

    brk #$00

;----- D7F1

    stz.w armor_state
    stz.w transform_armor_state_stored
.D7F7:
    jsr _01D8B3
    jsr _01D8F1
    jsr _01D91C
    jsr _01D8BF
    jsr _01D97E
    beq .D815

    ;landing after taking a hit
    lda #$7E : sta $2E
    lda $08 : ora #$10 : sta $08
    jmp arthur_create_CDBE

.D815:
    brk #$00

;----- D817

    bra .D7F7

;-----

.D819:
    lda.b #!sfx_arthur_death : jsl _018049_8053
    lda #$1F : sta $30
.D823:
    brk #$00

;----- D825

    jsl update_animation_normal
    jsr _01D8B3
    jsr _01D8F1
    jsr _01D91C
    jsr _01D8BF
    jsr _01D97E
    dec $30
    bne .D823

    lda #$0A : sta $3C
.D840:
    brk #$00

;----- D842

    lda $0C
    cmp #$84
    beq +

    jsl update_animation_normal
+:
    jsr _01D8B3
    jsr _01D8F1
    jsr _01D91C
    jsr _01D8BF
    jsr _01D97E
    beq .D840 ;branch if not on ground yet

    lda #$3F : sta $30
    inc $14D1
.D864:
    brk #$00

;----- D866

    jsr _01D8BF
    jsr _01D957
    jsl update_animation_normal
    dec $30
    bne .D864

    jsr _01D8E6
.D877:
    brk #$00

;----- D879

    lda $00DE : bne .D877 ;check if fading is done

    lda #$00
    ldx $1FB9
    bne .D88D

    lda #$05
    ldx $14D2
    beq .D88D

    inc
.D88D:
    sta $0278
    stz $0279
    stz $0332
    inc $0331
    lda #!arthur_state_steel : sta.w arthur_state_stored
    stz.w upgrade_state_stored
    stz.w shield_state_stored
    stz.w shield_type_stored
    lda.w weapon_current : and #$FE : sta.w current_weapon_stored
.D8AF:
    brk #$00

;----- D8B1

    bra .D8AF ;never reached? maybe just safety measure
}

{ ;D8B3 - D8BE
_01D8B3: ;a8 x-
    lda $1F91
    bne .D8BB

    jmp arthur_cap_fall_speed

.D8BB:
    inc $14C3
    rts
}

{ ;D8BF - D8E5
_01D8BF: ;a8 x-?
    lda.w !obj_arthur.pos_y+2
    bmi .D8D4

    !A16
    clc
    lda $19E8
    adc #$0100
    cmp.w !obj_arthur.pos_y+1
    !A8
    bcc .D8D5

.D8D4:
    rts

.D8D5:
    pla : pla
    stz.w !obj_upgrade2.active
    stz.w can_charge_magic
    stz $02AC
    jsr _01DDE6
    jmp _01DD5C
}

namespace off
