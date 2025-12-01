namespace zombie

{
create: ;a- x8
    !A16
    lda.b obj.pos_x+1
    cmp #$0880
    !A8
    bcc +

    jmp _0281A8_81B5
+:
    lda #$18 : sta $10
    lda #$02 : sta $1D
    lda #$01 : sta.b obj.flags1
    lda #$10 : sta.b obj.flags2
    !A16
    lda.w _00ED00+$3A : sta $27
    lda #zombie_data_coord_offsets : sta $13 ;collision related
    !A8
    jsl set_hp
    lda #$10 : sta $2F
    stz $15
    stz.b obj.zombie.on_ground
    stz.b obj.zombie.speed_idx
    stz.b obj.zombie.skip_collision_check
    lda #$FF : sta $37
    ldy #$04 : lda #$00 : jsl _019389
.8D65:
    dec $2F
    bne +

    jmp _0281A8_81B5
+:
    brk #$00

;----- 8D6E

    jsl _01939D
    beq .8D65

    sec
    sbc $0324
    cmp $0325
    bcs +

    lda $14D0
    beq .8D65

+:
    lda #$FF : sta $26
    ldx #$01
    jsl _018D5B
    brk #$00

;----- 8D8E

    stz $3A
    lda $09 : ora #$80 : sta $09
    lda $07
    cmp #$0F
    beq .8DA5

    lda $07
    bpl .8DDF

    stz $07
    jmp .8EBB
.8DA5:
    stz $07
    lda #$01 : sta $12 : sta.b obj.direction
    ldy #$78 : ldx #$22 : jsl set_sprite
    !A16
    lda #$0224 : sta $0C
    !A8
    ldx #$9A : jsl _0196EF : sta $2F
    lda #$01 : sta $37
    lda #$FF : sta.b obj.zombie.coffin_open_timer
.8DCE:
    brk #$00

;----- 8DD0

    dec.b obj.zombie.coffin_open_timer
    beq .8DDC

    ldy $2F : jsl arthur_range_check_x
    bcs .8DCE

.8DDC:
    jmp .8EAB

;-----

.8DDF:
    stz $3D
    lda #$00
    jsr .8F64
    lda #$1E : cop #$00

;----- 8DEA

    lda $08 : ora #$10 : sta $08
    jsl get_arthur_relative_side
    sta $12
    ldy #$78 : ldx #$22 : jsl set_sprite
    !A16
    lda #$004F : sta.b obj.zombie.unburrow_timer
    stz $2F
.8E07:
    lda.b obj.zombie.unburrow_timer
    and #$0001
    beq .8E1D

    lda $2F : eor #$0001 : sta $2F
    beq .8E1B

    inc.b obj.pos_x+1
    bra .8E1D

.8E1B:
    dec.b obj.pos_x+1
.8E1D:
    brk #$00

;----- 8E1F

    dec.b obj.zombie.unburrow_timer
    bne .8E07

    lda #$0001
    sta $37
    !A8
    lda $08 : and #$EF : sta $08
    !A16
    lda.b obj.pos_x+1
    cmp #$0200
    !A8
    bcc .8EA3

    ldx #$58 : jsl _0196EF : sta.b obj.zombie.flight_timer ;0 = no flight
    beq .8EA3

    inc.b obj.zombie.skip_collision_check
    ldy #$09 : jsl set_speed_y ;flying coffin speed
.8E4D:
    brk #$00

;----- 8E4F

    jsl update_pos_y
    jsl _01A559
    dec.b obj.zombie.flight_timer
    bne .8E4D

    inc $0F
    stz.b obj.zombie.circling_timer
    stz.b obj.direction
    ldx #$5A : jsl _0196EF : cop #$00

;----- 8E69

    stz $0F
    jsl _01A559
    bne .8EAB

    ldy #$72 : ldx #$22 : jsl set_sprite
    lda #$30 : cop #$00

;----- 8E7D

    stz $37
    ldy #$6E : ldx #$22 : jsl set_sprite
    ldy #$23 : jsl set_speed_xyg
    jsl get_arthur_relative_side : sta.b obj.facing : sta.b obj.direction
.8E95:
    brk #$00

;----- 8E97

    jsl update_pos_xyg_add
    jsl _01A559
    beq .8E95

    bra .8EC3

.8EA3:
    ldx #$48 : jsl _0196EF : cop #$00

;----- 8EAB

.8EAB:
    ldy #$72 : ldx #$22 : jsl set_sprite
    ldx #$B0 : jsl _0196EF : cop #$00

;----- 8EBB

.8EBB:
    jsl get_arthur_relative_side : sta.b obj.facing : sta.b obj.direction
.8EC3:
    stz $37
    ldx.w difficulty
    clc
    lda $07
    adc.w zombie_data_difficulty_speed_offset,X
    sta $0000
    asl
    clc
    adc $0000
    sta.b obj.zombie.speed_idx
    inc.b obj.zombie.skip_collision_check
    ldy #$70 : ldx #$22 : jsl set_sprite
    lda #$0F : cop #$00

;----- 8EE6

    lda #$5A : sta.b obj.zombie.reburrow_timer
    lda #$01 : sta.b obj.zombie.reburrow_timer+1
    ldy #$76 : ldx #$22 : jsl set_sprite
    jsr pot_creation_local
.8EF9:
    ldy.b obj.zombie.speed_idx : jsl set_speed_x
    stz.b obj.zombie.skip_collision_check
.8F01:
    jsl update_pos_x
    !A16
    dec.b obj.zombie.reburrow_timer
    !A8
    beq .8F29

    ldy #$04 : jsl _01A4E2_A4E8
    bcs .8F29

    lda $35
    beq .8F21

    ldy #$08 : jsl _01A4E2_A4E8
    bcc .8F29

.8F21:
    lda.b obj.zombie.on_ground
    beq .8F7C

    brk #$00

;----- 8F27

    bra .8F01

.8F29:
    lda $08 : ora #$10 : sta $08
    lda #$FF : sta $37
    lda #$08 : cop #$00

;----- 8F37

    ldy #$7A : ldx #$22 : jsl set_sprite
    lda #$01 : jsr .8F64
    lda #$3F : cop #$00

;----- 8F48

    lda $08 : and #$F7 : sta $08
    lda $3A
    beq +

    stz $3A
    !X16
    ldy $3B : jsr remove_child_object
    !X8
+:
    lda #$3F : cop #$00

;----- 8F61

    jmp _0281A8_81B5

;-----

.8F64: ;a8 x8
    jsl get_object_slot
    bmi .ret

    sta $002F,X
    tdc
    sta $002D,X
    xba
    sta $002E,X
    lda #!id_coffin_dirt : jsl prepare_object_8C37
.ret:
    rts

;-----

.8F7C:
    ldy #$22 : jsl set_speed_xyg
    inc.b obj.zombie.skip_collision_check
.8F84:
    brk #$00

;----- 8F86

    jsl update_pos_xyg_add
    jsl _01A559
    beq .8F84

    jmp .8EF9

;-----

thing:
    ldy #$0A : jsr pot_spawn_offset_local
    lda $0F ;flight timer
    beq .8FB1

    dec.b obj.zombie.circling_timer
    bpl .8FAB

    lda #$08 : sta.b obj.zombie.circling_timer
    lda.b obj.direction : dec : and #$0F : sta.b obj.direction
.8FAB:
    ldx #$04 : jsl update_pos_xy_2
.8FB1:
    lda.b obj.zombie.speed_idx
    cmp #$1E ;$1E = beginner's slow zombie
    bne .8FBF

    lda #$0F : jsl update_animation_custom_timer
    bra +

.8FBF:
    jsl update_animation_normal
+:
    jsl _018E32_8E73
    lda.b obj.zombie.skip_collision_check
    bne .8FDA

    stz.b obj.zombie.on_ground
    jsl _01A5AF
    beq +

    inc.b obj.zombie.on_ground ;set if colliding with floor
+:
    lda $001E : sta $35 ;store collision status
.8FDA:
    lda.w current_cage   ;skip some checks if arthur is inside a cage
    bne .8FF3

    lda $37             ;determines how to handle weapon collision
    beq .8FEA

    bmi .8FF3

    jsr _02FB9C_FBC0    ;turns weapon sprite into collision sprite?
    bra .8FF0

.8FEA:
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
.8FF0:
    jmp _02FD62_FD7C
.8FF3:
    rts

;-----

destroy:
    jsr drop_pot_local
    inc $3D
    jmp _028BEC
}

namespace off
