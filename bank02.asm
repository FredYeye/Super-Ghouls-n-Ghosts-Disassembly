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
    lda.b obj.pos_x+1
    adc #$0070
    sbc.w camera_x+1
    cmp #$01E0
    bcs .8071

    lda.b obj.pos_y+1
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
    cmp.b obj.pos_x+1
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
    cmp.b obj.pos_x+1
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
    inc.w open_weapon_slots : inc.w open_weapon_slots
    ldy.w open_weapon_slots
    tdc
    sta.w slot_list_weapons,Y
    xba
    sta.w slot_list_weapons+1,Y
    jmp _02821B_827A
}

{ ;80E9 - 810C
_0280E9: ;a8 x8
    ldx.b obj.type
    dec.w obj_type_count,X ;decrease type count
.80EE: ;a8 x-
    stz.b obj.active
    stz $2C
.80F2: ;a8 x-
    stz $08
    stz $09
    stz.b obj.direction
    stz.b obj.facing
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
    inc.w open_weapon_slots : inc.w open_weapon_slots
    ldy.w open_weapon_slots
    tdc
    sta.w slot_list_weapons+0,Y
    xba
    sta.w slot_list_weapons+1,Y
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
    lda.b obj.pos_x+1
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
    lda.b obj.pos_x+1
    adc #$0020
    cmp.w screen_boundary_left
    !A8
    bcc _0281DD

    rtl
}

{ ;8166 - 8175
_028166: ;a- x-
    !A16
    lda.b obj.pos_x+1
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

    lda.b obj.pos_y+1
    sec
    sbc #$0100
    cmp.w !obj_arthur.pos_y+1
    bcs .819F

    lda.b obj.pos_y+1
    clc
    adc #$0100
    cmp.w !obj_arthur.pos_y+1
    bcc .819F

.8196:
    lda.b obj.pos_x+1
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
    lda.b obj.pos_x+1
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
    inc.w open_object_slots : inc.w open_object_slots
    ldy.w open_object_slots
    tdc
    sta.w slot_list_objects+0,Y
    xba
    sta.w slot_list_objects+1,Y
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
    inc.w open_object_slots : inc.w open_object_slots
    ldy.w open_object_slots
    tdc
    sta.w slot_list_objects+0,Y
    xba
    sta.w slot_list_objects+1,Y
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
    lda #$35 : sta $02C5 ;obj count
    stz $02C6
    lda #$04 : xba : lda #$3C
    tcd

.822A:
    lda $1F96
    beq .824B

    !A16
    tdc
    cmp.w #!obj_arthur.active
    beq .826C

    cmp.w #!obj_upgrade.active
    beq .826C

    cmp.w #!obj_shield.active
    beq .826C

    cmp.w #!obj_weapons.base
    beq .826C

    !A8
    jmp .828E

.824B:
    lda $1F95
    beq .826E

    !A16
    tdc
    cmp.w #!obj_arthur.active
    beq .826C

    cmp.w #!obj_upgrade.active
    beq .826C

    cmp.w #!obj_shield.active
    beq .826C

    cmp.w #!obj_upgrade2.active
    beq .826C

    !A8
    jmp .828E

.826C:
    !A8
.826E:
    lda.b obj.active
    beq .828E

    cmp #$01
    bne .82AC

    dec.b obj.timer
    beq .82AC

.827A: ;a8 x8
    lda $09
    bpl .828E

    lda.b obj.type
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
    adc.w #!obj_size
    tcd
    clc
    lda.w !obj_arthur.pos_y+1 : adc $14D8 : sta $14DA
    !A8
    inc $02C6
    dec $02C5
    bne .822A

    pld
    rtl

.82AC:
    ldx #$08 : stx.b obj.active
    cmp #$0C
    bcs .82BD

    !A16
    lda.b obj.state+2 : pha
    lda.b obj.state+0 : pha
    rti ;push state code offset and run it

.82BD:
    asl
    bcs .82CE

    lda.b obj.type
    bmi +

    asl
    tax
    jmp (.create_object_offsets,X)

+:
    asl
    tax
    jmp (.create_object_offsets+256,X)

.82CE:
    lda.b obj.type
    bmi +

    asl
    tax
    jmp (.destroy_object_offsets,X)

+:
    asl
    tax
    jmp (.destroy_object_offsets+256,X)

.create_object_offsets:
    dw arthur_create, lance_create, lance2_create, knife_create, knife2_create, bowgun_create, bowgun2_create, scythe_create
    dw scythe2_create, torch_create, torch2_create, axe_create, axe2_create, triblade_create, triblade2_create, bracelet_create
    dw bracelet2_create, lance_fire_trail_create, knife2_shimmer_create, thunder_create, seek_create, shield_magic_create, fire_dragon_create, tornado_create
    dw lightning_create, nuclear_create, armor_upgrade_vfx_create, arthur_plume_create, arthur_face_create, stage4_transform_create, shield_create, armor_piece_create
    dw shield_piece_create, weapon_hit_create, pot_create, bracelet_tail_create, enemy_spawner_create, $8780, _02EEEA_create, stone_pillar_create
    dw $FFFF, flower_part_create, torch_flame_create, torch2_flame_create, $FFFF, $B0CD, $FFFF, shell_create
    dw shell_pearl_create, $9139, $9174, $9191, $91DD, belial_create, belial_flame_create, thunk_princess_create
    dw hydra_fireball_create, $B3AA, rosebud_create, black_cover_create, bars_create, eagler_create, rotating_platform_create, chest_create
    dw magician_create, armor_create, weapon_create, pickup_shield_create, trap_create, magician_orb_create, small_explosion_create, stone_pillar2_create
    dw point_statue_create, stage4_exit_create, raft_pulley_create, zombie_create, $9224, water_crash_splash_create, flower_bud_create, flower_projectile_create
    dw raft_hanging_create, icicle_create, gate_create, cockatrice_spawner_create, ready_go_create, siren_create, flying_killer_create, hydra_create
    dw hydra_genie_create, key_create, key_message_create, raft_create, guillotine_create, $C40D, ghost_create, ghost_unformed_create
    dw flower_head_create, cockatrice_legs_create, cockatrice_neck_create, cockatrice_head_create, siren_projectile_create, arthur_map_create, miniwing_create, cockatrice_wings_create
    dw cockatrice_body_create, skulls_create, money_bag_create, mimic_create, mimic_ghost_create, hannibal_create, storm_cesaris_projectile_create, coffin_dirt_create
    dw boss_explosion_spawner_create, boss_explosion_create, wolf_create, pier_create, rosebud_chunk_create, cockatrice_neck_base_create, storm_cesaris_create, storm_cesaris_parts_create
    dw flying_knight_create, bat_spawner_create, bat_create, chest2_create, pier_splinter_create, bracelet_item_create, bracelet_item_sparkle_create, thunk_crumbling_wall_create
    dw thunk_grilian_create, _029ED3_create, magic_charge_create, thunk_tower_edge_create, thunk_silk_gate_create, thunk_gargoyle_statue_create, thunk_grilian_projectile_create, thunk_skull_flower_multi_inactive_create
    dw thunk_skull_flower_multi_create, arremer_projectile_create, thunk_arremer_create, thunk_moving_platform_create, thunk_death_crawler_handler_create, thunk_death_crawler_part_create, thunk_death_crawler_create, thunk__03C30E_create
    dw thunk_geyser_create, _0289D3_create, thunk__03A42C_create, thunk_killer_create, thunk_tiny_goblin_create, thunk_game_over_text_flames_create, thunk_explosion_spawner_create, thunk_hannibal_projectile_create
    dw thunk_coral_create, thunk_waterfall_end_create, thunk_silk_platform_create, $8A25, thunk_menu_control_create, thunk_lava_pillar_create, thunk__03A2FC_create, thunk_lava_dropper_create
    dw thunk_lava_create, thunk_astaroth_create, thunk_nebiroth_create, thunk_conveyor_belt_create, thunk_cockatrice_head2_spawner_create, thunk_cockatrice_head2_create, thunk_gate2_create, thunk_mad_dog_create
    dw thunk_astaroth_flame_create, thunk_astaroth_laser_create, nuclear_projectile_create, thunk_ice_bridge_segment_create, thunk_ice_bridge_spawner_create, thunk_avalanche_create, thunk_death_crawler_projectile_create, $88A1
    dw thunk_cockatrice_head2_projectile_create, thunk_veil_allocen_create, thunk_veil_allocen_part_create, thunk_intro_cutscene_obj_create, thunk_cutscene_arthur_create, thunk_cutscene_princess_create, thunk_satan_create, thunk_satan_wings_create
    dw veil_allocen_claw1_create, veil_allocen_claw2_create, thunk_veil_allocen_spawner_create, thunk_nebiroth_flame_create, thunk_nebiroth_laser_create, thunk_veil_allocen_projectile_create, thunk_freeze_splinter_create, thunk_astaroth_nebiroth_body_create
    dw thunk_princess_dialogue_create, thunk_samael_create, thunk_samael_platform_create, thunk_samael_laser_create, thunk_sun_create, thunk_ending_object_create

.destroy_object_offsets:
    dw arthur_destroy, weapon_destroy, weapon_destroy, weapon_destroy, knife2_destroy, weapon_destroy, weapon_destroy, scythe_destroy
    dw scythe2_destroy, $878E, $878E, $878E, $878E, $878E, $878E, weapon_destroy_8792
    dw weapon_destroy_8792, $8780, _0280CB_remove_weapon, $8780, $8780, $8780, $8780, $8780
    dw $8780, $8780, $8780, $8780, $8780, $8780, shield_destroy, $8780
    dw $8780, $8780, $8780, $8780, $81B5, $8780, $8780, $8780
    dw $8780, flower_part_destroy, weapon_destroy, weapon_destroy, $8780, $8780, $8780, shell_destroy
    dw $8BB9, $8780, $8780, $8780, $8780, $8780, $8780, $8780
    dw $8BB9, $8780, rosebud_destroy, $8BEC, obj_void, eagler_destroy, $8780, chest_destroy
    dw magician_destroy, $8780, $8780, $8780, $8780, $8BB9, $8780, $81B5
    dw $81B5, $81B5, $81B5, zombie_destroy, $81B5, $81B5, $81B5, $8BB9
    dw $8780, icicle_destroy, $8780, $8780, $8780, siren_destroy, flying_killer_destroy, hydra_destroy
    dw $8780, key_destroy, key_message_destroy, $8780, guillotine_destroy, $8780, ghost_destroy, ghost_unformed_destroy
    dw flower_part_head_destroy, cockatrice_legs_destroy, cockatrice_neck_destroy, cockatrice_head_destroy, _028BEC_8BF9, obj_void, miniwing_destroy, cockatrice_wings_destroy
    dw cockatrice_body_destroy, $81B5, $8780, $8BEC, $8BEC, hannibal_destroy, $8BB9, $81B5
    dw boss_explosion_spawner_destroy, boss_explosion_destroy, wolf_destroy, $8780, $81B5, cockatrice_neck_base_destroy, storm_cesaris_destroy, storm_cesaris_parts_destroy
    dw flying_knight_destroy, bat_spawner_destroy, bat_destroy, chest_destroy, $8780, $8780, $8780, $8780
    dw thunk_grilian_destroy, _029ED3_destroy, $8780, $8780, $8780, thunk_gargoyle_statue_destroy, $8BB9, $8780
    dw thunk_skull_flower_multi_destroy, arremer_projectile_destroy, thunk_arremer_destroy, thunk_moving_platform_destroy, thunk_death_crawler_handler_destroy, $FFFF, thunk_death_crawler_destroy, $8780
    dw $8780, $8780, thunk__03A42C_destroy, thunk_killer_destroy, thunk_tiny_goblin_destroy, $8780, $8780, _028BB9
    dw _028BEC, $8780, $8780, arremer_killers_destroy, $8780, $8780, $8780, thunk_lava_dropper_destroy
    dw $8780, thunk_astaroth_destroy, thunk_nebiroth_destroy, $8780, thunk_cockatrice_head2_spawner_destroy, thunk_cockatrice_head2_destroy, $8780, thunk_mad_dog_destroy
    dw thunk_astaroth_flame_destroy, $81B5, $8780, thunk_ice_bridge_segment_destroy, thunk_ice_bridge_spawner_destroy, $8780, $81B5, $8780
    dw _028BB9, thunk_veil_allocen_destroy, thunk_veil_allocen_part_destroy, $8780, $8780, $8780, $8780, $8780
    dw veil_allocen_claw1_destroy, veil_allocen_claw2_destroy, $8780, thunk_nebiroth_flame_destroy, $81B5, $81B5, $81B5, $81B5
    dw $8780, thunk_samael_destroy, thunk_samael_platform_destroy, thunk_samael_laser_destroy, $8780, $8780

.thing_object_offsets: ;todo: figure out a better name. code that needs to run every frame regardless of state?
    dw arthur_thing, $8780, $8780, $8780, $8780, $8780, bowgun2_thing, scythe_thing
    dw $87D0, $8780, $8780, axe_thing, axe2_thing, triblade_thing, triblade2_thing, bracelet_thing
    dw bracelet2_thing, $882D, $8780, thunder_thing, seek_thing, shield_magic_thing, fire_dragon_thing, tornado_thing
    dw lightning_thing, nuclear_thing, $8780, $8780, $8780, $8780, $8780, $8780
    dw $8780, $8780, $8780, bracelet_tail_thing, enemy_spawner_thing, $8780, $8780, $8780
    dw _02FD62_FD7C, flower_part_thing, torch_flame_thing, torch2_flame_thing, _02FD62_FD7C, $8780, $8780, shell_thing
    dw shell_pearl_thing, $8780, $8780, $8780, $8780, belial_thing, $8780, $8780
    dw $AF04, $8780, rosebud_thing, $8780, obj_void, eagler_thing, rotating_platform_thing, chest_thing
    dw magician_thing, armor_thing, weapon_thing, pickup_shield_thing, $8780, magician_orb_thing, $8780, $81B5
    dw $81B5, $81B5, raft_pulley_thing, zombie_thing, $8780, $8780, $8780, flower_projectile_thing
    dw $8780, icicle_thing, $8780, $8780, $8780, siren_thing, flying_killer_thing, hydra_thing
    dw hydra_genie_thing, key_thing, key_message_thing, raft_thing, guillotine_thing, $8780, ghost_thing, ghost_unformed_thing
    dw flower_head_thing, cockatrice_legs_thing, cockatrice_neck_thing, cockatrice_head_thing, siren_projectile_thing, obj_void, miniwing_thing, cockatrice_wings_thing
    dw cockatrice_body_thing, skulls_thing, $8780, mimic_thing, mimic_ghost_thing, hannibal_thing, storm_cesaris_projectile_thing, $8780
    dw boss_explosion_spawner_thing, boss_explosion_thing, wolf_thing, pier_thing, rosebud_chunk_thing, $8780, storm_cesaris_thing, storm_cesaris_parts_thing
    dw flying_knight_thing, bat_spawner_thing, bat_thing, chest_thing, $8780, bracelet_item_thing, bracelet_item_sparkle_thing, $8780
    dw thunk_grilian_thing, _029ED3_thing, $8780, thunk_tower_edge_thing, $8780, thunk_gargoyle_statue_thing, thunk_grilian_projectile_thing, $8780
    dw thunk_skull_flower_multi_thing, arremer_projectile_thing, thunk_arremer_thing, thunk_moving_platform_thing, thunk_death_crawler_handler_thing, thunk_death_crawler_part_thing, thunk_death_crawler_thing, $8780
    dw thunk_geyser_thing, _0289D3_thing, thunk__03A42C_thing, thunk_killer_thing, thunk_tiny_goblin_thing, $8780, $8780, thunk_hannibal_projectile_thing
    dw thunk_coral_thing, $8780, $8780, arremer_killers_thing, $8780, thunk_lava_pillar_thing, $8780, $8780
    dw thunk_lava_thing, thunk_astaroth_thing, thunk_nebiroth_thing, thunk_conveyor_belt_thing, thunk_cockatrice_head2_spawner_thing, thunk_cockatrice_head2_thing, $8780, thunk_mad_dog_thing
    dw thunk_astaroth_flame_thing, $8ABB, nuclear_projectile_thing, thunk_ice_bridge_segment_thing, thunk_ice_bridge_spawner_thing, thunk_avalanche_thing, thunk_death_crawler_projectile_thing, $88A5
    dw thunk_cockatrice_head2_projectile_thing, thunk_veil_allocen_thing, thunk_veil_allocen_part_thing, $88D1, thunk_cutscene_arthur_thing, thunk_cutscene_princess_thing, thunk_satan_thing, thunk_satan_wings_thing
    dw veil_allocen_claw1_thing, veil_allocen_claw2_thing, $8780, thunk_nebiroth_flame_thing, thunk_nebiroth_laser_thing, thunk_veil_allocen_projectile_thing, thunk_freeze_splinter_thing, thunk_astaroth_nebiroth_body_thing
    dw $8780, thunk_samael_thing, thunk_samael_platform_thing, thunk_samael_laser_thing, $8780, $8780
}

;---------------
;object handling
;---------------

{ ;8780 - 8780
obj_void:
    rts
}

{ ;8781 - 8784
thunk_princess:

.create: jml princess_create
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
thunk_ice_bridge_segment:

.create:  jml ice_bridge_segment_create
.thing:   jsl ice_bridge_segment_thing : rts
.destroy: jml ice_bridge_segment_destroy
}

{ ;888B - 8897
thunk_ice_bridge_spawner:

.create:  jml ice_bridge_spawner_create
.thing:   jsl ice_bridge_spawner_thing : rts ;unused?
.destroy: jml ice_bridge_spawner_destroy ;unused?
}

{ ;8898 - 88A0
thunk_death_crawler_projectile:

.create: jml death_crawler_projectile_create
.thing:  jsl death_crawler_projectile_thing : rts
}

{ ;88A1 - 88A9
;death crawler head?

; .create:
    jml death_crawler_create

; .thing:
    jsl death_crawler_part_thing
    rts
}

{ ;88AA - 88B2
thunk_cockatrice_head2_projectile:

.create: jml cockatrice_head2_projectile_create
.thing:  jsl cockatrice_head2_projectile_thing : rts
}

{ ;88B3 - 88BF
thunk_veil_allocen:

.create:  jml veil_allocen_create
.thing:   jsl veil_allocen_thing : rts
.destroy: jml veil_allocen_destroy
}

{ ;88C0 - 88CC
thunk_veil_allocen_part:

.create: jml veil_allocen_part_create
.thing:  jsl veil_allocen_part_thing : rts
.destroy: jml _03E54E_create ;unused: leads to allocen claw1 create
}

{ ;88CD - 88D5
thunk_intro_cutscene_obj:

.create: jml intro_cutscene_obj_create
.thing:  jsl intro_cutscene_obj_thing : rts
}

{ ;88D6 - 88DE
thunk_cutscene_arthur:

.create: jml cutscene_arthur_create
.thing:  jsl cutscene_arthur_thing : rts
}

{ ;88DF - 88E7
thunk_cutscene_princess:

.create: jml cutscene_princess_create
.thing:  jsl cutscene_princess_thing : rts ;unused?
}

{ ;88E8 - 88F0
thunk_satan:

.create: jml satan_create
.thing:  jsl satan_thing : rts
}

{ ;88F1 - 88F9
thunk_satan_wings:

.create: jml satan_wings_create
.thing:  jsl satan_wings_thing : rts ;unused?
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
thunk_veil_allocen_spawner:

.create: jml veil_allocen_spawner_create
}

{ ;8918 - 8924
thunk_nebiroth_flame:

.create:  jml nebiroth_flame_create
.destroy: jml nebiroth_flame_destroy
.thing:   jsl nebiroth_flame_thing : rts
}

{ ;8925 - 892D
thunk_nebiroth_laser:

.create: jml nebiroth_laser_create
.thing:  jsl nebiroth_laser_thing : rts
}

{ ;892E - 8936
thunk_astaroth_nebiroth_body:

.create: jml astaroth_nebiroth_body_create
.thing:  jsl astaroth_nebiroth_body_thing : rts
}

{ ;8937 - 893A
thunk_crumbling_wall:

.create: jml crumbling_wall_create
}

{ ;893B - 8947
thunk_grilian:

.create:  jml grilian_create
.thing:   jsl grilian_thing : rts
.destroy: jml grilian_destroy
}

{ ;8948 - 8950
thunk_tower_edge:

.create: jml tower_edge_create
.thing:  jsl tower_edge_thing : rts
}

{ ;8951 - 8954
thunk_silk_gate:

.create: jml silk_gate_create
}

{ ;8955 - 8961
thunk_gargoyle_statue:

.create:  jml gargoyle_statue_create
.thing:   jsl gargoyle_statue_thing : rts
.destroy: jml gargoyle_statue_destroy
}

{ ;8962 - 896A
thunk_grilian_projectile:

.create: jml grilian_projectile_create
.thing:  jsl grilian_projectile_thing : rts
}

{ ;896B - 896E
thunk_skull_flower_multi_inactive:

.create: jml skull_flower_multi_inactive_create
}

{ ;896F - 897B
thunk_skull_flower_multi:

.create:  jml skull_flower_multi_create
.thing:   jsl skull_flower_multi_thing : rts
.destroy: jml skull_flower_multi_destroy
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
thunk_arremer:

.create:  jml arremer_create
.thing:   jsl arremer_thing : rts
.destroy: jml arremer_destroy
}

{ ;8996 - 89A2
thunk_moving_platform:

.create:  jml moving_platform_create
.thing:   jsl moving_platform_thing : rts ;unused? the code itself is used but not called from here?
.destroy: jml moving_platform_destroy ;unused? see above
}

{ ;89A3 - 89AF
thunk_death_crawler_handler:

.create:  jml death_crawler_handler_create
.thing:   jsl death_crawler_handler_thing : rts
.destroy: jml death_crawler_handler_destroy
}

{ ;89B0 - 89B8
thunk_death_crawler_part:

.create: jml death_crawler_part_create
.thing: jsl  death_crawler_part_thing : rts
}

{ ;89B9 - 89C5
thunk_death_crawler:

.create:  jml death_crawler_create
.thing:   jsl death_crawler_thing : rts
.destroy: jml death_crawler_destroy
}

{ ;89C6 - 89C9
thunk__03C30E: ;unused

.create: jml _03C30E_create
}

{ ;89CA - 89D2
thunk_geyser:

.create: jml geyser_create
.thing:  jsl geyser_thing : rts
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
thunk__03A42C: ;unused

.create:  jml _03A42C_create
.thing:   jsl _03A42C_thing : rts
.destroy: jml _03A42C_destroy
}

{ ;89E9 - 89F5
thunk_killer:

.create:  jml killer_create
.thing:   jsl killer_thing : rts
.destroy: jml killer_destroy
}

{ ;89F6 - 8A02
thunk_tiny_goblin:

.create:  jml tiny_goblin_create
.thing:   jsl tiny_goblin_thing : rts
.destroy: jml tiny_goblin_destroy
}

{ ;8A03 - 8A06
thunk_game_over_text_flames:

.create: jml game_over_text_flames_create
}

{ ;8A07 - 8A0A
thunk_explosion_spawner:

.create: jml explosion_spawner_create
}

{ ;8A0B - 8A13
thunk_hannibal_projectile:

.create: jml hannibal_projectile_create
.thing:  jsl hannibal_projectile_thing : rts
}

{ ;8A14 - 8A1C
thunk_coral:

.create: jml coral_create
.thing:  jsl coral_thing : rts
}

{ ;8A1D - 8A20
thunk_waterfall_end:

.create: jml waterfall_end_create
}

{ ;8A21 - 8A24
thunk_silk_platform:

.create: jml silk_platform_create
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
thunk_menu_control:

.create: jml menu_control_create
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
thunk_lava_pillar:

.create: jml lava_pillar_create
.thing:  jsl lava_pillar_thing : rts
}

{ ;8A47 - 8A4A
thunk__03A2FC: ;unused

.create: jml _03A2FC_create
}

{ ;8A4B - 8A52
thunk_lava_dropper:

.create:  jml lava_dropper_create
.destroy: jml lava_dropper_destroy ;unused
}

{ ;8A53 - 8A5B
thunk_lava:

.create: jml lava_create
.thing:  jsl lava_thing : rts
}

{ ;8A5C - 8A68
thunk_astaroth:

.create:  jml astaroth_create
.destroy: jml astaroth_destroy
.thing:   jsl astaroth_thing : rts
}

{ ;8A69 - 8A75
thunk_nebiroth:

.create:  jml nebiroth_create
.destroy: jml nebiroth_destroy
.thing:   jsl nebiroth_thing :  rts
}

{ ;8A76 - 8A7E
thunk_conveyor_belt:

.create: jml conveyor_belt_create
.thing:  jsl conveyor_belt_thing : rts
}

{ ;8A7F - 8A8B
thunk_cockatrice_head2_spawner:

.create:    jml cockatrice_head2_spawner_create
.destroy:   jml cockatrice_head2_spawner_destroy ;unused
.thing:     jsl cockatrice_head2_spawner_thing : rts ;unused
}

{ ;8A8C - 8A98
thunk_cockatrice_head2:

.create:  jml cockatrice_head2_create
.destroy: jml cockatrice_head2_destroy
.thing:   jsl cockatrice_head2_thing : rts
}

{ ;8A99 - 8A9C
thunk_gate2:

.create: jml gate2_create
}

{ ;8A9D - 8AA9
thunk_mad_dog:

.create:  jml mad_dog_create
.destroy: jml mad_dog_destroy
.thing:   jsl mad_dog_thing : rts
}

{ ;8AAA - 8AB6
thunk_astaroth_flame:

.create:  jml astaroth_projectiles_flame_create
.destroy: jml astaroth_projectiles_flame_destroy
.thing:   jsl astaroth_projectiles_flame_thing : rts
}

{ ;8AB7 - 8ABF
thunk_astaroth_laser:

.create: jml astaroth_projectiles_laser_create
.thing:  jsl astaroth_projectiles_laser_thing : rts
}

{ ;8AC0 - 8AC8
thunk_avalanche:

.create: jml avalanche_create
.thing:  jsl avalanche_thing : rts
}

{ ;8AC9 - 8AD1
thunk_veil_allocen_projectile:

.create: jml veil_allocen_projectile_create
.thing:  jsl veil_allocen_projectile_thing : rts
}

{ ;8AD2 - 8ADA
thunk_freeze_splinter:

.create: jml freeze_splinter_create
.thing:  jsl freeze_splinter_thing : rts
}

{ ;8ADB - 8ADE
thunk_princess_dialogue:

.create: jml princess_dialogue_create
}

{ ;8ADF -
thunk_samael:

.create:  jml samael_create
.destroy: jml samael_destroy
.thing:   jsl samael_thing : rts
}

{ ;8AEC -
thunk_samael_platform:

.create:  jml samael_platform_create
.destroy: jml samael_platform_destroy ;not called from here
.thing:   jsl samael_platform_thing : rts ;not called from here
}

{ ;8AF9 -
thunk_samael_laser:

.create:  jml samael_laser_create
.destroy: jml samael_laser_destroy
.thing:   jsl samael_laser_thing : rts
}

{ ;8B06 - 8B09
thunk_sun:

.create: jml sun_create
}

{ ;8B0A - 8B0D
thunk_ending_object:

.create: jml ending_object_create
}

{ ;8B0E - 8B16
_028B0E: ;a8 x8
    ;clear armor pieces / magic
    jsr _0280E9
    inc.w open_magic_slots
    jmp _02821B_827A
}

{ ;8B17 - 8B1D
_028B17:
    inc.w open_magic_slots
.8B1A: ;a8 x-
    jsr _0280E9_80EE
    rtl
}

{ ;8B1E -
_028B1E: ;a- x16
    ldx.w slot_list_objects,Y
    iny #2
    rtl

.8B24: ;a- x16
    ;todo: name? gets object slot, doesn't have to check if they're available
    ;also only updates a temp index (y)
    ldx.w slot_list_objects,Y
    iny #2
    rts
}

{ ;8B2A - 8B35
_028B2A: ;a- x16
    ldx.w slot_list_objects,Y
    dey #2
    rtl

.local: ;a- x16
    ldx.w slot_list_objects,Y
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
    lda #$8C : sta.w obj.active,Y
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
    ldx.b obj.type
    ldy.w _00BE76-$20,X : jsl update_score
    rts
}

{ ;8BEC - 8C21
_028BEC: ;a8 x8
    lda $0F
    bmi _028BB9_8BBB

    ldx.b obj.type
    ldy.w _00BE76-$20,X : jsl update_score
.8BF9:
    lda #$3B : jsl _018049_8053 ;enemy death sfx
    jsr _0281FF
    lda.b obj.direction
    pha
    jsr _0280E9_80F2
    pla
    sta.b obj.facing
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
    ldx.b obj.type
    ldy.w _00BE76-$20,X : jsl update_score
    lda #$3B : jsl _018049_8053 ;enemy death sfx
    jsr _0281FF
    lda.b obj.direction
    pha
    jsr _0280E9_80F2
    pla
    sta.b obj.facing
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

{
    incsrc "objects/zombie.asm"       ;8D1D - 8FFB
    incsrc "objects/armor_piece.asm"  ;8FFC - 9024
    incsrc "objects/shield.asm"       ;9025 - 90D4
    incsrc "objects/shield_piece.asm" ;90D5 - 90FB
    incsrc "objects/stone_pillar.asm" ;90FC - 9138
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

    lda #$0C : sta.w obj.active,X
    lda #$34 : sta.w obj.type,X ;todo
    !A16
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    clc : lda.b obj.pos_y+1 : adc $2D : sta.w obj.pos_y+1,X
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
    incsrc "objects/stone_pillar2.asm"
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

{
    incsrc "objects/water_crash_splash.asm"       ;9234 - 9251
    incsrc "objects/ready_go.asm"                 ;9252 - 9292
    incsrc "objects/storm_cesaris.asm"            ;9293 - 94B6
    incsrc "objects/storm_cesaris_parts.asm"      ;94B7 - 95A7
    incsrc "objects/storm_cesaris_projectile.asm" ;95A8 - 95F0
    incsrc "objects/hannibal.asm"                 ;95F1 - 96E8
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
    lda.w enemy_spawner_data_C0C2+0,X : sta.b obj.pos_x+1
    lda.w enemy_spawner_data_C0C2+2,X : sta.b obj.pos_y+1
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

    lda.w open_object_slots
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
    sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda $07 : sta $0007,X
    !A16
    lda $13ED,Y : sta $002F,X
    lda $13F1,Y : sta $002D,X
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    !A8
    rts

;-----

.9824: dw .9843, .982C, .9844, .9861

;-----

.982C:
    lda $07 : inc : and #$03 : sta $07
    !AX16
    ldy.b obj.pos_y+1
    sec : lda #$0400 : sbc.b obj.pos_x+1 : sta.b obj.pos_y+1
    sty.b obj.pos_x+1
    !AX8
.9843:
    rts

;-----

.9844:
    lda $07 : inc #2 : and #$03 : sta $07
    !AX16
    lda #$0400 : sec : sbc.b obj.pos_x+1 : sta.b obj.pos_x+1
    lda #$0400 : sec : sbc.b obj.pos_y+1 : sta.b obj.pos_y+1
    !AX8
    rts

.9861: ;unused? seems to be related to stage 4 rotations
    lda $07 : dec : and #$03 : sta $07
    !AX16
    ldx.b obj.pos_x+1
    sec : lda #$0400 : sbc.b obj.pos_y+1 : sta.b obj.pos_x+1
    stx.b obj.pos_y+1
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
    stz.b obj.direction
    !A16
    lda.w _00ED00+$0A : sta $27
    stz $39
    !A8
    lda #$FF : sta $26
    ldy #$EA : ldx #$21 : jsl set_sprite
    lda $07
    cmp #$03
    bne .98C0

    inc.b obj.direction
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

    stz.b obj.speed_y+0
    stz.b obj.speed_y+1
    stz.b obj.speed_y+2
    lda #$28 : sta $3B
    bra .992A

.9905:
    jsl get_rng_16
    lda.w enemy_spawner_data_C0A2,X
    bne .9958

    stz.b obj.speed_y+0
    stz.b obj.speed_y+1
    stz.b obj.speed_y+2
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
    inc.b obj.direction
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
    lda.b obj.speed_x+2
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

    lda.b obj.hp
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
    jsl get_arthur_relative_side : sta.b obj.facing
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
    lda $2F : sta.b obj.speed_y
    lda.b obj.pos_x+1 : sta $2D : sta $31 : sta $35 : sta $39
    lda.b obj.pos_y+1 : sta $2F : sta $33 : sta $37 : sta $3B
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
    lda $2D,X : sta.b obj.pos_x+1
    lda $2F,X : sta.b obj.pos_y+1
    !X16
    ldy.b obj.speed_y
    lda.w obj.pos_x+1,Y : sta $2D,X
    lda.w obj.pos_y+1,Y : sta $2F,X
    !A8
    lda $07
    cmp #$04
    bne .9AA7

    lda.w obj.facing,Y
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
    lda.w enemy_spawner_data_C0EF,X : adc.w camera_x+1 : and #$07FF : sta.b obj.pos_x+1
    lda #$0580 : sta.b obj.pos_y+1
.9B37:
    brk #$00

;----- 9B39

    !A16
    lda.b obj.pos_y+1 : clc : adc #$0010 : sta.b obj.pos_y+1
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
    lda.w open_object_slots
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
    lda.b obj.pos_x+1 : sta $0004
    lda.b obj.pos_y+1 : sta $0006
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
    lda $0000 : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda $0001 : sta $0007,X
    lda $0002 : sta.w obj.direction,X
    !A16
    lda $13ED,Y : sta $002F,X ; todo: what is this?
    lda.w slot_list_objects,Y : sta $002D,X
    lda $0004 : sta.w obj.pos_x+1,X
    lda $0006 : sta.w obj.pos_y+1,X
    lda $0008 : sta $0031,X
    !A8
    rts
}

{ ;9BFB - 9D59
    incsrc "objects/icicle.asm"
}

{ ;9D5A -
_029D5A:
    ;flying knight spawner
    inc.b obj.facing
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
    bcs icicle_destroy_9D34

    lda $1B12
    bne .9D60

    jsl get_rng_16
    lda.w enemy_spawner_data_C161,X
    ldx.w difficulty
    clc
    adc.w enemy_spawner_data_C171,X
    cop #$00

;----- 9D83

    lda.w open_object_slots
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
    incsrc "objects/flying_knight.asm"
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
    incsrc "objects/hydra.asm"
}

{ ;B06D - B080
    ;unused
    !A8
    lda.b obj.type : sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    dec $07
    lda $07 : sta $0007,X
    rts
}

{ ;B081 - B0CC
update_pos_xy_2_child_obj:
    !AX16
    ldy $2D
    clc
    lda.b obj.direction
    and #$00FF
    adc.l speed_xy_offsets,X
    tax
    !A8
    clc
    lda speed_xy_x1,X : adc.b obj.pos_x+0 : sta.w obj.pos_x+0,Y
    lda speed_xy_x2,X : adc.b obj.pos_x+1 : sta.w obj.pos_x+1,Y
    lda speed_xy_x3,X : adc.b obj.pos_x+2 : sta.w obj.pos_x+2,Y
    clc
    lda speed_xy_y1,X : adc.b obj.pos_y+0 : sta.w obj.pos_y+0,Y
    lda speed_xy_y2,X : adc.b obj.pos_y+1 : sta.w obj.pos_y+1,Y
    lda speed_xy_y3,X : adc.b obj.pos_y+2 : sta.w obj.pos_y+2,Y

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
    lda.w _00C2BB,Y      : sta.w obj.pos_x+1,X
    lda.w _00C2BB_C2C5,Y : sta.w obj.pos_y+1,X
    !A8
    lda #$0C : sta.w obj.active,X
    lda #!id_belial : sta.w obj.type,X
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
    lda $2D  : adc.b obj.pos_y+0 : sta.b obj.pos_y+0
    lda $31  : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
    lda #$00 : adc.b obj.pos_y+2 : sta.b obj.pos_y+2
    rtl

.B11A:
    sec
    lda.b obj.pos_y+0 : sbc $2D  : sta.b obj.pos_y+0
    lda.b obj.pos_y+1 : sbc $31  : sta.b obj.pos_y+1
    lda.b obj.pos_y+2 : sbc #$00 : sta.b obj.pos_y+2
    rtl
}

{
    incsrc "objects/belial.asm"       ;B12E - B38D
    incsrc "objects/belial_flame.asm" ;B38E - B3A9
    incsrc "objects/splash.asm"       ;B3AA - B3D8
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
    stz.b obj.direction
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
    lda.b obj.pos_x+1 : sec : sbc.w !obj_arthur.pos_x+1 : sta $32
    lda #$18
    sec
    sbc $32
    bcs .B441

    lda #$01 : sta $34
.B441:
    !A16
    lda.w !obj_arthur.pos_y+1
    cmp.b obj.pos_y+1
    !A8
    bcs .B467

.B44C:
    brk #$00

;----- B44E

    lda #$01 : sta $2E
    jsl _02B102
    jsl update_pos_x
    !A16
    lda.w !obj_arthur.pos_y+1
    cmp.b obj.pos_y+1
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
    lda.w !obj_arthur.pos_y+1
    cmp.b obj.pos_y+1
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

    jsl get_arthur_relative_side : sta.b obj.direction
    eor #$FF                     : sta.b obj.facing
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

{
    incsrc "objects/bars.asm"                  ;B4F0 - B66C
    incsrc "objects/chest2.asm"                ;B66D - B6B9
    incsrc "objects/chest.asm"                 ;B6BA - B82C
    incsrc "objects/magician.asm"              ;B82D - B930
    incsrc "objects/small_explosion.asm"       ;B931 - B951
    incsrc "objects/magician_orb.asm"          ;B952 - BA35
    incsrc "objects/armor.asm"                 ;BA36 - BB9B
    incsrc "objects/weapon.asm"                ;BB9C - BDBE
    incsrc "objects/pickup_shield.asm"         ;BDBF - BED2
    incsrc "objects/trap.asm"                  ;BED3 - BF24
    incsrc "objects/bracelet_item.asm"         ;BF25 - C061
    incsrc "objects/bracelet_item_sparkle.asm" ;C062 - C097
    incsrc "objects/rosebud_chunk.asm"         ;C098 - C146
    incsrc "objects/rosebud.asm"               ;C147 - C40C
}

{ ;C40D - C435
    ;unused
    ldy #$A4 : ldx #$21 : jsl set_sprite
    lda #$0B : sta $3B
    jsl call_rng : and #$0F : sta.b obj.direction
    lda #$10 : ldx #$10 : jsl _0189D9
.C429:
    brk #$00

;----- C42B

    jsl update_animation_normal
    dec $3B
    bne .C429

    jmp _0281A8_81B5
}

{
    incsrc "objects/gate.asm"                   ;C436 - C40C
    incsrc "objects/arthur_plume.asm"           ;C50D - C5A6
    incsrc "objects/black_cover.asm"            ;C5A7 - C6FB
    incsrc "objects/raft.asm"                   ;C6FC - CA4F
    incsrc "objects/skulls.asm"                 ;CA50 - CB64
    incsrc "objects/money_bag.asm"              ;CB65 - CCE6
    incsrc "objects/arthur_map.asm"             ;CCE7 - CDD5
    incsrc "objects/pier.asm"                   ;CDD6 - CEB3
    incsrc "objects/pier_splinter.asm"          ;CEB4 - CF15
    incsrc "objects/raft_pulley.asm"            ;CF16 - D1DE
    incsrc "objects/raft_hanging.asm"           ;D1DF - D1FD
    incsrc "objects/shell.asm"                  ;D1FE - D323
    incsrc "objects/shell_pearl.asm"            ;D324 - D378
    incsrc "objects/flying_killer.asm"          ;D379 - D42D
    incsrc "objects/guillotine.asm"             ;D42E - D4AC
    incsrc "objects/arthur_face.asm"            ;D4AD - D53C
    incsrc "objects/cockatrice_spawner.asm"     ;D53D - D655
    incsrc "objects/cockatrice_body.asm"        ;D656 - DA95
    incsrc "objects/cockatrice_legs.asm"        ;DA96 - DB8F
    incsrc "objects/cockatrice_neck_base.asm"   ;DB90 - DBFA
    incsrc "objects/cockatrice_neck.asm"        ;DBFB - DDA3
    incsrc "objects/cockatrice_head.asm"        ;DDA4 - DEA0
    incsrc "objects/miniwing.asm"               ;DEA1 - EA94
    incsrc "objects/cockatrice_wings.asm"       ;E195 - E1F8
    incsrc "objects/boss_explosion_spawner.asm" ;E1F9 - E277
    incsrc "objects/boss_explosion.asm"         ;E278 - E2A9
    incsrc "objects/wolf.asm"                   ;E2AA - E429
    incsrc "objects/siren.asm"                  ;E42A - E612
    incsrc "objects/siren_projectile.asm"       ;E613 - E64F
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
    lda.w open_object_slots
    clc
    adc #$02
    cmp #$0C
    bcc .E65C

    jsl get_rng_bool : asl : tay
    !AX16
    lda.w ghost_data_spawn_offset_x,Y : adc.w camera_x+1 : sta.b obj.pos_x+1
    !AX8
    jsl call_rng : and #$0F : tay
    !AX16
    lda.w ghost_data_spawn_offset_y,Y : and #$00FF : adc.w camera_y+1 : sta.b obj.pos_y+1
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

{
    incsrc "objects/ghost.asm"          ;E6FB - E93B
    incsrc "objects/ghost_unformed.asm" ;E93C - E9F9
}

{ ;E9FA - EA1B
_02E9FA:
    jsr .local
    rtl

.local: ;a8 x16
    ;create object, store offsets of other objects
    sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda $07 : sta $0007,X
    !A16
    lda.w slot_list_objects-4,Y : sta $002F,X
    lda.w slot_list_objects-0,Y : sta $002D,X
    !A8
    rts
}

{ ;EA1C - EA36
    ;unused
    !AX16
    ldx $2F
    lda.w obj.pos_x+1,X : sta.b obj.pos_x+1
    lda.w obj.pos_y+1,X : sta.b obj.pos_y+1
    !AX8
    lda.w obj.pos_x+0,X : sta.b obj.pos_x+0
    lda.w obj.pos_y+0,X : sta.b obj.pos_y+0
    rts
}

{ ;EA37 - EA51
    ;unused
    !AX16
    ldx $2F
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    !AX8
    lda.b obj.pos_x+0 : sta.w obj.pos_x+0,X
    lda.b obj.pos_y+0 : sta.w obj.pos_y+0,X
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
    lda.b obj.direction : sta.w obj.direction,X
    lda.b obj.facing : sta.w obj.facing,X
    lda $07 : sta $0007,X
    lda $0F : sta $000F,X
    !AX8
    lda #$00
.EA82:
    rtl
}

{
    incsrc "objects/bat_spawner.asm" ;EA83 - EAC1
    incsrc "objects/bat.asm"         ;EAC2 - EB56
}

{ ;EB57 - EB7D
_02EB57: ;a8 x16
    sta.w obj.type,X
    lda #$0C : sta.w obj.active,X
    lda $0F : sta $000F,X
    lda $07 : sta $0007,X
    !A16
    lda.w slot_list_objects+0,Y : sta $002F,X
    lda.w slot_list_objects+4,Y : sta $002D,X
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
    lda.w obj.pos_x+1,X : sta.b obj.pos_x+1
    lda.w obj.pos_y+1,X : sta.b obj.pos_y+1
    !AX8
    rts
}

{ ;EB8F - EBA7
_02EB8F: ;a- x-
    !A16
    lda.b obj.pos_x+1 : sta $1EC0
    lda.b obj.pos_y+1 : sta $1EC3
    !A8
    lda.b obj.pos_x+0 : sta $1EBF
    lda.b obj.pos_y+0 : sta $1EC2
    rts
}

{ ;EBA8 - EBC0
_02EBA8: ;a- x-
    !A16
    lda $1EC0 : sta.b obj.pos_x+1
    lda $1EC3 : sta.b obj.pos_y+1
    !A8
    lda $1EBF : sta.b obj.pos_x+0
    lda $1EC2 : sta.b obj.pos_y+0
    rts
}

{ ;EBC1 - EBC7
_02EBC1:
    lda #!id_key : jsl prepare_object
    rtl
}

{
    incsrc "objects/key.asm"               ;EBC8 - EE44
    incsrc "objects/key_message.asm"       ;EE45 - EEE9
    incsrc "objects/_02EEEA.asm"           ;EEEA - EF02
    incsrc "objects/flower_projectile.asm" ;EF03 - EF69
    incsrc "objects/flower_bud.asm"        ;EF6A - EFD1
    incsrc "objects/flower_head.asm"       ;EFD2 - F13D
}

{ ;F13E -
;various flower functions

_02F13E:
    jsl update_pos_x
    dec $33
    bne .F150

    lda.b obj.direction : eor #$01 : sta.b obj.direction
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
    lda.b obj.pos_x+1 : and #$03 : sta.b obj.gravity
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
    lda.b obj.gravity ;not used as gravity
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

{
    incsrc "objects/coffin_dirt.asm"  ;F2A9 - F2F1
    incsrc "objects/pot.asm"          ;F2F2 - F370
    incsrc "objects/point_statue.asm" ;F371 - F410
    incsrc "objects/mimic.asm"        ;F411 - F542
    incsrc "objects/mimic_ghost.asm"  ;F543 - F597
}

{ ;F598 - F5B1
_02F598:
    ;unused
    jsr _02812E
    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$01 : sta.b obj.facing
.F5A7:
    brk #$00

;----- F5A9

    jsl update_animation_normal
    jsr _028074
    bra .F5A7
}

{
    incsrc "objects/rotating_platform.asm" ;F5B2 - F6C5
    incsrc "objects/stage4_transform.asm"  ;F6C6 - F7BE
    incsrc "objects/stage4_exit.asm"       ;F7BF - F7F4
    incsrc "objects/magic_charge.asm"      ;F7F5 - F886
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
    lda.w !obj_arthur.pos_x+2
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

    lda #$0C : sta.w obj.active,X
    lda #!id_zombie : sta.w obj.type,X
    inc.w obj_type_count+!id_zombie
    lda $2F : sta $0007,X
    !A16
    ldy $33
    clc
    lda.w zombie_spawner_data_offset_x,Y
    adc.w camera_x+1
    and #$FFF0
    sta.w obj.pos_x+1,X
    cmp.w zombie_previous_x_spawn
    bne +

    clc
    lda.w camera_x+1
    adc #$0110
    sta.w obj.pos_x+1,X
+:
    sta.w zombie_previous_x_spawn
    stz.w obj.pos_y+1,X
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
    lda.w open_magic_slots
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
    lda.b obj.hp : sbc.w obj.hp,Y : sta.b obj.hp
    bcs .ret

    stz.b obj.hp
    lda #$8C : sta.b obj.active
    lda $08  : ora #$80 : sta $08
    asl $09  : lsr $09
    lda.w obj.facing,Y : sta.b obj.direction
.ret:
    !AX8
.ret2:
    rts
}

{ ;FA37 - FAA0
_02FA37: ;a8 x?
    lda.w armor_state
    cmp #!arthur_state_gold
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
    lda.w open_magic_slots
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
    sec : lda.b obj.hp : sbc.w obj.hp,Y : sta.b obj.hp
    bcs .FA9E

    stz.b obj.hp
.FA9E:
    !AX8
.FAA0:
    rts
}

{ ;FAA1 - FABF
_02FAA1: ;a8 x?
    lda.w open_magic_slots
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
    lda.w open_magic_slots
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
    lda.b obj.type
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
    ldy.w #!obj_magic.base
    jmp _02FCD4_FD15
}

{ ;FB16 - FB2A
    ;unused
    lda.w open_magic_slots
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
    lda.b obj.hp : sbc.w obj.hp,Y : sta.b obj.hp
    bcs .FB99

    stz.b obj.hp
    lda #$04 : sta $000F,Y
    lda.w obj.facing,Y : sta.b obj.direction
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
    lda #$8C : sta.w obj.active,Y
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
    lda.w obj.facing,Y
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
    lda.b obj.hp : sbc.w obj.hp,Y : sta.b obj.hp ;decrease enemy hp by weapon's hp(damage)
    bcs .FC3E

    stz.b obj.hp
    lda #$8C : sta $00
    lda $08 : ora #$80 : sta $08
    asl $09 : lsr $09
    lda.w obj.facing,Y : sta.b obj.direction
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
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,Y
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,Y
    !A8
    clc
    rts
}

{ ;FCA7 - FCD3
_02FCA7: ;a8 x16
    lda.w open_weapon_slots
    bmi .FCD3

    phx
    phy
    jsl get_weapon_slot
    lda #$0C : sta.w obj.active,X
    lda #!id_weapon_hit : sta.w obj.type,X
    lda #$80 : sta $0008,X
    ply
    !A16
    lda.w obj.pos_x+1,Y : sta.w obj.pos_x+1,X
    lda.w obj.pos_y+1,Y : sta.w obj.pos_y+1,X
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

    lda.b obj.type
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
    ldy.w #!obj_weapons.base
.FD15:
    lda.w obj.active,Y
    and #$000D
    beq .FD57

    lda $0008,Y
    bit #$4000
    beq .FD57

    bit #$0080
    bne .FD57

    sec
    lda.b obj.pos_x+1
    sbc.w obj.pos_x+1,Y
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
    lda.b obj.pos_y+1
    sbc.w obj.pos_y+1,Y
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
    sta.w !obj_arthur.direction
    eor #$01
    sta.w !obj_arthur.facing
.FDA2:
    jsr _02FDB3_FDB7
    dec.w !obj_arthur.hp
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
    lda #$8C : sta.w !obj_arthur.active
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
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FE17

    sec
    lda.b obj.pos_y+1
    sbc.w !obj_arthur.pos_y+1
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
    lda.b obj.pos_x+1
    sbc $14BE
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FE85

    sec
    lda.b obj.pos_y+1
    sbc.w !obj_arthur.pos_y+1
    clc
    adc $1F21
    cmp $1F23
    bcs .FE85

    lda.b obj.pos_y+1
    cmp.w !obj_arthur.pos_y+1
    bcs .FE78

    ldy.w bowgun_magic_active
    bne .FE78 ;branch if under solid object and on raft

    adc $1F21
    sta.w !obj_arthur.pos_y+1
    stz.w !obj_arthur.speed_y
    !AX8
    stz.w !obj_arthur.speed_y+2
    rts

.FE78:
    inc
    sbc $1F21
    sta.w !obj_arthur.pos_y+1
    !AX8
    inc $14C3
    rts

.FE85:
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FEB9

    sec
    lda.b obj.pos_y+1
    sbc.w !obj_arthur.pos_y+1
    clc
    adc $1F21
    cmp $1F23
    bcs .FEB9

    lda.b obj.pos_x+1
    cmp.w !obj_arthur.pos_x+1
    bcc .FEB2

    sbc $1F1D
    sta $045B
    bra .FEB9

.FEB2:
    sec
    adc $1F1D
    sta.w !obj_arthur.pos_x+1
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

    lda.b obj.type
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
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FF1F

    sec
    lda.b obj.pos_y+1
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

    dec.w !obj_shield.hp
    bpl +

    lda #$8C : sta.w !obj_shield.active
    lda.w !obj_shield.flags1 : ora #$80 : sta.w !obj_shield.flags1
+:
    lda #$8C : sta.b obj.active
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

    lda.w !obj_shield.active
    and #$0D
    beq .FFA1

    lda.w !obj_shield.flags1
    bmi .FFA1

    lda.w _00DDB2+0,Y : sta $1F1D
    asl               : sta $1F1F
    lda.w _00DDB2+1,Y : sta $1F21
    asl               : sta $1F23
    lda.w !obj_shield._25
    bne .FFA1

    !A16
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_shield.pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .FFA2

    sec
    lda.b obj.pos_y+1
    sbc.w !obj_shield.pos_y+1
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
