org $028000

{ ;8000 - 8047
_028000: ;a- x-
    jsr .local
    rtl

.local: ;a- x-
    !AX16
    stz $1F19
    lda.w _00B938,X : sta $1F14
    !A8
    inx #2
    lda.w _00B938,X : sta $1F16 : sta $0001
    inx
    lda.w _00B938,X : sta $1F17
    ldy $1F14
    ldx #$0000
.8029:
    lda #$20 : sta $0000
.802E:
    phx
    tyx
    lda $7EF400,X
    plx
    sta $7EAE00,X
    inx
    iny
    dec $0000
    bne .802E

    dec $0001
    bne .8029

    !X8
    rts
}

{ ;8048 - 8052
_028048: ;a- x-
    jsr .local
    rtl

.local: ;a- x-
    !AX8
    txa
    sta $1F18
    rts
}

{ ;8053 - 8073
_028053:
    jsr .local
    rtl

.local: ;a- x?
    !A16
    lda !obj_pos_x+1
    adc #$0070
    sbc.w camera_x+1
    cmp #$01E0
    bcs .8071

    lda !obj_pos_y+1
    adc #$0030
    sbc.w camera_y+1
    cmp #$0160
.8071:
    !A8
    rts
}

{ ;8074 - 80B8
_028074: ;a8 x8
    bit $09
    bvs .808E

    pla : pla
    jmp _0281A8_81B5

;-----

.807D:
    bit $09
    bvs .80A6

    pla : pla : pla
    jmp _0281A8_81B5

;-----

.8087: ;a8 x8
    bit $09
    bvs .808E

    jmp _0281BB

.808E:
    rts

;-----

;unused?
    bit $09
    bvs .808E

    !A16
    lda.w camera_x+1
    cmp !obj_pos_x+1
    !A8
    bcc .808E

    pla : pla
    jmp _0281A8_81B5

;-----

.80A3:
    jsr .80A7
.80A6:
    rtl

.80A7: ;a8 x8
    bit $09
    bvs .808E

    !A16
    lda.w camera_x+1
    cmp !obj_pos_x+1
    !A8
    bcc .808E

    jmp _0281BB
}

{ ;80B9 - 80C4
remove_child_object: ;a- x16
    php
    phd
    phy
    pld
    !AX8
    jsr _0281BB
    pld
    plp
    rts
}

{ ;80C5 - 80CA
_0280C5: ;remove object?
    jsr _0280E9
    jmp _02821B_827A
}

{ ;80CB - 80E8
_0280CB:
    pla : pla
    pla : pla
    pla : pla
    pla

.remove_weapon: ;a8 x8
    jsr _0280E9
    inc !open_weapon_slots : inc !open_weapon_slots
    ldy !open_weapon_slots
    tdc
    sta !slot_list_weapons,Y
    xba
    sta !slot_list_weapons+1,Y
    jmp _02821B_827A
}

{ ;80E9 - 810C
_0280E9: ;a8 x8
    ldx !obj_type
    dec.w obj_type_count,X ;decrease type count
.80EE: ;a8 x-
    stz !obj_active
    stz $2C
.80F2: ;a8 x-
    stz $08
    stz $09
    stz !obj_direction
    stz !obj_facing
    stz $10
    stz $29
    stz $2A
    stz $2B
    stz $0F
    stz $15
    stz $25
    stz $26
    stz $3A
    rts
}

{ ;810D -
_02810D: ;a8 x16
    jsr .local
    rtl

.local: ;a8 x16
    php
    phd
    phy
    pld
    inc !open_weapon_slots : inc !open_weapon_slots
    ldy !open_weapon_slots
    tdc
    sta !slot_list_weapons+0,Y
    xba
    sta !slot_list_weapons+1,Y
    !X8
    jsr _0280E9
    pld
    plp
    rts
}

{ ;812E - 8143
_02812E: ;a8 x-
    pla : sta $27
    pla : sta $28
.8134:
    brk #$00

;----- 8136

    jsr _0281A8
    bit $09
    bvc .8134

    lda $28 : pha
    lda $27 : pha
    rts
}

{ ;8144 - 8153
_028144: ;a- x-
    !A16
    clc
    lda !obj_pos_x+1
    adc #$0020
    cmp.w screen_boundary_left
    !A8
    bcc _0281BB

    rts
}

;todo: figure out what to do with these
;maybe connect all screen boundary left check functions into one block
_028154: rtl
_028155: rts

{ ;8156 - 8165
_028156: ;a- x-
    !A16
    clc
    lda !obj_pos_x+1
    adc #$0020
    cmp.w screen_boundary_left
    !A8
    bcc _0281DD

    rtl
}

{ ;8166 - 8175
_028166: ;a- x-
    !A16
    lda !obj_pos_x+1
    cmp.w screen_boundary_left
    !A8
    bcs _028154
    pla
    pla
    pla
    bra _0281A8_81B5
}

{ ;8176 -
_028176: ;a- x-
    !A16
    lda.w stage
    cmp #$0008
    bne .8196

    lda !obj_pos_y+1
    sec
    sbc #$0100
    cmp !arthur_pos_y+1
    bcs .819F

    lda !obj_pos_y+1
    clc
    adc #$0100
    cmp !arthur_pos_y+1
    bcc .819F

.8196:
    lda !obj_pos_x+1
    cmp.w screen_boundary_left
    !A8
    bcs _028155

.819F:
    !A8
    dec.w weapon_item_count
    pla : pla
    bra _0281A8_81B5

    ;todo: connect these functions?
}

{ ;81A8 - 81BA
_0281A8: ;a- x8
    !A16
    lda !obj_pos_x+1
    cmp.w screen_boundary_left
    !A8
    bcs _028155

    pla : pla
.81B5: ;a8 x8
    jsr _0281BB
    jmp _02821B_827A
}

{ ;81BB - 81DC
_0281BB: ;a8 x8
    jsr _0281FF
    ldx $2C
    lda $1D9A,X
    bmi +

    stz $1D9A,X
+
    jsr _0280E9
    inc !open_object_slots : inc !open_object_slots
    ldy !open_object_slots
    tdc
    sta !slot_list_objects+0,Y
    xba
    sta !slot_list_objects+1,Y
    rts
}

{ ;81DD - 81FE
_0281DD:
    jsr _0281FF
    ldx $2C
    lda $1D9A,X
    bmi .81EA

    stz $1D9A,X
.81EA:
    jsr _0280E9
    inc !open_object_slots
    inc !open_object_slots
    ldy !open_object_slots
    tdc
    sta !slot_list_objects+0,Y
    xba
    sta !slot_list_objects+1,Y
    rtl
}

{ ;81FF - 821A
_0281FF: ;a8 x8
    ldx $2B
    beq .ret

    inc $14A7,X
    inc $14A7,X
    clc
    lda.w _00A6A4-1,X
    adc $14A7,X
    tay
    !A16
    lda $29 : sta $1448,Y
.ret:
    !AX8
    rts
}

{ ;821B - 877F
_02821B: ;a8 x8
    ;obj handling
    phd
    lda #$35 : sta $02C5
    stz $02C6
    lda #$04 : xba : lda #$3C
    tcd

.822A:
    lda $1F96
    beq .824B

    !A16
    tdc
    cmp #!slot_arthur
    beq .826C

    cmp #!slot_upgrade
    beq .826C

    cmp #!slot_shield
    beq .826C

    cmp #!slot_weapons
    beq .826C

    !A8
    jmp .828E

.824B:
    lda $1F95
    beq .826E

    !A16
    tdc
    cmp #!slot_arthur
    beq .826C

    cmp #!slot_upgrade
    beq .826C

    cmp #!slot_shield
    beq .826C

    cmp #!slot_upgrade2
    beq .826C

    !A8
    jmp .828E

.826C:
    !A8
.826E:
    lda !obj_active
    beq .828E

    cmp #$01
    bne .82AC

    dec !obj_timer
    beq .82AC

.827A: ;a8 x8
    lda $09
    bpl .828E

    lda !obj_type
    bpl .8289

    asl
    tax
    jsr (.thing_object_offsets+256,X)
    bra .828E

.8289:
    asl
    tax
    jsr (.thing_object_offsets,X)
.828E:
    !A16
    clc
    tdc
    adc #!obj_size
    tcd
    clc
    lda !arthur_pos_y+1 : adc $14D8 : sta $14DA
    !A8
    inc $02C6
    dec $02C5
    bne .822A

    pld
    rtl

.82AC:
    ldx #$08 : stx !obj_active
    cmp #$0C
    bcs .82BD

    !A16
    lda !obj_state+2 : pha
    lda !obj_state+0 : pha
    rti ;push state code offset and run it

.82BD:
    asl
    bcs .82CE

    lda !obj_type
    bmi +

    asl
    tax
    jmp (.create_object_offsets,X)

+:
    asl
    tax
    jmp (.create_object_offsets+256,X)

.82CE:
    lda !obj_type
    bmi +

    asl
    tax
    jmp (.destroy_object_offsets,X)

+:
    asl
    tax
    jmp (.destroy_object_offsets+256,X)

.create_object_offsets: ;82DC
    dw arthur_create, lance_create, lance2_create, knife_create, knife2_create, bowgun_create, bowgun2_create, scythe_create, scythe2_create, torch_create, torch2_create, axe_create, axe2_create, triblade_create, triblade2_create, bracelet_create
    dw bracelet2_create, lance_fire_trail_create, knife2_shimmer_create, thunder_create, seek_create, shield_magic_create, fire_dragon_create, tornado_create, lightning_create, nuclear_create, armor_upgrade_vfx_create, plume_create, face_create, stage4_transform_create, shield_create, armor_piece_create
    dw shield_piece_create, weapon_hit_create, pot_create, bracelet_tail_create, enemy_spawner_create, $8780, $EEEA, stone_pillar_create, $FFFF, flower_part_create, torch_flame_create, torch2_flame_create, $FFFF, $B0CD, $FFFF, shell_create
    dw shell_pearl_create, $9139, $9174, $9191, $91DD, belial_create, belial_flame_create, princess_create, hydra_fireball_create, $B3AA, rosebud_create, black_cover_create, bars_create, eagler_create, rotating_platform_create, chest_create
    dw magician_create, armor_create, weapon_create, pickup_shield_create, $BED3, magician_orb_create, small_explosion_create, stone_pillar2_create, point_statue_create, stage4_exit_create, raft_pulley_create, zombie_create, $9224, water_crash_splash_create, flower_bud_create, flower_projectile_create
    dw raft_hanging_create, icicle_create, gate_create, cockatrice_spawner_create, ready_go_create, siren_create, flying_killer_create, hydra_create, hydra_genie_create, key_create, key_message_create, raft_create, guillotine_create, $C40D, ghost_create, ghost_unformed_create
    dw flower_head_create, cockatrice_legs_create, cockatrice_neck_create, cockatrice_head_create, siren_projectile_create, arthur_map_create, miniwing_create, cockatrice_wings_create, cockatrice_body_create, skulls_create, money_bag_create, mimic_create, mimic_ghost_create, hannibal_create, storm_cesaris_projectile_create, coffin_dirt_create
    dw boss_explosion_spawner_create, boss_explosion_create, wolf_create, pier_create, rosebud_chunk_create, cockatrice_neck_base_create, storm_cesaris_create, storm_cesaris_parts_create, flying_knight_create, bat_spawner_create, bat_create, chest2_create, pier_splinter_create, bracelet_item_create, bracelet_item_sparkle_create, crumbling_wall_create
    dw grilian_create, _029ED3_create, magic_charge_create, tower_edge_create, silk_gate_create, gargoyle_statue_create, grilian_projectile_create, skull_flower_multi_inactive_create, skull_flower_multi_create, arremer_projectile_create, arremer_create, moving_platform_create, death_crawler_handler_create, death_crawler_part_create, death_crawler_create, $89C6
    dw geyser_create, _0289D3_create, _0289DC_create, killer_create, tiny_goblin_create, game_over_text_flames_create, explosion_spawner_create, hannibal_projectile_create, coral_create, waterfall_end_create, silk_platform_create, $8A25, menu_control_create, lava_pillar_create, $8A47, lava_dropper_create
    dw lava_create, astaroth_create, nebiroth_create, conveyor_belt_create, cockatrice_head2_spawner_create, cockatrice_head2_create, gate2_create, mad_dog_create, astaroth_flame_create, astaroth_laser_create, nuclear_projectile_create, ice_bridge_segment_create, ice_bridge_spawner_create, avalanche_create, death_crawler_projectile_create, $88A1
    dw cockatrice_head2_projectile_create, veil_allocen_create, veil_allocen_part_create, intro_cutscene_obj_create, cutscene_arthur_create, $88DF, satan_create, satan_wings_create, veil_allocen_claw1_create, veil_allocen_claw2_create, veil_allocen_spawner_create, nebiroth_flame_create, nebiroth_laser_create, veil_allocen_projectile_create, freeze_splinter_create, astaroth_nebiroth_body_create
    dw princess_dialogue_create, samael_create, samael_platform_create, samael_laser_create, sun_create, ending_obj_create

.destroy_object_offsets: ;8468
    dw arthur_destroy, weapon_destroy, weapon_destroy, weapon_destroy, knife2_destroy, weapon_destroy, weapon_destroy, scythe_destroy, scythe2_destroy, $878E, $878E, $878E, $878E, $878E, $878E, weapon_destroy_8792
    dw weapon_destroy_8792, $8780, _0280CB_remove_weapon, $8780, $8780, $8780, $8780, $8780, $8780, $8780, $8780, $8780, $8780, $8780, $90B2, $8780
    dw $8780, $8780, $8780, $8780, $81B5, $8780, $8780, $8780, $8780, flower_part_destroy, weapon_destroy, weapon_destroy, $8780, $8780, $8780, shell_destroy
    dw $8BB9, $8780, $8780, $8780, $8780, $8780, $8780, $8780, $8BB9, $8780, rosebud_destroy, $8BEC, obj_void, eagler_destroy, $8780, chest_destroy
    dw magician_destroy, $8780, $8780, $8780, $8780, $8BB9, $8780, $81B5, $81B5, $81B5, $81B5, zombie_destroy, $81B5, $81B5, $81B5, $8BB9
    dw $8780, icicle_destroy, $8780, $8780, $8780, siren_destroy, flying_killer_destroy, hydra_destroy, $8780, key_destroy, key_message_destroy, $8780, guillotine_destroy, $8780, ghost_destroy, ghost_unformed_destroy
    dw flower_part_head_destroy, cockatrice_legs_destroy, cockatrice_neck_destroy, cockatrice_head_destroy, _028BEC_8BF9, obj_void, miniwing_destroy, cockatrice_wings_destroy, cockatrice_body_destroy, $81B5, $8780, $8BEC, $8BEC, hannibal_destroy, $8BB9, $81B5
    dw boss_explosion_spawner_destroy, boss_explosion_destroy, wolf_destroy, $8780, $81B5, cockatrice_neck_base_destroy, storm_cesaris_destroy, storm_cesaris_parts_destroy, flying_knight_destroy, bat_spawner_destroy, bat_destroy, chest_destroy, $8780, $8780, $8780, $8780
    dw grilian_destroy, _029ED3_destroy, $8780, $8780, $8780, gargoyle_statue_destroy, $8BB9, $8780, skull_flower_multi_destroy, arremer_projectile_destroy, arremer_destroy, moving_platform_destroy, death_crawler_handler_destroy, $FFFF, death_crawler_destroy, $8780
    dw $8780, $8780, _0289DC_destroy, killer_destroy, tiny_goblin_destroy, $8780, $8780, _028BB9, _028BEC, $8780, $8780, arremer_killers_destroy, $8780, $8780, $8780, $8A4F
    dw $8780, astaroth_destroy, nebiroth_destroy, $8780, cockatrice_head2_spawner_destroy, cockatrice_head2_destroy, $8780, mad_dog_destroy, astaroth_flame_destroy, $81B5, $8780, ice_bridge_segment_destroy, ice_bridge_spawner_destroy, $8780, $81B5, $8780
    dw _028BB9, veil_allocen_destroy, veil_allocen_part_destroy, $8780, $8780, $8780, $8780, $8780, veil_allocen_claw1_destroy, veil_allocen_claw2_destroy, $8780, nebiroth_flame_destroy, $81B5, $81B5, $81B5, $81B5
    dw $8780, samael_destroy, samael_platform_destroy, samael_laser_destroy, $8780, $8780

.thing_object_offsets: ;85F4 ;todo: figure out a better name. code that needs to run every frame regardless of state?
    dw arthur_thing, $8780, $8780, $8780, $8780, $8780, bowgun2_thing, scythe_thing, $87D0, $8780, $8780, axe_thing, axe2_thing, triblade_thing, triblade2_thing, bracelet_thing
    dw bracelet2_thing, $882D, $8780, thunder_thing, seek_thing, shield_magic_thing, fire_dragon_thing, tornado_thing, lightning_thing, nuclear_thing, $8780, $8780, $8780, $8780, $8780, $8780
    dw $8780, $8780, $8780, bracelet_tail_thing, enemy_spawner_thing, $8780, $8780, $8780, _02FD62_FD7C, flower_part_thing, torch_flame_thing, torch2_flame_thing, _02FD62_FD7C, $8780, $8780, shell_thing
    dw shell_pearl_thing, $8780, $8780, $8780, $8780, belial_thing, $8780, $8780, $AF04, $8780, rosebud_thing, $8780, obj_void, eagler_thing, rotating_platform_thing, chest_thing
    dw magician_thing, armor_thing, weapon_thing, pickup_shield_thing, $8780, magician_orb_thing, $8780, $81B5, $81B5, $81B5, raft_pulley_thing, zombie_thing, $8780, $8780, $8780, flower_projectile_thing
    dw $8780, icicle_thing, $8780, $8780, $8780, siren_thing, flying_killer_thing, hydra_thing, hydra_genie_thing, key_thing, key_message_thing, raft_thing, guillotine_thing, $8780, ghost_thing, ghost_unformed_thing
    dw flower_head_thing, cockatrice_legs_thing, cockatrice_neck_thing, cockatrice_head_thing, siren_projectile_thing, obj_void, miniwing_thing, cockatrice_wings_thing, cockatrice_body_thing, skulls_thing, $8780, mimic_thing, mimic_ghost_thing, hannibal_thing, storm_cesaris_projectile_thing, $8780
    dw boss_explosion_spawner_thing, boss_explosion_thing, wolf_thing, pier_thing, rosebud_chunk_thing, $8780, storm_cesaris_thing, storm_cesaris_parts_thing, flying_knight_thing, bat_spawner_thing, bat_thing, chest_thing, $8780, bracelet_item_thing, bracelet_item_sparkle_thing, $8780
    dw grilian_thing, _029ED3_thing, $8780, $894C, $8780, gargoyle_statue_thing, grilian_projectile_thing, $8780, skull_flower_multi_thing, arremer_projectile_thing, arremer_thing, moving_platform_thing, death_crawler_handler_thing, death_crawler_part_thing, death_crawler_thing, $8780
    dw geyser_thing, _0289D3_thing, _0289DC_thing, $89ED, tiny_goblin_thing, $8780, $8780, hannibal_projectile_thing, coral_thing, $8780, $8780, arremer_killers_thing, $8780, lava_pillar_thing, $8780, $8780
    dw lava_thing, astaroth_thing, $8A71, conveyor_belt_thing, cockatrice_head2_spawner_thing, cockatrice_head2_thing, $8780, mad_dog_thing, astaroth_flame_thing, $8ABB, nuclear_projectile_thing, ice_bridge_segment_thing, ice_bridge_spawner_thing, avalanche_thing, death_crawler_projectile_thing, $88A5
    dw cockatrice_head2_projectile_thing, veil_allocen_thing, veil_allocen_part_thing, $88D1, cutscene_arthur_thing, $88E3, satan_thing, satan_wings_thing, veil_allocen_claw1_thing, veil_allocen_claw2_thing, $8780, nebiroth_flame_thing, nebiroth_laser_thing, veil_allocen_projectile_thing, freeze_splinter_thing, astaroth_nebiroth_body_thing
    dw $8780, samael_thing, samael_platform_thing, samael_laser_thing, $8780, $8780
}

;---------------
;object handling
;---------------

{ ;8780 - 8780
obj_void:
    rts
}

{ ;8781 - 8784
princess:

.create:
    jml _03EDE2
}

{ ;8785 - 878D
bracelet_tail:

.create:
    jml _01EAC3_create

;-----

.thing:
    jsl _01EAC3_thing
    rts
}

{ ;878E - 8795
weapon_destroy:
    jml _01E224_E229

.8792:
    jml _01E224 ;bracelet?
}

{ ;8796 - 87A2
arthur:

.create:
    jml _01CCBD

.destroy:
    jml _01D72B

.thing:
    jsl _01D090
    rts
}

{ ;87A3 - 87A6
armor_upgrade_vfx:

.create:
    jml _01E98D
}

{ ;87A7 - 87AA
weapon_hit:

.create:
    jml _01E224_E234
}

{ ;87AB - 87AE
lance:

.create:
    jml _01E2AB
}

{ ;87AF - 87B2
lance2:

.create:
    jml _01E2CF
}

{ ;87B3 -
knife:

.create:
    jml _01E351
}

{ ;87B7 - 87BE
knife2:

.create:
    jml _01E378

;-----

.destroy:
    jml _01E378_destroy
}

{ ;87BF -
bowgun:

.create:
    jml _01E55A
}

{ ;87C3 -
bowgun2:

.create:
    jml _01E590

.thing:
    jsl _01E590_thing
    rts
}

{ ;87CC - 87D4
scythe:

.create:
    jml _01E657_scythe_create

;-----

.thing:
    jsl _01E657_thing
    rts
}

{ ;87D5 - 87D8
scythe2:

.create:
    jml _01E657_scythe2_create
}

{ ;87D9 - 87DC
torch:

.create:
    jml _01E6FD
}

{ ;87DD - 87E0
torch2:

.create:
    jml _01E6FD
}

{ ;87E1 -
axe:

.create:
    jml _01F2EE_create

;-----

.thing:
    jsl _01F2EE_thing
    rts
}

{ ;87EA - 87F2
axe2:

.create:
    jml _01F2EE_axe2_create

;-----

.thing:
    jsl _01F2EE_axe2_thing
    rts
}

{ ;87F3 - 87FB
triblade:

.create:
    jml _01F3FC_create

;-----

.thing:
    jsl _01F3FC_thing
    rts
}

{ ;87FC - 8804
triblade2:

.create:
    jml _01F3FC_triblade2_create

;-----

.thing:
    jsl _01F3FC_triblade2_thing
    rts
}

{ ;8805 - 880D
bracelet:

.create:
    jml _01EB18_create

;-----

.thing:
    jsl _01EB18_thing
    rts
}

{ ;880E - 8816
bracelet2:

.create:
    jml _01EB18_create

;-----

.thing:
    jsl _01EB18_thing
    rts
}

{ ;8817 -
torch_flame:

.create:
    jml _01E75E

.thing:
    jsl _01E75E_E821
    rts
}

{ ;8820 - 8828
torch2_flame:

.create:
    jml _01E836_create

;-----

.thing:
    jsl _01E75E_E821
    rts
}

{ ;8829 - 8831
lance_fire_trail:

.create:
    jml _01E8F9

;-----

.thing:
    jsl _01E8F9_E939
    rts
}

{ ;8832 -
knife2_shimmer:

.create:
    jml _01E534_create
}

{ ;8836 - 883E
thunder:

.create:
    jml _01EE73_create

;-----

.thing:
    jsl _01EE73_thing
    rts
}

{ ;883F -
seek:

.create:
    jml _01F5A9_create

;-----

.thing:
    jsl _01F5A9_thing ;unused
    rts
}

{ ;8848 -
shield_magic:

.create:
    jml _01F4F7_create

;-----

.thing:
    jsl _01F4F7_thing
    rts
}

{ ;8851 -
fire_dragon:

.create:
    jml _01EFD8_create

;-----

.thing:
    jsl _01EFD8_thing
    rts
}

{ ;885A - 8862
tornado:

.create:
    jml _01F264_create

;-----

.thing:
    jsl _01F264_thing
    rts
}

{ ;8863 -
lightning:

.create:
    jml _01ED46_create

;-----

.thing:
    jsl _01ED46_thing
    rts
}

{ ;886C -
nuclear:

.create:
    jml _01E9C5_create

;-----

.thing:
    jsl _01E9C5_thing
    rts
}

{ ;8875 - 887D
nuclear_projectile:

.create:
    jml _01EA59_create

;-----

.thing:
    jsl _01EA59_thing
    rts
}

{ ;887E - 888A
ice_bridge_segment:

.create:
    jml _03CBCD_create

;-----

.thing:
    jsl _03CBCD_thing
    rts

;-----

.destroy:
    jml _03CBCD_destroy
}

{ ;888B - 8897
ice_bridge_spawner:

.create:
    jml _03CC61_create

;-----

.thing: ;unused?
    jsl _03CC61_thing
    rts

;-----

.destroy: ;unused?
    jml _03CC61_destroy
}

{ ;8898 - 88A0
death_crawler_projectile:

.create:
    jml _03B63C_create

.thing:
    jsl _03B63C_thing
    rts
}

{ ;88A1 - 88A9
;death crawler head?

; .create:
    jml _03B5F9_create

; .thing:
    jsl _03B59C_thing
    rts
}

{ ;88AA - 88B2
cockatrice_head2_projectile:

.create:
    jml _03CB94_create

;-----

.thing:
    jsl _03CB94_thing
    rts
}

{ ;88B3 - 88BF
veil_allocen:

.create:
    jml _03E1F3_create

;-----

.thing:
    jsl _03E1F3_thing
    rts

;-----

.destroy:
    jml _03E1F3_destroy
}

{ ;88C0 - 88CC
veil_allocen_part:

.create:
    jml _03E4F0_create

.thing:
    jsl _03E4F0_thing
    rts

.destroy: ;unused: leads to allocen claw1 create
    jml _03E54E_create
}

{ ;88CD - 88D5
intro_cutscene_obj:

.create:
    jml _03CCCA

;-----

.thing:
    jsl _03CCCA_thing
    rts
}

{ ;88D6 - 88DE
cutscene_arthur:

.create:
    jml _03F774

.thing: ;88DA
    jsl _03F7DB
    rts
}

{ ;88DF - 88E7
cutscene_prinprin:

.create:
    jml _03F7E0

.thing: ;88E3
    ;unused?
    jsl _03F7E0_F7F8
    rts
}

{ ;88E8 - 88F0
satan:

.create:
    jml _03F7F9

.thing: ;88EC
    jsl _03F875_F886
    rts
}

{ ;88F1 - 88F9
satan_wings:

.create:
    jml _03F88E

.thing: ;unused?
    jsl _03F8A2
    rts
}

{ ;88FA - 8906
veil_allocen_claw1:

.create:
    jml _03E54E_create

;-----

.thing:
    jsl _03E54E_thing
    rts

;-----

.destroy:
    jml _03E54E_destroy
}

{ ;8907 - 8913
veil_allocen_claw2:

.create:
    jml _03E54E_claw2_create ;$03E686

;-----

.thing: ;890B
    jsl _03E54E_claw2_thing ;$03E6F1
    rts

;-----

.destroy: ;8910
    jml _03E54E_claw2_destroy
}

{ ;8914 - 8917
veil_allocen_spawner:

.create:
    jml _03E160_create
}

{ ;8918 - 8924
nebiroth_flame:

.create:
    jml _03D7BC_create

;-----

.destroy:
    jml _03D7BC_destroy

;-----

.thing:
    jsl _03D7BC_thing
    rts
}

{ ;8925 - 892D
nebiroth_laser:

.create:
    jml _03D832_create

;-----

.thing:
    jsl _03D832_thing
    rts
}

{ ;892E - 8936
astaroth_nebiroth_body:

.create:
    jml _03D5C9_create

;-----

.thing:
    jsl _03D5C9_thing
    rts
}

{ ;8937 - 893A
crumbling_wall:

.create:
    jml _03C392_create
}

{ ;893B - 8947
grilian:

.create:
    jml _03DD3C

.thing:
    jsl _03DD3C_thing
    rts

.destroy:
    jml _03DD3C_destroy
}

{ ;8948 - 8950
tower_edge:

.create:
    jml _039E79_create

.thing:
    jsl _039E79_thing
    rts
}

{ ;8951 - 8954
silk_gate:

.create:
    jml _039F40_create
}

{ ;8955 - 8961
gargoyle_statue:

.create:
    jml _039F9C_create

;-----

.thing:
    jsl _039F9C_thing
    rts

;-----

.destroy:
    jml _039F9C_destroy
}

{ ;8962 - 896A
grilian_projectile:

.create:
    jml _03B12B

.thing:
    jsl _03B12B_thing
    rts
}

{ ;896B - 896E
skull_flower_multi_inactive:

.create:
    jml _03AD50_create
}

{ ;896F - 897B
skull_flower_multi:

.create:
    jml _03AD8A_create

.thing:
    jsl _03AD8A_thing
    rts

.destroy:
    jml _03AD8A_destroy
}

{ ;897C - 8988
arremer_projectile:

.create:
    jml _03BE26_arremer_projectile_create

.thing:
    jsl _03BE26_arremer_projectile_thing
    rts

.destroy:
    jml _03BE26_arremer_projectile_destroy
}

{ ;8989 - 8995
arremer:

.create:
    jml _03A5D7_create

;-----

.thing:
    jsl _03A5D7_thing
    rts

;-----

.destroy:
    jml _03A5D7_destroy
}

{ ;8996 - 89A2
moving_platform:

.create:
    jml _03AB47_create

.thing: ;unused? the code itself is used but not called from here?
    jsl _03AB47_thing
    rts

.destroy: ;unused? see above
    jml _03AB47_destroy
}

{ ;89A3 - 89AF
death_crawler_handler:

.create:
    jml _03B19E_create

;-----

.thing:
    jsl _03B19E_thing
    rts

;-----

.destroy:
    jml _03B19E_destroy
}

{ ;89B0 - 89B8
death_crawler_part:

.create:
    jml _03B59C_create

.thing:
    jsl _03B59C_thing
    rts
}

{ ;89B9 - 89C5
death_crawler:

.create:
    jml _03B5F9

.thing:
    jsl _03B5F9_thing
    rts

.destroy:
    jml _03B5F9_destroy
}

{ ;89C6 - 89C9
    ;unused
    jml _03C30E
}

{ ;89CA - 89D2
geyser:

.create:
    jml _03A338_create

.thing:
    jsl _03A338_thing
    rts
}

{ ;89D3 - 89DB
_0289D3: ;unused

.create:
    jml _03A3E7_create

;-----

.thing:
    jsl _03A3E7_thing
    rts
}

{ ;89DC - 89E8
_0289DC: ;unused

.create:
    jml _03A42C_create

;-----

.thing:
    jsl _03A42C_thing
    rts

;-----

.destroy:
    jml _03A42C_destroy
}

{ ;89E9 - 89F5
killer:

.create:
    jml _03BF65

.thing:
    jsl _03BF65_C0E6
    rts

.destroy:
    jml _03BF65_C0CE
}

{ ;89F6 - 8A02
tiny_goblin:

.create:
    jml _03BC85_create

.thing:
    jsl _03BC85_thing
    rts

.destroy:
    jml _03BC85_destroy
}

{ ;8A03 - 8A06
game_over_text_flames:

.create:
    jml _03C2C5_create
}

{ ;8A07 - 8A0A
explosion_spawner:

.create:
    jml _03C1EA
}

{ ;8A0B - 8A13
hannibal_projectile:

.create:
    jml _03C1B6

;-----

.thing:
    jsl _03C1B6_C1DC
    rts
}

{ ;8A14 - 8A1C
coral:

.create:
    jml _03C32A

;-----

.thing:
    jsl _03C32A_C33E
    rts
}

{ ;8A1D - 8A20
waterfall_end:

.create:
    jml _03C34F
}

{ ;8A21 - 8A24
silk_platform:

.create:
    jml _03C367_create
}

{ ;8A25 - 8A31
arremer_killers:

.create:
    jml _03BE26_killers_create

.thing:
    jsl _03BE26_killers_thing
    rts

.destroy:
    jml _03BE26_killers_destroy
}

{ ;8A32 - 8A35
menu_control:

.create:
    jml _03B8B2
}

{ ;8A36 - 8A39
scythe_destroy:
    jml _01E657_scythe_destroy
}

{ ;BA3A - 8A3D
scythe2_destroy:
    jml _01E657_scythe2_destroy
}

{ ;8A3E - 8A46
lava_pillar:

.create:
    jml _03B74A

;-----

.thing:
    jsl _03B74A_thing
    rts
}

{ ;8A47 - 8A4A
    ;unused
    jml _03A2FC
}

{ ;8A4B - 8A4E
lava_dropper:

.create:
    jml _03C473
}

{ ;8A4F - 8A52
    ;unused
    jml _03C558
}

{ ;8A53 - 8A5B
lava:

.create:
      jml _03C55C

;-----

.thing:
  jsl _03C55C_thing
  rts

}

{ ;8A5C - 8A68
astaroth:

.create:
    jml _03D0D7_create

;-----

.destroy:
    jml _03D0D7_destroy

;-----

.thing:
    jsl _03D0D7_thing
    rts
}

{ ;8A69 - 8A75
nebiroth:

.create:
    jml _03D36F_create
;-----

.destroy:
    jml _03D36F_destroy

;-----

.thing:
    jsl _03D36F_thing
    rts
}

{ ;8A76 - 8A7E
conveyor_belt:

.create:
    jml _03D8C5

;-----

.thing:
    jsl _03D8C5_thing
    rts
}

{ ;8A7F - 8A8B
cockatrice_head2_spawner:

.create:
    jml _03C5B9_create

;-----

.destroy: ;unused
    jml _03C5B9_destroy

;-----

.thing: ;unused
    jsl _03C5B9_thing
    rts
}

{ ;8A8C - 8A98
cockatrice_head2:

.create:
    jml _03C6A0_create

;-----

.destroy:
    jml _03C6A0_destroy

;-----

.thing:
    jsl _03C6A0_thing
    rts
}

{ ;8A99 - 8A9C
gate2:

.create:
    jml _03DAA0_create
}

{ ;8A9D - 8AA9
mad_dog:

.create:
    jml _03DB5F_create

;-----

.destroy:
    jml _03DB5F_destroy

;-----

.thing:
    jsl _03DB5F_thing
    rts
}

{ ;8AAA - 8AB6
astaroth_flame:

.create:
    jml _03D5F2_create

;-----

.destroy:
    jml _03D5F2_destroy

;-----

.thing:
    jsl _03D5F2_thing
    rts
}

{ ;8AB7 - 8ABF
astaroth_laser:

.create:
    jml _03D5F2_laser_create

;-----

.thing:
    jsl _03D5F2_laser_thing
    rts
}

{ ;8AC0 - 8AC8
avalanche:

.create:
    jml _03DF1F_create

;-----

.thing:
    jsl _03DF1F_thing
    rts
}

{ ;8AC9 - 8AD1
veil_allocen_projectile:

.create:
    jml _03E744_create

;-----

.thing:
    jsl _03E744_thing
    rts
}

{ ;8AD2 - 8ADA
freeze_splinter:

.create:
    jml _03E7BB_create

;-----

.thing:
    jsl _03E7BB_thing
    rts
}

{ ;8ADB - 8ADE
princess_dialogue:

.create:
    jml _039C09
}

{ ;8ADF -
samael:

.create:
    jml _03E825_create

;-----

.destroy:
    jml _03E825_destroy

;-----

.thing:
    jsl _03E825_thing
    rts
}

{ ;8AEC -
samael_platform:

.create:
    jml _03EC76_create

;-----

.destroy:
    jml _03EC76_destroy ;not called from here

;-----

.thing:
    jsl _03EC76_thing ;not called from here
    rts
}

{ ;8AF9 -
samael_laser:

.create:
    jml _03ED7B_create

;-----

.destroy:
    jml _03ED7B_destroy

;-----

.thing:
    jsl _03ED7B_thing
    rts
}

{ ;8B06 - 8B09
sun:

.create:
    jml _03FBFA_create
}

{ ;8B0A - 8B0D
ending_obj:

.create:
    jml _03FC40_create
}

{ ;8B0E - 8B16
_028B0E: ;a8 x8
    ;clear armor pieces / magic
    jsr _0280E9
    inc !open_magic_slots
    jmp _02821B_827A
}

{ ;8B17 - 8B1D
_028B17:
    inc !open_magic_slots
.8B1A: ;a8 x-
    jsr _0280E9_80EE
    rtl
}

{ ;8B1E -
_028B1E: ;a- x16
    ldx !slot_list_objects,Y
    iny #2
    rtl

.8B24: ;a- x16
    ;todo: name? gets object slot, doesn't have to check if they're available
    ;also only updates a temp index (y)
    ldx !slot_list_objects,Y
    iny #2
    rts
}

{ ;8B2A - 8B35
_028B2A: ;a- x16
    ldx !slot_list_objects,Y
    dey #2
    rtl

.local: ;a- x16
    ldx !slot_list_objects,Y
    dey #2
    rts
}

{ ;8B36 - 8B51
_028B36: ;a8 x-
    ;flower related, delete parts probably
    jsr .local
    rtl

.local: ;a8 x-
    sta $0000
    phd
.8B3E:
    !X16
    ldx $2D
    phx
    pld
    !X8
    jsr _0281BB
    dec $0000
    bne .8B3E

    pld
    jmp _0281BB
}

{ ;8B52 - 8B7D
_028B52: ;a8 x-
    ;delete flower / icicle parts?
    jsr .local
    rtl

.local: ;a8 x-
    sta $0000
    !X16
    ldy $2D
.8B5D:
    lda #$8C : sta $0000,Y ;mark for "destroy"
    lda $0008,Y : ora #$80 : sta $0008,Y
    lda $0009,Y : and #$7F : sta $0009,Y
    ldx $002D,Y
    txy
    dec $0000
    bne .8B5D

    !X8
    rts
}

{ ;8B7E - 8BB8
    ;flower related
_028B7E: ;a8 x8
    sta $0000 ;flower part count
    sty $0001
    stx $0002
    !X16
    ldy $2D
.8B8B:
    lda #$8C : sta.w !obj_active,Y
    lda $0008,Y : ora #$80 : sta $0008,Y
    lda $0009,Y : and #$7F : sta $0009,Y
    lda $0001 : sta $0031,Y
    clc
    adc $0002
    sta $0001
    ldx $002D,Y
    txy
    dec $0000
    bne .8B8B

    !X8
    rts
}

{ ;8BB9 - 8BDD
_028BB9: ;a8 x8
    lda $0F
.8BBB:
    cmp #$EE
    beq .8BDB

    lda #$69 : jsl _018049_8053 ;collision sfx
    ldy #$46 : ldx #$20 : jsl set_sprite
    lda #$09 : sta $2D
.8BD1:
    brk #$00

;----- 8BD3

    jsl update_animation_normal
    dec $2D
    bne .8BD1

.8BDB:
    jmp _0281A8_81B5
}

{ ;8BDE - 8BEB
_028BDE:
    ;unused far call
    jsr .local
    rtl

.local: ;a8 x8 8BE2
    ldx !obj_type
    ldy.w _00BE76-$20,X : jsl update_score
    rts
}

{ ;8BEC - 8C21
_028BEC: ;a8 x8
    lda $0F
    bmi _028BB9_8BBB

    ldx !obj_type
    ldy.w _00BE76-$20,X : jsl update_score
.8BF9:
    lda #$3B : jsl _018049_8053 ;enemy death sfx
    jsr _0281FF
    lda !obj_direction
    pha
    jsr _0280E9_80F2
    pla
    sta !obj_facing
    ldy #$78 : ldx #$20 : jsl set_sprite
.8C13:
    brk #$00

;----- 8C15

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .8C13

    jmp _0281A8_81B5
}

{ ;8C22 - 8C55
_028C22: ;a8 x8
    ldx !obj_type
    ldy.w _00BE76-$20,X : jsl update_score
    lda #$3B : jsl _018049_8053 ;enemy death sfx
    jsr _0281FF
    lda !obj_direction
    pha
    jsr _0280E9_80F2
    pla
    sta !obj_facing
    ldy #$76 : ldx #$20 : jsl set_sprite
    lda #$16
    sta $2D
.8C49:
    brk #$00

;----- 8C4B

    jsl update_animation_normal
    dec $2D
    bne .8C49

    jmp _0281A8_81B5
}

{ ;8C56 - 8C69
drop_pot: ;a8 x-
    jsr .local
    rtl

.local: ;8C5A
    lda $3A     ;check is_carrying_pot
    beq .ret

    stz $3A     ;clear is_carrying_pot
    !X16
    ldx $3B     ;child_object_slot offset (pot)
    inc $003A,X ;pot_dropped = true
    !X8
.ret:
    rts
}

{ ;8C6A - 8CF0
pot_creation: ;a8 x8
    jsr .local
    rtl

.local: ;8C6E
    stz $3A
    inc.w pot_spawn_counter ;spawned enemies that can carry pot
    lda.w pot_spawn_counter
    cmp #$04
    bne .ret  ;return if this isn't the 4th pot enemy

    stz.w pot_spawn_counter ;reset enemy counter
    clc
    lda.w weapon_item_count
    adc.w point_statue_count
    cmp #$03
    bcs .ret  ;return if already at max drop limit

    lda.w weapon_item_count
    cmp #$01
    beq .weapon_exists

    lda.w point_statue_count
    cmp #$02
    beq .point_statues_exist

    inc.w pot_count
    lda.w pot_count
    cmp.w pot_weapon_req ;required pot count to drop weapon
    bne .drop_statue

.point_statues_exist:
    clc
    adc #$03
    sta.w pot_weapon_req
    lda #$FF  ;weapon
    bra .create_pot

.drop_statue:
    cmp.w pot_armor_state_req ;required pot count to drop armor statue
    bne .statue_or_1up

.weapon_exists:
    clc
    adc #$0A
    sta.w pot_armor_state_req
    lda #$02  ;armor statue
    bra .create_pot

.statue_or_1up:
    cmp.w pot_extend_req ;required pot count to drop 1up
    bne .statue

    clc
    adc #$30
    sta.w pot_extend_req
    lda #$03  ;1up
    bra .create_pot

.statue:
    lda #$01  ;statue

.create_pot:
    sta $0000
    jsl get_object_slot
    bmi .ret  ;return if no object slots available

    lda #$0C     : sta $0000,X
    lda #!id_pot : sta $0006,X
    stz $003A,X
    lda $0000 : sta $0007,X
    stz $0039,X
    stx $3B
    !AX8
    inc $3A
.ret
    rts
}

{ ;8CF1 - 8D08
pot_spawn_offset: ;a8 x8
    jsr .local
    rtl

.local: ;a8 x8 (8CF5)
    lda $3A
    beq .ret

    !X16
    ldx $3B : jsl set_spawn_offset_8C8A
    lda #$01 : sta $0039,X
    !X8
.ret:
    rts
}

{ ;8D09 - 8D1C
_028D09: ;a8 x-
    jsr .local
    rtl

.local: ;8D0D
    lda $3A
    beq .ret

    stz $3A
    !X16
    ldy $3B : jsr remove_child_object
    !X8
.ret:
    rts
}

{ ;8D1D - 8FFB
zombie: ;a8 x8

.create:
    !A16
    lda !obj_pos_x+1
    cmp #$0880
    !A8
    bcc +

    jmp _0281A8_81B5
+:
    lda #$18 : sta $10
    lda #$02 : sta $1D
    lda #$01 : sta $08
    lda #$10 : sta $09
    !A16
    lda.w _00ED00+$3A : sta $27
    lda #zombie_data_coord_offsets : sta $13 ;collision related
    !A8
    jsl set_hp
    lda #$10 : sta $2F
    stz $15
    stz $33
    stz $34
    stz $36
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
    lda #$01 : sta $12 : sta !obj_direction
    ldy #$78 : ldx #$22 : jsl set_sprite
    !A16
    lda #$0224 : sta $0C
    !A8
    ldx #$9A : jsl _0196EF : sta $2F
    lda #$01 : sta $37
    lda #$FF : sta $31
.8DCE:
    brk #$00

;----- 8DD0

    dec $31
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
    lda #$004F : sta $2D
    stz $2F
.8E07:
    lda $2D
    and #$0001
    beq .8E1D

    lda $2F : eor #$0001 : sta $2F
    beq .8E1B

    inc !obj_pos_x+1
    bra .8E1D

.8E1B:
    dec !obj_pos_x+1
.8E1D:
    brk #$00

;----- 8E1F

    dec $2D
    bne .8E07

    lda #$0001
    sta $37
    !A8
    lda $08 : and #$EF : sta $08
    !A16
    lda !obj_pos_x+1
    cmp #$0200
    !A8
    bcc .8EA3

    ldx #$58 : jsl _0196EF : sta $38 ;flight timer, 0 = no flight
    beq .8EA3

    inc $36
    ldy #$09 : jsl set_speed_y ;flying coffin speed
.8E4D:
    brk #$00

;----- 8E4F

    jsl update_pos_y
    jsl _01A559
    dec $38
    bne .8E4D

    inc $0F
    stz $39
    stz $11
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
    jsl get_arthur_relative_side
    sta $12
    sta !obj_direction
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
    jsl get_arthur_relative_side : sta !obj_facing : sta !obj_direction
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
    sta $34
    inc $36
    ldy #$70 : ldx #$22 : jsl set_sprite
    lda #$0F : cop #$00

;----- 8EE6

    lda #$5A : sta $31
    lda #$01 : sta $32
    ldy #$76 : ldx #$22 : jsl set_sprite
    jsr pot_creation_local
.8EF9:
    ldy $34 : jsl set_speed_x
    stz $36
.8F01:
    jsl update_pos_x
    !A16
    dec $31
    !A8
    beq .8F29

    ldy #$04 : jsl _01A4E2_A4E8
    bcs .8F29

    lda $35
    beq .8F21

    ldy #$08 : jsl _01A4E2_A4E8
    bcc .8F29

.8F21:
    lda $33
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
    inc $36
.8F84:
    brk #$00

;----- 8F86

    jsl update_pos_xyg_add
    jsl _01A559
    beq .8F84

    jmp .8EF9

;-----

.thing:
    ldy #$0A : jsr pot_spawn_offset_local
    lda $0F ;flight timer
    beq .8FB1

    dec $39 ;circling timer
    bpl .8FAB

    lda #$08 : sta $39
    lda !obj_direction : dec : and #$0F : sta !obj_direction
.8FAB:
    ldx #$04 : jsl update_pos_xy_2
.8FB1:
    lda $34 ;zombie speed_list offset. $1E = beginner's slow zombie
    cmp #$1E
    bne .8FBF

    lda #$0F : jsl update_animation_custom_timer
    bra +

.8FBF:
    jsl update_animation_normal
+:
    jsl _018E32_8E73
    lda $36             ;do collision checking if 0
    bne .8FDA

    stz $33             ;clear ground collision bool
    jsl _01A5AF
    beq +

    inc $33             ;set ground collision bool if colliding with floor
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

.destroy:
    jsr drop_pot_local
    inc $3D
    jmp _028BEC
}

{ ;8FFC - 9024
armor_piece: ;a8 x8

.create:
    ldy #$4C : ldx #$20 : jsl set_sprite_8482
    lda $3D : tax
    lda.w armor_piece_speed_direction+1,X : sta !obj_direction
    ldy.w armor_piece_speed_direction+0,X : jsl set_speed_xyg
    lda #$3F : sta $2D
.9017:
    jsl update_pos_xyg_add
    brk #$00

;----- 901D

    dec $2D
    bne .9017

    jml _028B0E
}

{ ;9025 -
shield:

.9025:
    lda $08 : ora #$80 : sta $08
    jmp .90B2

.create:
    ldy #$7C : ldx #$20
    lda $07
    beq .903A

    ldy #$60 : ldx #$21
.903A:
    jsl set_sprite
    jsl _01CCAF
    !A16
    lda.w _00ED00+$1C : sta $27
    lda #$001A : sta $29
    !A8
    ldx $07
    lda.w shield_data_hp,X : sta !obj_hp
    lda #$FF : sta $2D : sta $26
.905D:
    lda !armor_state
    beq .9025

    lda !slot_arthur+$25 : tay
    lda.w shield_data_BF27,Y : sta $3C
    ldx.w current_cage
    lda $08 : and #$F8 : ora.w shield_data_BF43,Y : ora.w shield_data_BF24,X : sta $08
    tya : asl #2 : tay
    lda !arthur_facing : sta !obj_facing
    !A16
    bne .9092

    clc : lda !arthur_pos_x+1 : adc.w shield_data_BF5F+0,Y : sta !obj_pos_x+1
    bra .909B

.9092:
    sec : lda !arthur_pos_x+1 : sbc.w shield_data_BF5F+0,Y : sta !obj_pos_x+1
.909B:
    clc : lda !arthur_pos_y+1 : adc.w shield_data_BF5F+2,Y : sta !obj_pos_y+1
    !A8
    jsl set_sprite_84A7
    jsl _018E32_8E73
    brk #$00

;----- 90B0

    bra .905D

.90B2:
    lda #$2F : jsl _018049_8053
    stz $02B0
    stz $07
    lda #$03 : sta $2D
.90C1:
    lda #!id_shield_piece : jsl prepare_object
    inc $07
    dec $2D
    bne .90C1

    stz $07
    jsr _0280E9_80EE
    jmp _02821B_827A
}

{ ;90D5 - 90FB
shield_piece:

.create:
    ldx $07
    phx
    lda.w shield_piece_data_BFCF,X : ldy #$7A : ldx #$20 : jsl set_sprite_8480
    plx
    ldy.w shield_piece_data_BFD2,X : jsl set_speed_xyg
    lda #$BD : sta $2D
.90EF:
    brk #$00

;----- 90F1

    jsl update_pos_xyg_add
    dec $2D
    bne .90EF

    jmp _0281A8_81B5
}

{ ;90FC -
stone_pillar: ;a8 x8

.create:
    !A16
    lda.w #_00BFD5 : sta $13 ;offset into rom for collision? seems to go unused
    !A8
    lda $07
    and #$03
    pha
    asl #2
    sta $15
    pla
    clc
    adc #$05
    sta $2D
    lda #$03 : sta $08
    lda $09 : and #$CF : ora #$20 : sta $09
.9120:
    brk #$00

;----- 9122

    ldy #$04 : jsl arthur_range_check_x
    bcs .912F

    lda $2D : jsr _02FE1E_FE27
.912F:
    lda $2D : jsr _02FB9C_FBAF
    jsr _0281A8
    bra .9120
}

{ ;9139 - 9173
_029139:
    ;unused
    lda #$02 : sta $08
    stz $31
    ldy #$EA : ldx #$21 : jsl set_sprite
    !A16
    lda.w #_00BFE5 : sta $13 ;todo
    !A8
    stz $15
    jsl _01A593
    stz $2E
    lda $07
    and #$08
    beq .9160

    inc $2E
.9160:
    brk #$00

;----- 9162

    lda $2E
    bne .916F

    lda.w stage1_earthquake_active
    beq .916F

    jsl _01A593
.916F:
    jsr _0281A8
    bra .9160
}

{ ;9174 - 9190
    ;unused
    lda #$10 : sta $08
    lda #$7E : sta $2D
    ldy #$BA : ldx #$21 : jsl set_sprite
.9184:
    brk #$00

;----- 9186

    jsl update_animation_normal
    dec $2D
    bne .9184

    jmp _0281A8_81B5
}

{ ;9191 - 91DC
    ;unused
    lda #$20 : sta $1D
    stz $2D
    stz $2E
    stz $2F
    stz $30
.919D:
    brk #$00

;----- 919F

    lda $09
    and #$40
    beq .919D

.91A5:
    lda #$07 : cop #$00

;----- 91A9

    jsl get_object_slot
    bmi .91A5

    lda #$0C : sta.w !obj_active,X
    lda #$34 : sta.w !obj_type,X ;todo
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    clc : lda !obj_pos_y+1 : adc $2D : sta.w !obj_pos_y+1,X
    clc : lda $2D : adc #$000C : sta $2D
    !AX8
    inc $30
    lda $30
    cmp #$04
    bne .91A5

    jmp _0281A8_81B5
}

{ ;91DD - 91FF
    ;unused
    lda #$10 : sta $08
    ldy #$BC : ldx #$21 : jsl set_sprite
    ldy #$18 : jsl set_speed_xyg
    lda #$19 : sta $2D
.91F3:
    brk #$00

;----- 91F5

    jsl update_animation_normal
    dec $2D
    bne .91F3

    jmp _0281A8_81B5
}

{ ;9200 - 9223
stone_pillar2:

.create:
    lda #$02 : sta $08
    lda $07 : sta $2D
.9208:
    brk #$00

;----- 920A

    lda $2D
    pha
    jsr _02FE1E_FE27
    pla
    jsr _02FB9C_FBAF
    ldy #$08 : jsl arthur_range_check
    bcs .921F

    inc $14CA
.921F:
    jsr _0281A8
    bra .9208
}

{ ;9224 - 9233
    ;unused
    ldy #$74 : ldx #$22 : jsl set_sprite
.922C:
    brk #$00

;----- 922E

    jsl update_animation_normal
    bra .922C
}

{ ;9234 -
water_crash_splash:

.create:
    ldy #$74 : ldx #$22 : jsl set_sprite
.923C:
    brk #$00

;----- 923E

    !A16
    lda !arthur_pos_x+1 : sta !obj_pos_x+1
    lda !arthur_pos_y+1 : sta !obj_pos_y+1
    !A8
    jsl update_animation_normal
    bra .923C
}

{ ;9252 - 9292
ready_go:

.create:
    lda $0277
    ora $0292
    bne .928C

    lda #$80 : sta $08
    !A16
    clc : lda.w camera_x+1 : adc #$0080 : sta !obj_pos_x+1
    clc : lda.w camera_y+1 : adc #$0068 : sta !obj_pos_y+1
    lda.w _00ED00+$28 : sta $27
    lda #$0020 : sta $29
    !A8
    lda #$00 : jsl _018E32_8E81
    ldy #$F4 : ldx #$20 : jsl set_sprite
.928C:
    lda #$3F : cop #$00

;----- 9290

    jmp _0280C5
}

{ ;9293 -
storm_cesaris:

.create:
    lda $07
    cmp #$0D
    beq .929C

    jmp .92DA

.929C:
    brk #$00

;----- 929E

    jsr .947F
    lda #$18 : jsl _0195E4
    bcc .929C

    !X16
    jsr _028B1E_8B24
    lda #!id_storm_cesaris : jsr .92C8
.92B3:
    jsr _028B1E_8B24
    lda #!id_storm_cesaris_parts : jsr .92C8
    bne .92B3

    !X8
    lda #!mus_stage_2_boss : jsl _018049_8053
    jmp _0281A8_81B5

;-----

.92C8:
    !A8
    sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    dec $07
    lda $07 : sta $0007,X
    rts

;-----

.92DA:
    lda #$01 : sta !obj_facing : sta $37
    jsl set_hp : sta $1EBA
    stz !obj_pos_x
    lda #$04 : sta $1D
    !A16
    lda #$15B0 : sta !obj_pos_x+1 : sta $1EBB
    lda #$0340 : sta !obj_pos_y+1 : sta $1EBD
    lda #$1400 : sta.w screen_boundary_left
    !A8
    inc !obj_direction
    inc !obj_facing
    stz $3A
    ldy #$EE : ldx #$21 : jsl set_sprite
.9315:
    brk #$00

;----- 9317

    jsr .947F
    !A16
    lda.w camera_x+1
    cmp #$1440
    !A8
    bcc .9315

    ldy #$27 : jsl set_speed_y
.932C:
    brk #$00

;----- 932E

    jsl update_animation_normal
    jsl update_pos_y
    jsr .947F
    !A16
    lda !obj_pos_x+1 : sta $1EBB
    lda !obj_pos_y+1 : sta $1EBD
    lda #$0280
    cmp $22
    !A8
    bcc .932C

    ldx #$08 : jsr _028000_local
    stz $0C
    inc $1EB9
    jsl get_rng_bool
    stz $35
    sta $36 ;store direction bool
    lda #$40
.9362:
    sta $3B
    jsl _02F9DA_F9E0
    lda #$02 : sta $3A
.936C:
    brk #$00

;----- 936E

    dec $3B
    bne .936C

    jsr .946E
    lda #$02 : sta $3A
    ldy #$39 : jsl set_speed_y
    lda $36 : sta !obj_direction
    jsl get_rng_16
    lda.w storm_cesaris_data_BFE9,X : sta $3B
.938C:
    brk #$00

;----- 938E

    dec $34
    bne .93A5

    lda #$35 : jsl _018049_8053
    lda #$03 : sta $07
    lda #$6E : jsl prepare_object ;todo
    jsr .946E
.93A5:
    lda !obj_pos_y+1
    sec
    sbc #$50
    cmp #$60
    !A8
    bcc .93B8

    lda !obj_direction : eor #$01 : sta !obj_direction : sta $36
.93B8:
    jsl _01884B_8876
    dec $3B
    bne .938C

    lda #$03 : sta $3A
    lda #$40 : sta $3B
.93C8:
    brk #$00

;----- 93CA

    dec $3B
    bne .93C8

    lda #$04 : sta $3A
    jsl get_rng_16
    lda.w storm_cesaris_data_BFF9,X : sta $3B
    ldy #$2D : jsl set_speed_x
    lda $35 : sta !obj_direction
.93E5:
    brk #$00

;----- 93E7

    !A16
    lda !obj_pos_x+1
    sec
    sbc #$14B0
    cmp #$0100
    !A8
    bcc .93FE

    lda !obj_direction : eor #$01 : sta !obj_direction : sta $35
.93FE:
    jsl update_pos_x
    dec $3B
    bne .93E5

    lda #$20
    jmp .9362

;-----

.destroy:
    lda !obj_hp : sta $1EBA
    bne .944A

    lda #!sfx_death : jsl _018049_8053
    ldy #$EC : ldx #$21 : jsl set_sprite
.9420:
    brk #$00

;----- 9422

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .9420

    stz $08
    stz $09
    lda #$C8 : cop #$00

;----- 9434

    inc $1ED7
    lda #$59 : jsl prepare_object
    jsl _018049
    lda #$10 : jsl _018049_8053
    jmp _0281A8_81B5

.944A:
    jsl _02F9DA_F9E0
    ldx #$03 : jsr _028048_local
    lda #$08 : sta $24
.9457:
    brk #$00

;----- 9459

    dec $24
    bne .9457

    lda $3A : asl : tax
    jmp (+,X) : +: dw .932C, .936C, .938C, .93C8, .93E5

;-----

.946E:
    jsl get_rng_16
    lda.w storm_cesaris_data_C009,X
    ldx.w difficulty
    clc
    adc.w storm_cesaris_data_C018,X
    sta $34
    rts

;-----

.947F:
    !A16
    lda !obj_pos_y+1 : sta $1EBD
    lda !obj_pos_x+1 : sta $1EBB
    cmp !arthur_pos_x+1
    bcs .9493

    sta !arthur_pos_x+1
.9493:
    !A8
    rts

;-----

.thing:
    lda $37
    beq .94B4

    !A16
    lda.w camera_x+1
    clc
    adc #$0130
    cmp !obj_pos_x+1
    bcs .94A9

    sta !obj_pos_x+1
.94A9:
    !A8
    jsr .947F
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
.94B4:
    jmp _02FD62_FD7C
}

{ ;94B7 - 95A7
storm_cesaris_parts:

.create:
    lda $07 : asl #2 : tax
    !A16
    lda.w storm_cesaris_parts_data_C01C+0,X : sta !obj_speed_x+1
    lda.w storm_cesaris_parts_data_C01C+2,X : sta !obj_speed_y+1
    !A8
    jsr .9593
    ldy $07
    ldx.w storm_cesaris_parts_data_C04C,Y
    ldy.w storm_cesaris_parts_data_C058+0,X
    lda.w storm_cesaris_parts_data_C058+1,X
    tax
    jsl set_sprite
    jsl _02F9DA_F9E0
    lda $07
    cmp #$06
    bcc .9520

    lda $07
    asl #2
    sta $3B
    cop #$00

;----- 94EF

.94EF:
    brk #$00

;----- 94F1

    jsl update_animation_normal
    lda $1EBA
    beq .9565

    jsr .9593
    lda $07
    cmp #$06
    beq .94EF

    lda $02C3
    lsr #3
    clc
    adc $3B
    and #$0F
    tax
    lda.w storm_cesaris_parts_data_C06E,X
    !A16
    and #$00FF
    clc
    adc !obj_pos_x+1
    sta !obj_pos_x+1
    !A8
    bra .94EF

.9520:
    brk #$00

;----- 9522

    jsr .9593
    lda $1EBA
    bne .9520

    jsl _02F9ED
    lda #$02 : sta $3B
.9532:
    ldx $07
    lda.w storm_cesaris_parts_data_C062,X : cop #$00

;----- 9539

    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$34 : jsl _018049_8053
.9547:
    brk #$00

;----- 9549

    jsr .9593
    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .9547

    dec $3B
    bne .9532

    stz $08
    stz $09
.955E:
    brk #$00

;----- 9560

    lda $1EBA
    bne .955E

.destroy:
.9565:
    jsl _02F9ED
    jsr .9593
    ldx $07
    lda.w storm_cesaris_parts_data_C062,X : cop #$00

;----- 9573

    ldy #$E6 : ldx #$21 : jsl set_sprite
    lda #$34 : jsl _018049_8053
.9581:
    brk #$00

;----- 9583

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .9581

    jmp _0281A8_81B5

;-----

.thing:
    jmp _02FD62_FD7C

;-----

.9593:
    !A16
    lda $1EBB : clc : adc !obj_speed_x+1 : sta !obj_pos_x+1
    lda $1EBD : clc : adc !obj_speed_y+1 : sta !obj_pos_y+1
    !A8
    rts
}

{ ;95A8 - 95F0
storm_cesaris_projectile:

.create:
    inc $08
    ldy #$F2 : ldx #$21 : jsl set_sprite
    ldy #$42 : jsl set_speed_x
    lda.w difficulty : asl : tax
    !A16
    clc : lda !obj_speed_x : adc.w storm_cesaris_projectile_data_C07E,X : sta !obj_speed_x
    !A8
.95C9:
    brk #$00

;----- 95CB

    jsl update_pos_x
    bit $09
    bvc .95C9

    jsl _02F9DA_F9E0
.95D7:
    brk #$00

;----- 95D9

    jsl update_pos_x
    jsr _028074
    bra .95D7

;-----

.thing:
    jsl update_animation_normal
    ldy #$0E : jsr _02FF22
    jsr _02FA37_FA65
    jmp _02FD62_FD7C
}

{ ;95F1 - 96E8
hannibal:

.create: ;a8 x8
    jsr _02812E
    jsl set_hp
    lda #$04 : sta $1D
    jsl _02F9DA_F9E0
    lda #$01 : sta !obj_direction : sta !obj_facing
.9606:
    ldy #$FC : ldx #$21 : jsl set_sprite
    jsl get_rng_16
    lda.w hannibal_data_cooldown,X
    ldx.w difficulty
    clc
    adc.w hannibal_data_cooldown_difficulty,X
    sta $3B
.961E:
    brk #$00

;----- 9620

    lda $02C3
    and #$0F
    bne .962F

    jsl get_arthur_relative_side
    cmp !obj_facing
    bne .turn

.962F:
    dec $3B
    bne .961E

    ldy #$D6 : ldx #$21 : jsl set_sprite
.963B:
    brk #$00

;----- 963D

    lda !obj_anim_timer
    cmp #$0C
    bne .963B

    lda #!id_hannibal_projectile : jsl prepare_object
.9649:
    brk #$00

;----- 964B

    lda !obj_anim_timer
    dec
    bne .9649

    bra .9606

;----- 9652

.turn:
    ldy #$B6 : ldx #$21 : jsl set_sprite
    jsr .9674
    lda #$09
    cop #$00

;----- 9661

    lda !obj_facing : eor #$01 : sta !obj_facing
    lda #$09 : cop #$00

;----- 966B

    jsr .9674
    lda !obj_facing : sta !obj_direction
    bra .9606

;-----

.9674:
    lda !obj_direction
    asl
    tax
    !A16
    lda !obj_pos_x+1
    clc
    adc.w hannibal_data_pos_offset,X
    sta !obj_pos_x+1
    !A8
    rts

;-----

.destroy:
    lda $08 : ora #$10 : sta $08
    ldy #$17 : jsl update_score
    lda #$05 : sta $2D
    lda #$66 : sta $1D
.9699:
    lda #$46 : jsl prepare_object
    lda #$07 : cop #$00

;----- 96A3

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053
    dec $2D
    bne .9699

    lda $08 : and #$F7 : sta $08
    lda #$05 : sta $2D
    lda #$66 : sta $1D
.96C2:
    lda #$46 : jsl prepare_object
    lda #$07 : cop #$00

;----- 96CC

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053
    dec $2D
    bne .96C2
    jmp _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _0296FE
    rts
}

{ ;96E9 - 96FD
_0296E9:
    jsr _02FA37_FA6D
    lda $02C3
    clc
    adc $02C6
    and #$03
    bne .96FD

    jsr _02FB62_FB69
    jsr _02FD62_FD87
.96FD:
    rtl
}

{ ;96FE - 9712
_0296FE: ;a8 x-
    jsr _02F9FA_F9FE
    lda $02C3
    clc
    adc $02C6
    and #$03
    bne .9712

    jsr _02FC0E
    jsr _02FD62_FD87
.9712:
    rtl
}

{ ;9713 - 9878
_029713: ;eagler spawner
    ldx.w difficulty
    lda.w enemy_spawner_data_C086,X : cop #$00

;----- 971B

    brk #$00

;----- 971D

    lda $1AD7
    ldx.w difficulty
    cmp.w enemy_spawner_data_C08A,X
    bcs _029713

.9728:
    lda #$10 : cop #$00

;----- 972C

    lda $1F91
    bne _029713

    ldx $0F
    !A16
    lda.w enemy_spawner_data_C0C2+0,X : sta !obj_pos_x+1
    lda.w enemy_spawner_data_C0C2+2,X : sta !obj_pos_y+1
    !A8
    lda.w enemy_spawner_data_C0C2+4,X : sta $07
    lda $1F2B
    and #$60
    lsr #4
    tax
    jsr (.9824,X)
    lda $0F
    clc
    adc #$05
    cmp #$2D
    bcc .975E

    lda #$00
.975E:
    sta $0F
    brk #$00

;----- 9762

    bit $09
    bvc .9728

    jsl get_rng_bool
    bne .9728

    lda !open_object_slots
    clc
    adc #$02
    cmp #$08
    bcc _029713

    lda #$06 : jsl _0195E4
    bcc _029713

    lda.w obj_type_count+!id_eagler : clc : adc #$04 : sta.w obj_type_count+!id_eagler
    !X16
    jsr _028B1E_8B24
    lda #!id_eagler : jsr .97FC
    lda #$04 : sta $07
.9795:
    jsr _028B1E_8B24
    lda #!id_eagler : jsr .97FC
    inc $07
    lda $07
    cmp #$07
    bne .9795

    !X8
    jmp _029713

;-----

.97AA: ;eagler spawner, stage 6
    lda $0292
    bne .97F4

.97AF:
    brk #$00

;----- 97B1

    bit $09
    bvc .97AF

    lda.w obj_type_count+!id_eagler
    cmp #$08
    bcs .97AA

    lda $07 : sec : sbc #$0B : sta $07
    lda #$06 : jsl _0195E4
    bcc .97F4

    lda.w obj_type_count+!id_eagler : clc : adc #$04 : sta.w obj_type_count+!id_eagler
    !X16
    jsr _028B1E_8B24
    lda #!id_eagler : jsr .97FC
    lda #$04 : sta $07
.97E2:
    jsr _028B1E_8B24
    lda #!id_eagler : jsr .97FC
    inc $07
    lda $07
    cmp #$07
    bne .97E2

    !X8
.97F4:
    jml _0281A8_81B5

;------

.97F8: ;used by skull flower multi
    jsr .97FC
    rtl

;-----

.97FC:
    sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda $07 : sta $0007,X
    !A16
    lda $13ED,Y : sta $002F,X
    lda $13F1,Y : sta $002D,X
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    !A8
    rts

;-----

.9824: dw .9843, .982C, .9844, .9861

;-----

.982C:
    lda $07 : inc : and #$03 : sta $07
    !AX16
    ldy !obj_pos_y+1
    sec : lda #$0400 : sbc !obj_pos_x+1 : sta !obj_pos_y+1
    sty !obj_pos_x+1
    !AX8
.9843:
    rts

;-----

.9844:
    lda $07 : inc #2 : and #$03 : sta $07
    !AX16
    lda #$0400 : sec : sbc !obj_pos_x+1 : sta !obj_pos_x+1
    lda #$0400 : sec : sbc !obj_pos_y+1 : sta !obj_pos_y+1
    !AX8
    rts

.9861: ;unused? seems to be related to stage 4 rotations
    lda $07 : dec : and #$03 : sta $07
    !AX16
    ldx !obj_pos_x+1
    sec : lda #$0400 : sbc !obj_pos_y+1 : sta !obj_pos_x+1
    stx !obj_pos_y+1
    !AX8
    rts
}

{ ;9879 - 9AAE
eagler:

.create:
    lda #$08 : sta $09
    lda $07
    cmp #$04
    bcc .9886

    jmp .9A1D

.9886:
    ldx #$01
    ldy #$16
    lda.w stage
    cmp #$03
    beq .9895

    ldx #$03
    ldy #$18
.9895:
    sty $37
    jsl _018D5B
    jsl set_hp
    stz !obj_direction
    !A16
    lda.w _00ED00+$0A : sta $27
    stz $39
    !A8
    lda #$FF : sta $26
    ldy #$EA : ldx #$21 : jsl set_sprite
    lda $07
    cmp #$03
    bne .98C0

    inc !obj_direction
.98C0:
    brk #$00

;----- 98C2

    jsl update_animation_normal
    ldx $37
    jsl _018E32
    lda $24
    cmp #$70
    bne .98C0

    jsl _02F9DA_F9E0
    ldy #$D4 : ldx #$21 : jsl set_sprite
    ldy #$2D : jsl set_speed_xyg
    lda $07 : asl : tax
    jmp (+,X) : +: dw .98F3, .991A, .9905, .991A

;-----

.98F3:
    jsl get_rng_bool
    bne .995A

    stz !obj_speed_y+0
    stz !obj_speed_y+1
    stz !obj_speed_y+2
    lda #$28 : sta $3B
    bra .992A

.9905:
    jsl get_rng_16
    lda.w enemy_spawner_data_C0A2,X
    bne .9958

    stz !obj_speed_y+0
    stz !obj_speed_y+1
    stz !obj_speed_y+2
    lda #$28 : sta $3B
    bra .9948

.991A:
    stz $3B
.991C:
    stz $39
.991E:
    brk #$00

;----- 9920

    jsl update_pos_xyg_add
    inc $3B
    lda $1B
    bmi .991E

.992A:
    lda #$02 : sta $39
.992E:
    brk #$00

;----- 9930

    jsl update_pos_xyg_add
    dec $3B
    bne .992E

    lda #$04 : sta $39
.993C:
    brk #$00

;----- 993E

    jsl update_pos_xyg_sub
    inc $3B
    lda $1B
    bpl .993C

.9948:
    lda #$06 : sta $39
.994C:
    brk #$00

;----- 994E

    jsl update_pos_xyg_sub
    dec $3B
    bne .994C

    bra .991C

.9958:
    inc !obj_direction
.995A:
    ldy #$2E : jsl set_speed_xyg
    stz $3B
.9962:
    lda #$08 : sta $39
.9966:
    brk #$00

;----- 9968

    jsl _01884B
    inc $3B
    lda $18
    bpl .9966

    lda #$0A : sta $39
.9976:
    brk #$00

;----- 9978

    jsl _01884B
    dec $3B
    bne .9976

    lda #$0C : sta $39
.9984:
    brk #$00

;----- 9986

    jsl _01884B_8860
    inc $3B
    lda !obj_speed_x+2
    bmi .9984

    lda #$0E : sta $39
.9994:
    brk #$00

;----- 9996

    jsl _01884B_8860
    dec $3B
    bne .9994

    bra .9962

;-----

.destroy: ;99A0
    lda $07
    cmp #$04
    bcs .99D6

    lda !obj_hp
    beq .99CB

    ldy #$D8 : ldx #$21 : jsl set_sprite
    jsl _02F9DA_F9E0
.99B6:
    brk #$00

;----- 99B8

    lda $24
    cmp #$70
    bne .99B6

    ldy #$D4 : ldx #$21 : jsl set_sprite
    ldx $39
    jmp (.99D9,X)

.99CB:
    jsr .9A0A
    lda #$03 : jsr _028B52_local
    jmp _028BEC

.99D6:
    jmp _0281A8_81B5

.99D9: dw .991E, .992E, .993C, .994C, .9966, .9976, .9984, .9994

;-----

.thing: ;99E9
    jsl get_arthur_relative_side : sta !obj_facing
    jsl update_animation_normal
    ldx $37 : jsl _018E32
    bit $09
    bvc .9A02

    jsl _0296E9
    rts

.9A02:
    jsr .9A0A
    lda #$03 : jmp _028B36_local

;-----

.9A0A:
    ldy #$03
    !AX16
    ldx $2D
.9A10:
    lda $0013,X : sta $002D,X
    tax
    dey
    bne .9A10

    !AX8
    rts

;-----

.9A1D:
    ldx $07
    lda.w enemy_spawner_data_C0B3-5,X : sta $24 ;loads a 1 from previous data (COB2)
    ldy #$36 : jsl set_speed_x
    stz $15
    !A16
    lda $2D : sta $13
    lda $2F : sta !obj_speed_y
    lda !obj_pos_x+1 : sta $2D : sta $31 : sta $35 : sta $39
    lda !obj_pos_y+1 : sta $2F : sta $33 : sta $37 : sta $3B
    !A8
    lda #$28 : cop #$00

;----- 9A50

    ldy #$E8 : ldx #$21
    lda $07
    cmp #$06
    bne .9A5E

    ldy #$EE : ldx #$21
.9A5E:
    jsl set_sprite
.9A62:
    brk #$00

;----- 9A64

    lda $15
    tax
    clc
    adc #$04
    and #$0F
    sta $15
    !A16
    lda $2D,X : sta !obj_pos_x+1
    lda $2F,X : sta !obj_pos_y+1
    !X16
    ldy !obj_speed_y
    lda.w !obj_pos_x+1,Y : sta $2D,X
    lda.w !obj_pos_y+1,Y : sta $2F,X
    !A8
    lda $07
    cmp #$04
    bne .9AA7

    lda.w !obj_facing,Y
    asl
    !A16
    and #$0002
    tay
    lda $2D,X : adc.w enemy_spawner_data_C0B6,Y : sta $2D,X
    clc : lda $2F,X : adc #$0004 : sta $2F,X
.9AA7:
    !AX8
    jsl update_animation_normal
    bra .9A62
}

{ ;9AAF - 9BFA
_029AAF: ;icicle spawner
    stz $1FAF
    !A16
    stz $2D
    lda #$0004 : sta $2F
    lda.w #enemy_spawner_data_C15D : sta $13
    !A8
.9AC2:
    brk #$00

;----- 9AC4

    lda $1AEF
    ldx.w difficulty
    cmp.w enemy_spawner_data_C08E,X
    bcs .9AC2

    ldx.w difficulty
    lda.w enemy_spawner_data_C092,X : cop #$00

;----- 9AD7

    !A16
    lda.w camera_x+1
    sbc #$01C0
    cmp #$0340
    bcc .9AF4

    lda.w camera_x+1
    cmp #$0540
    !A8
    bcc .9AC2

    inc $1FAF
    jmp _0281A8_81B5

.9AF4:
    !A8
    lda #$08 : sta $3B
    lda $30
    bne .9B0B

    clc : lda $2D : adc #$0B : jsl _019662 : sta $33
    bne .9B18

.9B0B:
    clc : lda $2E : adc #$0F : jsl _019662 : sta $2E
    bra .9B23

.9B18:
    clc : lda $2F : adc #$0F : jsl _019662 : sta $2F
.9B23:
    asl
    tax
    !A16
    lda.w enemy_spawner_data_C0EF,X : adc.w camera_x+1 : and #$07FF : sta !obj_pos_x+1
    lda #$0580 : sta !obj_pos_y+1
.9B37:
    brk #$00

;----- 9B39

    !A16
    lda !obj_pos_y+1 : clc : adc #$0010 : sta !obj_pos_y+1
    !A8
    jsl _01A559
    bne .9B52

    dec $3B
    bne .9B37

    jmp .9AC2

.9B52:
    lda #$0A : jsl _019662 : sta $2F
    asl                    : sta $31
    clc
    lda !open_object_slots
    adc #$0E
    cmp $31
    bcc .9BBE

    lda $31 : jsl _0195E4
    bcc .9BBE

    inc $1AEF
    !X16
    lda #!id_icicle : sta $0000
    stz $0001
    !A16
    lda !obj_pos_x+1 : sta $0004
    lda !obj_pos_y+1 : sta $0006
    !A8
    jsr _028B1E_8B24
    stx $0008
    jsr .9BC1
    lda $2F : sta $002F,X
    lda $33 : sta $0033,X
    ora $30 : sta $30
.9BA1:
    jsr _028B1E_8B24
    inc $0001
    jsr .9BC1
    lda $0001
    cmp $2F
    bne .9BA1

    !X8
    lda $2D
    inc
    and #$03
    sta $2D
    bne .9BBE

    stz $30
.9BBE:
    jmp .9AC2

;-----

.9BC1:
    lda $0000 : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda $0001 : sta $0007,X
    lda $0002 : sta.w !obj_direction,X
    !A16
    lda $13ED,Y : sta $002F,X ; todo: what is this?
    lda !slot_list_objects,Y : sta $002D,X
    lda $0004 : sta.w !obj_pos_x+1,X
    lda $0006 : sta.w !obj_pos_y+1,X
    lda $0008 : sta $0031,X
    !A8
    rts
}

{ ;9BFB -
icicle:

.create:
    lda #$01 : sta $08
    stz $34
    !A16
    lda #enemy_spawner_data_C15D : sta $13
    !A8
    ldx $07
    lda.w enemy_spawner_data_C096,X : sta $3B
    cpx #$00
    bne .9C29

    ldy #$F0 : ldx #$21 : jsl set_sprite
.9C1D:
    brk #$00

;----- 9C1F

    jsl update_animation_normal
    dec $3B
    bne .9C1D

    inc $3B
.9C29:
    brk #$00

;----- 9C2B

    dec $3B
    bne .9C29

    inc $0F
    ldy #$A8 : ldx #$21 : jsl set_sprite
    lda $07
    bne .9C4C

    jsl set_hp
    clc
    lda #$16 : adc $33 : jsl _019662 : sta $30
.9C4C:
    !X16
    ldx $31
    lda $0030,X
    !X8
    clc
    adc $07
    tax
    lda.w enemy_spawner_data_C0FD,X : sta !obj_direction
    ldx #$08 : jsl _018BBF
    jsr .9CB0
    lda $07
    beq .9C7C

    jsr .9CC1
    jsl _02F9DA_F9E0
    lda #$30 : cop #$00

;----- 9C76

    inc $34
.9C78:
    brk #$00

;----- 9C7A

    bra .9C78

.9C7C:
    lda #!sfx_grow : jsl _018049_8053
    jsl _02F9DA_F9E0
    lda #$30 : cop #$00

;----- 9C8A

    inc $34
.9C8C:
    brk #$00

;----- 9C8E

    jsr _028053_local
    bcc .9C8C

    ;remove icicle
    dec $1AEF ;todo: obj_type_count + id_icicle + 4 (?)
    lda $2F : sta $0000 ;2F = parts count?
    phd
.9C9C:
    !X16
    ldx $2D
    phx
    pld
    !X8
    jsr _0281BB
    dec $0000
    bne .9C9C

    pld
    jmp _0281A8_81B5

;-----

.9CB0:
    lda !obj_direction
    and #$07
    ldx #$0C
    jsl mulu
    !A16
    sta $0C
    !A8
    rts

;-----

.9CC1:
    !AX16
    ldx $2F
    lda.w !obj_pos_x+1,X : clc : adc.w !obj_speed_x+1,X : clc : adc !obj_speed_x+1 : sta !obj_pos_x+1
    lda.w !obj_pos_y+1,X : clc : adc.w !obj_speed_y+1,X : clc : adc !obj_speed_y+1 : sta !obj_pos_y+1
    !AX8
    rts

;-----

.destroy:
    lda $07
    bne .9CF8

    ldy #$0F : jsl update_score
    lda #!sfx_shatter : jsl _018049_8053
.9CF0:
    dec $1AEF ;obj_type_count + id_icicle + 4 (?)
    lda $2F : jsr _028B52_local
.9CF8:
    lda $0F
    beq .9D34

    !X8
    bit $09
    bvc .9D34

    ldy #$AA : ldx #$21 : jsl set_sprite
    lda #$20 : jsl _0187E5
.9D10:
    brk #$00

;----- 9D12

    jsl update_animation_normal
    jsl update_pos_xyg_add
    jsl _01A559
    bne .9D2E

    lda $24
    cmp #$70
    bne .9D10

    bra .9D34

.9D28:
    brk #$00

;----- 9D2A

    jsl update_animation_normal
.9D2E:
    lda $24
    cmp #$70
    bne .9D28

.9D34:
    jmp _0281A8_81B5

;-----

.thing:
    lda $1FAF
    bne .9D4A

    jsr _02FB2B
    jsr _02FAC0
    lda $34
    beq .9D49

    jmp _02FD62_FD7C

.9D49:
    rts

.9D4A:
    !AX16
    ldx $31
    stz $0008,X
    lda #.9CF0 : sta.w !obj_state+1,X
    !AX8
    rts
}

{ ;9D5A -
_029D5A:
    ;flying knight spawner
    inc !obj_facing
    lda #$20 : cop #$00

;----- 9D60

.9D60:
    brk #$00

;----- 9D62

.9D62:
    !A16
    lda.w camera_x+1
    cmp #$0540
    !A8
    bcs icicle_9D34

    lda $1B12
    bne .9D60

    jsl get_rng_16
    lda.w enemy_spawner_data_C161,X
    ldx.w difficulty
    clc
    adc.w enemy_spawner_data_C171,X
    cop #$00

;----- 9D83

    lda !open_object_slots
    clc
    adc #$02
    cmp #$08
    bcc .9D62

    ldx #$70 : jsl _0196EF
    sta $1B12
    dec
    sta $07
    lda #$04 : sta $1D
.9D9D:
    lda #!id_flying_knight : jsl prepare_object
    dec $07
    bpl .9D9D

    bra .9D62
}

{ ;9DA9 - 9ED2
flying_knight:

.9DA9:
    !A16
    lda !obj_pos_x+1
    adc #$00C0
    sbc.w camera_x+1
    cmp #$0280
    bcs .9DC3

    lda !obj_pos_y+1
    adc #$0030
    sbc.w camera_y+1
    cmp #$0160
.9DC3:
    !A8
    rts

;-----

.create:
    lda #$02 ;unused lda
    jsr pot_creation_local
    lda $07 : asl : tax
    !A16
    lda.w flying_knight_data_C175,X : clc : adc.w camera_x+1 : sta !obj_pos_x+1
    lda.w camera_y+1 : adc #$00A0 : sta !obj_pos_y+1
    !A8
    ldy #$2B : jsl set_speed_xyg
.9DEA:
    brk #$00

;----- 9DEC

    jsr .9DA9
    bcc .9DF4

    jmp _0281A8_81B5

.9DF4:
    jsl update_pos_x
    bit $09
    bvc .9DEA

    jsl _02F9DA_F9E0
    lda #$03 : sta $30
    ldy #$A2 : ldx #$21 : jsl set_sprite
.9E0C:
    lda #$46 : jsl _018049_8053
    jsr .9EC1

.9E15:
    brk #$00

;----- 9E17

    jsl update_pos_xyg_sub
    dec $31
    dec $2F
    bne .9E15

    ldy #$A0 : ldx #$21 : jsl set_sprite
.9E29:
    brk #$00

;----- 9E2B

    jsl update_pos_xyg_sub
    dec $31
    bne .9E29

    lda $32 : sta $31
.9E37:
    brk #$00

;----- 9E39

    jsl update_pos_xyg_add
    dec $31
    lda $31
    cmp #$03
    bne .9E37

    ldy #$A2 : ldx #$21 : jsl set_sprite
.9E4D:
    brk #$00

;----- 9E4F

    jsl update_pos_xyg_add
    dec $31
    bne .9E4D

    jsr .9EC1
.9E5A:
    brk #$00

;----- 9E5C

    jsl update_pos_xyg_add
    dec $31
    dec $2F
    bne .9E5A

    ldy #$A4 : ldx #$21 : jsl set_sprite
.9E6E:
    brk #$00

;----- 9E70

    jsl update_pos_xyg_add
    dec $31
    bne .9E6E

    lda $32 : sta $31
.9E7C:
    brk #$00

;----- 9E7E

    jsl update_pos_xyg_sub
    dec $31
    lda $31
    cmp #$03
    bne .9E7C

    ldy #$A2 : ldx #$21 : jsl set_sprite
.9E92:
    brk #$00

;----- 9E94

    jsl update_pos_xyg_sub
    dec $31
    bne .9E92

    jmp .9E0C

;-----

.destroy:
    jsr drop_pot_local
    jmp _028BEC

;-----

.thing:
    bit $09
    bvc .9EBB

    ldy #$84 : jsr pot_spawn_offset_local
    jsl update_animation_normal
    jsr _02FBF9
    jsr _02F9FA_F9FE
    jmp _02FD62_FD7C

.9EBB:
    jsr _028D09_local
    jmp _0281BB

;-----

.9EC1:
    lda #$03 : sta $2F
    lda $30 : inc : and #$03 : sta $30
    lda #$1A : sta $32 : sta $31
    rts
}

{ ;9ED3 - 9EDA
_029ED3: ;blank obj

.create:
    brk #$00

;----- 9ED5

    bra _029ED3

;-----

.thing:
    rts

;-----

.destroy:
    jmp _0281A8_81B5
}

{ ;9EDB - B06C
hydra:

.create:
    lda $07
    cmp #$0F
    beq .9EFA

    asl
    tax
    jmp (+,X) : +: dw .A239, .A60F, .A819, .A357, .A9CD, .A473, .AADB, .ABED, .A728, .A8FC

.9EFA:
    stz $1EC9
    stz $1ECB
    ldx #$10 : jsr _028000_local
.9F05:
    brk #$00

;----- 9F07

    lda #$34 : jsl _0195E4
    bcc .9F05

    !AX16
    tya
    clc
    adc #$0032
    tay
    !A8
    lda #$01 : sta $07
    jsr _028B2A_local
    stx $1EBD
    lda !obj_type : jsr _02EB57
    stz $0F
    stz $07
    lda #$02 : sta $31
.9F30:
    jsr _028B2A_local
    lda !obj_type
    inc $0F
    jsr _02EB57
    dec $31
    bne .9F30

    jsr _028B2A_local
    stx $1EB7
    stz $0F
    lda !obj_type : jsr _02EB57
    lda #$08 : sta $07
    lda #$06 : sta $0F
    jsr _028B2A_local
    lda !obj_type : jsr _02EB57
    jsr _028B2A_local
    dec $0F
    lda !obj_type : jsr _02EB57
    jsr _028B2A_local
    dec $0F
    lda !obj_type : jsr _02EB57
    lda #$02 : sta $07
    lda #$02 : sta $31
.9F77:
    jsr _028B2A_local
    dec $0F
    lda !obj_type : jsr _02EB57
    dec $31
    bne .9F77

    phx
    lda #$09 : sta $07
    jsr _028B2A_local
    stx $1EC7
    dec $0F
    lda !obj_type : jsr _02EB57
    !A16
    pla : sta $002D,X
    !A8
    jsr _028B2A_local
    stx $1EC5
    stz $0F
    lda !obj_type : jsr _02EB57
    lda #$04 : sta $07
    jsr _028B2A_local
    stx $1EBF
    lda !obj_type : jsr _02EB57
    stz $0F
    lda #$03 : sta $07
    lda #$02 : sta $31
.9FC5:
    jsr _028B2A_local
    lda !obj_type
    inc $0F
    jsr _02EB57
    dec $31
    bne .9FC5

    jsr _028B2A_local
    stx $1EB9
    stz $0F
    lda !obj_type : jsr _02EB57
    lda #$06 : sta $07
    jsr _028B2A_local
    stx $1EC1
    lda !obj_type : jsr _02EB57
    stz $0F
    lda #$05 : sta $07
    lda #$02 : sta $31
.9FF9:
    jsr _028B2A_local
    lda !obj_type
    inc $0F
    jsr _02EB57
    dec $31
    bne .9FF9

    jsr _028B2A_local
    stx $1EBB
    stz $0F
    lda !obj_type : jsr _02EB57
    lda #$07 : sta $07
    jsr _028B2A_local
    lda !obj_type : jsr _02EB57
    !A16
    !AX8
    brk #$00

;----- A026

    jmp _0281A8_81B5

;-----

.genie_create:
    inc $1ED4
    inc $1ED5
    lda $07 : asl : ldy #$E6 : ldx #$21 : jsl set_sprite_8480
    !A16
    lda.w _00ED00+$56 : sta $27
    lda $07
    and #$000F
    asl
    tax
    lda.w hydra_data_C291,X : sta $29
    lda.w #hydra_data_C29D : sta $13
    lda !obj_pos_y+0 : sta $36
    stz $0C
    !A8
    lda !obj_pos_y+2 : sta $38
    lda $09 : ora #$D0 : sta $09
    lda #$FF : sta $26
    stz $15
    lda $1ECA : eor #$01 : sta !obj_facing
    lda #$02 : sta $31
.A075:
    lda $1ECA
    beq .A082

    ldy #$35 : jsl set_speed_xyg
    bra .A088

.A082:
    ldy #$34 : jsl set_speed_xyg
.A088:
    brk #$00

;----- A08A

    jsl update_pos_xyg_add
    jsl _01A559
    beq .A088

    lda $07 : asl : ldy #$CC : ldx #$21 : jsl set_sprite_8480
    dec $31
    bne .A075

    lda $07 : asl : ldy #$C0 : ldx #$21 : jsl set_sprite_8480
    lda #$1F : cop #$00

;----- A0B2

    lda !obj_facing : eor #$01 : sta !obj_facing
    lda #$1F : cop #$00

;----- A0BC

    stz $31
    stz $32
    sec
    lda $33 : sbc !obj_pos_x+0 : sta $39
    lda $34 : sbc !obj_pos_x+1 : sta $3A
    lda $35 : sbc !obj_pos_x+2 : sta $0000
    bcs .A0EC

    sec
    lda !obj_pos_x+0 : sbc $33 : sta $39
    lda !obj_pos_x+1 : sbc $34 : sta $3A
    lda !obj_pos_x+2 : sbc $35 : sta $0000
    inc $31
.A0EC:
    sec
    lda $36 : sbc !obj_pos_y+0 : sta $3B
    lda $37 : sbc !obj_pos_y+1 : sta $3C
    lda $38 : sbc !obj_pos_y+2 : sta $0001
    bcs .A118

    sec
    lda !obj_pos_y+0 : sbc $36 : sta $3B
    lda !obj_pos_y+1 : sbc $37 : sta $3C
    lda !obj_pos_y+2 : sbc $38 : sta $0001
    inc $32
.A118:
    !A16
    lda $0000
    lsr
    lda $39
    ror
    lsr #5
    sta $39
    bne .A12F

    lda #$0001 : sta $39
.A12F:
    lda $0001
    lsr
    lda $3B
    ror
    lsr #5
    sta $3B
    bne .A144

    lda #$0001 : sta $3B
.A144:
    !A8
    lda $07 : asl : ldy #$D8 : ldx #$21 : jsl set_sprite_8480
    ldy #$2C : jsl set_speed_xyg
.A157:
    brk #$00

;----- A157

    lda $31
    bne .A172

    clc
    lda !obj_pos_x+0 : adc $39  : sta !obj_pos_x+0
    lda !obj_pos_x+1 : adc $3A  : sta !obj_pos_x+1
    lda !obj_pos_x+2 : adc #$00 : sta !obj_pos_x+2
    bra .A185

.A172:
    sec
    lda !obj_pos_x+0 : sbc $39  : sta !obj_pos_x+0
    lda !obj_pos_x+1 : sbc $3A  : sta !obj_pos_x+1
    lda !obj_pos_x+2 : sbc #$00 : sta !obj_pos_x+2
.A185:
    lda $32
    bne .A19E

    clc
    lda !obj_pos_y+0 : adc $3B  : sta !obj_pos_y+0
    lda !obj_pos_y+1 : adc $3C  : sta !obj_pos_y+1
    lda !obj_pos_y+2 : adc #$00 : sta !obj_pos_y+2
    bra .A1B1

.A19E:
    sec
    lda !obj_pos_y+0 : sbc $3B  : sta !obj_pos_y+0
    lda !obj_pos_y+1 : sbc $3C  : sta !obj_pos_y+1
    lda !obj_pos_y+2 : sbc #$00 : sta !obj_pos_y+2
.A1B1:
    jsl update_pos_xyg_add
    lda !obj_speed_y+2
    bmi .A157

    !A16
    lda !obj_pos_y+1
    sec
    sbc $37
    !A8
    bcs .A1C7

    jmp .A157

.A1C7:
    lda $07 : asl : ldy #$DE : ldx #$21 : jsl set_sprite_8480
    lda #$5F : cop #$00

;----- A1D6

    dec $1ED5
.A1D9:
    brk #$00

;----- A1DB

    lda $1ED5
    bne .A1D9

    lda $07 : asl : ldy #$A0 : ldx #$21 : jsl set_sprite_8480
    !A16
    lda.w _00ED00+$4E : sta $27
    lda $07
    and #$000F
    asl
    tax
    lda.w hydra_data_C291,X : sta $29
    !A8
    stz $1ED4
    lda #$05 : sta $31
.A207:
    lda #$03 : sta $0332
    inc $0331
    lda #$02 ;leftover lda
    brk #$00

;----- A213

    lda #$00 : sta $0332
    inc $0331
    brk #$00

;----- A21D

    dec $31
    bne .A207

    jmp _0281A8_81B5

;-----

.genie_thing:
    lda $09 : ora #$40 : sta $09
    jsl update_animation_normal
    jsl _018E32_8E73
    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
    rts

;-----

.A239:
    ldy #$B6 : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    lda $08 : ora #$05 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $3B
    lda #$04 : sta $3C
    lda #$04 : sta !obj_direction
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx $0F
    lda.w hydra_data_C27F,X : sta $31
    stz $35
    stz $39
.A26F:
    !X8
    brk #$00

;----- A273

    !X16
    ldx $1EBD
    lda $0034,X
    beq .A280

    jmp .A58F

.A280:
    lda $0033,X
    bne .A26F

    !X8
    lda $1EC9
    beq .A2C5

    lda $1EC9
    cmp #$01
    beq .A26F

    lda $39
    bne .A26F

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    jsr .AF17
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A2B6:
    brk #$00

;----- A2B8

    lda $1ECC
    bne .A2B6

    lda $08 : ora #$08 : sta $08
    bra .A26F

.A2C5:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    stz $39
    lda $0F
    beq .A310

    lda $35
    bne .A2FA

    dec $31
    bne .A34E

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A34E

.A2FA:
    dec $35
    lda $35
    and #$07
    bne .A30E

    jsr .A5B6
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A30E:
    bra .A34E

.A310:
    lda $35
    bne .A338

    dec $31
    bne .A34E

    ldx #$2C : jsl _0196EF : sta $32 : sta $38
    ldx #$2E : jsl _0196EF : sta $35 : sta $37
    ldx #$30 : jsl _0196EF : sta $31 : sta $36
    bra .A34E

.A338:
    dec $35
    lda $35
    and #$07
    bne .A34C

    jsr .A5B6
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A34C:
    bra .A34E

.A34E:
    ldx #$3A : jsl update_pos_xy_2_child_obj
    jmp .A26F

;-----

.A357:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    lda $08 : ora #$02 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $3B
    lda #$04 : sta $3C
    lda #$04 : sta !obj_direction
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx $0F
    lda.w hydra_data_C27F,X : sta $31
    stz $35
    stz $39
.A38D:
    !X8
    brk #$00

;----- A391

    !X16
    ldx $1EBF
    lda $0034,X
    beq .A39E

    jmp .A58F

.A39E:
    lda $0033,X
    bne .A38D

    !X8
    lda $1EC9
    beq .A3E3

    lda $1EC9
    cmp #$01
    beq .A38D

    lda $39
    bne .A38D

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    jsr .AF17
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A3D4:
    brk #$00

;----- A3D6

    lda $1ECC
    bne .A3D4

    lda $08 : ora #$08 : sta $08
    bra .A38D

.A3E3:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $0F
    beq .A42C

    lda $35
    bne .A416

    dec $31
    bne .A46A

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A46A

.A416:
    dec $35
    lda $35
    and #$07
    bne .A42A

    jsr .A5B6
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A42A:
    bra .A46A

.A42C:
    lda $35
    bne .A454

    dec $31
    bne .A46A

    ldx #$2C : jsl _0196EF : sta $32 : sta $38
    ldx #$2E : jsl _0196EF : sta $35 : sta $37
    ldx #$30 : jsl _0196EF : sta $31 : sta $36
    bra .A46A

.A454:
    dec $35
    lda $35
    and #$07
    bne .A468

    jsr .A5B6
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A468:
    bra .A46A

.A46A:
    ldx #$3A : jsl update_pos_xy_2_child_obj
    jmp .A38D

;-----

.A473:
    ldy #$EE : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    lda $08 : ora #$02 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $3B
    lda #$04 : sta $3C
    lda #$04 : sta !obj_direction
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx $0F
    lda.w hydra_data_C27F,X : sta $31
    stz $35
    stz $39
.A4A9:
    !X8
    brk #$00

;----- A4AD

    !X16
    ldx $1EC1
    lda $0034,X
    beq .A4BA

    jmp .A58F

.A4BA:
    lda $0033,X
    bne .A4A9

    !X8
    lda $1EC9
    beq .A4FF

    lda $1EC9
    cmp #$01
    beq .A4A9

    lda $39
    bne .A4A9

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    jsr .AF17
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A4F0:
    brk #$00

;----- A4F2

    lda $1ECC
    bne .A4F0

    lda $08 : ora #$08 : sta $08
    bra .A4A9

.A4FF:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $0F
    beq .A548

    lda $35
    bne .A532

    dec $31
    bne .A586

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A586

.A532:
    dec $35
    lda $35
    and #$07
    bne .A546

    jsr .A5B6
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A546:
    bra .A586

.A548:
    lda $35
    bne .A570

    dec $31
    bne .A586

    ldx #$2C : jsl _0196EF : sta $32 : sta $38
    ldx #$2E : jsl _0196EF : sta $35 : sta $37
    ldx #$30 : jsl _0196EF : sta $31 : sta $36
    bra .A586

.A570:
    dec $35
    lda $35
    and #$07
    bne .A584

    jsr .A5B6
    ldx !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
.A584:
    bra .A586

.A586:
    ldx #$3A : jsl update_pos_xy_2_child_obj
    jmp .A4A9

;-----

.A58F:
    !X8
    lda $08 : ora #$10 : sta $08
    lda #$10 : sta $31
.A59B:
    brk #$00

;----- A59D

    ldx #$3A : jsl update_pos_xy_2_child_obj
    dec $31
    bne .A59B

    lda #!id_small_explosion : jsl prepare_object
    lda #$3B : jsl _018049_8053
    jmp _0281A8_81B5

;-----

.A5B6:
    !A8
    lda $32
    beq .A5CE

    lda !obj_direction
    cmp #$02
    beq .A5EC

    lda !obj_direction
    cmp #$07
    beq .A5DE

    lda !obj_facing
    beq .A5E6

    bra .A5E9

.A5CE:
    lda !obj_direction
    cmp #$06
    beq .A5EC

    lda !obj_direction
    beq .A5E1

    lda !obj_facing
    beq .A5E9

    bra .A5E6

.A5DE:
    stz !obj_direction
    rts

.A5E1:
    lda #$07
    sta !obj_direction
    rts

.A5E6:
    dec !obj_direction
    rts

.A5E9:
    inc !obj_direction
    rts

.A5EC:
    rts

;-----

.A5ED:
    !A8
    lda $32
    beq .A600

    lda $1ECA
    bne .A5FB

    stz !obj_direction
    rts

.A5FB:
    lda #$04 : sta !obj_direction
    rts

.A600:
    lda $1ECA
    beq .A60A

    lda #$05 : sta !obj_direction
    rts

.A60A:
    lda #$07 : sta !obj_direction
    rts

;-----

.A60F:
    ldy #$A4 : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    !A16
    lda.w _00ED00+$4E : sta $27
    lda #$0100 : sta $29
    !A8
    lda #$FF : sta $26
    lda $08 : and #$F8 : ora #$01 : sta $08
    lda $09 : ora #$90 : sta $09
    stz $0F
    jsl set_hp
    stz $31
    stz $34
    stz $3B
    stz $39
.A649:
    !A16
    lda !obj_pos_x+1 : sta $1ECE
    !A8
    lda $09 : ora #$40 : sta $09
    brk #$00

;----- A65A

    lda $1EC9
    beq .A6DE

    lda $1EC9
    cmp #$01
    beq .A649

    lda $39
    bne .A649

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    jsr .AF1F
    jsl get_object_slot
    bmi .A6B6

    !X16
    lda #!id_hydra_genie : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda #$02 : sta $0007,X
    lda !obj_pos_x+2 : sta $0035,X
    !A16
    lda #$0001 : sta $0008,X
    lda !obj_pos_x : sta $0033,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    lda $1ECE : sta.w !obj_pos_x+1,X
    !AX8
    lda $09 : and #$BF : sta $09
.A6B6:
    brk #$00

;----- A6B8

    lda $1ECC
    bne .A6B6

    lda $09 : ora #$40 : sta $09
    ldy #$A4 : ldx #$21 : jsl set_sprite
    jsl update_animation_normal
    jsl _018E32_8E73
    brk #$00

;----- A6D5

    lda $08 : ora #$08 : sta $08
    jmp .A649

.A6DE:
    stz $39
    lda $31
    bne .A70B

    lda $33
    bne .A6EB

    jmp .A649

.A6EB:
    ldy #$B0 : ldx #$21 : jsl set_sprite
    lda #$5F : sta $31
    lda #$4E : sta $1D
    lda $08 : and #$07 : sta $1ED6
    lda #$38 : jsl prepare_object
    jmp .A649

.A70B:
    dec $31
    beq .A712

    jmp .A649

.A712:
    stz $33
    ldy #$A4 : ldx #$21 : jsl set_sprite
    jmp .A649

;-----

    ;unused?
    ldy #$D8 : ldx #$21 : jsl set_sprite
    rts

;-----

.A728:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    lda #$05 : sta $3C
    stz $3B
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $0C
    stz !obj_direction
    ldx $0F
    lda.w hydra_data_C27F,X : sta $31
    stz $3B
    stz $35
    stz $39
.A757:
    brk #$00

;----- A759

    lda $1ECB
    cmp #$07
    bne .A763

    jmp .A80C

.A763:
    lda $1EC9
    beq .A7B3

    lda $1EC9
    cmp #$01
    beq .A757

    lda $39
    bne .A757

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    jsr .AF17
    ldx #$00
    lda !obj_direction
    lda.w hydra_data_C267,X : sta $0C
    stz $0D
    lda $0F
    cmp #$06
    beq .A79A

    ldx #$3A : jsl update_pos_xy_2_child_obj
.A79A:
    brk #$00

;----- A79C

    lda $1ECB
    cmp #$07
    bne .A7A6

    jmp $A80C

.A7A6:
    lda $1ECC
    bne .A79A

    lda $08 : ora #$08 : sta $08
    bra .A757

.A7B3:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $35
    bne .A7E2

    dec $31
    bne .A7F6

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A7F6

.A7E2:
    dec $35
    lda $35
    bne .A7F6

    jsr .A5ED
    ldx #$00
    ldx !obj_direction
    lda.w hydra_data_C277,X : sta $0C
    stz $0D
.A7F6:
    lda $0F
    cmp #$06
    beq .A802

    ldx #$3A : jsl update_pos_xy_2_child_obj
.A802:
    lda $1ECB
    cmp #$07
    beq .A80C

    jmp .A757

.A80C:
    lda $08 : ora #$10 : sta $08
    lda #$5F : cop #$00

;----- A816

    jmp _0281A8_81B5

;-----

.A819:
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    lda #$05 : sta $3C
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    stz $0C
    stz !obj_direction
    ldx $0F
    lda.w hydra_data_C288,X : sta $31
    stz $3B
    stz $39
    stz $35
.A846:
    brk #$00

;----- A848

    lda $1ECB
    cmp #$07
    bne .A852

    jmp .A8EF

.A852:
    lda $1EC9
    beq .A89A

    lda $1EC9
    cmp #$01
    beq .A846

    lda $39
    bne .A846

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    jsr .AF17
    ldx !obj_direction
    lda.w hydra_data_C26F,X : sta $0C
    stz $0D
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A881:
    brk #$00

;----- A883

    lda $1ECB
    cmp #$07
    bne .A88D

    jmp .A8EF

.A88D:
    lda $1ECC
    bne .A881

    lda $08 : ora #$08 : sta $08
    bra .A846

.A89A:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $35
    bne .A8C9

    dec $31
    bne .A8DF

    !X16
    ldx $2F
    !A8
    lda $0038,X : sta $38 : sta $32
    lda $0037,X : sta $37 : sta $35
    lda $0036,X : sta $36 : sta $31
    !X8
    bra .A8DF

.A8C9:
    dec $35
    lda $35
    bne .A8DD

    jsr .A5ED
    ldx #$00
    ldx !obj_direction
    lda.w hydra_data_C26F,X : sta $0C
    stz $0D
.A8DD:
    bra .A8DF

.A8DF:
    ldx #$3A : jsl update_pos_xy_2_child_obj
    lda $1ECB
    cmp #$07
    beq .A8EF

    jmp .A846

.A8EF:
    lda $08 : ora #$10 : sta $08
    lda #$5F : cop #$00

;----- A8F9

    jmp _0281A8_81B5

;-----

.A8FC:
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    ldx $0F
    lda.w hydra_data_C288,X : sta $31
    stz $3B
    stz $39
    stz $35
.A921:
    brk #$00

;----- A923

    lda $1ECB
    cmp #$07
    bne .A92D

    jmp .A9C0

.A92D:
    lda $1EC9
    beq .A970

    lda $1EC9
    cmp #$01
    beq .A921

    lda $39
    bne .A921

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    lda $0F
    beq .A957

    jsr .AF27
    ldx #$3A : jsl update_pos_xy_2_child_obj
.A957:
    brk #$00

;----- A959

    lda $1ECB
    cmp #$07
    bne .A963

    jmp .A9C0

.A963:
    lda $1ECC
    bne .A957

    lda $08 : ora #$08 : sta $08
    bra .A921

.A970:
    stz $39
    jsr _02FB9C
    jsr _02FD62_FD6A
    lda $35
    bne .A9A6

    !A8
    dec $31
    bne .A9AC

    lda $32
    bne .A98A

    inc $32
    bra .A98C

.A98A:
    stz $32
.A98C:
    lda $32 : sta $38
    ldx #$32 : jsl _0196EF : sta $35 : sta $37
    ldx #$32 : jsl _0196EF : sta $31 : sta $36
    bra .A9AC

.A9A6:
    dec $35
    lda $35
    bne .A9AC

.A9AC:
    lda $0F
    beq .A9B6

    ldx #$3A : jsl update_pos_xy_2_child_obj
.A9B6:
    lda $1ECB
    cmp #$07
    beq .A9C0

    jmp .A921

.A9C0:
    lda $08 : ora #$10 : sta $08
    lda #$5F : cop #$00

;----- A9CA

    jmp _0281A8_81B5

;-----

.A9CD:
    ldy #$A0 : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    !A16
    lda.w _00ED00+$4E : sta $27
    lda #$0120 : sta $29
    !A8
    lda #$FF : sta $26
    lda $08 : ora #$00 : sta $08
    lda $09 : ora #$90 : sta $09
    stz $3B
    lda #$01 : sta $0F
    jsl set_hp
    stz $31
    stz $34
    stz $39
.AA07:
    !A16
    lda !obj_pos_x+1 : sta $1ED0
    !A8
    lda $09 : ora #$40 : sta $09
    brk #$00

;----- AA18

    lda $1EC9
    beq .AA9A

    lda $1EC9
    cmp #$01
    beq .AA07

    lda $39
    bne .AA07

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    jsr .AF1F
    jsl get_object_slot
    bmi .AA72

    !X16
    lda #!id_hydra_genie : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    stz $0007,X
    lda !obj_pos_x+2 : sta $0035,X
    !A16
    lda #$0001 : sta $0008,X
    lda !obj_pos_x : sta $0033,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    lda $1ED0 : sta.w !obj_pos_x+1,X
    !AX8
    lda $09 : and #$BF : sta $09
.AA72:
    brk #$00

;----- AA74

    lda $1ECC
    bne .AA72

    lda $09 : ora #$40 : sta $09
    ldy #$A0 : ldx #$21 : jsl set_sprite
    jsl update_animation_normal
    jsl _018E32_8E73
    brk #$00

;----- AA91

    lda $08 : ora #$08 : sta $08
    jmp .AA07

.AA9A:
    stz $39
    lda $31
    bne .AAC7

    lda $33
    bne .AAA7

    jmp .AA07

.AAA7:
    ldy #$AC : ldx #$21 : jsl set_sprite
    lda #$5F : sta $31
    lda #$4E : sta $1D
    lda $08 : and #$07 : sta $1ED6
    lda #$38 : jsl prepare_object ;todo
    jmp .AA07

.AAC7:
    dec $31
    beq .AACE

    jmp .AA07

.AACE:
    stz $33
    ldy #$A0 : ldx #$21 : jsl set_sprite
    jmp .AA07

;-----

.AADB:
    !AX8
    ldy #$A2 : ldx #$21 : jsl set_sprite
    lda #$0F : sta !obj_pos_x+2
    !A16
    lda.w _00ED00+$4E : sta $27
    lda #$0140 : sta $29
    !A8
    lda #$FF : sta $26
    lda $08 : ora #$00 : sta $08
    lda $09 : ora #$90 : sta $09
    lda #$02 : sta $0F
    jsl set_hp
    stz $31
    stz $34
    stz $3B
    stz $39
.AB17:
    !A16
    lda !obj_pos_x+1 : sta $1ED2
    !A8
    lda $09 : ora #$40 : sta $09
    brk #$00

;----- AB28

    lda $1EC9
    beq .ABAC

    lda $1EC9
    cmp #$01
    beq .AB17

    lda $39
    bne .AB17

    lda $08 : and #$F7 : sta $08
    inc $39
    lda $1ECA : sta !obj_facing
    jsr .AF1F
    jsl get_object_slot
    bmi .AB84

    !X16
    lda #!id_hydra_genie : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda #$01 : sta $0007,X
    lda !obj_pos_x+2 : sta $0035,X
    !A16
    lda #$0001 : sta $0008,X
    lda !obj_pos_x : sta $0033,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    lda $1ED2 : sta.w !obj_pos_x+1,X
    !AX8
    lda $09 : and #$BF : sta $09
.AB84:
    brk #$00

;----- AB86

    lda $1ECC
    bne .AB84

    lda $09 : ora #$40 : sta $09
    ldy #$A2 : ldx #$21 : jsl set_sprite
    jsl update_animation_normal
    jsl _018E32_8E73
    brk #$00

;----- ABA3

    lda $08 : ora #$08 : sta $08
    jmp .AB17

.ABAC:
    stz $39
    lda $31
    bne .ABD9

    lda $33
    bne .ABB9

    jmp .AB17

.ABB9:
    ldy #$AE : ldx #$21 : jsl set_sprite
    lda #$5F : sta $31
    lda #$4E : sta $1D
    lda $08 : and #$07 : sta $1ED6
    lda #$38 : jsl prepare_object
    jmp .AB17

.ABD9:
    dec $31
    beq .ABE0

    jmp .AB17

.ABE0:
    stz $33
    ldy #$A2 : ldx #$21 : jsl set_sprite
    jmp .AB17

;-----

.ABED:
    !AX8
    ldy #$B2 : ldx #$21 : jsl set_sprite
    !A16
    lda #$0180 : sta !obj_pos_x+1
    lda #$0088 : sta !obj_pos_y+1
    !A8
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    lda #$FF : sta !obj_direction
    lda #$80 : sta !obj_speed_x+0
    stz !obj_speed_x+1
    stz !obj_speed_x+2
    lda #$06 : sta $3C
    stz $38
    stz $31
    stz $36
    stz $35
    stz $3B
    stz $39
    stz $1ECB
.AC30:
    lda $1ECB
    cmp #$07
    bne .AC3A

    jmp .AE07

.AC3A:
    brk #$00

;----- AC3C

    lda $1EC9
    beq .AC97

    jsr .B03C
    bne .AC3A

    lda $1ECB
    cmp #$07
    bne .AC50

    jmp .AE07

.AC50:
    inc $1ECC
    lda $08 : and #$F7 : sta $08
    brk #$00

;----- AC5B

    inc $1EC9
    jsr .B04C
    lda $1ECA : sta !obj_facing
    stz $39
    jsr .AF2F
    lda #$03 : cop #$00

;----- AC6F

.AC6F:
    brk #$00

;----- AC71

    lda $1ED4
    bne .AC6F

    stz $1ECC
    lda $08 : ora #$08 : sta $08
.AC7F:
    brk #$00

;----- AC81

    jsr .B03C
    bne .AC7F

    stz $39
    lda #$66 : jsl _018049_8053
    !A8
    stz $3B
    stz $1EC9
    bra .AC30

.AC97:
    !A8
    lda $1ECA
    beq .ACAF

    !A16
    lda !arthur_pos_x+1
    sec
    sbc !obj_pos_x+1
    bcs .ACBE

    lda !obj_pos_x+1
    sta !arthur_pos_x+1
    bra .ACBE
.ACAF:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc !obj_pos_x+1
    bcc .ACBE

    lda !obj_pos_x+1 : sta !arthur_pos_x+1
.ACBE:
    !A8
    jsr _02FB9C
    jsr _02FD62_FD6A
    dec $36
    beq .ACCD

    jmp .ADDA

.ACCD:
    !X8
    lda #$5F : sta $31
.ACD3:
    brk #$00

;----- ACD5

    lda $1ECB
    cmp #$07
    bne .ACDF

    jmp .AE07

.ACDF:
    dec $31
    bne .ACD3

    sec
    lda #$03 : sta $31
    stz $1ECD
.ACEB:
    brk #$00

;----- ACED

    lda $1ECB
    cmp #$07
    bne .ACF7

    jmp .AE07

.ACF7:
    ldx #$36 : jsl _0196EF
    sta $0000
    and $1ECB
    bne .ACEB

    lda $0000 : asl : tax
    jsr (.AD9A,X)
    lda $1ECD
    beq .ACEB

    stz $1ECD
    !X8
    ldx #$38 : jsl _0196EF : sta $37
.AD1F:
    brk #$00

;----- AD21

    lda $1ECB
    cmp #$07
    beq .AD53

    lda $1ECA
    beq .AD3E

    !A16
    lda !arthur_pos_x+1
    sec
    sbc !obj_pos_x+1
    bcs .AD4D

    lda !obj_pos_x+1 : sta !arthur_pos_x+1
    bra .AD4D

.AD3E:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc !obj_pos_x+1
    bcc .AD4D

    lda !obj_pos_x+1 : sta !arthur_pos_x+1
.AD4D:
    !A8
    dec $37
    bne .AD1F

.AD53:
    dec $31
    bne .ACEB

    lda #$3F : sta $31
.AD5B:
    brk #$00

;----- AD5D

    lda $1ECB
    cmp #$07
    bne .AD67

    jmp .AE07

.AD67:
    dec $31
    bne .AD5B

    lda $38
    bne .AD79

    ldx #$3A : jsl _0196EF : sta $38
    bra .AD8A

.AD79:
    ldx #$2C : jsl _0196EF : sta $38
    inc $1EC9
    lda #$65 : jsl _018049_8053
.AD8A:
    lda !obj_direction : eor #$FF : sta !obj_direction
    ldx #$34 : jsl _0196EF : sta $36
    bra .ADDA

;-----

.AD9A: dw .ADA4, .ADA4, .ADB2, .ADC0, .ADC0

.ADA4:
    lda $1ECB
    and #$01
    bne .ADD7

    !X16
    ldx $1EBD
    bra .ADCC

.ADB2:
    lda $1ECB
    and #$02
    bne .ADD7

    !X16
    ldx $1EBF
    bra .ADCC

.ADC0:
    lda $1ECB
    and #$04
    bne .ADD7

    !X16
    ldx $1EC1
.ADCC:
    lda $0034,X
    bne .ADD7

    inc $0033,X
    inc $1ECD
.ADD7:
    !X8
    rts

;-----

.ADDA:
    jsl update_pos_x
    !A16
    lda !obj_pos_x+1
    cmp #$0040
    bcs .ADED

    !A8
    stz !obj_direction
    bra .ADF8

.ADED:
    lda !obj_pos_x+1
    cmp #$01C0
    bcc .ADF8

    !A8
    inc !obj_direction
.ADF8:
    !A8
    jsr .AF2F
    lda $1ECB
    cmp #$07
    beq .AE07

    jmp .AC30

.AE07:
    brk #$00

;----- AE09

    lda #$10 : jsl _018049_8053
    lda $08 : ora #$10 : sta $08
    lda #$70 : jsl prepare_object
    lda #$5F : sta $31
.AE1F:
    brk #$00

;----- AE21

    dec $31
    bne .AE1F

    lda #$72 : sta $1D
    lda #!id_key : jsl prepare_object
    inc $1ED7
    jmp _0281A8_81B5

;-----

    rts ;unused rts

;-----

.thing:
    lda $1EC9
    bne .AE51

    lda $1ECA : sta !obj_facing
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
    jsl update_animation_normal
    jsl _018E32_8E73
.AE51:
    rts

;-----

.destroy:
    lda !obj_hp
    beq .AE80

    lda $33
    bne .AE6A

    sec
    lda $0F : asl : ldy #$A6 : ldx #$21 : jsl set_sprite_8480
    lda #$20 : sta $31
.AE6A:
    ldx #$02 : jsr _028048_local
    jsl _02F9DA_F9E0
    lda $0F : asl : tax
    jmp (+,X) : +: dw .A649, .AA07, .AB17

.AE80:
    lda $08 : ora #$10 : sta $08
    lda #$10 : cop #$00

;----- AE8A

    ldx $0F
    lda.w hydra_data_C2A1,X : ora $1ECB : sta $1ECB
    lda #$05 : sta $31
    inc $34
    lda #$66 : sta $1D
.AE9F:
    lda #!id_small_explosion : jsl prepare_object
    lda #$0A : cop #$00

;----- AEA9

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053
    dec $31
    bne .AE9F

    jmp _0281A8_81B5

;-----

.fireball_create:
    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda $08 : ora $1ED6 : sta $08
    lda $09 : ora #$80 : sta $09
    lda #$26 : jsl _018049_8053
    lda #$24 : sta $31
.AEDC:
    brk #$00

;----- AEDE

    jsl update_animation_normal
    dec $31
    bne .AEDC

    ldy #$BA : ldx #$21 : jsl set_sprite
    jsl _01918E_set_direction16 : sta !obj_direction
.AEF4:
    brk #$00

;----- AEF6

    lda $09
    and #$40
    beq .fireball_destroy

    ldx #$4E : jsl update_pos_xy_2
    bra .AEF4

;-----

.fireball_thing:
    jsr _02FA37_FA65
    ldy #$14 : jsr _02FF22
    jsr _02FD62_FD7C
    jsl update_animation_normal
    rts

;-----

.fireball_destroy: ;only used from fireball_create
    jmp _0281A8_81B5

;-----

.AF17:
    ldx !obj_direction
    lda.w hydra_data_C21F,X
    sta !obj_direction
    rts

;-----

.AF1F:
    ldx !obj_direction
    lda.w hydra_data_C23F,X : sta !obj_direction
    rts

;-----

.AF27:
    ldx !obj_direction
    lda.w hydra_data_C25F,X
    sta !obj_direction
    rts

;-----

.AF2F:
    !AX8
    phy
    lda $1ECA
    bne .AF3E

    !AX16
    ldy #$0000
    bra .AF44

.AF3E:
    !AX16
    lda #$0014
    tay
.AF44:
    ldx $1EC5
    clc : lda !obj_pos_x+1 : adc.w hydra_data_C1F7,Y : sta.w !obj_pos_x+1,X
    iny #2
    clc : lda !obj_pos_y+1 : adc.w hydra_data_C1F7,Y : sta.w !obj_pos_y+1,X
    lda #$00D8 : sta $000C,X
    iny #2
    ldx $1EC7
    clc : lda !obj_pos_x+1 : adc.w hydra_data_C1F7,Y : sta.w !obj_pos_x+1,X
    iny #2
    clc : lda !obj_pos_y+1 : adc.w hydra_data_C1F7,Y : sta.w !obj_pos_y+1,X
    lda #$0024 : sta $000C,X
    iny #2
    !A8
    lda $1ECB
    and #$01
    bne .AFA8

    !A16
    ldx $1EB7
    sec : lda !obj_pos_x+1 : sbc.w hydra_data_C1F7,Y : sta.w !obj_pos_x+1,X
    iny #2
    sec : lda !obj_pos_y+1 : sbc.w hydra_data_C1F7,Y : sta.w !obj_pos_y+1,X
    iny #2
    bra .AFAC

.AFA8:
    iny #4
.AFAC:
    !A8
    lda $1ECB
    and #$02
    bne .AFD2

    !A16
    ldx $1EB9
    sec : lda !obj_pos_x+1 : sbc.w hydra_data_C1F7,Y : sta $001F,X
    iny #2
    sec : lda !obj_pos_y+1 : sbc.w hydra_data_C1F7,Y : sta.w !obj_pos_y+1,X
    iny #2
    bra .AFD6

.AFD2:
    iny #4
.AFD6:
    !A8
    lda $1ECB
    and #$04
    bne .AFFC

    !A16
    ldx $1EBB
    clc : lda !obj_pos_x+1 : adc.w hydra_data_C1F7,Y : sta $001F,X
    iny #2
    sec : lda !obj_pos_y+1 : sbc.w hydra_data_C1F7,Y : sta.w !obj_pos_y+1,X
    iny #2
    bra .B000

.AFFC:
    iny #4
.B000:
    !AX8
    ply
    rts

;-----

    ;unused?
    lda !obj_direction
    bne .B022

    clc
    lda.w !obj_pos_x+0,X : adc #$80 : sta.w !obj_pos_x+0,X
    lda.w !obj_pos_x+1,X : adc #$00 : sta.w !obj_pos_x+1,X
    lda.w !obj_pos_x+2,X : adc #$00 : sta.w !obj_pos_x+2,X
    rts

.B022:
    sec
    lda.w !obj_pos_x+0,X : sbc #$80 : sta.w !obj_pos_x+0,X
    lda.w !obj_pos_x+1,X : sbc #$00 : sta.w !obj_pos_x+1,X
    lda.w !obj_pos_x+2,X : sbc #$00 : sta.w !obj_pos_x+2,X
    rts

;-----

.B03C:
    lda $39
    bne .B049

    ldx #$12 : jsr _028048_local
    lda #$62 : sta $39
.B049:
    dec $39
    rts

;-----

.B04C:
    !A8
    lda $1ECA
    beq .B060

    !A16
    lda #$01C0 : sta !obj_pos_x+1
    !A8
    stz $1ECA
    rts

.B060:
    !A16
    lda #$0040 : sta !obj_pos_x+1
    !A8
    inc $1ECA
    rts
}

{ ;B06D - B080
    ;unused
    !A8
    lda !obj_type : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    dec $07
    lda $07 : sta $0007,X
    rts
}

{ ;B081 - B0CC
update_pos_xy_2_child_obj:
    !AX16
    ldy $2D
    clc
    lda !obj_direction
    and #$00FF
    adc.l speed_xy_offsets,X
    tax
    !A8
    clc
    lda speed_xy_x1,X : adc !obj_pos_x+0 : sta.w !obj_pos_x+0,Y
    lda speed_xy_x2,X : adc !obj_pos_x+1 : sta.w !obj_pos_x+1,Y
    lda speed_xy_x3,X : adc !obj_pos_x+2 : sta.w !obj_pos_x+2,Y
    clc
    lda speed_xy_y1,X : adc !obj_pos_y+0 : sta.w !obj_pos_y+0,Y
    lda speed_xy_y2,X : adc !obj_pos_y+1 : sta.w !obj_pos_y+1,Y
    lda speed_xy_y3,X : adc !obj_pos_y+2 : sta.w !obj_pos_y+2,Y

    !X8
    rtl
}

{ ;B0CD - B101
    ;unused
    stz $07
.B0CF:
    brk #$00

;----- B0D1

    jsl get_object_slot
    bmi .B0FF

    !X16
    lda $07 : asl : tay
    !A8
    lda.w _00C2BB,Y      : sta.w !obj_pos_x+1,X
    lda.w _00C2BB_C2C5,Y : sta.w !obj_pos_y+1,X
    !A8
    lda #$0C : sta.w !obj_active,X
    lda #!id_belial : sta.w !obj_type,X
    !X8
    inc $07
    cmp #$05 ;don't think this works correctly!
    bne .B0CF

.B0FF:
    jmp _0281A8_81B5
}

{ ;B102 - B12D
_02B102:
    ;unused, called by other unused code
    lda $2E
    bne .B11A

    clc
    lda $2D  : adc !obj_pos_y+0 : sta !obj_pos_y+0
    lda $31  : adc !obj_pos_y+1 : sta !obj_pos_y+1
    lda #$00 : adc !obj_pos_y+2 : sta !obj_pos_y+2
    rtl

.B11A:
    sec
    lda !obj_pos_y+0 : sbc $2D  : sta !obj_pos_y+0
    lda !obj_pos_y+1 : sbc $31  : sta !obj_pos_y+1
    lda !obj_pos_y+2 : sbc #$00 : sta !obj_pos_y+2
    rtl
}

{ ;B12E - B38D
belial:

.thing:
    !AX8
    lda $2F
    beq .B16A

    lda !obj_speed_x+1
    bne .B14C

    lda !obj_speed_x+0
    sec
    cmp #$78
    bcs .B14C

    stz $32
    lda !obj_speed_x+0
    sec
    cmp #$2D
    bcs .B150

    stz $33
    bra .B154

.B14C:
    lda #$01 : sta $32
.B150:
    lda #$01 : sta $33
.B154:
    !AX16
    ldy $30
    ldx $2D
    jsl set_spawn_offset_8C8A
    lda $32 : sta $003C,X
    lda $38 : sta $0012,X
    !AX8
.B16A:
    jmp _02FD62_FD7C

;-----

.create:
    lda #$90 : sta $09
    lda $08 : and #$F8 : ora #$00 : sta $08
    stz $2F
    stz $32
    jsl get_object_slot
    bpl .B186

    jmp _0281A8_81B5

.B186:
    !X16
    lda #$0C : sta.w !obj_active,X
    lda #!id_belial_flame : sta.w !obj_type,X
    stx $2D
    !X8
    inc $2F
    lda #$48 : sta $1D : sta $30
    stz $31
    ldy #$C2 : ldx #$21 : jsl set_sprite
    lda #$01 : sta !obj_facing
    !A16
    lda #belial_data_C2D3 : sta $13
    !A8
    lda #$0A : sta !obj_speed_x+0
    lda #$01 : sta $35
    stz $3D
    stz $15
    stz $33
    stz $34
    stz $36
    stz $37
    stz $3A
    stz !obj_speed_x+1
    stz !obj_speed_x+2
    jsl _01A593
.B1D3:
    brk #$00

;----- B1D5

    lda !obj_pos_y+1 : sta $38
    jsl _01A593
    lda $33
    beq .B1E5

    jsl update_animation_normal
.B1E5:
    jsr _02FB9C_FBC0
    lda $38
    cmp !obj_pos_y+1
    beq .B1D3

    lda #$02 : sta $34
    stz $38
    lda $0011
    beq .B1FD

    lda #$01 : sta $38
.B1FD:
    !A8
    lda #$01 : sta $33
    lda #!sfx_impact : jsl _018049_8053
.B209:
    brk #$00

;----- B20B

    lda $34
    beq .B22C

    dec
    beq .B243

    clc
    lda !obj_speed_x+0 : adc $35  : sta !obj_speed_x+0
    lda !obj_speed_x+1 : adc #$00 : sta !obj_speed_x+1
    sec
    sbc #$02
    bcc .B277

    stz !obj_speed_x+0
    lda #$02 : sta !obj_speed_x+1
    bra .B277

.B22C:
    sec
    lda !obj_speed_x+0 : sbc $35  : sta !obj_speed_x+0
    lda !obj_speed_x+1 : sbc #$00 : sta !obj_speed_x+1
    bcs .B277

    stz $33
    stz !obj_speed_x
    stz !obj_speed_x+1
    bra .B277

.B243:
    lda $35
    cmp #$14
    bcc .B24E

    sec
    lda #$0F : sta $35
.B24E:
    inc $35 : inc $35
    sec
    lda !obj_speed_x+0 : sbc $35  : sta !obj_speed_x+0
    lda !obj_speed_x+1 : sbc #$00 : sta !obj_speed_x+1
    bcs .B277

    lda !obj_speed_x+0 : eor #$FF : sta !obj_speed_x+0
    lda !obj_speed_x+1 : eor #$FF : sta !obj_speed_x+1
    lda $38 : eor #$01 : sta $38
    lda #$02 : sta $34
.B277:
    lda $38
    bne .B290

    clc
    lda !obj_pos_x+0 : adc !obj_speed_x+0 : sta !obj_pos_x+0
    lda !obj_pos_x+1 : adc !obj_speed_x+1 : sta !obj_pos_x+1
    lda !obj_pos_x+2 : adc #$00           : sta !obj_pos_x+2
    bra .B2A3

.B290:
    sec
    lda !obj_pos_x+0 : sbc !obj_speed_x+0 : sta !obj_pos_x+0
    lda !obj_pos_x+1 : sbc !obj_speed_x+1 : sta !obj_pos_x+1
    lda !obj_pos_x+2 : sbc #$00           : sta !obj_pos_x+2
.B2A3:
    jsl _01A593
    beq .B2BA

    jsr .B2F9
    lda $33
    beq .B2B4

    jsl update_animation_normal
.B2B4:
    jsr _02FB9C_FBC0
    jmp .B209

.B2BA:
    lda #$0A : sta !obj_speed_y+0
    lda #$01 : sta !obj_speed_y+1
    stz !obj_speed_y+2
    lda #$38 : sta !obj_gravity
    lda $38 : sta !obj_direction
.B2CC:
    brk #$00

;----- B2CE

    jsl update_pos_xyg_add
    jsl _01A559
    beq .B2DB

    jmp .B209

.B2DB:
    jsr _0281A8
    jsr _02FB9C_FBC0
    lda $09
    and #$40
    bne .B2CC

    !X16
    ldy $2D : jsr remove_child_object
    !X8
    lda #$F1 : jsl _018049_8053 ;todo: stop sound...?
    jmp _0281A8_81B5

;-----

.B2F9:
    !A8
    stx $39
    jsr .B36A
    lda $39
    and #$30
    cmp #$30
    beq .B321

    lda $0011
    bne .B331

    lda $3A
    cmp #$01
    beq .B343

    ldy #$C4 : ldx #$21 : jsl set_sprite
    lda #$01 : sta $3A
    bra .B343

.B321:
    lda $3A
    beq .B343

    ldy #$C2 : ldx #$21 : jsl set_sprite
    stz $3A
    bra .B343

.B331:
    lda $3A
    cmp #$02
    beq .B343

    ldy #$C0 : ldx #$21 : jsl set_sprite
    lda #$02 : sta $3A
.B343:
    lda $39
    and #$70
    cmp #$70
    beq .B367

    lda $0011
    bne .B359

    lda $38
    beq .B362

    lda #$02 : sta $34
    rts

.B359:
    lda $38
    bne .B362

    lda #$02 : sta $34
    rts

.B362:
    lda #$01 : sta $34
    rts

.B367:
    stz $34
    rts

;-----

.B36A:
    lda $0011
    beq .B375

    lda #$01 : sta !obj_direction
    bra .B377

.B375:
    stz !obj_direction
.B377:
    txa
    and #$70
    cmp #$70
    bne .B383

    lda #$02 : sta $35
    rts

.B383:
    lsr #4
    tax
    lda.w belial_data_slope_speed,X
    sta $35
    rts
}

{ ;B38E - B3A9
belial_flame:

.create:
    lda #$01 : sta $08
    lda #$10 : sta $09
    ldy #$C6 : ldx #$21 : jsl set_sprite
.B39E:
    brk #$00

;----- B3A0

    jsl set_sprite_84A7
    jsl update_animation_normal
    bra .B39E
}

{ ;B3AA - B3D8
splash:

.create:
    !AX8
    lda $07 : ldy #$D0 : ldx #$21 : jsl set_sprite_8480
    !A16
    lda $009F : sta !obj_pos_y+1
    !A8
    lda #$10 : sta $2D
.B3C3:
    brk #$00

;----- B3C5

    !A16
    lda $009F : sta !obj_pos_y+1
    !A8
    jsl update_animation_normal
    dec $2D
    bne .B3C3

    jmp _0281A8_81B5
}

{ ;B3D9 - B4EF
_02B3D9:
    ;unused

.create:
    !AX8
    ldx #$02 : jsl _018D5B
    lda #$90 : ora $09 : sta $09
    lda #$01 : sta $08
    ldy #$D6 : ldx #$21 : jsl set_sprite
    ldy #$18 : jsl set_speed_x
    !A16
    lda.w _00ED00+$06 : sta $27 ;wolf? must have been something else at some point
    !A8
    lda #$FF : sta $26
    stz !obj_direction
    jsl set_hp
.B40C:
    brk #$00

;----- B40E

    lda $0F
    beq .B40C

    ldx #$20 : jsl _0196EF : cop #$00

;----- B41A

    lda #$02 : sta $08
    ldy #$D8 : ldx #$21 : jsl set_sprite
    lda #$02 : sta $31 : sta $2D
    stz $34
    lda !obj_pos_x+1 : sec : sbc !arthur_pos_x+1 : sta $32
    lda #$18
    sec
    sbc $32
    bcs .B441

    lda #$01 : sta $34
.B441:
    !A16
    lda !arthur_pos_y+1
    cmp !obj_pos_y+1
    !A8
    bcs .B467

.B44C:
    brk #$00

;----- B44E

    lda #$01 : sta $2E
    jsl _02B102
    jsl update_pos_x
    !A16
    lda !arthur_pos_y+1
    cmp !obj_pos_y+1
    !A8
    bcc .B44C

    bra .B47E

.B467:
    brk #$00

;----- B469

    stz $2E
    jsl _02B102
    jsl update_pos_x
    !A16
    lda !arthur_pos_y+1
    cmp !obj_pos_y+1
    !A8
    bcs .B467

.B47E:
    lda #$01 : sta $31
    lda #$52 : sta $2D
    lda #$08 : sta $2F
.B48A:
    brk #$00

;----- B48C

    lda $2F
    cmp #$10
    beq .B496

    inc $2F
    bra .B4A4

.B496:
    lda $2E
    beq .B49E

    stz $2E
    bra .B4A2

.B49E:
    lda #$01 : sta $2E
.B4A2:
    stz $2F
.B4A4:
    jsl _02B102
    jsl update_pos_x
    lda $09
    and #$40
    bne .B48A

    jmp _0281A8_81B5

.thing:
    lda $0F
    bne .B4CD

    jsl get_arthur_relative_side : sta !obj_direction
    eor #$FF                     : sta !obj_facing
    ldy #$06 : jsl arthur_range_check
    bcs .B4CD

    inc $0F
.B4CD:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda.w current_cage
    bne .B4E3

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jmp _02FD62_FD7C

.B4E3:
    rts

.destroy:
    lda #$3B : jsl _018049_8053
    jmp _028BEC

;-----

    jmp _0281A8_81B5 ;may or may not belong to above object
}

{ ;B4F0 - B66C
bars:

.create:
    !A16
    lda !obj_pos_x+1 : sta $2D
    lda !obj_pos_y+1 : sta $2F
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
    stz !obj_direction
    stz !obj_facing
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

    lda.b #_01DD01    : sta !arthur_state+1
    lda.b #_01DD01>>8 : sta !arthur_state+2
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
    dec !obj_pos_x+1 : dec !obj_pos_x+1
    !A8
    bra .B581

.B579:
    !A16
    inc !obj_pos_x+1 : inc !obj_pos_x+1
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
    lda !slot_arthur+$09  : and #$CF : ora #$20 : sta !slot_arthur+$09
    lda !slot_upgrade+$09 : and #$CF : ora #$20 : sta !slot_upgrade+$09
    lda !slot_shield+$09  : and #$CF : ora #$20 : sta !slot_shield+$09
    lda.b #coord_offsets_arthur_cage    : sta !slot_arthur+$13
    lda.b #coord_offsets_arthur_cage>>8 : sta !slot_arthur+$14
    !A16
    lda $2D : sta !obj_pos_x+1
    !A8
    clc
    lda #$2C : adc !obj_pos_y+1 : sta !obj_pos_y+1
.B5CD:
    brk #$00

;----- B5CF

    dec !obj_pos_y+1 : dec !obj_pos_y+1
    inc $32
    lda $32
    cmp #!obj_pos_x
    bne .B5CD

    jmp .B52A

;-----

.B5DE:
    stz $32
.B5E0:
    brk #$00

;----- B5E2

    inc !obj_pos_y+1 : inc !obj_pos_y+1
    inc $32
    lda $32
    cmp #$18
    bne .B5E0

    stz.w current_cage
    lda !slot_arthur+$09  : and #$CF : ora #$10 : sta !slot_arthur+$09
    lda !slot_upgrade+$09 : and #$CF : ora #$10 : sta !slot_upgrade+$09
    lda !slot_shield+$09  : and #$CF : ora #$10 : sta !slot_shield+$09
    lda.b #coord_offsets_arthur    : sta !slot_arthur+$13
    lda.b #coord_offsets_arthur>>8 : sta !slot_arthur+$14
    stz $32
    !A16
    lda $2F : sta !obj_pos_y+1
    !A8
    lda $36
    and #$01
    beq .B637

    !A16
    clc
    lda !obj_pos_x+1 : adc #$0010 : sta !obj_pos_x+1
    !A8
    bra .B643

.B637:
    !A16
    sec
    lda !obj_pos_x+1 : sbc #$0010 : sta !obj_pos_x+1
    !A8
.B643:
    brk #$00

;----- B645

    inc $32
    lda $36
    and #$01
    bne .B657

    !A16
    inc !obj_pos_x+1 : inc !obj_pos_x+1
    !A8
    bra .B65F

.B657:
    !A16
    dec !obj_pos_x+1 : dec !obj_pos_x+1
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

{ ;B66D - B6B9
chest2:

.create:
    !AX8
    lda $09 : ora #$04 : sta $09
    !A16
    lda $1F : sta $39
    lda $22 : sta $3B
    !A8
    stz $31
    lda #$70 : sta $1D
.B687
    brk #$00

;----- B689

    jsr _0281A8
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .B687

.B691:
    inc $31
    lda.w chest_counter : sta $37
    inc.w chest_counter
    lda $07
    !AX16
    and #$00FF
    asl #2
    tax
    lda.w chest_offset_chest2,X : clc : adc !obj_pos_x+1 : sta !obj_pos_x+1
    inx #2
    lda.w chest_offset_chest2,X : clc : adc !obj_pos_y+1 : sta !obj_pos_y+1
    jmp chest_B704
}

{ ;B6BA - B82C
chest: ;a8 x8

.create:
    !AX8
    lda $09 : ora #$04 : sta $09
    !A16
    lda !obj_pos_x+1 : sta $39
    lda !obj_pos_y   : sta $3B
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
    adc !obj_pos_x+1
    sta !obj_pos_x+1
    inx #2
    lda.w chest_offset,X
    clc
    adc !obj_pos_y+1
    sta !obj_pos_y+1
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

.thing:
    lda #$03
    jsr _02FE1E_local
    jsr _02FA37_FA6D
    jsr _02FB62_FB69
    jsr _028144
    rts

;-----

.destroy:
    lda !obj_hp
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
    bra .B72A

.B75B:
    ldy #$5A : ldx #$20 : jsl set_sprite
    jsl _02F9DA_F9E0
    bra .B72A

.B769:
    brk #$00

;----- B76B

    ldy #$5C : ldx #$20 : jsl set_sprite
.B773:
    brk #$00

;----- B775

    jsl update_animation_normal
    lda !obj_anim_timer
    cmp #$7A
    bne .B773

    lda $08 : and #$F7 : sta $08
    lda #$FF : sta $07
    lda !slot_shield
    beq .B796

    lda !slot_shield+$07
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
    sta !obj_type
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

{ ;B82D - B930
magician:

.create:
    !AX8
    lda #$84 : ora $09 : sta $09
    ldy #$9E : ldx #$20 : jsl set_sprite
    !A16
    dec !obj_pos_y+1 : dec !obj_pos_y+1 : dec !obj_pos_y+1
    lda.w _00ED00+$0C : sta $27
    lda #$0100 : sta $29
    !A8
    stz $33
    stz $34
    jsl set_hp
    jsl get_arthur_relative_side : sta !obj_facing
    lda #$FF : sta $26
    lda #$00 : sta $1D
    lda $08 : and #$F8 : ora #$10 : ora #$02 : sta $08
.B871:
    brk #$00

;----- B873

    inc $34
    lda $34
    cmp #$20
    bne .B871

    lda $08 : and #$EF : sta $08
    lda #$01 : sta $33
    stz $34
.B887:
    brk #$00

;----- B889

    inc $34
    lda $34
    cmp #$20
    bne .B887

    lda $08 : ora #$10 : sta $08
    stz $33
    stz $34
.B89B:
    brk #$00

;----- B89D

    inc $34
    lda $34
    cmp #$18
    bne .B89B

    jmp _0281A8_81B5

;-----

.thing:
    lda $24
    cmp #$0E
    beq .B8B0

    bra .B8B6

.B8B0:
    lda #!id_magician_orb : jsl prepare_object
.B8B6:
    jsl get_arthur_relative_side : sta !obj_facing
    jsl update_animation_normal
    jsl _018E32_8E73
    lda $33
    beq .B8D1

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
.B8D1:
    rts

;-----

.destroy:
    !AX8
    lda $08 : and #$08 : ora #$12 : sta $08
    lda #$04 : sta $2D
    lda #$66 : sta $1D
.B8E4:
    lda #!id_small_explosion : jsl prepare_object
    lda #$0A : cop #$00

;----- B8EE

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053 ;explosion sfx
    dec $2D
    bne .B8E4

    lda $08 : and #$F7 : sta $08
    lda #$04 : sta $2D
    lda #$66 : sta $1D
.B90D:
    lda #!id_small_explosion : jsl prepare_object
    lda #$0A : cop #$00

;----- B917

    lda $1D : clc : adc #$02 : sta $1D
    lda #$3B : jsl _018049_8053 ;explosion sfx
    dec $2D
    bne .B90D

    ldy #$0F : jsl update_score
    jmp _0281A8_81B5
}

{ ;B931 - B951
small_explosion:

.create:
    ldy #$76 : ldx #$20 : jsl set_sprite
    lda $08 : and #$F8 : ora #$01 : sta $08
    lda #$14 : sta $2D
.B945:
    brk #$00

;----- B947

    jsl update_animation_normal
    dec $2D
    bne .B945

    jmp _0281A8_81B5
}

{ ;B952 - BA35
magician_orb:

.create:
    !AX8
    lda #$29 : jsl _018049_8053 ;"laser" sfx
    ldy #$F2 : ldx #$20 : jsl set_sprite
    lda #$FF : sta $26
    lda $09 : ora #$84 : sta $09
    stz $33
    lda $08 : and #$F8 : ora #$01 : sta $08
    jsl _01918E_set_direction16 : sta !obj_direction
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
    stz $02B0
    lda !slot_shield
    beq .B9A3

    stz !slot_shield
    lda !slot_shield+!obj_type : sta $02B0
    lda !slot_shield+$07 : sta $02B1
.B9A3:
    lda !armor_state
    sta.w transform_stored_armor_state
    asl
    tax
    jsr (.B9E8,X) : sta !armor_state
    lda #$7E : sta.w transform_timer
    lda #$01 : sta.w transform_timer+1
    lda #!sfx_transform : jsl _018049_8053
    ldy #$5C : ldx #$20 : jsl set_sprite
    lda #$10 : sta $32
.B9CD:
    brk #$00

;----- B9CF

    !A16
    lda !arthur_pos_x+1 : sta !obj_pos_x+1
    lda !arthur_pos_y+1 : sta !obj_pos_y+1
    !A8
    jsl update_animation_normal
    dec $32
    bne .B9CD

    jmp _0281A8_81B5

;-----

.B9E8: dw .underwear, .steel, .bronze, .bronze, .gold

;-----

.underwear:
    lda.b #arthur_baby    : sta !arthur_state+1
    lda.b #arthur_baby>>8 : sta !arthur_state+2
    lda #!baby
    rts

;-----

.steel:
    lda.b #arthur_seal    : sta !arthur_state+1
    lda.b #arthur_seal>>8 : sta !arthur_state+2
    lda #!seal
    rts

;-----

.bronze:
    lda.b #arthur_bee    : sta !arthur_state+1
    lda.b #arthur_bee>>8 : sta !arthur_state+2
    lda #!bee
    rts

;-----

.gold:
    lda.b #arthur_maiden    : sta !arthur_state+1
    lda.b #arthur_maiden>>8 : sta !arthur_state+2
    lda #!maiden
    rts

;-----

.thing:
    ldy #$18 : jsr _02FF22
    jsl update_animation_normal
    ldx #$0A : jsl update_pos_xy_2
    rts
}

{ ;BA36 - BB9B
armor:

.create:
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
    lda #!id_face : sta $3C ;loads face again later anyway
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
    dec !obj_pos_y+1 : dec !obj_pos_y+1 : dec !obj_pos_y+1
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
    lda !obj_pos_y+1
    sec
    sbc #$0002
    sta !obj_pos_y+1
    !A8
    bra .BAEE

.BAE2:
    !A16
    lda !obj_pos_y+1
    clc
    adc #$0002
    sta !obj_pos_y+1
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

    lda !arthur_hp
    bmi .BAC8

    lda $3A : jsl _018049_8053
    ldx !armor_state
    lda.w _00C2A4,X
    bmi .BB76

    sta.w transform_stored_armor_state
    sta !armor_state
    ldx #$01 : stx !arthur_hp
    dec
    bne .BB2D

    stz !slot_shield
    lda #$1E : sta !slot_shield+!obj_type
    jmp _0281A8_81B5

.BB2D:
    ldx.b #_01D9FA    : stx !arthur_state+1
    ldx.b #_01D9FA>>8 : stx !arthur_state+2
    lda !armor_state
    cmp #$04
    bne .BB4E

    lda #$0C : sta !slot_shield
    lda #!id_shield : sta !slot_shield+!obj_type
    lda #!id_plume : sta $3C
    bra .BB52

.BB4E:
    lda #!id_face : sta $3C
.BB52:
    stz $10F6
    stz $10F7
    ldx $3C : stx !slot_upgrade+!obj_type
    ldx #$0C : stx !slot_upgrade
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
    lda #$01 : sta !arthur_hp
    lda.w _00C2A4_C2B2,X : sta.w transform_stored_armor_state

.BB90:
    jmp _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts
}

{ ;BB9C - BDBE
weapon:

.BB9C:
    db $00, $00, $00, $00, $00, $00, $01, $01, $02, $00

.create:
    lda $07
    cmp #$FE
    beq .BBCE

    lda.w loop
    beq .BBD2

    lda.w weapon_current
    cmp #!weapon_bracelet
    bcs .BBD2

    lda !armor_state
    cmp #!gold
    bcc .BBD2

    jsr _0280E9
    lda #!id_bracelet_item : sta !obj_type
    lda #$0C : sta !obj_active
    jml _02821B_827A

.BBCE:
    lda #$FF : sta $07
.BBD2:
    ldx.w stage
    lda.l weapon_BB9C,X
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
    lda !obj_pos_y+1
    sec
    sbc #$0002
    sta !obj_pos_y+1
    !A8
    bra .BD57

.BD4B:
    !A16
    lda !obj_pos_y+1
    clc
    adc #$0002
    sta !obj_pos_y+1
    !A8
.BD57:
    inc $33
.BD59:
    jsr _028176
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .BD31

    lda.w current_cage
    bne .BD31

    lda !armor_state
    cmp #!baby ;do nothing if transformed. todo: add define "transformed" (5) for these kinds of checks?
    bcs .BD31

    lda $14E3
    bne .BD31

    lda !arthur_hp
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
    lda !armor_state
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

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts
}

{ ;BDBF - BED2
pickup_shield:

.create:
    lda !slot_shield+!obj_active
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
    lda !obj_pos_y+1 : sec : sbc #$0002 : sta !obj_pos_y+1
    bra .BE1A

.BE10:
    !A16
    lda !obj_pos_y+1 : clc : adc #$0002 : sta !obj_pos_y+1
.BE1A:
    !A8
    inc $33
.BE1E:
    jsr _0281A8
    lda.w jump_counter
    bne .BDF8

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .BDF8

    lda !armor_state
    cmp #$05
    bcs .BDF8

    lda $14E3
    bne .BDF8

    lda !arthur_hp
    bmi .BDF8

    lda #$2E : jsl _018049_8053
    lda !slot_shield+!obj_active
    bne .BE8F

    lda !armor_state
    bne .BE5A

    lda #$01 : sta !arthur_hp
    inc !armor_state
    inc.w transform_stored_armor_state
    jmp _0281A8_81B5

.BE5A:
    dec
    bne .BE8F

    ldx.b #_01D9FA    : stx !arthur_state+1
    ldx.b #_01D9FA>>8 : stx !arthur_state+2
    stz !slot_upgrade+$08
    stz !slot_upgrade+$09
    ldx #!id_face : stx !slot_upgrade+!obj_type
    ldx #$0C : stx !slot_upgrade+!obj_active
    lda.w weapon_current : ora #$01 : sta.w weapon_current
    lda #$01 : sta !arthur_hp
    lda #$03 : sta !armor_state : sta.w transform_stored_armor_state
    jmp _0281A8_81B5

.BE8F:
    ldx !armor_state
    lda.w _00C2A4,X
    bmi .BEC1

    lda #$01 : sta !arthur_hp
    lda !slot_shield+!obj_active
    beq .BEA8

    lda #$01 : sta !slot_shield+$07
    bra .BEAB

.BEA8:
    stz !slot_shield+$07
.BEAB:
    lda #$0C : sta !slot_shield+!obj_active
    lda #$1E : sta !slot_shield+!obj_type
    stz !slot_shield+$08
    stz !slot_shield+$09
    stz !slot_shield+$0F
    jmp _0281A8_81B5

.BEC1: ;not sure this is reachable? picking up shield while transformed...?
    lda.w _00C2A4_C2B2,X : sta.w transform_stored_armor_state ;todo
    jmp _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts
}

{ ;BED3 - BF24
trap:

.create:
    !AX8 ;unnecessary
    ldy #$4A : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+$1E : sta $27 ;todo
    lda #$00BC : sta $29
    !A8
    lda $08 : and #$F8 : ora #$02 : sta $08
    lda $09 : ora #$04 : sta $09
    lda #$FF : sta $26
    lda #$04 : clc : adc !obj_pos_y+1 : sta !obj_pos_y+1
.BF04:
    brk #$00

;----- BF06

    jsl update_animation_normal
    jsl _018E32_8E73
    jsr _02FD62_FD7C
    lda $24
    cmp #$7E
    bne .BF04

.BF17:
    brk #$00

;----- BF19

    jsr _0281A8
    jsl _018E32_8E73
    jsr _02FD62_FD7C
    bra .BF17
}

{ ;BF25 - C061
bracelet_item:

.create:
    ldx.w stage
    lda.l weapon_BB9C,X
    tax
    jsl _018D5B
    !A16
    lda !obj_pos_x+1 : sta $31
    lda !obj_pos_y+1 : sta $33
    lda !obj_pos_y+1 : sec : sbc #$0008 : sta !obj_pos_y+1
    lda.w #_00C2D7 : sta $13
    !A8
    ldy #$22 : ldx #$20 : jsl set_sprite
    inc $1FAB
    !A16
    lda.w _00ED00+$1A : sta $27
    !A8
    lda #$FF : sta $26
    lda $09 : ora #$94 : sta $09
    lda $08 : and #$F8 : sta $08
    lda #!id_bracelet_item_sparkle : jsl prepare_object
    lda #$C6 : sta $1D
    lda #$0A : sta $2F
    lda #$05 : sta $2D
    lda #$BF : sta $37
.BF84:
    brk #$00

;----- BF86

    jsr .C040
    dec $37
    lda $37
    and #$03
    bne .BF84

    !A16
    lda $31 : sta !obj_pos_x+1
    lda $33 : sta !obj_pos_y+1
    !A8
    lda #$2D
    jsl update_pos_xy_2
    lda !obj_direction : inc : and #$0F : sta !obj_direction
    lda $37
    bne .BF84

    !A16
    lda $31 : sta !obj_pos_x+1
    lda $33 : clc : adc #$0008 : sta !obj_pos_y+1
    !A8
    ldy #$E6 : ldx #$20 : jsl set_sprite
    stz $37
.BFC8:
    brk #$00

;----- BFCA

    lda $37
    cmp #$10
    bcs .BFF0

    cmp #$08
    bcs .BFE2

    !A16
    lda !obj_pos_y+1 : sec : sbc #$0002 : sta !obj_pos_y+1
    !A8
    bra .BFEE

.BFE2:
    !A16
    lda !obj_pos_y+1 : clc : adc #$0002 : sta !obj_pos_y+1
    !A8
.BFEE:
    inc $37
.BFF0:
    jsr _028176
    lda $14E3
    bne .BFC8

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .BFC8

    lda.w current_cage
    bne .BFC8

    lda !arthur_hp
    bpl .C00A

    jmp .BFC8

.C00A:
    lda #$F1 : jsl _018049_8053
    lda #$30 : jsl _018049_8053
    brk #$00

;----- C018

    lda #$0E : sta.w weapon_current
    lda !armor_state
    cmp #$02
    bcc .C027

    inc.w weapon_current
.C027:
    dec $1FAB
    bne .C034

    lda.w weapon_current : and #$0E : sta $02B3
.C034:
    jmp _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts

;-----

.C040:
    dec $2F
    bne .C061

    lda #!id_bracelet_item_sparkle : jsl prepare_object
    lda $1D : clc : adc #$02 : sta $1D
    lda #$0A : sta $2F
    dec $2D
    bne .C061

    lda #$C6 : sta $1D
    lda #$05 : sta $2D
.C061:
    rts
}

{ ;C062 - C097
bracelet_item_sparkle:

.create:
    ldy #$38 : ldx #$20 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    !A16
if !version == 0 || !version == 1
    lda.w _00ED00+$0C : sta $27
    lda #$0100 : sta $29
elseif !version == 2
    lda.w _00ED00+$6A : sta $27
    lda #$011D : sta $29
endif
    !A8
    lda #$FF : sta $26
    lda #$10 : sta $35
.C086:
    brk #$00

;----- C088

    dec $35
    bne .C086

    jmp _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts
}

{ ;C098 - C146
rosebud_chunk:

.create:
    lda.w stage
    bne .C09F

    inc $08
.C09F:
    lda #$10 : sta $09
    lda $07 : asl : tax
    jmp (+,X) : +: dw .C0AE, .C0E9

;-----

.C0AE: ;explosion sprites, i guess
    ldx !obj_direction
    lda.w rosebud_chunk_data_explosion_timer,X : cop #$00

;----- C0B5

    lda !obj_direction
    cmp #$04
    beq .C0C6

    asl
    sta !obj_direction
    lda #$0C : ldx #$30 : jsl _0189D9
.C0C6:
    jsl _02F9DA
    lda #$19 : sta $3C
    ldy #$D0 : ldx #$21 : jsl set_sprite
    jsr rosebud_C3FB
.C0D9:
    brk #$00

;----- C0DB

    lda $1EB8
    bne .C0E6

    lda $24
    cmp #$70
    bne .C0D9

.C0E6:
    jmp _0281A8_81B5

;-----

.C0E9:
    jsl _02F9DA
    ldy #$D2 : ldx #$21 : jsl set_sprite
    jsr rosebud_C3FB
    lda #$C0 : sta $3B
.C0FC:
    brk #$00

;----- C0FE

    ldx #$2C : jsl update_pos_xy_2
    dec $3B
    bne .C0FC

    lda #$10 : ora $08 : sta $08
    lda #$40 : sta $3B
.C112:
    brk #$00

;----- C114

    ldx #$2C : jsl update_pos_xy_2
    dec $3B
    bne .C112

    jmp _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    lda $07
    bne .C139

    lda $25
    bne .C138

    ldy #$22 : jsr _02FF22
    jsr _02FA37_FA65
    jmp _02FD62_FD6A

.C138:
    rts

.C139:
    ldy #$02 : jsr _02FF22
    jsr _02FA37_FA65
    jsr _02FD62_FD7C
    jmp _028074_8087
}

{ ;C147 - C40C
rosebud:

.create:
    ldx.w stage
    bne .C150

    lda #$01 : sta $08
.C150:
    lda #$10 : sta $09
    stz $3C
    !A16
    lda $1F : sta $33
    lda $22 : sta $35
    lda #rosebud_data_C765 : sta $13
    !A8
    lda #$04 : sta $38
    lda #$40 : sta $37
    lda #$01 : sta !obj_facing
    jsl set_hp
    stz $39
    ldy #$CA : ldx #$21 : jsl set_sprite
    jsr .C3FB
    ldy #$12 : jsl set_speed_x
.C18A:
    brk #$00

;----- C18C

    bit $09
    bvs .C197

    jsr _028053_local
    bcs .C1A5

    bra .C18A

.C197:
    brk #$00

;----- C199

    jsl update_animation_normal
    jsr _028074
    lda $1EB7
    beq .C1A8

.C1A5:
    jmp _0281A8_81B5

.C1A8:
    ldy #$12 : jsl arthur_range_check_x
    bcs .C197

    lda $1AF8 ;todo: rosebuds active. obj type array? or standalone
    ldx.w difficulty
    cmp.w rosebud_data_max_active,X
    bcs .C197

    inc $1AF8
    ldy #$CC : ldx #$21 : jsl set_sprite
.C1C6:
    lda #!sfx_rosebud_grow : jsl _018049_8053
    jsl _02F9DA_F9E0
    lda $07 : sta $31
    cmp #$02
    bcs .C21D

.C1D8:
    brk #$00

;----- C1DA

    jsr .C298
    jsl update_animation_normal
    lda $3C
    cmp #$02
    bne .C1D8

    ldy #$CE : ldx #$21 : jsl set_sprite
    inc $39
    stz $3A
.C1F3:
    brk #$00

;----- C1F5

    jsl update_animation_normal
    bit $09
    bvc .C21A

    dec $3A
    bne .C1F3

    inc $39
    lda #$3C : sta $3A
.C207:
    brk #$00

;----- C209

    lda #$FC : jsl update_animation_custom_timer
    bit $09
    bvc .C21A

    dec $3A
    bne .C207

    jsr .C275
.C21A:
    jmp .C30B

.C21D:
    !A16
    lda #rosebud_data_C785 : sta $13
    !A8
.C226:
    brk #$00

;----- C228

    jsr .C298
    jsl update_animation_normal
    lda $3C
    cmp #$03
    bne .C226

    lda #$03 : sta $39
    stz $3A
.C23B:
    brk #$00

;----- C23D

    jsl update_animation_normal
    dec $3A
    bne .C23B

    inc $39
    ldy #$D4 : ldx #$21 : jsl set_sprite
    lda #$3C : sta $3A
.C253:
    brk #$00

;----- C255

    jsl update_animation_normal
    dec $3A
    bne .C253

    jsr .C275
    inc $07
    stz !obj_facing
.C264:
    lda #!id_rosebud_chunk : jsl prepare_object
    inc !obj_facing
    lda !obj_facing
    cmp #$08
    bne .C264

    jmp .C30B

;-----

.C275:
    stz $08
    lda #$10 : sta $09
    stz $07
    lda #$04 : sta $1D
    stz !obj_facing
    lda #!sfx_rosebud_explode : jsl _018049_8053
.C289:
    lda #!id_rosebud_chunk : jsl prepare_object
    inc !obj_facing
    lda !obj_facing
    cmp #$05
    bne .C289

    rts

;-----

.C298:
    lda $24
    cmp #$71
    bne .C2A4

    inc $3C
    lda #$01 : sta $24
.C2A4:
    rts

;-----

.destroy:
    lda !obj_hp
    beq .C2E3

    lda $39
    bne .C2B4

    lda #$1E : cop #$00 ;gets here if shot while still expanding

;----- C2B1

    jmp .C1C6

.C2B4:
    jsl _02F9DA_F9E0
    lda #$02 : sta $32
.C2BC:
    lda #$03 : sta $3B
.C2C0:
    brk #$00

;----- C2C2

    jsl update_pos_x
    dec $3B
    bne .C2C0

    lda !obj_direction : eor #$01 : sta !obj_direction
    dec $32
    bne .C2BC

    lda $39
    asl
    tax
    jmp (.C2DB-2,X) : .C2DB: dw .C1F3, .C207, .C23B, .C253

.C2E3:
    ldy #$17 : jsl update_score
    lda #!sfx_death : jsl _018049_8053
    lda !obj_direction : sta !obj_facing
    stz $29
    stz $2A
    ldy #$78 : ldx #$20 : jsl set_sprite
.C2FF:
    brk #$00

;----- C301

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .C2FF

.C30B:
    dec $1AF8
    lda.w stage
    beq .C316

    jmp _0281A8_81B5

.C316:
    jsr .C3FB
    lda #$10 : sta $09
    stz $08
    lda.w difficulty : asl : tax
    !A16
    lda.w rosebud_data_regrowth_timer,X : sta $3B
    !A8
.C32D:
    brk #$00

;----- C32F

    jsr _028074
    !A16
    dec $3B
    !A8
    bne .C32D

    !A16
    lda $33 : sta $1F
    lda $35 : sta $22
    !A8
    ldy #$CC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$10 : sta $08
    lda #$3C : sta $3B
.C358:
    brk #$00

;----- C35A

    jsr _028074
    dec $3B
    bne .C358

    lda $08 : and #$EF : sta $08
    lda $31 : sta $07
    jmp .create

;-----

.thing:
    lda $1EB7
    bne .C383

    bit $09
    bvc .C383

    jsr .C389
    jsr _02FB62
    jsr _02FAA1
    jmp _02FD62_FD6A

.C383:
    dec $1AF8
    jmp _0281BB

;-----

.C389:
    lda $07
    and #$01
    bne .C3A6

    lda $39
    beq .C3A6

    ldx $0F
    jmp (+,X) : +: dw .C39E, .C3A7, .C3C7

;-----

.C39E:
    dec $37
    bne .C3A6

    lda #$02 : sta $0F
.C3A6:
    rts

;-----

.C3A7:
    lda #$04 : sta $0F
    lda $38 : jsl _019662 : sta !obj_direction
    tax
    ldy #$3C
    and #$01
    beq .C3BC

    ldy #$54
.C3BC:
    sty $37
    lda.w rosebud_data_C7A5,X
    clc
    adc $38
    sta $38
    rts

;-----

.C3C7:
    !A16
    lda !obj_pos_x+1 : sta $2D
    lda !obj_pos_y+1 : sta $2F
    !A8
    ldx #$2E : jsl update_pos_xy_2
    lda !obj_direction : asl #2 : tay
    jsl _01A4E2
    bcc .C3F0

    !A16
    lda $2D : sta !obj_pos_x+1
    lda $2F : sta !obj_pos_y+1
    !A8
.C3F0:
    dec $37
    bne .C3FA

    stz $0F
    lda #$20 : sta $37
.C3FA:
    rts

;-----

.C3FB:
    !A16
    lda #$0120
    ldx.w stage
    beq .C408

    lda #$0190
.C408:
    sta $29
    !A8
    rts
}

{ ;C40D - C435
    ;unused
    ldy #$A4 : ldx #$21 : jsl set_sprite
    lda #$0B : sta $3B
    jsl call_rng : and #$0F : sta !obj_direction
    lda #$10 : ldx #$10 : jsl _0189D9
.C429:
    brk #$00

;----- C42B

    jsl update_animation_normal
    dec $3B
    bne .C429

    jmp _0281A8_81B5
}

{ ;C436 - C40C
gate:

.create:
    lda $02D5 : and #$0F : sta $02D5
    lda #$20 : sta $09
    lda #$FF : sta $19EC
    lda #$48 : jsl _018049_8053
    ldx #$00
    !X16
    ldy.w _00ED00+$48 ;stage 1 gate
    lda.w stage
    beq .C45F

    ldx #$0006
    ldy.w _00ED00+$52 ;stage 4c gate, not sure if anything else gets here
.C45F:
    !A16
    lda.w gate_data_C7BA+0,X : sta !obj_pos_x+1
    lda.w gate_data_C7BA+2,X : sta !obj_pos_y+1
    lda.w gate_data_C7BA+4,X : sta $13
    sty $27
    lda #$0100 : sta $29
    stz $33
    !AX8
    lda #$80 : sta $02E6
    lda #$08 : sta $02E7
    lda #$02 : sta $02E8
    jsr .C4EC
    ldy #$1A : ldx #$22
    lda.w stage
    beq .C49A

    ldy #$BE : ldx #$21
.C49A:
    jsl set_sprite
    ldy #$12 : jsl set_speed_y
    ldx #$00
    lda.w stage
    beq .C4AD

    ldx #$04
.C4AD:
    !AX16
    lda.w gate_data_C7B2+0,X
    ldy.w gate_data_C7B2+2,X
    tax
    lda #$0010
.C4B9:
    pha
    lda $7EF400,X
    phx
    tyx
    sta $7EF400,X
    plx
    inx #2
    iny #2
    pla
    dec
    bne .C4B9

    !AX8
    inc $0331
    lda #$00 : jsl _018E32_8E81
    lda #$78 : sta $2D
.C4DC:
    brk #$00

;----- C4DE

    jsl update_pos_y
    dec $2D
    bne .C4DC

    inc $1F9F
    jmp _0281A8_81B5

;-----

.C4EC:
    !X16
    ldx $13 : stx !A1T7L
    !X8
    lda #$00
    stz !A1B7
    lda #$04 : sta !DMAP7
    lda #$26 : sta !BBAD7
    lda $02F0 : ora #$80 : sta $02F0
    rts
}

{ ;C50D - C5A6
plume:

.C50D:
    stz !obj_active
    jml _02821B_827A

.create:
    brk #$00

;----- C515

    ldy #$C6 : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+$20 : sta $27
    lda #$0010 : sta $29
    !A8
    lda #$FF : sta $2D : sta $26
    jsl _01CCAF
.C535:
    lda !armor_state
    cmp #!gold
    bne .C50D

    lda !slot_arthur+$25
.C53F:
    tay
    lda.w plume_data_C7F8,Y
    bpl .C55D

    and #$0F
    clc
    adc #$1B
    ldx.w jump_counter
    beq .C555

    ldx !arthur_speed_y+2
    bmi .C555

    inc
.C555:
    pha
    jsl update_animation_normal
    pla
    bra .C53F

.C55D:
    sta $3C
    lda $08
    and #$F8
    ora.w plume_data_C81D,Y
    ldx.w current_cage
    beq .C56F

    ora #$04
    ldx #$01
.C56F:
    sta $08
    tya
    asl #2
    tay
    lda !arthur_facing : sta !obj_facing
    !A16
    bne .C587

    clc
    lda !arthur_pos_x+1
    adc.w plume_data_C842+0,Y
    bra .C58E

.C587:
    sec
    lda !arthur_pos_x+1
    sbc.w plume_data_C842+0,Y
.C58E:
    sta !obj_pos_x+1
    clc : lda !arthur_pos_y+1 : adc.w plume_data_C842+2,Y : sta !obj_pos_y+1
    !A8
    jsl set_sprite_84A7
    jsl _018E32_8E73
    brk #$00

;----- C5A5

    bra .C535
}

{ ;C5A7 - C6FB
black_cover:

.create:
    ldx #$00
    ldy #$01
    lda $07
    beq .C5B2

    ldx #$09
    iny
.C5B2:
    sty !obj_direction
    !A16
    lda.w black_cover_data+0,X
    sta !obj_speed_y+1
    sec
    sbc #$0004
    sta $2D
    lda.w black_cover_data+2,X
    sta !obj_pos_y
    clc
    adc #$0008
    sta $2F
    ldy.w black_cover_data+4,X : sty $31
    lda.w black_cover_data+5,X : sta !obj_speed_x
    lda.w black_cover_data+7,X : sta !obj_pos_x+1
    phd
    pla
    clc
    adc #$0033
    sta !obj_speed_x+2
    !A8
    stz $02E6
    lda #$02 : sta $02E7
    stz $02E8
    lda #$48 : sta $33
    stz $34
    stz $35
    lda #$01 : sta $39
    stz $3A
    stz $3B
    stz $3C
    stz !obj_facing
.C604:
    brk #$00

;----- C606

    jsr .C69E
    !A16
    lda !obj_pos_x+1
    cmp.w screen_boundary_left
    !A8
    bcs .C61E

    lda $07
    beq .C61B

    stz $02E7
.C61B:
    jmp _0281A8_81B5

.C61E:
    lda.w current_cage
    cmp !obj_direction
    beq .C627

    bra .C604

.C627:
    !A16
    sec
    lda !obj_speed_y+1
    sbc !arthur_pos_x+1
    bcs .C635

    adc !obj_pos_y
    bcs .C63C

.C635:
    clc
    adc !arthur_pos_x+1
    sta !arthur_pos_x+1
.C63C:
    !A8
    sec
    lda $31
    sbc !arthur_pos_y+1
    bcc .C656

    clc
    adc !arthur_pos_y+1
    sta !arthur_pos_y+1
    stz !arthur_speed_y+0
    stz !arthur_speed_y+1
    stz !arthur_speed_y+2
.C656:
    !X16
    ldy #!slot_weapons
    lda #$0A
.C65D:
    pha
    lda.w !obj_active,Y
    beq .C68B

    lda.w !obj_type,Y
    !A16
    lda $2D
    sbc.w !obj_pos_x+1,Y
    bcs .C673

    adc $2F
    bcs .C67C

.C673:
    !A8
    phy
    jsr _02810D_local
    ply
    bra .C68B

.C67C:
    !A8
    sec
    lda $31
    sbc.w !obj_pos_y+1,Y
    bcc .C68B

    phy
    jsr _02810D_local
    ply
.C68B:
    !A16
    clc
    tya
    adc #!obj_size
    tay
    !A8
    pla
    dec
    bne .C65D

    !X8
    jmp .C604

;-----

.C69E:
    !A16
    sec
    lda !obj_speed_x
    sbc.w camera_x+1
    cmp #$00FF
    bcc .C6B0

    bpl .C6EB

    lda #$0000
.C6B0:
    tax
    sec
    lda !obj_pos_x+1
    sbc.w camera_x+1
    bcc .C6EB

    cmp #$00FF
    !A8
    bcc .C6C2

    lda #$FF
.C6C2:
    ldy #$50
    sty $36
    stx $37
    sta $38
    !X16
    ldx !obj_speed_x+2 : stx !A1T2L
    !X8
    stz !A1B2
    lda #$01 : sta !DMAP2
    lda #$26 : sta !BBAD2
    lda $02F0 : ora #$04 : sta $02F0
    sta !obj_facing
    rts

.C6EB:
    !A8
    lda !obj_facing
    beq .C6FB

    lda $02F0 : and #$FB : sta $02F0
    stz !obj_facing
.C6FB:
    rts
}

{ ;C6FC - CA4F
raft:

.C6FC:
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

.create:
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
    beq .C6FC

    jmp .C8AE

.C741:
    jsl _02F9DA_F9E0
.C745:
    brk #$00

;----- C747

    jsr .CA00
    jsr .C96C
    jsr .C90B
    lda $2D
    beq .C745

    jmp .C7FB

.C757:
    lda.w checkpoint
    beq .C777

    inc $006D
    !A16
    lda $009F : sta !obj_pos_y+1
    !A8
    jsr .C96C
    inc $1F98 ;todo: bowgun magic bool? reuse?
    jsr .C9E7
    jsl _02F9DA_F9E0
    bra .C7E4

.C777:
    brk #$00

;----- C779

    jsr .C96C
    lda $2D
    beq .C777

    lda #$01 : sta.w checkpoint
    inc $1AD4
    ldy #$1C : jsl set_speed_xyg
    inc $006D
    jsr .CA05
.C794:
    brk #$00

;----- C796

    jsr .CA05
    jsr .C96C
    jsl update_pos_xyg_add
    jsr .C9E7
    !A16
    lda #$0600
    cmp !obj_speed_y
    bcs .C7AE

    sta !obj_speed_y
.C7AE:
    lda $009F
    cmp !obj_pos_y+1
    !A8
    bcs .C794

    !A16
    sta !obj_pos_y+1
    !A8
    lda #$04 : sta $1D
    lda #!id_splash : jsl prepare_object
    inc $1F98
    jsr .C9E7
    jsl _02F9DA_F9E0
    lda #$0C : sta $3B
.C7D5:
    brk #$00

;----- C7D7

    jsr .CA05
    jsr .C96C
    jsr .C90B
    dec $3B
    bne .C7D5

.C7E4:
    brk #$00

;----- C7E6

    jsr .CA05
    jsr .C96C
    jsr .C90B
    lda $2D
    beq .C7E4

    lda #$02 : sta $19EB : sta $19EC
.C7FB:
    brk #$00

;----- C7FD

    jsr .C9BB
    jsr .C96C
    jsr .CA41
    jsr .C90B
    !A16
    lda !obj_pos_x+1
    cmp $2F
    !A8
    bcc .C7FB

    stz !obj_direction
    !A16
    lda !obj_pos_x+1 : sta !obj_speed_x+1
    lda !obj_pos_y+1 : sta !obj_speed_y+1
    !A8
    lda #$14 : sta $35
    ldx #$1C : jsl _0189D9
    jsr .CA05
    !AX16
    lda !obj_pos_x+1
    ldx !obj_speed_x+1 : stx !obj_pos_x+1
    sta !obj_speed_x+1
    lda !obj_pos_y+1
    ldx !obj_speed_y+1 : stx !obj_pos_y+1
    sta !obj_speed_y+1
    !AX8
    jsr .C9E7
    lda #$1F : sta !obj_direction
    lda #$05 : sta $36
.C84D:
    lda $36 : sta $3B
.C851:
    brk #$00

;----- C853

    !A16
    lda $009F : sta !obj_speed_y+1
    !A8
    jsr .CA00
    jsr .C96C
    jsr .CA41
    lda $35 : ldx #$1C : jsl _018B25
    jsr .C9E7
    dec $3B
    bne .C851

    lda !obj_direction
    inc
    and #$3F
    sta !obj_direction
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
    lda !obj_pos_x+1 : sta $31
    !A8
.C8BE:
    brk #$00

;----- C8C0

    jsr .C96C
    jsr .C90B
    lda $2D
    beq .C8BE

.C8CA:
    brk #$00

;----- C8CC

    jsr .C9BB
    !A16
    lda $31
    cmp !obj_pos_x+1
    bcc .C8DD

    beq .C8DD

    sta !obj_pos_x+1
    bra .C8E6

.C8DD:
    lda $2F
    cmp !obj_pos_x+1
    bcs .C8F9

    inc
    sta !obj_pos_x+1
.C8E6:
    !A8
    jsr .CA00
    jsr _028074
    jsr .C96C
    jsr .CA41
    jsr .C90E
    bra .C8CA

.C8F9:
    !A8
    jsr .C96C
    jsr .CA41
    jsr .C90B
    bra .C8CA

;-----

.thing:
    jsl update_animation_normal
    rts

;-----

.C90B:
    jsr .C927
.C90E:
    !A16
    lda $009F : sec : sbc #$0001 : sta !obj_pos_y+1
    ldx $2D
    beq .C924

    sec
    sbc #$0018
    sta !arthur_pos_y+1
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

    lda #$40 : clc : adc.w camera_x        : sta !arthur_pos_x+0
    lda #$00 :       adc   !arthur_pos_x+1 : sta !arthur_pos_x+1
    lda #$00 :       adc   !arthur_pos_x+2 : sta !arthur_pos_x+2
    !A16
    lda !arthur_pos_x+1
    cmp #$15B0
    !A8
    bcs .C96B

    lda #$40 : clc : adc.w camera_x     : sta !obj_pos_x+0
    lda #$00       : adc   !obj_pos_x+1 : sta !obj_pos_x+1
    lda #$00       : adc   !obj_pos_x+2 : sta !obj_pos_x+2
.C96B:
    rts

;-----

.C96C:
    !AX16
    lda !obj_pos_x+1
    clc
    adc #$0015
    sec
    sbc !arthur_pos_x+1
    cmp #$002C
    bcs .C9B6

    lda !arthur_pos_y+1
    clc
    adc #$0018
    sec
    sbc !obj_pos_y+1
    cmp #$0010
    bcs .C9B6

    eor #$FFFF
    inc
    adc !arthur_pos_y+1
    sta !arthur_pos_y+1
    !AX8
    lda #$80 : sta $14C3
    !A16
    lda !arthur_pos_x+1 : sec : sbc !obj_pos_x+1 : sta $37
    lda !arthur_pos_y+1 : sec : sbc !obj_pos_y+1 : sta $39
    !A8
    lda #$FF : sta $2D
    rts

.C9B6:
    !AX8
    stz $2D
    rts

;-----

.C9BB:
    stz $2E
    !A16
    lda !obj_pos_x+1
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
    adc !obj_pos_x+1
    sta !obj_pos_x+1
    !A8
    inc $2E
.C9E4:
    !A8
    rts

;-----

.C9E7:
    lda $2D
    beq .C9FF

    !A16
    clc
    lda $37 : adc !obj_pos_x+1 : sta !arthur_pos_x+1
    clc
    lda $39 : adc !obj_pos_y+1 : sta !arthur_pos_y+1
    !A8
.C9FF:
    rts

;-----

.CA00:
    lda.w jump_counter
    bne .CA3E

.CA05:
    !AX16
    lda !obj_pos_x+1
    clc
    adc #$0015
    sec
    sbc !arthur_pos_x+1
    cmp #$002B
    bcs .CA3C

    lda !obj_pos_x+1
    clc
    adc #$000A
    sec
    sbc !arthur_pos_x+1
    sec
    sbc #$0015
    bcc .CA3C

    beq .CA3C

    bpl .CA2E

    clc
    adc #$0015
.CA2E:
    clc
    adc !arthur_pos_x+1
    sta !arthur_pos_x+1
    !AX8
    lda #$01 : sta $2E
    rts

.CA3C:
    !AX8
.CA3E:
    stz $2E
    rts

;-----

.CA41:
    lda $2D
    beq .CA4F

    stz $14D5
    lda $2E
    beq .CA4F

    inc $14D5
.CA4F:
    rts
}

{ ;CA50 - CB64
skulls:

.create:
    lda $07
    cmp #$05
    bcc .CA5B

    jmp .CB35

.CA59:
    brk #$00

;----- CA5B

.CA5B:
    ldx $07
    lda $00A1 ;stage section/event counter?
    cmp.w skulls_data_C910,X
    bcc .CA59

    lda #$05 : sta $08 : sta $07
    lda #$10 : sta $09
    ldy #$AA : ldx #$21 : jsl set_sprite
    !A16
    lda $1F : sta $17
    lda $22 : sta $1A
    !A8
.CA83:
    brk #$00

;----- CA85

    jsr _0281A8
    ldy #$10 : jsl arthur_range_check
    bcs .CA83

    jsl get_rng_16
    lda.w skulls_data_cooldown1,X
    ldx.w difficulty
    clc
    adc.w skulls_data_cooldown1_difficulty,X
    sta $3B
.CAA0:
    brk #$00

;----- CAA2

    jsr .CB18
    dec $3B
    bne .CAA0

    ldx #$68 : jsl _0196EF
    sta $2D
    jsr .CB29
    lda #$10 : sta $3B
.CAB8:
    brk #$00

;----- CABA

    jsr .CB18
    dec $3B
    bne .CAB8

    jsl call_rng
    and #$01
    sta $2E
    clc
    adc $2D
    tax
    lda.w skulls_data_C913,X
    jsr .CB29
    lda #$10 : sta $3B
.CAD7:
    brk #$00

;----- CAD9

    jsr .CB18
    dec $3B
    bne .CAD7

    lda $2E
    inc
    and #$01
    clc
    adc $2D
    tax
    lda.w skulls_data_C913,X
    jsr .CB29
    lda #$10 : sta $3B
.CAF3:
    brk #$00

;----- CAF5

    jsr .CB18
    dec $3B
    bne .CAF3

    jsl get_rng_16
    lda.w skulls_data_cooldown2,X
    ldx.w difficulty
    clc
    adc.w skulls_data_cooldown2_difficulty,X
    cop #$00

;----- CB0C

    jmp .CA83

;-----

.CB0F: ;moving platform calls this for shaking
    jsr .CB18
    rtl

;-----

.CB13: ;a8 x8
    ;used by money bag
    lda.w stage1_earthquake_active
    beq .CB28

.CB18:
    jsl call_rng
    and #$07
    sta !obj_direction
    lda #$01 : ldx #$30 : jsl _018B25
.CB28:
    rts

;-----

.CB29:
    asl
    adc #$12
    sta $1D
    lda #!id_skulls : jsl prepare_object
    rts

;-----

.CB35:
    ldy #$AC : ldx #$21 : jsl set_sprite
    ldy #$1E : jsl set_speed_xyg
    jsl _02F9DA
    lda #!sfx_skulls : jsl _018049_8053
.CB4D:
    brk #$00

;----- CB4F

    jsl update_pos_xyg_add
    bra .CB4D

;-----

.thing:
    jsl update_animation_normal
    jsr _02FB9C_FBC0
    jsr _02FA37_FA65
    jsr _02FD62_FD7C
    jmp _028074_8087
}

{ ;CB65 - CCE6
money_bag: ;a8 x8

.create:
    lda $07
    cmp #$06
    bcs .CB71

    ldy #$48 : ldx #$20
    bra .CB75

.CB71:
    ldy #$52 : ldx #$21
.CB75:
    jsl set_sprite
    jsl _03B114
    !A16
    lda !obj_pos_x+1 : sta !obj_speed_x+1
    lda !obj_pos_y+1 : sta !obj_speed_y+1
    !A8
    ldx $07
    jmp (+,X) : +: dw .CBA4, .CB9E, .CC0D, .CBA4, .CB9E, .CC0D, .CC32, .CC68

;-----

.CB9E:
    lda $09 : ora #$10 : sta $09
.CBA4:
    brk #$00

;----- CBA6

    jsr skulls_CB13
    jsr _0281A8 ;remove money bag if too far left
    lda.w current_cage
    bne .CBA4

    lda !arthur_hp
    bmi .CBA4

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .CBA4

.CBBB:
    lda #$20 : sta $08
    stz $09
    lda $07
    cmp #$06
    bcs .CBD3

    ldy #$27 : jsl update_score
    ldy #$34 : ldx #$20
    bra .CBDD

.CBD3:
    ldy #$4F : jsl update_score
    ldy #$72 : ldx #$20
.CBDD:
    jsl set_sprite
    lda #$30 : jsl _018049_8053 ;pickup sfx
    sed
    lda.w money_bag_count
    clc
    adc #$01
    cld
    ldx.w difficulty
    cmp.w money_bag_req_for_continue,X
    bcc .CC03

    lda.w continues
    cmp #$09
    bcs +

    inc.w continues
+:
    lda #$00
.CC03:
    sta.w money_bag_count
    lda #$60 : cop #$00

;----- CC0A

    jmp _0281A8_81B5

;-----

.CC0D: ;money bag in second layer
    lda $08 : ora #$05 : sta $08
    lda $09 : ora #$20 : sta $09
.CC19:
    brk #$00

;----- CC1B

    jsr skulls_CB13
    jsr _0281A8
    lda.w current_cage
    beq .CC19

    lda !arthur_hp
    bmi .CC19

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .CC19

    bra .CBBB

;-----

.CC32: ;special "money bag" that triggers the vortex sfx in 2-2
    stz $08
    stz $09
.CC36:
    brk #$00

;----- CC38

    lda.w camera_y+2
    cmp #$02
    bne .CC36

    !A16
    lda.w camera_x+1
    cmp #$0900
    !A8
    bcc .CC36

    lda #!sfx_vortex : jsl _018049_8053
.CC51:
    brk #$00

;----- CC53

    !A16
    lda.w camera_x+1
    cmp #$0B00
    !A8
    bcc .CC51

    lda #$3C : jsl _018049_8053
    jmp _0281A8_81B5

;-----

.CC68: ;special "money bag" that triggers the lightning in 2-2
    lda #$03 : sta $08
    lda #$30 : sta $09
    stz $18
.CC72:
    ldy #$D8 : ldx #$21 : jsl set_sprite
    lda #$18 : jsl _019662 : sta !obj_speed_x+1
    lda #$19 : jsl _019662 : sta !obj_speed_y+1
.CC8A:
    brk #$00

;----- CC8C

    !A16
    lda.w camera_x+1 : clc : adc !obj_speed_x+1 : sta !obj_pos_x+1
    !A8
    lda.w camera_y+1 : clc : adc !obj_speed_y+1 : sta !obj_pos_y+1
    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .CC8A

    stz $08
    stz $09
    lda #!sfx_lightning : jsl _018049_8053
    lda #$03 : sta $0332 ;white screen
    inc $0331
    lda #$04 : cop #$00

;----- CCC0

    lda #$00 : sta $0332
    inc $0331
    lda #$1A : jsl _019662 : sta $3B
.CCD0:
    lda #$02 : cop #$00

;----- CCD4

    dec $3B
    bne .CCD0

    !A16
    lda.w camera_x+1
    cmp #$1380
    !A8
    bcc .CC72

    jmp _0281A8_81B5
}

{ ;CCE7 - CDD5
arthur_map: ;a8 x8

.CCE7: ;game over
    lda $1FB5
    bne .CCFD

.CCEC:
    lda #!id_game_over_text_flames : jsl prepare_object
    inc $07
    lda $07
    cmp #$10
    bne .CCEC

    jmp _0281A8_81B5

.CCFD:
    lda #$04
.CCFF:
    sta $2D
    tay
    !AX16
    lda.w _00C919+0,Y : ldx #$0394 : jsr .CD4A
    lda.w _00C919+2,Y : ldx #$0414 : jsr .CD4A
    !AX8
    inc $0323
.CD1B:
    brk #$00

;----- CD1D

    lda.w p1_button_press+1
    bit #!start
    bne .CD37

    bit #!down|!up|!select
    beq .CD1B

    lda #$37 : jsl _018049_8053
    lda $2D
    clc
    adc #$04
    and #$07
    bra .CCFF

.CD37:
    lda $2D : sta $1FB3
    beq .CD44

    lda #$63 : jsl _018049_8053
.CD44:
    inc $1FB4
    jmp _0281A8_81B5

;-----

.CD4A:
    sta $7F9000,X
    cmp #$2045
    beq .CD54

    inc
.CD54:
    inx #2
    sta $7F9000,X
    rts

;-----

.CD5B: ;time over
    ldy #$02 : ldx #$20 : jsl set_sprite
    stz $14D2
.CD66:
    brk #$00
    bra .CD66

.CD6A: ;"to be continued..." unused
    ldy #$04 : ldx #$20 : jsl set_sprite
    stz $0290
    stz $14D2
    bra .CD66

;-----

.create:
    lda $07
    bne .CD8C

    ;reached from game over, time over. anything else...?
    lda $14D2
    asl
    tax
    jmp (+, X) : +: dw .CCE7, .CD5B, .CD6A

;-----

.CD8C:
    lda #$01 : sta !OBSEL
    lda.w stage
    asl
    adc.w checkpoint
    asl #2
    tax
    !A16
    lda.w arthur_map_offsets+0,X : sta !obj_pos_x+1
    lda.w arthur_map_offsets+2,X : sta !obj_pos_y+1
    !A8
    ldy #$06 : ldx #$20 : jsl set_sprite
.CDB1:
    brk #$00

;----- CDB3

    jsl update_animation_normal
    clc
    lda.w camera_x+0 : adc #$00 : sta.w camera_x+0
    lda.w camera_x+1 : adc #$01 : sta.w camera_x+1
    lda.w camera_x+2 : adc #$00 : sta.w camera_x+2
    jsl _01B90E
    bra .CDB1
}

{ ;CDD6 - CEB3
pier:

.create:
    lda #$03 : sta $08
    ldy #$DA : ldx #$21 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    lda #$30 : sta $10
    lda !obj_pos_y+0 : sta $2D
    lda !obj_pos_y+1 : sta $2E
    lda !obj_pos_y+2 : sta $2F
    clc
    lda $2D : adc $1EAA : sta !obj_pos_y+0
    lda $2E : adc $1EAB : sta !obj_pos_y+1
    lda $2F : adc $1EAC : sta !obj_pos_y+2
.CE0E:
    brk #$00

;----- CE10

    clc
    lda $2D : adc $1EAA : sta !obj_pos_y+0
    lda $2E : adc $1EAB : sta !obj_pos_y+1
    lda $2F : adc $1EAC : sta !obj_pos_y+2
    lda !arthur_pos_x+1
    cmp #$A0
    bcc .CE0E

    lda #$50 : sta !obj_speed_y+0
    stz !obj_speed_y+1
    stz !obj_speed_y+2
    lda #$7F : sta $33
    lda #$08 : sta $34
    lda #$1E : sta $1D
.CE41:
    lda #$7C : jsl prepare_object
    lda $1D : clc : adc #$02 : sta $1D
    dec $34
    bne .CE41

.CE52:
    brk #$00

;----- CE54

    !A16
    dec !obj_pos_x+1
    !A8
    jsl update_pos_y
    brk #$00

;----- CE60

    !A16
    inc !obj_pos_x+1
    !A8
    jsl update_pos_y
    brk #$00

;----- CE6C

    !A16
    inc !obj_pos_x+1
    !A8
    jsl update_pos_y
    brk #$00

;----- CE78

    !A16
    dec !obj_pos_x+1
    !A8
    jsl update_pos_y
    dec $33
    bne .CE52

    jmp _0281A8_81B5

;-----

.thing:
    lda.w jump_counter
    beq .CE94

    lda !arthur_speed_y+2
    bpl .CE94

    rts

.CE94:
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .CEB3

    lda !arthur_pos_x+1
    cmp #$A0
    bcs .CEB3

    stz !arthur_speed_y+2
    !A16
    lda !obj_pos_y+1 : sec : sbc #$002A : sta !arthur_pos_y+1
    !A8
    inc $14C3
.CEB3:
    rts
}

{ ;CEB4 - CF15
pier_splinter:

.create:
    ldx #$7A : jsl _0196EF : sta $2D
    lda #$50 : sta !obj_speed_y
    stz !obj_speed_y+1
    stz !obj_speed_y+2
.CEC4:
    brk #$00

;----- CEC6

    jsl update_pos_y
    dec $2D
    bne .CEC4

    ldx #$7C : jsl _0196EF : asl : tax
    jmp (+,X) : +: dw .CEE1, .CEEB, .CEF5, .CEF5 ;last offset is unused

;-----

.CEE1:
    ldy #$DC : ldx #$21 : jsl set_sprite
    bra .CEFD

.CEEB:
    ldy #$DE : ldx #$21 : jsl set_sprite
    bra .CEFD

.CEF5:
    ldy #$E0 : ldx #$21 : jsl set_sprite
.CEFD:
    ldy #$1D : jsl set_speed_xyg
.CF03:
    brk #$00

;----- CF05

    jsl update_animation_normal
    jsl update_pos_xyg_add
    lda $09
    and #$40
    bne .CF03

    jmp _0281A8_81B5
}

{ ;CF16 - D1DE
raft_pulley:

.create:
    lda #$01 : sta $08
    ldy #$A0 : ldx #$21 : jsl set_sprite
    stz $2D
    stz $2E
    stz $2F
    stz $30
    stz $31
    stz $32
    stz $33
    stz $34
    stz $35
    stz $36
    stz $37
    stz $38
    stz $39
    stz $3A
    lda #$20 : sta $3B
    stz $3C
    jsl get_object_slot
    bpl .CF4D

    jmp _0281A8_81B5

.CF4D:
    !X16
    lda #$0C : sta.w !obj_active,X
    lda #!id_raft_hanging : sta.w !obj_type,X
    stx $2D
    ldy #$0002 : jsl set_spawn_offset_8C8A
    !X8
    lda #$05 : sta !obj_speed_x
    lda #$02 : sta !obj_speed_y
    !A16
    stz !obj_speed_x+1
    stz !obj_speed_y+1
    lda.w _00ED00+$18 : sta $27
    lda #$0120 : sta $29
    !A8
    lda !obj_pos_y+1 : clc : adc #$10 : sta !obj_pos_y+1
    stz $0F
    lda $09 : ora #$80 : sta $09
.CF8D:
    brk #$00

;----- CF8F

    jsr _0281A8
    lda $20
    cmp #$08
    bcc .CF8D

    !X16
    ldy $2D : jsr remove_child_object
    !X8
    jmp _0281A8_81B5

;-----

.thing:
    !AX8
    jsr _0281A8
    lda $0F : asl : tax
    jmp (+,X) : +: dw .CFBA, .CFFB, .D0EC, .D0FF, .D1B9

;-----

.CFBA:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda.w jump_counter
    beq .CFF6

    lda !arthur_speed_y+2
    bmi .CFF6

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .CFF6

    lda #$3D : jsl _018049_8053
    inc $0F
    stz $30
    inc $14C3
    lda !obj_pos_y+1 : sec : sbc #$10 : sta !arthur_pos_y+1
    lda !obj_pos_x : sta !arthur_pos_x
    lda !obj_pos_y : sta !arthur_pos_y
    lda #$20 : sta $3B
    stz $3A
.CFF6:
    lda #$FF : sta $26
    rts

;-----

.CFFB:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda.w jump_counter
    beq .D026

    lda !arthur_speed_y+2
    bpl .D026

    !A16
    lda !obj_pos_x+1
    and #$07FF
    cmp #$0540
    bcc .D01F

    !A8
    inc $30
    bra .D02E

.D01F:
    !A8
    stz $30
    jmp .D0CE

.D026:
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .D02E

    inc $14C3
.D02E:
    inc $39
    lda $3A
    beq .D04B

    cmp #$01
    beq .D045

    cmp #$02
    beq .D040

    lda $39
    bra .D050

.D040:
    lda $39
    lsr
    bra .D050

.D045:
    lda $39
    lsr #2
    bra .D050

.D04B:
    lda $39
    lsr #3
.D050:
    and #$03
    sta $25
    lda !obj_speed_x+1
    cmp #$04
    beq .D06C

    !A16
    lda #$0005 : adc !obj_speed_x : sta !obj_speed_x
    lda #$0002 : adc !obj_speed_y : sta !obj_speed_y
    !A8
.D06C:
    lda $3B
    beq .D074

    dec $3B
    bra .D07A

.D074:
    lda #$20 : sta $3B
    inc $3A
.D07A:
    !A16
    lda !obj_pos_x+1
    cmp #$0738
    bcc .D086

    jmp .D1AB

.D086:
    !A8
    stz !obj_direction
    jsl update_pos_xy
    lda $30
    bne .D0BB

    clc
    lda !arthur_pos_x+0 : adc !obj_speed_x+0 : sta !arthur_pos_x+0
    lda !arthur_pos_x+1 : adc !obj_speed_x+1 : sta !arthur_pos_x+1
    lda !arthur_pos_x+2 : adc #$00           : sta !arthur_pos_x+2
    lda !obj_pos_y : sta !arthur_pos_y
    !A16
    lda !obj_pos_y+1 : sec : sbc #$0010 : sta !arthur_pos_y+1
.D0BB:
    !AX16
    ldx $2D : ldy #$0002 : jsl set_spawn_offset_8C8A
    !AX8
    jsr arthur_overlap_check_FED8_8bit_local
    bcs .D0CE

    rts

.D0CE:
    lda $30
    beq .D0D3
    rts

.D0D3:
    !A16
    stz !obj_speed_x
    stz !obj_speed_y
    !A8
    stz !obj_speed_x+2
    stz !obj_speed_y+2
    inc $0F
    lda #$18 : sta $3C
    lda #$F1 : jsl _018049_8053
    rts

;-----

.D0EC:
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    dec $3C
    bne .D0FE

    inc $0F
.D0FE:
    rts

;-----

.D0FF:
    !A16
    sec
    lda !obj_pos_x+1
    cmp #$0464
    bcs .D10C

    jmp .D198

.D10C:
    !A8
    lda.w jump_counter
    beq .D159

    lda !arthur_speed_y+2
    bmi .D159

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .D159

    lda #$3D : jsl _018049_8053
    lda #$01 : sta $0F
    inc $14C3
    lda !obj_pos_y+1 : sec : sbc #$10 : sta !arthur_pos_y+1
    lda !obj_pos_x : sta !arthur_pos_x
    lda !obj_pos_y : sta !arthur_pos_y
    stz !obj_speed_x+0
    stz !obj_speed_y+0
    stz !obj_speed_x+1
    stz !obj_speed_y+1
    stz !obj_speed_x+2
    stz !obj_speed_y+2
    stz $30
    lda #$20 : sta $3B
    stz $3A
    jsl update_animation_normal
    jsl _018E32_8E73
    rts

.D159:
    lda $39
    inc
    sta $39
    lsr #2
    eor #$FF
    and #$03
    sta $25
    !A16
    lda #$0050 : sta !obj_speed_x
    lda #$0020 : sta !obj_speed_y
    !A8
    lda #$01 : sta !obj_direction
    ldy #$03 : jsl set_speed_y
    jsl update_pos_xy
    !AX16
    ldx $2D : ldy #$0002 : jsl set_spawn_offset_8C8A
    !AX8
    jsl update_animation_normal
    jsl _018E32_8E73
    rts

.D198:
    !A16
    stz !obj_speed_x
    stz !obj_speed_y
    !A8
    stz !obj_speed_x+2
    stz !obj_speed_y+2
    jsl update_animation_normal
    stz $0F
    rts

;-----

.D1AB:
    !A8
    lda #$80 : sta !obj_gravity
    stz !obj_direction
    clc
    lda #$04 : sta $0F
    rts

;-----

.D1B9:
    jsl update_pos_xyg_add
    !AX16
    ldx $2D : ldy #$0002 : jsl set_spawn_offset_8C8A
    !AX8
    jsl update_animation_normal
    jsl _018E32_8E73
    lda #$F1 : jsl _018049_8053
    lda $09
    and #$40
    bne .D1DE ;does nothing

.D1DE:
    rts
}

{ ;D1DF - D1FD
raft_hanging:

.create:
    lda #$02 : sta $08
    lda #$10 : sta $09
    ldy #$A2 : ldx #$21 : jsl set_sprite
    lda !obj_pos_y+1 : clc : adc #$10 : sta !obj_pos_y+1
.D1F6:
    brk #$00

;----- D1F8

    jsl update_animation_normal
    bra .D1F6
}

{ ;D1FE - D323
shell:

.create:
    lda #$01 : sta $08
    lda #$90 : sta $09
    stz $2D
    stz $2E
    stz $2F
    stz $30
    stz $31
    stz $32
    stz $33
    !A16
    lda.w #_00C971 : sta $13
    !A8
    stz $15
    jsl set_hp
.D223:
    ldy #$46 : ldx #$22 : jsl set_sprite ;idle
    ldx #$26 : jsl _0196EF : sta $34
.D233:
    brk #$00

;----- D235

    jsl _01A593
    bne .D25D

    jmp .D305 ;remove shell if it didn't land on solid ground

    ;unused code start
    dec $34
    bne .D233

    ldy #$48 : ldx #$22 : jsl set_sprite
    lda #$A0 : sta $32
.D24E:
    brk #$00

;----- D250

    jsl _01A593
    bne .D259
    ;unused code end

.D256:
    jmp .D305

.D259:
    ;unused code start
    dec $32
    bne .D24E
    ;unused code end

.D25D:
    lda $2D
    beq .D267

    stz $2D
    ldy #$1A
    bra .D26B

.D267:
    inc $2D
    ldy #$1B
.D26B:
    jsl set_speed_xyg
    lda #$68 : sta $32
.D273:
    brk #$00

;----- D275

    jsl _01A593
    beq .D256

    dec $32
    bne .D273

    ldy #$4A : ldx #$22 : jsl set_sprite ;jump, before shooting pearl
    inc $2E
.D289:
    brk #$00

;----- D28B

    jsl update_pos_xyg_add
    jsl _01A559
    bne .D2F1

    lda $30
    bne .D2D9

    ldy #$00 : jsl arthur_range_check_y
    bcs .D2D9

.D2A1:
    inc $33
    ldy #$4C : ldx #$22 : jsl set_sprite ;shooting pearl
    lda #$10 : sta $31
.D2AF:
    brk #$00

;----- D2B1

    jsl update_pos_xyg_add
    jsl _01A559
    bne .D2F1

    lda $25
    cmp #$01
    bne .D2D1

    cmp $3C
    beq .D2D1

    lda #$72 : sta $1D
    lda #!id_shell_pearl : jsl prepare_object
    inc $30
.D2D1:
    lda $25 : sta $3C
    dec $31
    bne .D2AF

.D2D9:
    lda $2F
    bne .D2E9

    lda !obj_speed_y+2
    bmi .D2E9

    lda $33
    bne .D2E9

    inc $2F
    bra .D2A1

.D2E9:
    lda $09
    and #$40
    beq .D305

    bra .D289

.D2F1:
    stz $2E
    stz $2F
    stz $30
    stz $33
    jmp .D223

;-----

.destroy:
    lda #!sfx_death : jsl _018049_8053
    jmp _028BEC

;-----

.D305:
    jmp _0281A8_81B5

;-----

.thing:
    jsl get_arthur_relative_side : sta !obj_facing
    jsl update_animation_normal
    lda $2E
    beq .D31E

    jsr _02FA37_FA6D
    jsr _02FB62_FB69
    bra .D321

.D31E:
    jsr _02FB9C_FBC0
.D321:
    jmp _02FD62_FD7C
}

{ ;D324 - D378
shell_pearl:

.create:
    lda #$00 : sta $08
    lda #$80 : sta $09
    ldy #$15 : jsl set_speed_x
    ldy #$4E : ldx #$22 : jsl set_sprite
    jsl get_arthur_relative_side : sta !obj_direction : sta !obj_facing
    lda #$C0 : sta $33
    lda #$F8 : sta $34
.D34A:
    brk #$00

;----- D34C

    jsl update_pos_x
    lda $09
    and #$40
    beq .D376

    dec $34
    beq .D376

    dec $33
    bne .D34A

    lda $08 : ora #$10 : sta $08
    bra .D34A

;-----

.thing:
    jsl update_animation_normal
    ldy #$04 : jsr _02FF22
    jsr _02FA37_FA65
    jml _02FD62_FD7C

;-----

.D376:
    jmp _0281A8_81B5
}

{ ;D379 - D42D
flying_killer:

.create:
    jsr pot_creation_local
    lda #$80 : sta $09
    ldy #$B0 : ldx #$21 : jsl set_sprite
    stz $30
    jsl set_hp
    jsl get_arthur_relative_side : sta !obj_direction : sta !obj_facing
    ldx #$28 : jsl _0196EF : sta $2F
    ldx #$7E : jsl _0196EF : sta $31
.D3A6:
    !A8
    brk #$00

;----- D3AA

    jsr _0281A8
    !A16
    clc
    lda !arthur_pos_x+1
    adc $2F
    cmp !obj_pos_x+1
    bcc .D3A6

    !A8
.D3BB:
    brk #$00

;----- D3BD

    jsr _0281A8
    !A16
    dec $22
    !A8
    dec $31
    bne .D3BB

    !AX8
    jsl _01918E_set_direction16 : sta !obj_direction
    lda #$01 : sta !obj_facing
    bra .D3EF

;-----

    ;unused code
    jsl get_arthur_relative_side
    beq .D3E0

    lda #$FF
.D3E0:
    eor #$FF
    and #$08
    sta !obj_direction
    lsr #3
    sta !obj_facing
    bra .D3EF

    stz !obj_facing

;-----

.D3EF:
    ldy #$B2 : ldx #$21 : jsl set_sprite
    !AX8
.D3F9:
    brk #$00

;----- D3FB

    ldx #$14 : jsl update_pos_xy_2
    lda $09
    and #$40
    beq .D428
    bra .D3F9

;-----

.thing:
    ldy #$DA : jsr pot_spawn_offset_local
    jsl update_animation_normal
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jml _02FD62_FD7C

;-----

.destroy:
    lda #$3B : jsl _018049_8053
    jsr drop_pot_local
    jmp _028BEC

;-----

.D428:
    jsr _028D09_local
    jmp _0281A8_81B5
}

{ ;D42E - D4AC
guillotine:

.create:
    lda $0292
    beq .D436

    jmp .destroy

.D436:
    lda #$10 : sta $10
    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$80 : sta $09
    !A16
    lda !obj_pos_x+1 : sta $2D
    lda !obj_pos_y+1 : sta $2F
    lda #$0038 : clc : adc $2D : sta !obj_pos_x+1
    lda #$003C : clc : adc $2F : sta !obj_pos_y+1
    !AX8
.D46A:
    lda.w difficulty
    asl
    clc
    adc $07
    tax
    lda.w guillotine_data_C9BB,X : cop #$00

;----- D477

    jsl update_animation_normal
    lda $25 : asl : tax ;25 gets updated to the animation frame ID
    !A16
    lda.w guillotine_data_C97B,X : clc : adc $2D : sta !obj_pos_x+1
    lda.w guillotine_data_C99B,X : clc : adc $2F : sta !obj_pos_y+1
    !A8
    txa
    cmp #$08
    bne .D46A

    lda #!sfx_guillotine : jsl _018049_8053
    bra .D46A

;-----

.thing:
    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
    jsr _028144
    rts

;-----

.destroy:
    jmp _0281A8_81B5
}

{ ;D4AD - D53C
face:

.create:
    brk #$00

;----- D4AF

    jsl _01CCAF
    ldy #$66 : ldx #$20 : jsl set_sprite
    !A16
    lda.w #face_data_CA48 : sta $13
    lda.w _00ED00+$22 : sta $27
    lda #$0010 : sta $29
    !A8
    lda #$FF : sta $2D : sta $26
.D4D4:
    lda !armor_state
    cmp #$02
    beq .D4E2

    cmp #$03
    beq .D4E2

    jmp .D538
.D4E2:
    lda $0461 ;$25
    tay
    lda.w face_data_sprite_idx,Y : sta $3C
    lda $08 : and #$F8 : sta $37
    lda.w face_data_CA6A,Y
    ldx.w current_cage
    clc
    adc.w face_data_CA67,X
    ora $37
    sta $08
    tya
    asl #2
    tay
    lda !arthur_facing : sta !obj_facing
    !A16
    bne .D517

    clc : lda !arthur_pos_x+1 : adc.w face_data_offset+0,Y : sta !obj_pos_x+1
    bra .D520

.D517:
    sec : lda !arthur_pos_x+1 : sbc.w face_data_offset+0,Y : sta !obj_pos_x+1
.D520:
    clc : lda !arthur_pos_y+1 : adc.w face_data_offset+2,Y : sta !obj_pos_y+1
    !A8
    jsl set_sprite_84A7
    jsl _018E32_8E73
    brk #$00

;----- D535

    jmp .D4D4

;-----

.D538:
    stz !obj_active
    jmp _02821B_827A
}

{ ;D53D - D655
cockatrice_spawner:

.create:
    lda $0292
    bne .D548

    lda #!mus_stage_1_boss : jsl _018049_8053
.D548:
    ldx #$00 : ldy #$90 : lda.b #_01FF00_5C : jsl _01A6FE
.D552:
    brk #$00

;----- D554

    lda !arthur_pos_x+1
    cmp #$48
    bcs .D560

    lda #$48 : sta !arthur_pos_x+1
.D560:
    lda $00DE
    bne .D552

    ldx #$07 : ldy #$90 : lda.b #_01FF00_5C : jsl _01A6FE
.D56F:
    brk #$00

;----- D571

    lda !arthur_pos_x+1
    cmp #$48
    bcs .D57D

    lda #$48 : sta !arthur_pos_x+1
.D57D:
    lda $00DE
    bne .D56F

    inc $1EB7
    inc $1EB8
.D588:
    brk #$00

;----- D58A

    lda #$20 : jsl _0195E4
    bcc .D588

    stz $1EC5
    !X16
    phy
    phx
    !X8
    ldx #$00 : jsr _028000_local
    !X16
    plx
    ply
    !X8
    !AX16
    tya
    clc
    adc #$001C
    tay
    lda #$13C8 : sta $1EC0
    lda #$0038 : sta $1EC3

    !A8
    jsr _028B2A_local
    stx $1EB7
    lda #!id_cockatrice_legs : jsr _02EB57
    !A16
    phd
    pla
    sta $002D,X

    !A8
    jsr _028B2A_local
    stx $1EBD
    lda #!id_cockatrice_wings : jsr _02EB57
    !A16
    phd
    pla
    sta $002D,X

    !A8
    jsr _028B2A_local
    stx $1ECC
    lda #!id_cockatrice_neck_base : jsr _02EB57
    !A16
    phd
    pla
    sta $002D,X

    !A8
    lda #$07 : sta $07
.D5FC:
    phx
    jsr _028B2A_local
    lda #!id_cockatrice_neck
    dec $07
    jsr _02EB57
    !A16
    pla
    sta $002D,X

    !A8
    lda $07
    bne .D5FC

    phx
    jsr _028B2A_local
    stx $1EB9
    lda #!id_cockatrice_neck
    dec $07
    jsr _02EB57
    !A16
    pla
    sta $002D,X

    !A8
    phx
    jsr _028B2A_local
    stx $1EBB
    lda #!id_cockatrice_head : jsr _02EB57
    !A16
    pla
    sta $002D,X

    !A8
    jsr _028B2A_local
    lda #!id_cockatrice_body : jsr _02EB57
    !A16
    phx
    ldx $1ECC
    pla
    sta $002D,X

    !AX8
    brk #$00

;----- D653

    jmp _0281A8_81B5
}

{ ;D656 - DA95
cockatrice_body:

.create:
    stz $1EC8
    stz $3C
    lda #$28 : sta $10
    ldy #$FE : ldx #$21 : jsl set_sprite
    !A16
    lda #cockatrice_body_data_CA1D : sta $13
    lda.w _00ED00+$44 : sta $27
    lda #$0100 : sta $29
    clc
    lda #$13C0 : sta !obj_pos_x+1
    lda #$0038 : sta !obj_pos_y+1
    lda #$0100 : sta $31
    !A8
    lda $08 : ora #$03 : sta $08
    stz $15
    lda #$FF : sta $26
    lda $09 : ora #$40 : sta $09
    jsl update_animation_normal
    jsl _018E32_8E73
.D6A4:
    !A8
    brk #$00

;----- D6A8

    jsl update_animation_normal
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$1330
    bcs .D6BB

    dec $31
    bne .D6A4

.D6BB:
    !A8
    ldy #$1F : jsl set_speed_xyg
    inc !obj_direction
    !X16
    ldx $1EBB
    inc $003C,X
    !AX8
    lda #$30 : sta $31
.D6D3:
    !A8
    jsr _02EB8F
    brk #$00

;----- D6DA

    jsl update_pos_xyg_add
    dec $31
    bne .D6D3

    !X16
    ldx $1EB7
    lda #$02 : sta $003B,X
    !X8
.D6EE:
    jsr _02EB8F
    brk #$00

;----- D6F3

    jsl update_pos_xyg_add
    jsl _01A559
    beq .D6EE

    jsr _02EB8F
    lda #$20 : cop #$00

;----- D704

    jsr _02EB8F
    lda $09 : ora #$90 : sta $09
    stz $0F
    jsl set_hp
    stz $38
    stz $1EC7
    !A16
    stz $3A
    lda #$0001 : sta $33
    !A8 ;duplicate instruction
.D723:
    !A8
    brk #$00

;----- D727

    lda $0F
    cmp #$01
    beq .D723

    lda $0F
    cmp #$03
    beq .D73B

    bra .D747

    lda $0F   ;D735 - D73A: unused code
    cmp #$05  ;
    bne .D747 ;

.D73B:
    !A16
    dec $33
    bne .D747

    !A8
    inc $0F
    bra .D723

.D747:
    !AX8
    inc $3A
    lda $3A
    cmp #$80
    bne .D723

    ldx #$4C : jsl _0196EF
    cmp #$00
    beq .D723

    !X16
    ldx $1EB9
    lda $003B,X
    bne .D76D

    lda #$20 : sta $31
    lda #$08 : sta $0F
.D76D:
    !A8
    bra .D723

;-----

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda $3C
    bne .D780

    jsr _02FD62_FD7C
.D780:
    lda $0F : asl : tax
    jmp (+,X) : +: dw .D7A1, .D7B9, .D7E9, .D80B, .D8B3, .D8E7, .D915, .D974, .D99B, .D9B0, .D9C7, .DA28, .DA2B

;-----

.D7A1:
    stz $39
    stz $07
    lda #$50 : sta !obj_speed_y+0
    lda #$FF : sta !obj_speed_y+1 : sta !obj_speed_y+2
    lda #$60 : sta $31
    inc $0F
    jsr _02EB8F
    rts

;-----

.D7B9:
    jsl update_pos_y
    lda $31
    cmp #$52
    bne .D7C6

    jsr .D7D8
.D7C6:
    dec $31
    bne .D7D4

    stz $38
    stz $37
    lda #$15 : sta !obj_direction
    inc $0F
.D7D4:
    jsr _02EB8F
    rts

;-----

.D7D8:
    !X16
    ldx $1EBB
    stz $003C,X
    ldx $1EB7
    stz $003B,X
    !X8
    rts

;-----

.D7E9:
    ldx #$4A : jsl _0196EF
    ldx #$3F : jsl mulu
    !A16
    sta $33
    lda #$0060 : sta !obj_speed_x
    lda #$0060 : sta !obj_speed_y
    !A8
    inc $0F
    jsr _02EB8F
    rts

;-----

.D80B:
    lda $39
    and #$04
    cmp $07
    beq .D875

    sta $07
    lda $38
    bne .D841

    lda $37
    bne .D829

    lda !obj_direction
    cmp #$0A
    bne .D835

    lda #$01 : sta $37
    bra .D875

.D829:
    lda !obj_direction
    cmp #$16
    bne .D83D

    stz $37
    dec !obj_direction
    bra .D875

.D835:
    lda !obj_direction
    beq .D83D

    dec !obj_direction
    bra .D875

.D83D:
    inc !obj_direction
    bra .D875

.D841:
    lda $37
    bne .D85D

    lda !obj_direction
    cmp #$06
    bne .D851

    lda #$01 : sta $37
    bra .D875

.D851:
    inc !obj_direction
    lda !obj_direction
    cmp #$20
    bne .D875

    stz !obj_direction
    bra .D875

.D85D:
    lda !obj_direction
    cmp #$1A
    bne .D869

    stz $37
    dec !obj_direction
    bra .D875

.D869:
    lda !obj_direction
    beq .D871

    dec !obj_direction
    bra .D875

.D871:
    lda #$1F : sta !obj_direction
.D875:
    ldx #$1A : jsl update_pos_xy_2
    !A16
    lda !obj_pos_x+1
    sec
    sbc #$12B0
    bcc .D895

    lda !obj_pos_x+1
    sec
    sbc #$1380
    bcs .D8A2

    !A8
    inc $39
    jsr _02EB8F
    rts

.D895:
    lda #$12B0 : sta !obj_pos_x+1
    !A8
    lda #$04 : sta $36
    bra .D8AD

.D8A2:
    lda #$1380 : sta !obj_pos_x+1
    !A8
    lda #$04 : sta $36
.D8AD:
    inc $0F
    jsr _02EB8F
    rts

;-----

.D8B3:
    ldx #$56 : jsl _0196EF
    sta $33
    ldx #$2A : jsl _0196EF
    beq .D8CD

.D8C3:
    stz $35
    lda #$07 : sta $0F
    jsr _02EB8F
    rts

.D8CD:
    lda $35
    cmp #$03
    bcs .D8C3

    inc $35
    inc $0F
    jsr _02EB8F
    !A16
    lda !obj_pos_y : sta $1EC9
    stz $1ECB
    !A8
    rts

;-----

.D8E7:
    lda $1ECB
    inc
    and #$1F
    sta $1ECB
    asl
    tax
    bne .D904

    dec $33
    bne .D904

    !A16
    lda $1EC9 : sta !obj_pos_y
    !A8
    inc $0F
    rts

.D904:
    !A16
    clc : lda.w cockatrice_body_data_C9C3,X : adc $1EC9 : sta !obj_pos_y
    !A8
    jsr _02EB8F
    rts

;-----

.D915:
    lda $36
    sec
    cmp #$04
    bcc .D928

    stz $36
    lda $38
    pha
    eor #$01
    sta $38
    pla
    bra .D938

.D928:
    lda $38
    pha
    ldx #$4C : jsl _0196EF
    sta $38
    pla
    cmp $38
    beq .D958

.D938:
    cmp #$00
    bne .D949

    lda !obj_direction
    sec
    sbc #$0A
    tax
    lda.w cockatrice_body_data_CA03,X
    sta !obj_direction
    bra .D958

.D949:
    lda !obj_direction
    cmp #$18
    bmi .D952

    sec
    sbc #$13
.D952:
    tax
    lda.w cockatrice_body_data_CA10,X
    sta !obj_direction
.D958:
    inc $36
    ldx #$4A : jsl _0196EF
    ldx #$3F : jsl mulu
    !A16
    sta $33
    !A8
    lda #$03 : sta $0F
    jsr _02EB8F
    rts

;-----

.D974:
    jsl set_direction32
    tax
    lda.w cockatrice_body_data_CA25,X : sta $1EC6
    !X16
    ldx $1EB9
    lda #$02
    sta $3B
    sta $003B,X
    sta $1EC5
    ldx $1EBB
    sta $003B,X
    !X8
    lda #$0A : sta $0F
    rts

;-----

.D99B:
    !AX8
    lda $1EC7 ;miniwing count
    cmp #$04
    beq .D9AB

    dec $31
    bne .D9AA

    inc $0F
.D9AA:
    rts

.D9AB: ;gets here if there are 4 miniwings
    lda #$06 : sta $0F
    rts

;-----

.D9B0:
    !AX8
    lda #$03
    sta $3B
    !X16
    ldx $1EBB
    sta $003B,X
    !X8
    lda #$20 : sta $31
    inc $0F
    rts

;-----

.D9C7:
    lda $3B
    dec
    asl
    tax
    jmp (+,X) : +: dw .D9D9, .D9ED, .DA01, .DA15, .DA15

;-----

.D9D9: ;unused?
    !X16
    ldx $1EB7
    lda $003B,X
    bne .DA28

    !X8
    lda #$06 : sta $0F
    jsr _02EB8F
    rts

;-----

.D9ED:
    lda $1EC5
    bne .DA28

    !X16
    ldx $1EBB
    stz $003B,X
    !X8
    lda #$06 : sta $0F
    rts

;-----

.DA01:
    dec $31
    bne .DA28

    lda #$10 : sta $31
    inc $3B
    lda #!id_miniwing : jsl prepare_object
    inc $1EC7
    rts

;-----

.DA15:
    dec $31
    bne .DA28

    !X16
    ldx $1EBB
    stz $003B,X
    !X8
    lda #$06 : sta $0F
    rts

;-----

.DA28:
    !X8
    rts

;-----

.DA2B:
    rts

;-----

.destroy:
    lda #$0C : sta $0F
    inc $3C
    lda #!mus_defeat_boss : jsl _018049_8053
    !X16
    ldx $1EB7
    lda $0008,X : ora #$10 : sta $0008,X
    inc $003C,X
    ldx $1EBD
    lda $0008,X : ora #$10 : sta $0008,X
    inc $003C,X
    !X8
    lda $08 : ora #$10 : sta $08
    lda #!id_boss_explosion_spawner : jsl prepare_object
    lda #$77 : sta $31
.DA68:
    brk #$00

;----- DA6A

    jsl update_animation_normal
    jsl _018E32_8E73
    dec $31
    bne .DA68

    lda #$72 : sta $1D
    lda #!id_key : jsl prepare_object
    !X16
    ldy $1EB7 : jsr remove_child_object
    ldy $1EBD : jsr remove_child_object
    !AX8
    inc $1ED7
    jmp _0281A8_81B5
}

{ ;DA96 - DB8F
cockatrice_legs:

.create:
    ldy #$02 : ldx #$22 : jsl set_sprite
    lda $08 : ora #$01 : sta $08
    lda $09 : ora #$90 : sta $09
    jsr _02EBA8
    !A16
    lda.w _00ED00+$42 : sta $27
    lda #$018E : sta $29
    !A8
    lda #$FF : sta $26
    stz $3B
    stz $3C
    lda $09 : ora #$40 : sta $09
    jsl update_animation_normal
    jsl _018E32_8E73
.DAD1:
    brk #$00

;----- DAD3

    lda $08
    and #$10
    bne .DAEF

    lda $14D1
    bne .DAEF

    !A16
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    bcs .DAED

    lda !obj_pos_x+1 : sta !arthur_pos_x+1
.DAED:
    !A8
.DAEF:
    jsr _02EBA8
    !A16
    lda #$002C
    clc
    adc !obj_pos_x+1
    sta !obj_pos_x+1
    !A8
    lda $3B
    cmp #$02
    beq .DB18

    cmp #$03
    beq .DB18

    ldy #$0E : jsl arthur_range_check_x
    bcs .DB16

    lda #$01 : sta $3B
    bra .DAD1

.DB16:
    stz $3B
.DB18:
    bra .DAD1

;-----

.thing:
    lda $3C
    bne .DB8C

    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
    jsl update_animation_normal
    jsl _018E32_8E73
    lda $3B
    beq .DB56

    cmp #$02
    beq .DB72

    cmp #$03
    beq .DB8C

    ;lower legs when arthur is close
    lda $0F
    bne .DB8C

    ldy #$04 : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    lda #$01 : sta $0F
    bra .DB8C

.DB56:
    lda $0F
    beq .DB8C

    ldy #$02 : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    stz $0F
    bra .DB8C

.DB72:
    ldy #$00 : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    lda #$01 : sta $0F
    inc $3B
.DB8C:
    rts

;-----

.destroy: ;unused?
    jmp _0281A8_81B5
}

{ ;DB90 - DBFA
cockatrice_neck_base:

.create:
    ldy #$0A : ldx #$22 : jsl set_sprite
    lda $08 : ora #$04 : sta $08
    lda $09 : ora #$40 : sta $09
    !A16
    lda.w _00ED00+$68 : sta $27
    lda #$010E : sta $29
    stz $31
    !A8
    lda #$FF : sta $26
    jsl update_animation_normal
    ldx #$26 : jsl _018E32
    stz $0F
.DBC4:
    jsr _02EBA8
    !A16
    lda !obj_pos_x+1 ;do these three instructions even do anything?
    clc              ;
    adc #$0004       ;
    lda !arthur_pos_x+1
    cmp #$1248
    bcs .DBDD

    lda #$1248 : sta !arthur_pos_x+1
.DBDD:
    !A8
    brk #$00

;----- DBE1

    bra .DBC4

;-----

.destroy:
    !X16
    ldx $2D
    lda #$8C : sta.w !obj_active,X
    !X8
    lda $08 : ora #$10 : sta $08
    lda #$77 : cop #$00

;----- DBF8

    jmp _0281A8_81B5
}

{ ;DBFB - DDA3
cockatrice_neck:

.create:
    ldy #$0A : ldx #$22 : jsl set_sprite
    lda $08 : ora #$04 : sta $08
    lda $08 : and #$F7 : sta $08
    lda $09 : ora #$C0 : sta $09
    jsr _02EBA8
    !A16
    lda #$010E : sta $29
    stz $31
    stz !obj_speed_x
    stz !obj_speed_y
    !A8
    stz !obj_speed_x+2
    stz !obj_speed_y+2
    stz $3B
    stz $3C
.DC2F:
    !AX8
    brk #$00

;----- DC33

    lda $3B
    bne .DC3C

    jsr _02EBA8
    bra .DC2F

.DC3C:
    lda $0F : asl : tax
    jmp (+,X) : +: dw .DC55, .DC7B, .DCBC, .DCDA, .DD03, .DD21, .DD3E, .DD50, .DD76

;-----

.DC55:
    !X16
    ldx $2D
    lda $1EC6
    sta !obj_direction
    sta.w !obj_direction,X
    !X8
    stz $33
    stz $31
    inc $0F
    lda #$04 : cop #$00

;----- DC6D

    !X16
    ldx $2D
    lda #$02 : sta $003B,X
    !X8
    jmp .DC2F

;-----

.DC7B:
    inc $31
    lda $31
    and #$03
    cmp #$03

    bne .DCA7

    lda $33
    bne .DC99

    !A16
    lda !obj_pos_x+1 : clc : adc #$0002 : sta !obj_pos_x+1
    !A8
    inc $33
    bra .DCA7

.DC99:
    !A16
    lda !obj_pos_x+1 : sec : sbc #$0002 : sta !obj_pos_x+1
    !A8
    stz $33
.DCA7:
    lda $31
    cmp #$40
    bne .DCB9

    lda $08 : ora #$08 : sta $08
    lda #$20 : sta $31
    inc $0F
.DCB9
    jmp .DC2F

;-----

.DCBC:
    ldx #$2A : jsl update_pos_xy_2
    dec $31
    bne .DCD7

    !X16
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$30 : sta $31
    inc $0F
.DCD7:
    jmp .DC2F

;-----

.DCDA:
    dec $31
    bne .DD00

    !X16
    ldx $2D
    lda #$07 : sta $000F,X
    lda #$80 : sta $0031,X
    !X8
    lda !obj_direction
    lsr
    sec
    sbc #$05
    tax
    lda.w _00CA45,X
    sta !obj_direction
    lda #$40 : sta $31
    inc $0F
.DD00:
    jmp .DC2F

;-----

.DD03:
    dec $31
    beq .DD16
    lda $08 : and #$F7 : sta $08
    ldx #$28 : jsl update_pos_xy_2
    jmp .DC2F

.DD16:
    lda $08 : and #$F7 : sta $08
    inc $0F
    jmp .DC2F

;-----

.DD21:
    !X16
    ldx $2D
    lda #$05 : sta $000F,X
    !X8
    lda $08 : and #$F7 : sta $08
    stz $1EC5
    stz $31
    stz $3B
    stz $0F
    jmp .DC2F

;-----

.DD3E:
    !X16
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$08 : sta $0F
    jmp .DC2F

;-----

.DD50:
    lda #$08 : cop #$00

;----- DD54

    !X16
    ldx $2D
    lda #$07 : sta $000F,X
    !X8
    lda !obj_direction
    lsr
    sec
    sbc #$05
    tax
    lda.w _00CA45,X : sta !obj_direction
    lda #$38 : sta $31
    lda #$04 : sta $0F
    jmp .DC2F

;-----

.DD76:
    jmp .DC2F

;-----

.thing:
    lda $3C
    bne .DD83

    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
.DD83:
    rts

;-----

.destroy:
    inc $3C
    lda $08 : ora #$10 : sta $08
    !X16
    ldx $2D
    lda #$8C : sta $0000,X
    !X8
    lda #$77 : cop #$00

;----- DD9B

    lda #$46 : jsl prepare_object
    jmp _0281A8_81B5
}

{ ;DDA4 - DEA0
cockatrice_head:

.create:
    brk #$00

;----- DDA6

    ldy #$EC : ldx #$21 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    lda $08 : ora #$01 : sta $08
    jsr _02EBA8
    !A16
    lda.w _00ED00+$40 : sta $27
    lda #$0180 : sta $29
    stz !obj_speed_x+0
    stz !obj_speed_y+0
    !A8
    stz !obj_speed_x+2
    stz !obj_speed_y+2
    lda #$FF : sta $26
    stz $3B
    stz $3C
    lda #$01 : sta !obj_direction
    jsl set_hp
    lda #$01 : sta $0F
.DDE7:
    brk #$00

;----- DDE9

    jsr _02EB7E
    lda $0F : asl : tax
    jmp (+,X) : +: dw .DDFF, .DE0F, .DE23, .DE33, .DE3B, .DE4B

;-----

.DDFF:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    bra .DDE7

;-----

.DE0F:
    lda $3B
    beq .DDE7

    lda $3B
    cmp #$03
    beq .DE1F

    lda #$04 : sta $0F
    bra .DDE7

.DE1F:
    inc $0F
    bra .DDE7

;-----

.DE23:
    ldy #$FA : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    bra .DDE7

;-----

.DE33:
    lda $3B
    bne .DDE7

    stz $0F
    bra .DDE7

;-----

.DE3B:
    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    bra .DDE7

;-----

.DE4B:
    lda $3B
    bne .DDE7

    stz $0F
    bra .DDE7

;-----

.thing:
    jsl update_animation_normal
    ldx #$26 : jsl _018E32
    lda $3C
    bne .DE6A

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
.DE6A:
    rts

;-----

.destroy:
    lda $0E
    beq .DE7E

    ldx #$02 : jsr _028048_local
    jsl _02F9DA_F9E0
    jsr _02EB7E
    jmp .DDE7

.DE7E:
    inc $3C
    lda $08 : ora #$10 : sta $08
    !X16
    ldx $2D
    lda #$8C : sta.w !obj_active,X
    !X8
    inc $1EC8
    lda #$77 : cop #$00

;----- DE98

    lda #!id_boss_explosion : jsl prepare_object
    jmp _0281A8_81B5
}

{ ;DEA1 - EA94
miniwing:

.create:
    ldx #$03 : jsl _018D5B
    lda #!sfx_cockatrice_spew : jsl _018049_8053
    ldy #$EE : ldx #$21 : jsl set_sprite
    !A16
    lda.w #cockatrice_body_data_CA21 : sta $13
    lda.w _00ED00+$3C : sta $27
    lda #$0010 : sta !obj_speed_x+1
    lda #$0010 : sta !obj_speed_y+1
    stz $0C
    !A8
    lda #$FF : sta $26
    stz $25
    stz $15
    lda $09 : ora #$C0 : sta $09
    lda #$01 : sta !obj_direction
    jsl update_pos_x
    jsl update_pos_y
    ldy #$10 : jsl set_speed_xyg
.DEEF:
    brk #$00

;----- DEF1

    jsl update_pos_xyg_add
    jsl _01A559
    beq .DEEF

    lda.w difficulty : asl #2 : sta !obj_hp
    lda #$90 : sta !obj_speed_x+0
    stz !obj_speed_x+1
    stz !obj_speed_x+2
    ldy #$12 : jsl set_speed_xyg
.DF10:
    brk #$00

;----- DF12

    lda $1EC8
    beq .DF20

    lda #$3B : jsl _018049_8053
    jmp _028BEC

.DF20:
    lda $0F : asl : tax
    jmp (+,X)

+:
    dw .DF47, .DF8D, .DFC2, .DFCD, .DFE2, .E015, .E081, .E086
    dw .E08B, .E0D7, .E0D7, .E107, .E116, .E11B, .E121, .E121

;-----

.DF47: ;egg land
    stz $35
    ldx #$4E : jsl _0196EF
    cmp #$00
    beq .DF76

    ldy #$F0 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    stz $17
    ldx #$52 : jsl _0196EF : sta $31
    jsl get_arthur_relative_side
    beq .DF76

    sta !obj_direction
    inc $0F
    jmp .DF10

.DF76:
    ldy #$F2 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$02 : sta $0F
    lda #$64 : sta $31
    jmp .DF10

;-----

.DF8D:
    jsl update_pos_x
    !A16
    lda !obj_pos_x+1
    cmp #$1250
    bcc .DFA7

    lda !obj_pos_x+1
    cmp #$13D0
    bcs .DFA7

    !A8
    dec $31
    bne .DFBB

.DFA7:
    !A8
    ldy #$F2 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    lda #$64 : sta $31
.DFBB:
    jsl _01A593
    jmp .DF10

;-----

.DFC2:
    dec $31
    bne .DFCA

    lda #$03 : sta $0F
.DFCA:
    jmp .DF10

;-----

.DFCD:
    ldy #$F4 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$0E : sta $31
    inc $0F
    jmp .DF10

;-----

.DFE2:
    dec $31
    bne .E012

    lda #$05 : cop #$00

;----- DFEA

    ldy #$F6 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$00 : sta !obj_speed_x+0
    lda #$01 : sta !obj_speed_x+1
    jsl get_arthur_relative_side : sta !obj_direction
    eor #$01 : sta !obj_facing
    lda #$40 : sta $31
    inc $0F
    lda #$10 : cop #$00

;----- E012

.E012:
    jmp .DF10

;-----

.E015:
    jsl update_pos_x
    !A16
    lda !obj_pos_x+1
    cmp #$1250
    bcs .E029

    lda #$1250 : sta !obj_pos_x+1
    bra .E035

.E029:
    lda !obj_pos_x+1
    cmp #$13D0
    bcc .E042

    lda #$13D0 : sta !obj_pos_x+1
.E035:
    !A8
    lda #$05 : sta $07
    lda #$0A : sta $0F
    jmp .DF10

.E042:
    !A8
    dec $31
    bne .E07A

    lda #$28 : sta $31
    ldx #$4E : jsl _0196EF
    cmp #$00
    bne .E07A

    ldy #$0C : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    lda #$FF : sta !obj_speed_y+0
    lda #$FE : sta !obj_speed_y+1
    lda #$FF : sta !obj_speed_y+2
    ldy #$12 : jsl set_speed_xyg
    lda #$15 : sta $31
.E07A:
    jsl _01A593
    jmp .DF10

;-----

.E081:
    inc $0F
    jmp .DF10

;-----

.E086:
    inc $0F
    jmp .DF10

;-----

.E08B:
    jsl update_pos_xyg_add
    !A16
    lda !obj_pos_x+1
    cmp #$1250
    bcs .E09F

    lda #$1250 : sta !obj_pos_x+1
    bra .E0AB

.E09F:
    lda !obj_pos_x+1
    cmp #$13D0
    bcc .E0B8

    lda #$13D0 : sta !obj_pos_x+1
.E0AB:
    !A8
    lda #$08 : sta $07
    lda #$0A : sta $0F
    jmp .DF10

.E0B8:
    !A8
    jsl _01A559
    beq .E0D4

    ldy #$F6 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$05 : sta $0F
    lda #$28 : sta $31
.E0D4:
    jmp .DF10

;-----

.E0D7:
    lda $35
    bne .E0F0

    lda !obj_direction : eor #$01 : sta !obj_direction
    lda !obj_facing : eor #$01 : sta !obj_facing
    lda $07 : sta $0F
    inc $35
    jmp .DF10

.E0F0:
    ldy #$0C : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    ldy #$20 : jsl set_speed_xyg
    inc $0F
    jmp .DF10

;-----

.E107:
    jsl update_pos_xyg_add
    lda $09
    and #$40
    cmp #$40
    bne .E11B

    jmp .DF10

;-----

.E116: ;unused getting hit state?
    dec $1EC7
    bra .destroy

;-----

.E11B:
    dec $1EC7
    jmp _0281A8_81B5

;-----

.E121: ;unused getting hit state?
    dec $1EC7
    bra .destroy

;-----

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    jsr _02FD62_FD7C
    lda $0F
    cmp #$05
    bcc .E13E

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    rts

.E13E:
    jsr _02FB9C_FBC0
    rts

;-----

.destroy:
    lda !obj_hp
    beq .E186

    ldy #$F8 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    lda #$08 : cop #$00

;----- E15E

    jsl _02F9DA_F9E0
    lda $0F
    cmp #$05
    bne .E177

    ldy #$F6 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    jmp .DF10

.E177: ;hitting miniwing in the air?
    ldy #$0C : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    jmp .DF10

.E186:
    lda #$3B : jsl _018049_8053
    dec $1EC7
    jmp _028BEC

;-----

    jmp _0281A8_81B5 ;unused, probably belongs to miniwing
}

{ ;E195 - E1F8
cockatrice_wings:

.create:
    ldy #$08 : ldx #$22 : jsl set_sprite
    jsr _02EBA8
    !A16
    lda.w _00ED00+$3E : sta $27
    lda #$0120 : sta $29
    !A8
    lda #$FF : sta $26
    lda $08 : ora #$01 : sta $08
    lda $09 : ora #$C0 : sta $09
    stz $3C
    jsl update_animation_normal
    jsl _018E32_8E73
.E1C8:
    brk #$00

;----- E1CA

    jsr _02EBA8
    !A16
    lda #$002C
    clc
    adc !obj_pos_x+1
    sta !obj_pos_x+1
    !A8
    lda $25
    cmp #$02
    bne .E1C8

    bra .E1C8

;-----

.thing:
    lda $3C
    bne .E1EF

    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C
    jsl update_animation_normal
.E1EF:
    jsl _018E32_8E73
    !A8
    rts

;-----

.destroy: ;unused?
    jmp _0281A8_81B5
}

{ ;E1F9 - E277
boss_explosion_spawner:

.create:
    ldx.w stage
    lda.w boss_explosion_spawner_data_CB4E,X : sta $2D
    !AX16
    lda.w stage : asl : tax
    lda.w boss_explosion_spawner_data_CB56,X : sta $2F
    lda.w boss_explosion_spawner_data_CB66,X : sta $31
.E212:
    !AX8
    jsl get_object_slot
    bmi .E25D

    lda #!id_boss_explosion : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda !obj_direction : sta.w !obj_direction,X
    lda !obj_facing : sta.w !obj_facing,X
    lda $07 : sta $0007,X
    stz.w !obj_speed_x,X
    stz.w !obj_speed_y,X
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    ldy $2F
    lda.w boss_explosion_spawner_data_offset_x,Y : sta.w !obj_speed_x+1,X
    inc $2F : inc $2F
    ldy $31
    lda.w boss_explosion_spawner_data_offset_y,Y : sta.w !obj_speed_y+1,X
    inc $31 : inc $31
.E25D:
    !AX8
    lda #$08 : cop #$00

;----- E263

    lda #$34 : jsl _018049_8053
    dec $2D
    bne .E212

    jmp _0281A8_81B5

.E270: ;unused?
    brk #$00

;----- E272

    bra .E270

;-----

.thing: ;unused?
    rts

;-----

.destroy: ;unused?
    jmp _0281A8_81B5
}

{ ;E278 - E2A9
boss_explosion:

.create:
    ldy #$18 : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    !A16
    lda !obj_pos_x+1 : clc : adc !obj_speed_x+1 : sta !obj_pos_x+1
    lda !obj_pos_y+1 : clc : adc !obj_speed_y+1 : sta !obj_pos_y+1
    !A8
    lda #$22 : sta $2D
.E29A:
    brk #$00

;----- E29C

    jsl update_animation_normal
    dec $2D
    bne .E29A

    bra .destroy

;-----

.thing:
    rts

;-----

.destroy:
    jmp _0281A8_81B5
}

{ ;E2AA - E429
wolf:

.create:
    ldx #$01 : jsl _018D5B
    jsl set_hp
    stz $15
    stz $30
    !A16
    lda.w _00ED00+$06 : sta $27
    lda.w #wolf_data_CD2E : sta $13
    !A8
    lda #$FF : sta $26
    lda $07 : sta $2F
    beq .E2E1

.E2D0:
    jsl _01A559
    bne .E2E1

    brk #$00

;----- E2D8

    clc
    lda !obj_pos_y+1 : adc #$08 : sta !obj_pos_y+1
    bra .E2D0

.E2E1:
    ldy #$1C : ldx #$22 : jsl set_sprite
    jsl _02F9DA_F9E0
.E2ED:
    brk #$00

;----- E2EF

    bit $09
    bvc .E2ED

    jsl get_arthur_relative_side
    sta !obj_direction
    sta !obj_facing
.E2FB:
    ldy #$1C : ldx #$22 : jsl set_sprite
    jsl get_rng_16
    lda.w wolf_data_idle_timer,X
    ldx $9636 ;bug: loads $FF. supposed to be difficulty...?
    clc
    adc.w wolf_data_idle_timer_modifier,X ;always adds $00 from $CE15 instead!
    !A16
    and #$00FF
    asl
    sta $2D
    !A8
.E31B:
    brk #$00

;----- E31D

    jsl get_arthur_relative_side
    cmp !obj_facing
    beq .E341

    ldy #$1E : ldx #$22 : jsl set_sprite
    lda #$2C : sta $2D
.E331:
    brk #$00

;----- E333

    dec $2D
    bne .E331

    lda !obj_facing
    eor #$01
    sta !obj_direction
    sta !obj_facing
    bra .E2FB

.E341:
    !A16
    lda #$0880
    cmp !obj_pos_x+1
    !A8
    bcc .E354

    ldy #$14 : jsl _0192AD
    bcc .E370

.E354:
    !A16
    dec $2D
    !A8
    bne .E31B

    ldy #$1E : ldx #$22 : jsl set_sprite
    lda #$77 : sta $2D
.E368:
    brk #$00

;----- E36A

    dec $2D
    bne .E368
    bra .E2FB

.E370:
    jsl get_rng_16
    lda.w wolf_data_jump_cooldown,X
    ldx $9636 ;bug: loads $FF. supposed to be difficulty...?
    clc
    adc.w wolf_data_jump_cooldown_modifier,X ;always adds $01 from $CE29 instead!
    cop #$00

;----- E380

    ldy #$20 : ldx #$22 : jsl set_sprite
    ldy #$0E : sty $30
    stz $2F
    jsl call_rng
    and #$0F
    cmp #$08
    bcc .E399

    iny
.E399:
    jsl set_speed_xyg
.E39D:
    brk #$00

;----- E39F

    jsl update_pos_xyg_add
    lda !obj_speed_y+2
    bmi .E39D

.E3A7:
    brk #$00

;----- E3A9

    jsl update_pos_xyg_add
    jsl _01A559
    beq .E3A7

    lda #$01 : sta $2F
    stz $30
    ldy #$24 : ldx #$22 : jsl set_sprite
    lda #$0A : cop #$00

;----- E3C5

    ldy #$1C : ldx #$22 : jsl set_sprite
    lda #$0A : cop #$00

;----- E3D1

    jmp .E2FB

;-----

.destroy:
    lda $0E
    bne .E3DB

    jmp _028BEC
.E3DB:
    jsl _02F9DA_F9E0
    ldy #$22 : ldx #$22 : jsl set_sprite
.E3E7:
    brk #$00

;----- E3E9

    lda !obj_anim_timer
    cmp #$70
    bne .E3E7

    jmp .E2ED

;-----

.E3F2:
    lda $2F
    beq .E3FA

    jsl _01A5AF
.E3FA:
    rts

;-----

.thing:
    jsl update_animation_normal
    ldx #$00 : jsl _018E32
    lda $30 ;"is jumping" bool ($00 / $0E)
    bne .E41E

    jsr .E3F2
    lda.w current_cage
    bne .E427

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
    jsr .E427
    rts

.E41E:
    lda.w current_cage
    bne .E427

    jsl _0296FE

.E427:
    jmp _028074_80A7
}

{ ;E42A - E612
siren:

.create:
    ldx #$02 : jsl _018D5B
    jsl set_hp
    lda #$04 : sta $08
    !A16
    lda.w _00ED00+$2A : sta $27
    !A8
    lda #$20
    stz $38
    sta $10
    lda #$FF : sta $26
    lda #$60 : sta $09
    ldy #$C2 : ldx #$21 : jsl set_sprite
    jsl _018E32_8E73
    inc !obj_direction
    inc !obj_facing
    lda #$FF : sta $2D
.E463:
    brk #$00

;----- E465

    bit $09
    bvc .E463

.E469:
    brk #$00

;----- E46B

    lda $188D
    eor #$FF
    inc
    clc
    adc #$A0
    sta !obj_pos_y+1
    adc #$08
    cmp $009F
    bcs .E485

    lda $08 : ora #$08 : sta $08
    bra .E48B

.E485:
    lda $08 : and #$F7 : sta $08
.E48B:
    dec $2D
    bne .E469

    lda $08
    and #$08
    beq .E499

    inc $2D
    bra .E469

.E499:
    stz $08
    stz $09
    !A16
    lda !obj_pos_x+1 : adc #$0020 : sta !obj_pos_x+1
    lda #$0320 : sta !obj_pos_y+1
    !A8
    lda #$40 : cop #$00

;----- E4B1

    ldy #$0F : jsl set_speed_y
    jsl _02F9DA
.E4BB:
    ldy #$CA : ldx #$21 : jsl set_sprite
.E4C3:
    brk #$00

;----- E4C5

    jsl update_animation_normal
    jsl _018E32_8E73
    jsl update_pos_y
    lda $38
    beq .E4C3

.E4D5:
    ldy #$A6 : ldx #$21 : jsl set_sprite
.E4DD:
    brk #$00

;----- E4DF

    ldy #$14 : jsl arthur_range_check
    bcs .E4DD

    ldy #$21 : jsl set_speed_xyg
    lda #$04 : sta $38
    lda #$04 : sta $07
    lda #$04 : sta $1D
    lda #!id_splash : jsl prepare_object
.E4FF:
    ldy #$A4 : ldx #$21 : jsl set_sprite
.E507:
    brk #$00

;----- E509

    jsl update_pos_xyg_add
    lda $38
    cmp #$02
    bne .E507

    ldy #$A6 : ldx #$21 : jsl set_sprite
    lda #!id_splash : jsl prepare_object
    ldx.w difficulty
    lda.w siren_data_CD32,X : cop #$00 ;mistake: no base timer! it's using the difficulty modifier as a raw timer

;----- E529

    ldy #$A8 : ldx #$21 : jsl set_sprite
.E531:
    brk #$00

;----- E533

    lda $24
    cmp #$77
    bne .E531

    ldx #$5E : jsl _0196EF : sta $39
    lda #$0C : sta $1D
    lda #$35 : jsl _018049_8053
    lda #$03
.E54D:
    pha
    ldx $39
    inc $39
    lda.w siren_data_CD3A,X : sta $3C
    jsr .E5EF
    pla
    dec
    bne .E54D

    ldx.w difficulty
    lda.w siren_data_CD36,X : cop #$00

;----- E566

    jmp .E4D5

;-----

.destroy: ;E569
    lda !obj_hp
    bne .E570

    jmp _028BEC

.E570:
    ldy #$AA : ldx #$21 : jsl set_sprite
    jsl _02F9DA_F9E0
.E57C:
    brk #$00

;----- E57E

    lda $24
    cmp #$70
    bne .E57C

    ldx $38
    jmp (+,X) : +: dw .E4BB, .E4D5, .E4FF

;-----

.thing: ;E58F
    jsl get_arthur_relative_side : sta !obj_direction : sta !obj_facing
    jsr .E5B0
    jsl update_animation_normal
    jsl _018E32_8E73
    ldy #$02 ;does nothing?
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
    jmp _028074_8087

;-----

.E5B0:
    ldx $38
    jmp (+,X) : +: dw .E5BB, .E5CB, .E5D9

.E5BB:
    !A16
    lda $009F
    clc
    adc #$FFF8
    cmp !obj_pos_y+1
    !A8
    bcs .E5E9

    rts

.E5CB:
    !A16
    lda $009F
    clc
    adc #$FFF8
    sta !obj_pos_y+1
    !A8
    rts

.E5D9:
    !A16
    lda $009F
    clc
    adc #$FFF8
    cmp !obj_pos_y+1
    !A8
    bcc .E5E9

    rts

.E5E9:
    lda #$02 : sta $38
    bra .E5CB

;-----

.E5EF:
    jsl get_object_slot
    bmi .E612

    sta $0007,X
    lda #!id_siren_projectile : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda $3C : sta $003C,X
    lda !obj_direction : sta.w !obj_direction,X
    jsl set_spawn_offset
    !X8
.E612:
    rts
}

{ ;E613 - E64F
siren_projectile:

.create:
    ldy #$AE : ldx #$21 : jsl set_sprite
    jsl _02F9DA
    lda $3C : ldx #$18 : jsl _018BBF
.E627:
    brk #$00

;----- E629

    !A16
    lda $00A3 : clc : adc !obj_pos_y+1 : sta !obj_pos_y+1
    !A8
    jsl update_animation_normal
    jsl update_pos_xy
    bra .E627

;-----

.thing:
    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    ldy #$06 : jsr _02FF22
    jsr _02FD62_FD7C
    jmp _028074_8087
}

{ ;E650 - E6FA
_02E650: ;a8 x?
    ;from enemy spawner. ghost spawner?
    stz $2D
    stz $2E
    stz $30
    jsl get_rng_bool : sta $07
.E65C:
    lda #$40 : sta $2F
.E660:
    brk #$00

;----- E662

    jsr .E6C7
    dec $2F
    bne .E660

    !A8
    lda !open_object_slots
    clc
    adc #$02
    cmp #$0C
    bcc .E65C

    jsl get_rng_bool : asl : tay
    !AX16
    lda.w ghost_data_spawn_offset_x,Y : adc.w camera_x+1 : sta !obj_pos_x+1
    !AX8
    jsl call_rng : and #$0F : tay
    !AX16
    lda.w ghost_data_spawn_offset_y,Y : and #$00FF : adc.w camera_y+1 : sta !obj_pos_y+1
    !AX8
    lda $2E
    inc $2D
    ldx $2D
    cpx #$02
    bne .E6AB

    ora #$02
    stz $2D
.E6AB:
    sta $07
    lda #$04 : sta $1D
    lda #!id_ghost_unformed : jsl prepare_object
    lda #$09 : jsl _019662
    clc
    adc $2E
    and #$01
    sta $2E
    jmp .E65C

;-----

.E6C7:
    !A16
    ldx.w stage
    dex
    bne .E6D9

    lda.w camera_x+1
    cmp #$0900
    bcc .E6F8

    bra .E6F2

.E6D9: ;not stage 2
    ldx $30
    bne .E6E7

    lda.w camera_y+1
    cmp #$0080
    bcs .E6F8

    inc $30
.E6E7:
    lda.w camera_x+1
    cmp #$02A0
    bcc .E6F8

    inc $1AD4 ;todo: type count array?
.E6F2:
    pla
    !A8
    jmp _0281A8_81B5

.E6F8:
    !A8
    rts
}

{ ;E6FB - E918
ghost:

.create:
    jsl set_hp
    stz $31
    stz $3A
    jsl get_arthur_relative_side : sta !obj_facing
    asl #3 : sta !obj_direction
    lda #$10 : sta $08
    ldy #$C4 : ldx #$21 : jsl set_sprite
    jsr _02E919_E929
    ldx.w difficulty
    lda.w ghost_data_wait_timer_forming,X : sta $37
.E725:
    brk #$00

;----- E727

    jsr _02E919
    jsl update_animation_normal
    dec $37
    bne .E725

    stz $08
    ldy #$C6 : ldx #$21 : jsl set_sprite
    lda.w stage
    dec
    bne .E745 ;skip pot creation if not stage 2

    jsr pot_creation_local
.E745:
    brk #$00

;----- E747

    jsr _02E919
    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .E745

    jsl _02F9DA_F9E0
    ldx.w difficulty
    lda.w ghost_data_wait_timer_begin,X
    jmp .E838

.E761:
    jsl set_direction32
    inc
    and #$1F
    lsr
    sta !obj_direction
    jsl get_arthur_relative_side
    cmp !obj_facing
    beq .E78D

    inc $31
    ldy #$C0 : ldx #$21 : jsl set_sprite
.E77D:
    brk #$00

;----- E77F

    lda $24
    cmp #$70
    bne .E77D

    lda !obj_facing : eor #$01 : sta !obj_facing
    bra .E761

.E78D:
    sta !obj_facing
    !A16
    lda !arthur_pos_x+1 : sta !obj_speed_x+1
    lda !arthur_pos_y+1 : sta !obj_speed_y+1
    !A8
    stz $31
    ldy #$BE : ldx #$21 : jsl set_sprite
    lda #!sfx_ghost_spawn : jsl _018049_8053
    stz $37
.E7AF:
    brk #$00

;----- E7B1

    ldx #$10 : jsl update_pos_xy_2
    jsr .E873
    !X8
    lda $37
    beq .E7AF

    lda #$01 : sta $35
    lda #$3C : sta $37
    lda #$06 : sta $38
    jsl get_rng_bool : tax
    lda.w ghost_data_CD60,X : sta $36
.E7D6:
    brk #$00

;----- E7D8

    ldx #$10 : jsl update_pos_xy_2
    dec $38
    bne .E803

    lda #$06 : sta $38
    inc $35
    lda !obj_direction
    cmp #$0C
    beq .E803

    lda !obj_facing
    asl #4
    adc $35
    adc $36
    tax
    lda.w ghost_data_CD62,X
    clc
    adc !obj_direction
    and #$0F
    sta !obj_direction
.E803:
    lda $35
    ldx #$12 : jsl _0189D9
    dec $37
    bne .E7D6

    inc $0F
    lda $0F
    cmp #$04
    beq .E861

.E817:
    brk #$00

;----- E819

    ldx #$10 : jsl update_pos_xy_2
    lda $35
    ldx #$12 : jsl _0189D9
    lda $02C3
    and #$03
    bne .E817

    dec $35
    bne .E817

    ldx.w difficulty
    lda.w ghost_data_wait_timer_next,X
.E838:
    sta $37
    lda #$00
    bra .E848

.E83E:
    brk #$00

;----- E840

    dec $38
    bne .E856

    lda $33
    eor #$03
.E848:
    sta $33 ;0 or 3
    clc
    adc #$2A
    tay
    jsl set_speed_y
    lda #$10 : sta $38
.E856:
    jsl update_pos_y
    dec $37
    bne .E83E

    jmp .E761

.E861:
    brk #$00

;----- E863

    ldx #$10 : jsl update_pos_xy_2
    lda $35
    ldx #$12 : jsl _0189D9
    bra .E861

;-----

.E873:
    lda !obj_direction
    and #$0E
    tax
    !X16
    jmp (+,X) : +: dw .E88D, .E896, .E899, .E8A2, .E8A5, .E8AE, .E8B1, .E8BA

;-----

.E88D:
    ldx !obj_pos_x+1
    cpx !obj_speed_x+1
    bcc .E895

    inc $37
.E895:
    rts

;-----

.E896:
    jsr .E88D
.E899:
    ldx !obj_pos_y+1
    cpx !obj_speed_y+1
    bcc .E8A1

    inc $37
.E8A1:
    rts

;-----

.E8A2:
    jsr .E899
.E8A5:
    ldx !obj_pos_x+1
    cpx !obj_speed_x+1
    bcs .E8AD

    inc $37
.E8AD:
    rts

;-----

.E8AE:
    jsr .E8A5
.E8B1:
    ldx !obj_pos_y+1
    cpx !obj_speed_y+1
    bcs .E8B9

    inc $37
.E8B9:
    rts

;-----

.E8BA:
    jsr .E88D
    jmp .E8B1

;-----

.destroy:
    ldy #$0F : jsl update_score
.E8C6
    ldy #$CC : ldx #$21 : jsl set_sprite
    lda #!sfx_ghost_destroy : jsl _018049_8053
.E8D4:
    brk #$00

;----- E8D6

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .E8D4

    jsr drop_pot_local
    jmp _0281A8_81B5

;-----

.thing:
    bit $09
    bvc .E903

    lda.w stage
    dec
    beq .E8F5

    lda $1AD4
    bne .E909

.E8F5:
    ldy #$82 : jsr pot_spawn_offset_local
    jsl update_animation_normal
    jsl _0296FE
    rts

.E903:
    jsr _028D09_local
    jmp _0281BB

.E909:
    !A16
    lda #.E8C6 : sta !obj_state+1
    !A8
    lda $09 : and #$7F : sta $09
.E918:
    rts
}

{ ;E919 - E93B
_02E919: ;functions shared between ghost and ghost_unformed
    lda.w stage
    dec
    beq ghost_E918

    lda $1AD4
    beq ghost_E918

    pla : pla
    jmp _0281A8_81B5

;-----

.E929:
    !A16
    lda #$0170
    ldx.w stage
    dex
    beq .E937

    lda #$0120
.E937:
    sta $29
    !A8
    rts
}

{ ; E93C - E9F9
ghost_unformed:

.create: ;TODO
    lda $07
    tax ;x = $07
    asl
    sta $07
    asl
    adc $07
    sta $07 ;$07 *= 6
    ldy.w ghost_data_CDB1,X
    lda.w ghost_data_CDB5,X : sta $08
    lda.w stage
    dec
    bne .E957

    inx #2
.E957:
    lda.w ghost_data_CDB9,X : sta $09
    jsl set_speed_x
    stz $2D
    jsl get_arthur_relative_side : sta !obj_direction : sta !obj_facing
    ldy #$C8 : ldx #$21 : jsl set_sprite
    jsr _02E919_E929
    lda #$01 : sta $2D
    ldx #$88 : jsl _0196EF
    clc
    adc #$78
    sta $2E
.E984:
    brk #$00

;----- E986

    jsr _02E919
    jsl update_animation_normal
    jsl update_pos_xy
    dec $2E
    beq .E9C1

.E995:
    dec $2D
    bne .E99C

    jsr .E9A1
.E99C:
    jsr _028074
    bra .E984

;-----

.E9A1:
    clc
    lda $2D
    tay
    adc $07
    tax
    lda.w ghost_data_CDBF+0,X : sta $2D
    ldy.w ghost_data_CDBF+1,X : jsl set_speed_y
    lda $2D
    inc #2
    cmp #$05
    bcc .E9BE

    lda #$00
.E9BE:
    sta $2D
.destroy:
.thing:
    rts

;-----

.E9C1:
    ldy.w difficulty
    ldx.w ghost_data_CD5C,Y
    !A16
    lda.w camera_x+1
    cmp #$0500
    bcc .E9DA

    ldx #$00
    cmp #$0700
    bcc .E9DA

    ldx #$01
.E9DA:
    !A8
    cpx $1AF8
    bcc .E995

    beq .E995

    lda !open_object_slots
    cmp #$02
    bcc .E995

    inc $1AF8
    lda #$04 : sta $1D
    lda #!id_ghost : jsl prepare_object
    jmp _0281A8_81B5
}

{ ;E9FA - EA1B
_02E9FA:
    jsr .local
    rtl

.local: ;a8 x16
    ;create object, store offsets of other objects
    sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda $07 : sta $0007,X
    !A16
    lda !slot_list_objects-4,Y : sta $002F,X
    lda !slot_list_objects-0,Y : sta $002D,X
    !A8
    rts
}

{ ;EA1C - EA36
    ;unused
    !AX16
    ldx $2F
    lda.w !obj_pos_x+1,X : sta !obj_pos_x+1
    lda.w !obj_pos_y+1,X : sta !obj_pos_y+1
    !AX8
    lda.w !obj_pos_x+0,X : sta !obj_pos_x+0
    lda.w !obj_pos_y+0,X : sta !obj_pos_y+0
    rts
}

{ ;EA37 - EA51
    ;unused
    !AX16
    ldx $2F
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    !AX8
    lda !obj_pos_x+0 : sta.w !obj_pos_x+0,X
    lda !obj_pos_y+0 : sta.w !obj_pos_y+0,X
    rts
}

{ ;EA52 - EA82
    ;unused
    sta $0000
    jsl get_object_slot
    bmi .EA82

    lda $0000 : sta $0006,X
    lda #$0C : sta $0000,X
    jsl set_spawn_offset
    lda !obj_direction : sta.w !obj_direction,X
    lda !obj_facing : sta.w !obj_facing,X
    lda $07 : sta $0007,X
    lda $0F : sta $000F,X
    !AX8
    lda #$00
.EA82:
    rtl
}

{ ;EA83 - EAC1
bat_spawner:

.create:
    inc.w obj_type_count+!id_bat_spawner
    stz.w bat_count
.EA89:
    brk #$00

;----- EA8B

    lda $07 : asl : tax
    !A16
    lda.w bat_spawner_data_x_pos_threshold,X : sta $31
    lda !arthur_pos_x+1
    sbc $31
    bcs .EAB9

    !A8
    ldx $07
    lda.w bat_spawner_data_spawn_limit,X : sta $2F
    lda.w bat_count
    cmp $2F
    bcs .EA89

    lda #!id_bat : jsl prepare_object
if !version == 0 || !version == 1
    lda #$7F : cop #$00
elseif !version == 2
    lda #$C0 : cop #$00
endif

;----- EAB7

    bra .EA89

.EAB9:
    !A8
    jmp _0281A8_81B5

;-----

.thing: ;unused?
    rts

;-----

.destroy: ;unused?
    jmp _0281A8_81B5
}

{ ;EAC2 - EB56
bat:

.create:
    jsr pot_creation_local
    inc.w bat_count
    ldx #$76 : jsl _0196EF
    beq .EAE1

    stz !obj_facing
    !A16
    lda.w camera_x+1 : clc : adc #$0110 : sta !obj_pos_x+1
    !A8
    bra .EAF2

.EAE1:
    lda #$01 : sta !obj_facing
    !A16
    lda.w camera_x+1 : clc : adc #$0002 : sta !obj_pos_x+1
    !A8
.EAF2:
    ldx #$78 : jsl _0196EF
    clc
    adc.w camera_y+1
    sta !obj_pos_y+1
    lda #$00 : adc.w camera_y+2 : sta !obj_pos_y+2
    ldy #$EE : ldx #$21 : jsl set_sprite
    sta $09
    lda #$80 : sta $09
    jsl set_direction32 : sta !obj_direction
    jsl set_hp
.EB1D:
    !A8
    brk #$00

;----- EB21

    ldx #$46 : jsl update_pos_xy_2
    !A16
    lda $09
    and #$0040
    bne .EB1D

    !A8
    dec.w bat_count
    jsr _028D09_local
    jmp _0281A8_81B5

;-----

.thing:
    ldy #$86 : jsr pot_spawn_offset_local
    jsl update_animation_normal
    jsr _02FA37_FA6D
    jsr _02FB62_FB69
    jsr _02FD62_FD7C
    rts

;-----

.destroy:
    dec.w bat_count
    jsr drop_pot_local
    jmp _028BEC
}

{ ;EB57 - EB7D
_02EB57: ;a8 x16
    sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda $0F : sta $000F,X
    lda $07 : sta $0007,X
    !A16
    lda !slot_list_objects+0,Y : sta $002F,X
    lda !slot_list_objects+4,Y : sta $002D,X
    !A8
    rts

.far:
    jsr _02EB57
    rtl
}

{ ;EB7E - EB8E
_02EB7E: ;a- x-
    !AX16
    ldx $2D
    lda.w !obj_pos_x+1,X : sta !obj_pos_x+1
    lda.w !obj_pos_y+1,X : sta !obj_pos_y+1
    !AX8
    rts
}

{ ;EB8F - EBA7
_02EB8F: ;a- x-
    !A16
    lda !obj_pos_x+1 : sta $1EC0
    lda !obj_pos_y+1 : sta $1EC3
    !A8
    lda !obj_pos_x+0 : sta $1EBF
    lda !obj_pos_y+0 : sta $1EC2
    rts
}

{ ;EBA8 - EBC0
_02EBA8: ;a- x-
    !A16
    lda $1EC0 : sta !obj_pos_x+1
    lda $1EC3 : sta !obj_pos_y+1
    !A8
    lda $1EBF : sta !obj_pos_x+0
    lda $1EC2 : sta !obj_pos_y+0
    rts
}

{ ;EBC1 - EBC7
_02EBC1:
    lda #!id_key : jsl prepare_object
    rtl
}

{ ;EBC8 - EE44
key:

.create:
    !AX8
    lda #$90 : sta $09
    ldy #$FA : ldx #$20 : jsl set_sprite
    stz !obj_facing
    lda $08 : ora #$03 : sta $08
    stz $0000
    lda.w stage
    cmp #$08
    bne .EBF7

    stz $0000
    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    bne .EBF7

    inc $0000
.EBF7:
    lda.w stage
    clc
    adc $0000
    asl #2
    tax
    stz $37
    stz $3A
    !A16
    lda.w key_data_CE81,X : sta $38
    inx #2
    lda.w key_data_CE81,X : sta $3B
    lda.w #key_data_CEA9 : sta $13
    lda.w _00ED00+$2C : sta $27
    lda #$00BC : sta $29
    !A8
    stz $15
    stz $32
    sec
    lda $3A : sbc !obj_pos_y+0 : sta $35
    lda $3B : sbc !obj_pos_y+1 : sta $36
    lda $3C : sbc !obj_pos_y+2 : sta $0001
    bcs .EC54

    ;unused branch? what does it do?
    sec
    lda !obj_pos_y+0 : sbc $3A : sta $35
    lda !obj_pos_y+1 : sbc $3B : sta $36
    lda !obj_pos_y+2 : sbc $3C : sta $0001
    inc $32
.EC54:
    stz $31
    sec
    lda $37 : sbc !obj_pos_x+0 : sta $33
    lda $38 : sbc !obj_pos_x+1 : sta $34
    lda $39 : sbc !obj_pos_x+2 : sta $0000
    bcs .EC82

    sec
    lda !obj_pos_x+0 : sbc $37 : sta $33
    lda !obj_pos_x+1 : sbc $38 : sta $34
    lda !obj_pos_x+2 : sbc $39 : sta $0000
    inc $31
.EC82:
    !A16
    lda $0000
    lsr
    lda $33
    ror
    lsr #5
    sta $33
    bne .EC99

    lda #$0001 : sta $33
.EC99:
    lda $0001
    lsr
    lda $35
    ror
    lsr #5
    sta $35
    bne .ECAE

    lda #$0001 : sta $35
.ECAE:
    !A8
    lda #$FF : sta $26
    brk #$00

;----- ECB6

    jsl get_object_slot
    bmi .ECAE

    !X16
    stx $2D
    stz $0007,X
    lda #!id_key_message : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    !X8
    ldy #$2C : jsl set_speed_xyg
    stz $0F
.ECD7:
    brk #$00

;----- ECD9

    jsl update_animation_normal
    jsl _018E32_8E73
    lda $0F
    cmp #$07
    beq .ECD7

    lda $31
    bne .ED00

    clc
    lda !obj_pos_x+0 : adc $33  : sta !obj_pos_x+0
    lda !obj_pos_x+1 : adc $34  : sta !obj_pos_x+1
    lda !obj_pos_x+2 : adc #$00 : sta !obj_pos_x+2
    bra .ED13

.ED00:
    sec
    lda !obj_pos_x+0 : sbc $33  : sta !obj_pos_x+0
    lda !obj_pos_x+1 : sbc $34  : sta !obj_pos_x+1
    lda !obj_pos_x+2 : sbc #$00 : sta !obj_pos_x+2
.ED13:
    lda $32
    bne .ED2C

    clc
    lda !obj_pos_y+0 : adc $35  : sta !obj_pos_y+0
    lda !obj_pos_y+1 : adc $36  : sta !obj_pos_y+1
    lda !obj_pos_y+2 : adc #$00 : sta !obj_pos_y+2
    bra .ED3F

.ED2C: ;unused branch? gets reached if previous unused(?) branch is taken
    sec
    lda !obj_pos_y+0 : sbc $35 : sta !obj_pos_y+0
    lda !obj_pos_y+1 : sbc $36 : sta !obj_pos_y+1
    lda !obj_pos_y+2 : sbc #$00 : sta !obj_pos_y+2
.ED3F:
    jsl update_pos_xyg_add
    lda $1B
    bmi .ECD7

    !A16
    lda !obj_pos_y+1
    sec
    sbc $3B
    !A8
    bcs .ED55

    jmp .ECD7

.ED55:
    lda #$07 : sta $0F
    jmp .ECD7

;-----

.thing:
    lda.w jump_counter
    bne .ED8A

    lda $0F
    cmp #$07
    bne .ED8A

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .ED8A

    lda !arthur_hp
    bmi .ED8A

    inc $1F9E
    jsl _01DDAE
    lda.w stage : asl : tax
    jsr (.ED8B,X)
    lda #$8C : sta !obj_active
    lda $09 : and #$7F : sta $09
.ED8A:
    rts

.ED8B: dw .ED9D, .ED9E, .ED9D, .ED9D, .ED9D, .ED9D, .EDB5, .EDB5, .EDA7

;-----

.ED9D:
    rts

;-----

.ED9E:
    ldy #$90 : lda.b #_01FF00_44 : jsl _01A6FE
    rts

;-----

.EDA7:
    lda.w loop
    beq .EDBB

    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    bne .EDBB

.EDB5:
    lda #!id_gate2 : jsl prepare_object
.EDBB:
    rts

;-----

.destroy:
    lda.w stage
    cmp #$08
    bne .EDE4

    lda.w loop
    beq .EDD1

    lda $14D3
    and #$0E
    cmp #!weapon_bracelet
    beq .EDE4

.EDD1:
    !AX16
    ldy $2D : jsr remove_child_object
    !AX8
    lda #!id_princess_dialogue : jsl prepare_object
    jml _0281A8_81B5

.EDE4:
    !AX16
    ldy $2D : jsr remove_child_object
    !AX8
    lda.w p1_button_hold+1
    and #!up
    beq .EE0D

    ;nice catch
    jsl get_object_slot
    !X16
    stx $2D
    lda #$02 : sta $0007,X
    lda #!id_key_message : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    !X8
.EE0D:
    jsl get_object_slot
    !X16
    stx $2D
    lda #$01 : sta $0007,X
    lda #!id_key_message : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    !X8
    ldy #$57 : jsl update_score
    lda #$72 : sta $1D
    lda.w stage
    beq .EE3C

    cmp #$05
    beq .EE3C

    jmp _0281A8_81B5

.EE3C:
    lda #!id_gate : jsl prepare_object
    jmp _0281A8_81B5
}

{ ;EE45 - EEE9
key_message:

.create:
    !AX8
    lda #$01 : sta $1F9B
    lda $07
    bne .EE70

    jsl _0190F1 ;get grayscale palette? not used here?
    !A16
    lda #$0004 : sta $0000
    ldx #$00
    lda #$FFFF
.EE61:
    lda _04984F_9879+$06,X : sta $7EF5A0,X ;palette
    inx #2
    dec $0000
    bne .EE61

.EE70:
    !A16
    lda.w camera_x+1 : clc : adc #$0080 : sta !obj_pos_x+1
    lda.w camera_y+1 : clc : adc #$0060 : sta !obj_pos_y+1
    lda.w _00ED00+$28 : sta $27
    lda #$0180 : sta $29
    !A8
    lda #$00 : jsl _018E32_8E81
    lda #$80 : sta $09
    lda #$FF : sta $26
    lda $07
    beq .EEBE

    cmp #$01
    beq .EEB4

    lda #$60 : sta !obj_pos_y+1
    ldy #$64 : ldx #$20 : jsl set_sprite
    bra .EEC6

.EEB4:
    ldy #$F6 : ldx #$20 : jsl set_sprite
    bra .EEC6

.EEBE:
    ldy #$F8 : ldx #$20 : jsl set_sprite
.EEC6:
    !A16 ;does nothing
.EEC8:
    brk #$00

;----- EECA

    lda.w camera_x+1 : clc : adc #$0080 : sta !obj_pos_x+1
    lda.w camera_y+1 : clc : adc #$0060 : sta !obj_pos_y+1
    bra .EEC8

;-----

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    rts

;-----

.destroy: ;unused
    jmp _0281A8_81B5
}

{ ;EEEA - EF02
    ;unused
    ldy #$94 : ldx #$22 : jsl set_sprite
    ldy #$FC : jsl set_speed_xyg
.EEF8:
    brk #$00

;----- EEFA

    jsl update_pos_xyg_add
    jsr _028074
    bra .EEF8
}

{ ;EF03 -
flower_projectile:

.create:
    ldy #$90 : ldx #$22
    lda.w stage
    cmp #$03
    bne .EF12

    ldy #$BA : ldx #$21
.EF12:
    jsl set_sprite
    stz $31
.EF18:
    brk #$00

;----- EF1A

    jsl update_animation_normal
    lda $31
    bpl .EF25

    jmp _0281A8_81B5
.EF25:
    beq .EF18

    ldy #$96 : ldx #$22
    lda.w stage
    cmp #$03
    bne .EF36

    ldy #$C0 : ldx #$21
.EF36:
    jsl set_sprite
    lda $08 : and #$F8 : sta $08
    lda $09 : ora #$C0 : and #$CF : sta $09
    jsl _01918E_set_direction16 : sta !obj_direction
.EF4E:
    brk #$00

;----- EF50

    ldx #$0A : jsl update_pos_xy_2
    jsl update_animation_normal
    bra .EF4E

;-----

.thing:
    ldy #$00 : jsr _02FF22
    jsr _02FA37_FA65
    jsr _02FD62_FD7C
    jmp _028074_8087
}

{ ;EF6A - EFD1
flower_bud:

.EF6A:
    jmp _0281A8_81B5
.create:
    lda $0292
    bne .EF6A

    brk #$00

;----- EF74

    lda.w stage
    beq .EF81

    ldy #$02 : jsl arthur_range_check_y
    bcs .create

.EF81:
    brk #$00

;----- EF83

    lda $07 : asl : jsl _0195E4
    bcc .create

    !X16
    lda $07 : sta $2D
    stz $2E
    jsr _028B1E_8B24
    lda #!id_flower_head : jsr _02E9FA_local
    jsr .EFC3
.EF9F:
    clc
    lda $07 : adc #$10 : sta $07
    jsr _028B1E_8B24
    lda #!id_flower_part : jsr _02E9FA_local
    jsr .EFC3
    lda $2E
    eor #$01
    sta $2E
    sta.w !obj_direction,X
    dec $2D
    bne .EF9F

    !X8
    jmp _0281A8_81B5

;-----

.EFC3:
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    !A8
    rts
}

{ ;EFD2 - F13D
flower_head:

.create:
    jsr _02F13E_F15F
    jsl set_hp
    ldx.w stage
    cpx #$06
    bne .EFE7

    clc
if !version == 0 || !version == 1
    lda #$0C : adc !obj_hp : sta !obj_hp
elseif !version == 2
    lda #$04 : adc !obj_hp : sta !obj_hp
endif
.EFE7:
    stz $31
    stz $32
    stz $34
    stz $35
    stz $36
    stz $0F
    ldy #$8C : ldx #$22 : jsl set_sprite
    lda #$01 : sta !obj_direction
    stz !obj_facing
.F001:
    brk #$00

;----- F003

    lda $32
    beq .F001

    ldy #$8E : ldx #$22 : jsl set_sprite
.F00F:
    brk #$00

;----- F011

    jsl update_animation_normal
    lda $31
    beq .F00F

    lda #$08 : sta $33
    ldy #$0C : jsl set_speed_y
    ldy #$21 : jsl set_speed_x
    inc $34
.F02B:
    jsl update_pos_y
    brk #$00

;----- F031

    lda $31 ;keep rising until $31 is 0
    bne .F02B

    inc $0F
.F037:
    jsl get_object_slot
    bmi .F0A6

    stz !obj_direction
    lda #$01 : sta $3C
    stx $35
    !A16
    ldy $2D
    lda.w !obj_pos_x+1,Y : sta $13
    sec
    lda.w !obj_pos_y+1,Y : sbc #$0008 : sta $27
    !A8
    lda $08 : and #$07 : dec : sta $0008,X
    lda $09 : and #$30 : sta $0009,X
    lda #!id_flower_projectile : jsl prepare_object_8C37
    stz $34
    lda #$01 : sta $3D ;speed up rotation
.F074:
    brk #$00

;----- F076

    jsr .F0B1
    !AX16
    ldx $35
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    !A8
    lda $3C
    cmp #$68
    bcc .F074

    inc $0031,X
    !X8
    lda #$FF : sta $3D ;slow down rotation
.F098:
    brk #$00

;----- F09A

    jsr .F0B1
    lda $3C
    dec
    bne .F098

    inc $34
    stz !obj_direction
.F0A6:
    ldx #$B2 : jsl _0196EF : cop #$00

;----- F0AE

    jmp .F037

;-----

.F0B1:
    !AX8
    jsl update_animation_normal
    !A16
    lda $13 : sta !obj_pos_x+1
    lda $27 : sta !obj_pos_y+1
    !A8
    stz !obj_pos_x
    stz !obj_pos_y
    clc
    lda $3C : adc $3D : sta $3C
    inc !obj_direction
    lda !obj_direction : and #$1F : sta !obj_direction
    ldx #$16
    lda $3C : jsl _0189D9 ;3C = multiplicand
    rts

;-----

.thing:
    lda $34
    beq .F0EA

    jsr _02F13E
    jsl update_animation_normal
.F0EA:
    lda !obj_gravity
    cmp.w current_cage
    bne .F0FB

    lda $0F : asl : tax
    jsr (.F133,X)
    jsr _02FD62_FD7C
.F0FB:
    lda $02C3
    and #$07
    bne .F130

    jsl get_arthur_relative_side : sta !obj_facing
    !A16
    lda.w stage
    beq .F11A

    clc
    lda.w camera_y+1
    adc #$0120
    cmp !obj_pos_y+1
    bcc .F126

.F11A:
    sec
    lda.w camera_x+1
    sbc #$0040
    sec
    sbc !obj_pos_x+1
    bmi .F130

.F126:
    !A8
    jsr _02F13E_F151
    lda $07 : jmp _028B36_local

.F130:
    !A8
    rts

;-----

.F133: dw _02FB9C_FBC0, .F137

;-----

.F137:
    jsr _02FC0E
    jsr _02F9FA_F9FE
    rts
}

{ ;F13E -
;various flower functions

_02F13E:
    jsl update_pos_x
    dec $33
    bne .F150

    lda !obj_direction : eor #$01 : sta !obj_direction
    lda #$10 : sta $33
.F150:
    rts

;-----

.F151:
    !X16
    ldx $35
    beq .F15C

    lda #$FF : sta $0031,X
.F15C:
    !X8
    rts

;-----

.F15F:
    !X16
    ldx #$A006
    lda !obj_pos_x+1 : and #$03 : sta !obj_gravity
    bne .F16F

    ldx #$8002
.F16F:
    stx $08
    !X8
    rts
}

{ ;F174 - F2A8
flower_part:

.create:
    jsr _02F13E_F15F
    lda $07
    stz $0F
    pha
    and #$0F
    sta $38
    pla
    lsr #4
    cmp $38
    bne .F18B

    inc $0F
.F18B:
    stz $31
    stz $32
    lda #$08 : sta $33
    ldy #$0C : jsl set_speed_y
    ldy #$21 : jsl set_speed_x
    lda $0F
    asl
    tax
    jmp (+,X) : +: dw .F1AA, .F1CD

;-----

.F1AA:
    brk #$00

;----- F1AC

    lda $32 ;wake up bool?
    beq .F1AA

    jsr .F256
.F1B3:
    brk #$00

;----- F1B5

    lda $31
    beq .F1B3

.F1B9:
    jsl update_pos_y
    jsr _02F13E
    brk #$00

;----- F1C2

    lda $31
    bne .F1B9

.F1C6:
    jsr _02F13E
    brk #$00

;----- F1CB

    bra .F1C6

;-----

.F1CD:
    brk #$00

;----- F1CF

    !A16
    lda.w #_00CEB6 : sta $13
    !A8
    stz $15
    ldy #$B4    ;bug: should be ldx!
    jsl _0196EF ;x will always be 8 for this call!
    sta $2D     ;possible values: 2, 4, 6
.F1E2:
    brk #$00

;----- F1E4

    ;intended ranges: $006E, $0060, $0080, $0020
    ;possible ranges: $0200, $0040, $0090
    ldy $2D : jsl arthur_range_check_x
    bcs .F1E2

    jsr .F256
    !X16
    lda $38 : sta $3B
    ldy $2F
.F1F7:
    tyx
    inc $0032,X
    ldy $002F,X
    dec $3B
    bne .F1F7

    stx $39
    !X8
    ldx #$5C : jsl _0196EF
    cop #$00

;----- F20E

    lda #!sfx_grow : jsl _018049_8053
    !X16
    lda $38 : sta $3B
    ldx $39
    inc $0031,X
    ldy $002D,X
    sty $39
    lda #$10 : cop #$00

;----- F228

    dec $3B
.F22A:
    ldx $39
    inc $0031,X
    ldy $002D,X
    sty $39
    lda #$13 : cop #$00

;----- F238

    dec $3B
    bne .F22A

    ldy $2F
    lda $38 : sta $3B
.F242:
    tyx
    stz $0031,X
    ldy $002F,X
    dec $3B
    bne .F242

    !X8
.F24F:
    brk #$00

;----- F251

    jsr _02F13E
    bra .F24F

;-----

.F256:
    ldy #$92 : ldx #$22 : jsl set_sprite
    rts

;-----

.thing:
    lda !obj_gravity ;not used as gravity
    cmp.w current_cage
    bne .F26C

    jsr _02FB9C_FBC0
    jsr _02FD62_FD7C

.F26C:
    jsl update_animation_normal
    lda $07
    beq + : +: ;leftover branch
    rts

;-----

.head_destroy:
    jsr _02F13E_F151
    jsr _028BDE_local
    lda $07
    ldy #$08 : ldx #$08 : jsr _028B7E
    bra .F28A

.destroy:
    lda $31 : cop #$00
.F28A:
    lda #$3B : jsl _018049_8053
    ldy #$76 : ldx #$20 : jsl set_sprite
    lda #$1F : sta $2D
.F29C:
    brk #$00

;----- F29E

    jsl update_animation_normal
    dec $2D
    bne .F29C

    jmp _0281A8_81B5
}

{ ;F2A9 - F2F1
coffin_dirt: ;a8 x8

.create:
    ldy #$B8 : ldx #$21
    lda $2F
    beq +

    ldy #$AE : ldx #$21
+:
    jsl set_sprite
    ldx $2F
    lda.w coffin_dirt_data_burrow_timer,X : sta $30
.F2C0:
    ldy #$10
    !X16
    ldx $2D
    lda $003D,X ;check if parent object (zombie) is removed
    bne .F2ED

    !A16
    jsl _018CB3_8CD6
    !AX8
    jsl update_animation_normal
    brk #$00

;----- F2D9

    dec $30 ;burrow timer
    bne .F2C0

    lda $2F
    bne .F2ED

    ldy #$A8 : ldx #$21 : jsl set_sprite
    lda #$0A : cop #$00

;----- F2ED

.F2ED:
    !AX8
    jmp _0281A8_81B5
}

{ ;F2F2 - F370
pot: ;a8 x8

.create:
    brk #$00

;----- F2F4

    lda $39 ;attached_to_parent
    beq .create

    lda #$02 : sta $08
    ldy #$36 : ldx #$20 : jsl set_sprite ;pot sprite
.F304:
    brk #$00

;----- F306

    lda $3A ;pot_dropped
    beq .F304

    lda.w stage
    cmp #$04 ;stage 4, raft section
    beq .F339

    cmp #$01 ;stage 2
    bne .F31A

    lda.w checkpoint ;raft section
    bne .F339

.F31A:
    lda.b #pot_data_CEBC    : sta $13
    lda.b #pot_data_CEBC>>8 : sta $14
    stz $15
    ldy #$11 : jsl set_speed_xyg
.F32A:
    brk #$00

;----- F32C

    jsr _028074
    jsl update_pos_xyg_add
    jsl _01A559
    beq .F32A

.F339: ;open pot
    lda #$0F : sta $2D
    ldy #$5C : ldx #$20 : jsl set_sprite
.F345:
    brk #$00

;----- F347

    jsl update_animation_normal
    dec $2D
    bne .F345

    lda #$04 : sta $1D
    lda #!id_weapon
    ldx $07
    bmi .F35D ;branch if weapon

    lda #!id_point_statue
    bra .F35F

.F35D:
    dec $07
.F35F:
    ldx $07
    phx
    jsr _0280E9
    sta !obj_type
    plx
    stx $07
    lda #$0C : sta !obj_active
    jmp _02821B_827A
}

{ ;F371 - F410
point_statue: ;a8 x8

.create:
    inc.w point_statue_count
    ldx $07
    lda.w pot_data_graphics_offset-1,X : ldy #$00 : ldx #$20 : jsl set_sprite_8480
    lda $08 : ora #$20 : sta $08
    lda $09 : and #$30 : ora #$10 : sta $09
    lda $07
    cmp #$03
    beq + : +: ;probably disabled branch

.F395:
    brk #$00

;----- F397

    !A16
    lda !obj_pos_x+1
    cmp.w screen_boundary_left
    !A8
    bcs .F3A8

    dec.w point_statue_count
    jmp _0281A8_81B5

.F3A8:
    lda !arthur_hp
    bmi .F395

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .F395

    lda #$30 : jsl _018049_8053 ;pickup sfx
    lda $08 : and #$F8 : sta $08
    lda $07 : asl : tax
    jmp (.F3C5-2,X) : .F3C5: dw .F3CB, .F3E3, .F3FB

;-----

.F3CB: ;statue
    ldy #$0F : jsl update_score
    ldy #$30 : ldx #$20 : jsl set_sprite
    lda #$7E : cop #$00

;----- F3DD

    dec.w point_statue_count
    jmp _0281A8_81B5

;-----

.F3E3: ;armor statue
    ldy #$27 : jsl update_score
    ldy #$34 : ldx #$20 : jsl set_sprite
    lda #$7E : cop #$00

;----- F3F5

    dec.w point_statue_count
    jmp _0281A8_81B5

;-----

.F3FB: ;1up
    jsl add_extra_life
    ldy #$C2 : ldx #$20 : jsl set_sprite
    lda #$7E : cop #$00

;----- F40B

    dec.w point_statue_count
    jmp _0281A8_81B5
}

{ ;F411 - F542
mimic:

.create:
    ldx #$03 : jsl _018D5B
    jsl set_hp
    lda.w stage
    cmp #$08
    bne .F427

    clc
    lda !obj_hp : sta !obj_hp ;does nothing. maybe stage 7 mimics were meant to have more hp at some point?
.F427:
    ldy #$F4 : ldx #$21 : jsl set_sprite
    lda #$D0 : sta $09
    !A16
    lda.w _00ED00+$4A : sta $27
    lda.w #mimic_data_CEC3 : sta $13
    !A8
    lda #$04 : sta $1D
    lda #$FF : sta $26
    jsr .F53A
.F44C:
    brk #$00

;----- F44E

    ldy #$18 : jsl _0192AD
    bcs .F44C

.F456:
    lda.w stage
    dec
    beq .F477

    ;stage 7
.F45C:
    !A8
    brk #$00

;----- F460

    !A16
    clc
    lda.w camera_y+1
    adc #$0080
    sec
    sbc !obj_pos_y+1
    clc
    adc #$00C0
    cmp #$0180
    bcs .F45C

    sep #$20

.F477:
    lda #!sfx_mimic_shake : jsl _018049_8053
    ldy #$F6 : ldx #$21 : jsl set_sprite
    lda #$40 : cop #$00

;----- F489

    lda #!sfx_mimic_jump : jsl _018049_8053
    ldy #$F8 : ldx #$21 : jsl set_sprite
    ldy #$13 : jsl set_speed_xyg
.F49D:
    brk #$00

;----- F49F

    jsr .F4EF
    beq .F49D

    lda #$02 : sta $0F
    lda !obj_facing : asl ;does nothing
    ldy #$FA : ldx #$21 : jsl set_sprite_8482
    lda #$04 : sta $2E
.F4B7:
    ldy #$1D : jsl set_speed_xyg
.F4BD:
    brk #$00

;----- F4BF

    jsr .F4EF
    beq .F4BD

    dec $2E
    bne .F4B7

    bit $09
    bvc .F4D2

    lda #!id_mimic_ghost : jsl prepare_object
.F4D2:
    stz $0F
    ldy #$00 : ldx #$22 : jsl set_sprite
    lda #$3F : cop #$00

;----- F4E0

    ldy #$F4 : ldx #$21 : jsl set_sprite_8482
    lda #$78 : cop #$00

;----- F4EC

    jmp .F456

;-----

.F4EF:
    jsl update_pos_xyg_add
    lda !obj_speed_y+2
    bmi .F4FC

    jsl _01A559
    rts

.F4FC:
    lda #$00
    rts

;-----

.thing:
    jsl get_arthur_relative_side : sta !obj_facing
    jsl update_animation_normal
    ldx $3C : jsl _018E32
    jsr _02FD62_FD7C
    ldx $0F
    jsr (.F52F,X)
    lda.w camera_x+2
    beq .F52E

    !A16
    sec
    lda.w camera_x+1
    sbc #$00A0
    cmp !obj_pos_x+1
    !A8
    bcc .F52E

    jmp _0281BB

.F52E:
    rts

.F52F: dw _02FB9C_FBC0, .F533

;-----

.F533:
    jsr _02FC0E
    jsr _02F9FA_F9FE
    rts

;-----

.F53A: ;also used by mimic_ghost
    ldx.w stage
    lda.w mimic_data_CEC7,X : sta $3C
    rts
}

{ ;F543 - F597
mimic_ghost:

.create:
    ldx #$04 : jsl _018D5B
    lda #$C0 : sta $09
    ldy #$FE : ldx #$21 : jsl set_sprite
    !A16
    lda.w _00ED00+$4C : sta $27
    !A8
    lda #$FF : sta $26
    jsr mimic_F53A
    jsl set_direction32
    sta !obj_direction
    stz !obj_facing
    clc
    adc #$08
    and #$1F
    cmp #$11
    bcc .F578

    inc !obj_facing
.F578:
    brk #$00

;----- F57A

    ldx #$34 : jsl update_pos_xy_2
    bra .F578

;-----

.thing:
    jsl update_animation_normal
    ldx $3C : jsl _018E32
    jsr _02FD62_FD7C
    jsr _02FB62_FB69
    jsr _02F9FA_F9FE
    jmp _028074_8087
}

{ ;F598 - F5B1
_02F598:
    ;unused
    jsr _02812E
    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$01 : sta !obj_facing
.F5A7:
    brk #$00

;----- F5A9

    jsl update_animation_normal
    jsr _028074
    bra .F5A7
}

{ ;F5B2 - F6C5
rotating_platform:

.create:
    lda #$01 : sta $08
    lda #$80 : sta $09
    stz $2D
    !A16
    lda.w _00ED00+$38 : sta $27
    lda #$01D8 : sta $29
    !A8
    lda #$FF : sta $26
.F5CE:
    ldy #$C4 : ldx #$21 : jsl set_sprite
.F5D6:
    brk #$00

;----- F5D8

    lda $2D
    bne .F5D6

    lda #$09 : jsr _02FE1E_local
    bit $09
    bvc .F5D6

    lda $07
    cmp $1F93
    bne .F5D6

    lda !arthur_hp
    bmi .F5D6

    lda.w jump_counter
    bne .F5D6

    lda $14C3
    beq .F5D6

    ldy #$18 : jsl arthur_range_check
    bcs .F5D6

    inc $2D
    lda.b #_01DDFC    : sta !arthur_state+1
    lda.b #_01DDFC>>8 : sta !arthur_state+2
    inc $14F5
    lda $0276 : ora #$04 : sta $0276
    lda !slot_arthur+$08 : ora #$80 : sta !slot_arthur+$08
    ldy #$C6 : ldx #$21 : jsl set_sprite
    !A16
    lda !obj_pos_x+1 : sta !arthur_pos_x+1
    !A8
    lda #$1F : cop #$00

;----- F537

    ldx #$03
    lda $07
    cmp #$01
    bne .F641

    ldx #$02
.F641:
    stx $19E9
    asl
    tax
    lda.w rotating_platform_data_CED0+0,X : sta $1F92
    lda.w rotating_platform_data_CED0+1,X : sta $1F91
    lda #$02 : sta $1F94
    lda #$5B : jsl _018049_8053
.F65D:
    brk #$00

;----- F65F

    !A16
    lda !arthur_pos_x+1 : sta !obj_pos_x+1
    clc : lda !arthur_pos_y+1 : adc #$0018 : sta !obj_pos_y+1
    !A8
    lda $1F91
    bne .F65D

    inc $1F93
    lda #$5C : jsl _018049_8053
    ldy #$C8 : ldx #$21 : jsl set_sprite
    lda #$1F : cop #$00

;----- F68B

    lda !arthur_hp
    bmi .F6A1

    lda !armor_state : asl : tax
    lda.w rotating_platform_data_CED8+0,X : sta !arthur_state+1
    lda.w rotating_platform_data_CED8+1,X : sta !arthur_state+2
.F6A1:
    lda $0276 : and #$FB : sta $0276
    stz $14F5
    jmp .F5CE

;-----

.thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    lda $1F91
    bne .F6C5

    lda $2D
    beq .F6C5

    lda #$09 : jsr _02FE1E_local
.F6C5:
    rts
}

{ ;F6C6 - F7BE
stage4_transform:

.create:
    lda #$80 : sta $08
    !X16
.F6CC:
    brk #$00

;----- F6CE

    ldx !arthur_pos_x+1
    cpx #$01C0
    bcc .F6CC

    jsr .F71A
.F6D9:
    brk #$00

;----- F6DB

    lda $1F2B
    cmp #$20
    bne .F6D9

    ldx !arthur_pos_x+1
    cpx #$0300
    bcs .F6D9

    jsr .F71A
.F6ED:
    brk #$00

;----- F6EF

    lda $1F2B
    cmp #$80
    bne .F6ED

    ldx !arthur_pos_x+1
    cpx #$0100
    bcs .F6ED

    jsr .F71A
.F701:
    brk #$00

;----- F703

    lda $1F2B
    cmp #$40
    bne .F701

    ldx !arthur_pos_x+1
    cpx #$0100
    bcs .F701

    jsr .F71A
    !X8
    jmp _0281A8_81B5

;-----

.F71A:
    !X8
    inc $1F97
    stz $31
    pla
    sta $2F
    pla
    sta $30
    lda #$08 : sta $2D
.F72B:
    lda #$8D : sta $031E
    lda #$07 : cop #$00

;----- F734

    lda #$8A : sta $031E
    lda #$07 : cop #$00

;----- F73D

    dec $2D
    bne .F72B

    jsr .F7A1
    stz $0326
    lda #$13 : sta $0327
.F74C:
    lda #$8B : sta $031E
    lda #$07 : cop #$00

;----- F755

    lda #$8C : sta $031E
    lda #$07 : cop #$00

;----- F75E

    lda $31
    bne .F76B

    lda $1F91
    beq .F74C

    inc $31
    bra .F74C

.F76B:
    lda $1F91
    bne .F74C

    jsl _0190B9 ;set palette back to normal
    lda #$10 : sta $0326
    lda #$03 : sta $0327
    lda #$8B : sta $031E
    lda #$07 : cop #$00

;----- F787

    lda #$8A : sta $031E
    lda #$07 : cop #$00

;----- F790

    lda #$8D : sta $031E
    lda $30 : pha
    lda $2F : pha
    !X16
    stz $1F97
    rts

;-----

.F7A1:
    !A16
    ldx #$1E
.F7A5:
    lda.l palette_cycling_84EC+$00,X : sta $7EF462,X
    lda.l palette_cycling_84EC+$1E,X : sta $7EF4E2,X ;copies one value too much (non palette data)
    dex #2
    bpl .F7A5

    !A8
    inc $0331
    rts
}

{ ;F7BF - F7F4
stage4_exit:

.create:
  lda #$04 : sta $09
  !A16
  lda !obj_pos_x+1 : sta $39
  lda !obj_pos_y+1 : sta $3B
  !A8
.F7CF:
  brk #$00

;----- F7D1

  lda $14D1
  bne .F7CF

  lda !armor_state
  cmp #$05
  bcs .F7CF

  jsr arthur_overlap_check_8bit_local
  bcs .F7CF

  lda #$07 : sta $0278
  lda #$04
  ldx $07
  beq .F7EF

  lda #$05
.F7EF:
  sta $1F9D
  jmp _0281A8_81B5
}

{ ;F7F5 - F886
magic_charge:

.create:
    lda $07 : asl : tax
    jmp (+,X) : +: dw .F802, .F850, .F85E

;-----

.F802:
    stz $35
    stz $29
    stz $2A
    lda !arthur_facing : sta !obj_facing
    ldy #$44 : ldx #$21 : jsl set_sprite
.F815:
    jsl update_animation_normal
    jsr .F841
    lda $08
    and #$F7
    tax
    lda $35
    and #$07
    cmp #$02
    beq .F831

    cmp #$03
    beq .F831

    txa : ora #$08 : tax
.F831:
    stx $08
    inc $35
    brk #$00

;----- F837

    lda $14EB
    bne .F815

    stz $00
    jmp _02821B_827A

;-----

.F841:
    !A16
    lda !arthur_pos_x+1 : sta !obj_pos_x+1
    lda !arthur_pos_y+1 : sta !obj_pos_y+1
    !A8
    rts

;-----

.F850:
    lda #$10 : cop #$00

;----- F854

    ldy #$16 : ldx #$21 : jsl set_sprite
    bra .F866

.F85E:
    ldy #$18 : ldx #$21 : jsl set_sprite
.F866:
    !A16
    lda.w _00ED00+$36 : sta $27
    lda #$0050 : sta $29
    !A8
    lda #$FF : sta $26
.F878:
    jsr .F841
    jsl update_animation_normal
    jsl _018E32_8E79
    brk #$00

;----- F885

    bra .F878
}

{ ;F887 - F9B1
enemy_spawner: ;a8 x8

.create:
    lda $07 : asl : tax
    jmp (+,X)

+:
    dw .F8B6, _02F9B2, _02F9B2, _02F9B2, _02F9B2, _02F9B2, _029AAF, .F8AE
    dw _029713, _02E650, _029D5A, $97AA, $97AA, $97AA, _029713_97AA, .F8B2

;-----

.F8AE:
    jml _03BC15

;-----

.F8B2:
    jml _03B711

;-----

.F8B6:
    lda #$80 : sta $09
    lda #$08 : sta $2D
    lda #$0A : sta $2E
    stz $30
    lda #$01 : sta $31
    stz $32
    stz $34
    lda #$3F : cop #$00

;----- F8D0

.F8D0:
    brk #$00

;----- F8D2

    clc
    ldx.w difficulty
    lda !arthur_pos_x+2
    adc.w zombie_spawner_data_zone_difficulty_offset,X
    tax
    lda.w obj_type_count+!id_zombie
    cmp.w zombie_spawner_data_zone_max,X
    bcs .F8D0

    lda $31
    bne .F8F7

    lda $30
    cmp #$04
    beq .F903

    jsl call_rng
    and #$01
    bne .F903

.F8F7:
    ldx $2D : jsl _0196EF ;starts on $08, then cycles between $00, $02, $04, $06 (not $08)
    sty $2D
    sty $33
    bra .F90F

.F903:
    inc $31
    ldx $2E : jsl _0196EF ;starts on $0A, then cycles between $0A, $0C, $0E
    sty $2E
    sty $33
.F90F:
    stz $2F
    lda $30
    cmp #$02
    beq +

    cmp #$04
    bne .F92C

+:
    jsl call_rng
    and #$02
    clc
    adc #$10
    sta $33
    lda #$80 : sta $2F
    bra .F934

.F92C:
    lda $30
    cmp #$03
    bne .F934

    inc $2F
.F934:
    brk #$00

;----- F936

    jsl get_object_slot
    bmi .F934

    lda #$0C : sta.w !obj_active,X
    lda #!id_zombie : sta.w !obj_type,X ;zombie
    inc.w obj_type_count+!id_zombie
    lda $2F : sta $0007,X
    !A16
    ldy $33
    clc
    lda.w zombie_spawner_data_offset_x,Y
    adc.w camera_x+1
    and #$FFF0
    sta.w !obj_pos_x+1,X
    cmp.w zombie_previous_x_spawn
    bne +

    clc
    lda.w camera_x+1
    adc #$0110
    sta.w !obj_pos_x+1,X
+:
    sta.w zombie_previous_x_spawn
    stz.w !obj_pos_y+1,X
    !A8
    stz $003A,X
    !AX8
    inc $30
    lda $30
    cmp #$05
    bne .F987

    stz $30
    stz $31
.F987:
    lda #$1E : cop #$00

;----- F98B

    lda.w obj_type_count+!id_zombie
    cmp #$03
    bcs .F987

    lda $32
    and #$07
if !version == 0 || !version == 1
    tax
    inc $32
elseif !version == 2
    ;oversight? "inc $32" is removed! so there is only one zombie delay timer per difficulty
    ldx.w difficulty
    clc
    adc.w zombie_spawner_data_delay,X
    tax
endif
    lda.w zombie_spawner_data_delay,X : cop #$00

;----- F99E

    jmp .F8D0

;-----

.thing:
    !A16
    sec
    lda.w camera_x+1
    cmp #$0880
    !A8
    bcc .F9B1

    jmp _0281BB
.F9B1:
    rts
}

{ ;F9B2 - F9B5
_02F9B2: ;a8 x-
    jsr _02FD62_FD7C
    rtl
}

{ ;F9B6 - F9B9
_02F9B6: ;a8 x-
    jsr _02FB62_FB69
    rtl
}

{ ;F9BA - F9BD
_02F9BA: ;a8 x?
    jsr _02FA37_FA6D
    rtl
}

{ ;F9BE - F9C1
_02F9BE: ;a8 x?
    jsr _02FA37_FA65
    rtl
}

{ ;F9C2 - F9C5
_02F9C2:
    jsr _02FB9C_FBC0
    rtl
}

{ ;F9C6 - F9C9
_02F9C6:
    jsr _02FB9C_FBAF
    rtl
}

{ ;F9CA - F9CD
_02F9CA: ;a8 x-
    jsr _02FC0E
    rtl
}

{ ;F9CE - F9D1
_02F9CE: ;a8 x8
    jsr _02FF22
    rtl
}

{ ;F9D2 - F9D5
_02F9D2:
    jsr _02FB9C
    rtl
}

{ ;F9D6 - F9D9
    ;unused
    jsr _02FB62
    rtl
}

{ ;F9DA - F9EC
_02F9DA: ;a8 x-
    lda $09 : ora #$40 : sta $09
.F9E0: ;a8 x-
    lda $09 : ora #$80 : sta $09
    lda $08 : and #$7F : sta $08
    rtl
}

{ ;F9ED - F9F9
_02F9ED: ;a8 x-
    lda $09 : and #$7F : sta $09
    lda $08 : ora #$80 : sta $08
    rtl
}

{ ;F9FA - FA36
_02F9FA: ;a8 x-
    jsr .F9FE
    rtl

.F9FE:
    lda !open_magic_slots
    cmp #$08  ;if all magic slots are free,
    beq .ret2 ;do nothing

    bit $09
    bvc .ret2

    jsr _02FAD4
    !A8
    bcs .ret

    jsr _02FC41
    bcs .ret

    sec
    lda !obj_hp : sbc.w !obj_hp,Y : sta !obj_hp
    bcs .ret

    stz !obj_hp
    lda #$8C : sta !obj_active
    lda $08  : ora #$80 : sta $08
    asl $09  : lsr $09
    lda.w !obj_facing,Y : sta !obj_direction
.ret:
    !AX8
.ret2:
    rts
}

{ ;FA37 - FAA0
_02FA37: ;a8 x?
    lda !armor_state
    cmp #!gold
    bne .FA62

    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    bne .FA62

    jsr _02FCD4_FCE7
    bcs .FA62

    ;bracelet and projectile are overlapping
    !AX8
    lda #$8C : sta $00
    lda $08 : ora #$80 : sta $08
    lda $09 : and #$7F : sta $09
    lda #$EE : sta $0F
.FA62:
    !AX8
    rts

;-----

.FA65: ;a8 x?
    jsr _02FA37
    lda $14E7
    beq .FAA0

.FA6D: ;a8 x-
    lda !open_magic_slots
    cmp #$08
    beq .FAA0

    bit $09
    bvc .FAA0

    jsr _02FAD4
    !A8
    bcs .FA9E

    jsr _02FC41
    bcs .FA9E

.FA84:
    lda #$8C : sta $00
    lda $08 : ora #$80 : sta $08
    asl $09 : lsr $09
    sec : lda !obj_hp : sbc.w !obj_hp,Y : sta !obj_hp
    bcs .FA9E

    stz !obj_hp
.FA9E:
    !AX8
.FAA0:
    rts
}

{ ;FAA1 - FABF
_02FAA1: ;a8 x?
    lda !open_magic_slots
    cmp #$08
    beq _02FA37_FAA0

    bit $09
    bvc _02FA37_FAA0

    lda $3C
    !AX16
    and #$00FF
    asl
    adc #$0188
    jsr _02FAD4_FADC
    !A8
    bcs _02FA37_FA9E
    bra _02FA37_FA84
}

{ ;FAC0 - FAD3
_02FAC0: ;a8 x-
    lda !open_magic_slots
    cmp #$08
    beq _02FA37_FAA0

    bit $09
    bvc _02FA37_FAA0

    jsr _02FAD4
    !A8
    bcs _02FA37_FA9E

    bra _02FB2B_FB42
}

{ ;FAD4 - FB15
_02FAD4: ;a- x-
    lda !obj_type
    !AX16
    and #$00FF
    asl
.FADC:
    tay
    !A8
    lda.w magic_current
    cmp #!magic_nuclear
    bne .FAF4

    lda #$7E
    sta $1F29
    sta $1F1D
    asl
    sta $1F1F
    bra .FB0B

.FAF4:
    lda.w _00DC1E-$40,Y
    clc
    adc $1F28
    sta $1F1D
    asl
    sta $1F1F
    lda.w _00DC1E-$40+1,Y
    adc $1F27
    sta $1F29
.FB0B:
    !A16
    ldx #$0008
    ldy #!slot_magic
    jmp _02FCD4_FD15
}

{ ;FB16 - FB2A
    ;unused
    lda !open_magic_slots
    cmp #$08
    beq .FB29

    bit $09
    bvc .FB29

    jsr _02FAD4
    !AX8
    bcs .FB29

    rts

.FB29:
    sec
    rts
}

{ ;FB2B - FB61
_02FB2B: ;a8 x?
    lda $02C3
    clc
    adc $02C6
    and #$03
    bne .FB5F

    jsr _02FCD4_FCE7
    !A8
    bcs .FB5F

    jsr _02FC56
    bcs .FB5F

.FB42:
    ldx $31
    sec
    lda $000E,X
    sbc $000E,Y
    bcs .FB4F

    lda #$00
.FB4F:
    sta $000E,X
    bne .FB5F

    lda #$8C : sta $0000,X
    stz $0008,X
    stz $0009,X
.FB5F:
    sep #$30
    rts
}

{ ;FB62 - FB9B
_02FB62: ;a? x?
    jsr _02FCD4_FCD6
    bcs .FB99

    bra .FB6E

.FB69: ;a8 x-
    jsr _02FCD4_FCE7
    bcs .FB99

.FB6E:
    !A8
    jsr _02FC56
    bcs .FB99

    lda #$8C : sta $00
    lda $08 : ora #$80 : sta $08
    asl $09 : lsr $09
    sec
    lda !obj_hp : sbc.w !obj_hp,Y : sta !obj_hp
    bcs .FB99

    stz !obj_hp
    lda #$04 : sta $000F,Y
    lda.w !obj_facing,Y : sta !obj_direction
.FB99:
    !AX8
    rts
}

{ ;FB9C - FBE3
_02FB9C: ;a- x-
    lda $3C
    !AX16
    and #$00FF
    asl
    clc
    adc.w #offset(_00DC1E-$40, _00DC1E_DD66)
    jsr _02FCD4_FCF3
    bcs .FBE1

    bra .FBC5

.FBAF: ;a- x-
    !AX16
    and #$00FF
    asl
    clc
    adc #$01A0 ;what is this offset? DD66+C*2
    jsr _02FCD4_FCF3
    bcs .FBE1

    bra .FBC5

.FBC0: ;a8 x-
    jsr _02FCD4_FCE7
    bcs .FBE1

.FBC5:
    !A8
    lda #$8C : sta.w !obj_active,Y
    lda $0008,Y : ora #$80 : sta $0008,Y
    lda $0009,Y : and #$7F : sta $0009,Y
    lda #$02 : sta $000F,Y
.FBE1:
    !AX8
    rts
}

{ ;FBE4 - FBF8
_02FBE4:
    !AX8
    rtl

.FBE7:
    !AX16
    and #$00FF
    asl
    adc #$0188
    jsr _02FCD4_FCF3
    bcs _02FBE4

    jsr _02FC0E_FC13
    rtl
}

{ ;FBF9 - FC0B
_02FBF9:
    ;todo: link all these functions probably
    jsr _02FCD4_FCE7
    bcs _02FB62_FB99

    !A8
    lda.w !obj_facing,Y
    cmp #$02
    beq _02FC0E_FC13

    cmp $12
    beq _02FC0E_FC13

    jmp _02FB9C_FBC5
}

{ ;FC0E - FC40
_02FC0E: ;a8 x-
    jsr _02FCD4_FCE7
    bcs _02FB62_FB99 ;odd choice to return on, unless these functions are linked (which is likely)

.FC13:
    ;gets here upon hitting certain enemies
    !A8
    jsr _02FC56
    bcs .FC3E

    sec
    lda !obj_hp : sbc.w !obj_hp,Y : sta !obj_hp ;decrease enemy hp by weapon's hp(damage)
    bcs .FC3E

    stz !obj_hp
    lda #$8C : sta $00
    lda $08 : ora #$80 : sta $08
    asl $09 : lsr $09
    lda.w !obj_facing,Y : sta !obj_direction
    lda #$04 : sta $000F,Y
.FC3E:
    !AX8
    rts
}

{ ;FC41 - FC55
_02FC41: ;a8 x16
    lda $0009,Y
    bit #$02
    beq .FC52

    lda $40
    cmp $0040,Y
    beq .FC54

    sta $0040,Y
.FC52:
    clc
    rts

.FC54:
    sec
    rts
}

{ ;FC56 - FCA6
_02FC56: ;a8 x16
    lda $0009,Y
    bit #$01
    bne .FC94

    bit #$02
    beq .FC7B

    ;torch reaches here. anything else? piercing weapons...?
    inc $14F4
    lda $40
    cmp $0040,Y
    beq .FC92

    sta $0040,Y
    jsr _02FCA7
    inc $1F1C
    bne +

    inc $1F1C
+:
    clc
    rts

.FC7B:
    lda #$8C : sta $0000,Y
    lda $0008,Y : ora #$80 : sta $0008,Y
    lda $0009,Y : and #$7F : sta $0009,Y
    clc
    rts

.FC92:
    sec
    rts

.FC94: ;center weapon on target (scythe hit for example)
    jsr .FC7B
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,Y
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,Y
    !A8
    clc
    rts
}

{ ;FCA7 - FCD3
_02FCA7: ;a8 x16
    lda !open_weapon_slots
    bmi .FCD3

    phx
    phy
    jsl get_weapon_slot
    lda #$0C : sta.w !obj_active,X
    lda #!id_weapon_hit : sta.w !obj_type,X
    lda #$80 : sta $0008,X
    ply
    !A16
    lda.w !obj_pos_x+1,Y : sta.w !obj_pos_x+1,X
    lda.w !obj_pos_y+1,Y : sta.w !obj_pos_y+1,X
    !A8
    plx
.FCD3:
    rts
}

{ ;FCD4 - FD61
;get overlapping weapon
_02FCD4:
    sec
    rts

.FCD6: ;a8 x-
    bit $09
    bvc _02FCD4

    lda $3C
    !AX16
    and #$00FF
    asl
    adc #$0188
    bra .FCF3

.FCE7: ;a8 x-
    bit $09
    bvc .FD60

    lda !obj_type
    !AX16
    and #$00FF
    asl
.FCF3: ;a8 x8
    tay
    !A8
    lda.w _00DC1E-$40+0,Y : sta $1F29
    clc
    adc $1F26
    sta $1F1D
    asl
    sta $1F1F
    lda.w _00DC1E-$40+1,Y : sta $1F29
    !A16
    ldx #$000A
    ldy #!slot_weapons
.FD15:
    lda.w !obj_active,Y
    and #$000D
    beq .FD57

    lda $0008,Y
    bit #$4000
    beq .FD57

    bit #$0080
    bne .FD57

    sec
    lda !obj_pos_x+1
    sbc.w !obj_pos_x+1,Y
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FD57

    clc
    lda $1F29
    adc $002B,Y
    sta $1F21
    asl
    sta $1F23
    sec
    lda !obj_pos_y+1
    sbc.w !obj_pos_y+1,Y
    clc
    adc $1F21
    cmp $1F23
    bcs .FD57

    rts

.FD57:
    tya
    clc
    adc #$0041
    tay
    dex
    bne .FD15

.FD60:
    sec
    rts
}

{ ;FD62 - FDB2
_02FD62:
    jsr .FD6A
    rtl

;-----

.FD66: ;a8 x?
    jsr .FD75
    rtl

;-----

.FD6A: ;a8 x?
    lda $02C3
    clc
    adc $02C6
    and #$03
    bne .FDB1

.FD75:
    jsr _02FEBC
    bcs .FDAE

    bra .FD8C

.FD7C: ;a8 x-
    lda $02C3
    clc
    adc $02C6
    and #$03
    bne .FDB1

.FD87: ;a8 x-
    jsr _02FEBC_arthur_overlap_check
    bcs .FDAE

.FD8C: ;arthur being hit
    ldx #$00
    sec
    lda $1F
    sbc $045B
    bcc +

    inx
+:
    !AX8
    txa
    sta !arthur_direction
    eor #$01
    sta !arthur_facing
.FDA2:
    jsr _02FDB3_FDB7
    dec !arthur_hp
    bpl .FDAD

    inc $14D1
.FDAD:
    clc
.FDAE:
    !AX8
    rts

.FDB1:
    sec
    rts
}

{ ;FDB3 - FDCC
_02FDB3: ;a8 x-
    jsr .FDB7
    rtl

.FDB7: ;a8 x-
    lda #$8C : sta !arthur_active
    lda $0444 : ora #$80 : sta $0444 ;todo: label bitflags for arthur
    lda $0276 : ora #$02 : sta $0276
    rts
}

{ ;FDCD - FDD0
_02FDCD: ;a8 x?
    jsr _02FD62_FDA2
    rtl
}

{ ;FDD1 - FDDA
arthur_overlap_check_8bit:
    jsr .local
    rtl

;------

.local: ;a8 x-
    jsr _02FEBC_arthur_overlap_check
    !AX8
    rts
}

{ ;FDDB - FDE4
arthur_overlap_check_FED8_8bit:
    jsr .local
    rtl

.local: ;a8 x-
    jsr _02FEBC_FED8
    !AX8
    rts
}

{ ;FDE5 - FE1D
_02FDE5:
    ;unused
    lda.w _00DD94+0,Y : sta $1F1D ;todo
    asl               : sta $1F1F
    lda.w _00DD94+2,Y : sta $1F21
    asl               : sta $1F23
    !A16
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FE17

    sec
    lda !obj_pos_y+1
    sbc !arthur_pos_y+1
    clc
    adc $1F21
    cmp $1F23
.FE17:
    !A8
    rts

;unreachable return branch
    sec
    !A8
    rts
}

{ ;FE1E - FEBB
;solid sprite collision handling? used by chest, stone pillar and lava pillar
_02FE1E: ;a? x?
    jsr .local
    rtl

;-----

.FE22:
    rts
.local: ;a8 x8
    bit $09
    bvc .FE22

.FE27: ;a8 x8
    asl
    tay
    lda.w _00DD96+0,Y : sta $1F1D
    asl               : sta $1F1F
    lda.w _00DD96+1,Y : sta $1F21
    asl               : sta $1F23
    !AX16
    sec
    lda !obj_pos_x+1
    sbc $14BE
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FE85

    sec
    lda !obj_pos_y+1
    sbc !arthur_pos_y+1
    clc
    adc $1F21
    cmp $1F23
    bcs .FE85

    lda !obj_pos_y+1
    cmp !arthur_pos_y+1
    bcs .FE78

    ldy.w bowgun_magic_active
    bne .FE78 ;branch if under solid object and on raft

    adc $1F21
    sta !arthur_pos_y+1
    stz !arthur_speed_y
    !AX8
    stz !arthur_speed_y+2
    rts

.FE78:
    inc
    sbc $1F21
    sta !arthur_pos_y+1
    !AX8
    inc $14C3
    rts

.FE85:
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FEB9

    sec
    lda !obj_pos_y+1
    sbc !arthur_pos_y+1
    clc
    adc $1F21
    cmp $1F23
    bcs .FEB9

    lda !obj_pos_x+1
    cmp !arthur_pos_x+1
    bcc .FEB2

    sbc $1F1D
    sta $045B
    bra .FEB9

.FEB2:
    sec
    adc $1F1D
    sta !arthur_pos_x+1
.FEB9:
    !AX8
    rts
}

{ ;FEBC - FF21
_02FEBC: ;a8 x-
    ;todo: rename these labels
    lda $0444
    bmi .FF20

    bit $09
    bvc .FF20

    lda $3C
    !AX16
    and #$00FF
    asl
    adc.w #offset(_00DAA2-$40, _00DAA2_DBEA)
    clc
    bra .FEE4

.arthur_overlap_check: ;a8 x-
    lda $0444 ;arthur $08
    bmi .FF20

.FED8: ;a8 x-
    bit $09
    bvc .FF20

    lda !obj_type
    !AX16
    and #$00FF
    asl
.FEE4:
    tay
    !A8
    lda.w _00DAA2-$40+0,Y : adc $14D7 : sta $1F1D
    asl
    sta $1F1F
    lda.w _00DAA2-$40+1,Y : adc $14D6 : sta $1F21
    asl
    sta $1F23
    !A16
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FF1F

    sec
    lda !obj_pos_y+1
    sbc $14DA
    clc
    adc $1F21
    cmp $1F23
.FF1F:
    rts

.FF20:
    sec ;carry set means no overlap!
    rts
}

{ ;FF22 - FF56
_02FF22: ;a8 x-
    ;collision testing with the shield
    lda $02C3
    clc
    adc $02C6
    and #$03
    bne .ret

    jsr _02FF57
    bcs .ret

    dec !slot_shield+!obj_hp
    bpl +

    lda #$8C : sta !slot_shield
    lda !slot_shield+$08 : ora #$80 : sta !slot_shield+$08
+:
    lda #$8C : sta !obj_active
    lda $08  : ora #$80 : sta $08
    asl $09  : lsr $09
    lda #$FF : sta $0F
.ret:
    rts
}

{ ;FF57 - FFA4
_02FF57: ;a x
    bit $09
    bvc .FFA1

    lda !slot_shield
    and #$0D
    beq .FFA1

    lda !slot_shield+$08
    bmi .FFA1

    lda.w _00DDB2+0,Y : sta $1F1D
    asl               : sta $1F1F
    lda.w _00DDB2+1,Y : sta $1F21
    asl               : sta $1F23
    lda !slot_shield+$25
    bne .FFA1

    !A16
    sec
    lda !obj_pos_x+1
    sbc !slot_shield+!obj_pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FFA2

    sec
    lda !obj_pos_y+1
    sbc !slot_shield+!obj_pos_y+1
    clc
    adc $1F21
    cmp $1F23
    !AX8
    rts

.FFA1:
    sec
.FFA2:
    !AX8
    rts
}

{ ;FFA5 - FFFF
if !version == 0
    fillbyte $FF : fill 91
elseif !version == 1
    incbin "fill_bytes/eng/bank02a.bin"
elseif !version == 2
    incbin "fill_bytes/eng/bank02a.bin":5..0
endif
}
