{
stage_objects:
    dw offset(stage_objects, .stage1), offset(stage_objects, .stage2), offset(stage_objects, .stage3), offset(stage_objects, .stage4)
    dw offset(stage_objects, .stage4_b), offset(stage_objects, .stage4_c), offset(stage_objects, .stage5), offset(stage_objects, .stage6)
    dw offset(stage_objects, .stage7), offset(stage_objects, .stage8), offset(stage_objects, .game_over_time_over), offset(stage_objects, .map_screen)
    dw offset(stage_objects, .main_menu), offset(stage_objects, .main_menu), offset(stage_objects, .main_menu), offset(stage_objects, .main_menu)
    dw offset(stage_objects, .stage4_r1), offset(stage_objects, .stage4_r2), offset(stage_objects, .stage4_r3), offset(stage_objects, .stage4_r4)
    dw offset(stage_objects, .game_start_cutscene), offset(stage_objects, .game_start_cutscene_2), offset(stage_objects, .game_start_cutscene_3), offset(stage_objects, .ending)

    ;initial byte is obj count
    ;list of objects to place: type, init param, Xpos, Ypos

.stage1:
if !version == 0 || !version == 1
    db $53
elseif !version == 2
    db $4F
endif

    db !id_chest,              $85 : dw $0008, $0068
    db !id_enemy_spawner,      $80 : dw $0010, $00AA ;zombie spawner
    db !id_stone_pillar,       $80 : dw $00E8, $009C
    db !id_chest,              $91 : dw $0108, $00AA
    db !id_zombie,             $8F : dw $0138, $0000
    db !id_money_bag,          $80 : dw $0180, $0058
    db !id_stone_pillar,       $81 : dw $01E0, $00A4
    db !id_stone_pillar,       $81 : dw $0278, $0084
    db !id_zombie,             $8F : dw $0300, $0000
    db !id_bars,               $80 : dw $0310, $00AA
    db !id_bars,               $81 : dw $0310, $00AA
    db !id_black_cover,        $80 : dw $0310, $00B8
    db !id_money_bag,          $84 : dw $0330, $00A8
    db !id_wolf,               $81 : dw $0348, $0048
    db !id_flower_bud,         $83 : dw $0361, $00B0
    db !id_bars,               $82 : dw $0370, $00AA
    db !id_bars,               $83 : dw $0370, $00AA
    db !id_chest,              $83 : dw $03D0, $0055
    db !id_wolf,               $80 : dw $0410, $0078
    db !id_stone_pillar,       $81 : dw $0410, $00B6
if !version == 0 || !version == 1
    db !id_flower_bud,         $83 : dw $0460, $00BC
endif
    db !id_wolf,               $81 : dw $0538, $0058
    db !id_bars,               $90 : dw $0540, $00AA
    db !id_bars,               $91 : dw $0540, $00AA
    db !id_black_cover,        $82 : dw $0540, $00B8
    db !id_money_bag,          $88 : dw $0544, $0030
if !version == 0 || !version == 1
    db !id_flower_bud,         $83 : dw $0582, $00B0
endif
    db !id_chest,              $90 : dw $05A0, $00A0
if !version == 0 || !version == 1
    db !id_wolf,               $80 : dw $05E0, $005C
endif
    db !id_flower_bud,         $83 : dw $05EA, $00B8
    db !id_bars,               $92 : dw $05F0, $00AA
    db !id_bars,               $93 : dw $05F0, $00AA
    db !id_wolf,               $81 : dw $0648, $00A0
    db !id_money_bag,          $82 : dw $0650, $0038
    db !id_zombie,             $8F : dw $0680, $0000
    db !id_skulls,             $80 : dw $0760, $000C
    db !id_wolf,               $81 : dw $0768, $0050
    db !id_wolf,               $81 : dw $07A0, $0058
    db !id_skulls,             $81 : dw $07E0, $0070
    db !id_wolf,               $81 : dw $07F0, $0048
    db !id_chest,              $8E : dw $0800, $0080
    db !id_wolf,               $81 : dw $0820, $0058
    db !id_money_bag,          $86 : dw $0840, $0020
    db !id_skulls,             $82 : dw $0840, $0048
    db !id_stone_pillar,       $80 : dw $0890, $00AC
    db !id_wolf,               $80 : dw $0890, $0077
    db !id_money_bag,          $80 : dw $08A8, $00A8
    db !id_stone_pillar,       $80 : dw $08F8, $0064
    db !id_stone_pillar2,      $80 : dw $09F0, $009E
    db !id_money_bag,          $86 : dw $0A2C, $00B0
    db !id_stone_pillar2,      $81 : dw $0B10, $007E
    db !id_stone_pillar2,      $80 : dw $0B70, $0066
    db !id_chest,              $8F : dw $0B74, $0044
    db !id_chest,              $84 : dw $0D20, $0026
    db !id_money_bag,          $82 : dw $0D88, $0048
    db !id_rosebud,            $01 : dw $0DA0, $0068
    db !id_rosebud,            $01 : dw $0DC0, $0048
    db !id_rosebud,            $00 : dw $0DD8, $0090
    db !id_rosebud,            $01 : dw $0E30, $0030
    db !id_belial,             $80 : dw $0E30, $0040
    db !id_rosebud,            $01 : dw $0E50, $0028
    db !id_rosebud,            $02 : dw $0E98, $0060
    db !id_money_bag,          $88 : dw $0EC0, $0040
    db !id_rosebud,            $01 : dw $0EC0, $0078
    db !id_chest,              $87 : dw $0F00, $0020
    db !id_belial,             $80 : dw $0F10, $0078
    db !id_rosebud,            $02 : dw $0F60, $0070
    db !id_rosebud,            $02 : dw $0F90, $0058
    db !id_money_bag,          $88 : dw $0F98, $0038
    db !id_chest,              $86 : dw $0FB0, $0090
    db !id_money_bag,          $82 : dw $0FC0, $00C0
    db !id_rosebud,            $02 : dw $0FD8, $0088
    db !id_rosebud,            $01 : dw $1020, $0040
    db !id_belial,             $80 : dw $1050, $0040
    db !id_money_bag,          $82 : dw $1088, $0020
    db !id_belial,             $80 : dw $10D0, $0060
    db !id_rosebud,            $01 : dw $10F0, $0040
    db !id_rosebud,            $03 : dw $1120, $0078
if !version == 0 || !version == 1
    db !id_belial,             $80 : dw $1168, $006C
endif
    db !id_chest,              $8D : dw $1170, $00A6
    db !id_money_bag,          $82 : dw $1188, $0020
    db !id_money_bag,          $82 : dw $1188, $00A4
    db !id_cockatrice_spawner, $80 : dw $132A, $0078

.stage2:
if !version == 0 || !version == 1
    db $61
elseif !version == 2
    db $5B
endif

    db !id_pier,          $80 : dw $0050, $02B0
    db !id_chest,         $88 : dw $0100, $0240
    db !id_enemy_spawner, $89 : dw $0180, $0238 ;ghost spawner
    db !id_money_bag,     $82 : dw $0268, $0230
    db !id_chest,         $89 : dw $02C0, $024E
    db !id_chest,         $82 : dw $0300, $017C
    db !id_money_bag,     $82 : dw $0358, $0140
if !version == 0 || !version == 1
    db !id_guillotine,    $80 : dw $03D0, $0150
endif
    db !id_guillotine,    $81 : dw $043C, $01A2
    db !id_money_bag,     $80 : dw $0460, $0260
    db !id_raft_pulley,   $80 : dw $0464, $014E
    db !id_money_bag,     $80 : dw $0478, $0214
    db !id_money_bag,     $80 : dw $05A0, $0174
    db !id_mimic,         $80 : dw $05A0, $0220
    db !id_guillotine,    $80 : dw $05C0, $0118
    db !id_chest,         $8B : dw $0620, $0104
    db !id_mimic,         $80 : dw $0640, $010C
    db !id_mimic,         $80 : dw $0660, $0174
    db !id_money_bag,     $80 : dw $0674, $01C0
    db !id_money_bag,     $80 : dw $06B0, $0211
    db !id_chest,         $8A : dw $06D0, $01D0
    db !id_mimic,         $80 : dw $06C0, $0112
    db !id_guillotine,    $81 : dw $06D0, $0128
    db !id_chest,         $8C : dw $0740, $0160
    db !id_money_bag,     $80 : dw $0784, $00C8
if !version == 0 || !version == 1
    db !id_guillotine,    $80 : dw $0790, $00CC
endif
    db !id_mimic,         $80 : dw $07D0, $0114
    db !id_mimic,         $80 : dw $0840, $0150
    db !id_money_bag,     $82 : dw $08C8, $00C8
    db !id_mimic,         $80 : dw $08D0, $0114
    db !id_raft,          $80 : dw $09CC, $00F4
    db !id_raft,          $87 : dw $09CC, $00F4
    db !id_money_bag,     $8C : dw $0A00, $00F0 ;not a normal money bag: triggers vortex sfx
    db !id_raft,          $81 : dw $0A98, $02B0
    db !id_raft,          $82 : dw $0B28, $0290
    db !id_chest,         $81 : dw $0BA0, $0298
    db !id_flying_killer, $80 : dw $0BC0, $02C0
    db !id_flying_killer, $80 : dw $0C00, $02C0
    db !id_flying_killer, $80 : dw $0C30, $02C0
    db !id_flying_killer, $80 : dw $0C40, $02B8
    db !id_chest,         $88 : dw $0C48, $0264
    db !id_flying_killer, $80 : dw $0C70, $02B8
    db !id_money_bag,     $8E : dw $0C80, $0280 ;lightning?
    db !id_flying_killer, $80 : dw $0C80, $02B8
    db !id_hannibal,      $80 : dw $0CA0, $0290
    db !id_money_bag,     $80 : dw $0CB8, $0280
    db !id_flying_killer, $80 : dw $0D00, $02D0
if !version == 0 || !version == 1
    db !id_flying_killer, $80 : dw $0D20, $02B8
endif
    db !id_flying_killer, $80 : dw $0D50, $02C0
    db !id_hannibal,      $80 : dw $0D70, $0250
    db !id_money_bag,     $80 : dw $0D68, $0280
    db !id_flying_killer, $80 : dw $0DC0, $02D0
if !version == 0 || !version == 1
    db !id_flying_killer, $80 : dw $0DE0, $02C0
endif
    db !id_flying_killer, $80 : dw $0E00, $02C8
    db !id_flying_killer, $80 : dw $0E40, $02C0
    db !id_hannibal,      $80 : dw $0E70, $0230
    db !id_coral,         $80 : dw $0E78, $0258
    db !id_coral,         $80 : dw $0E78, $0268
    db !id_coral,         $80 : dw $0E78, $0278
    db !id_coral,         $80 : dw $0E78, $0288
    db !id_money_bag,     $88 : dw $0E88, $0210
    db !id_flying_killer, $80 : dw $0EC0, $02D0
    db !id_hannibal,      $80 : dw $0F20, $0280
if !version == 0 || !version == 1
    db !id_flying_killer, $80 : dw $0F20, $02C0
endif
    db !id_money_bag,     $80 : dw $0F38, $0280
    db !id_flying_killer, $80 : dw $0F40, $02C0
    db !id_hannibal,      $80 : dw $0F80, $0260
    db !id_coral,         $80 : dw $0F88, $0218
    db !id_coral,         $80 : dw $0F88, $0228
    db !id_coral,         $80 : dw $0F88, $0238
    db !id_coral,         $80 : dw $0F88, $0248
    db !id_coral,         $80 : dw $0F88, $0278
    db !id_coral,         $80 : dw $0F88, $0288
    db !id_money_bag,     $88 : dw $0F98, $0280
if !version == 0 || !version == 1
    db !id_flying_killer, $80 : dw $0FA0, $02C0
endif
    db !id_flying_killer, $80 : dw $0FC0, $02C0
    db !id_siren,         $80 : dw $1000, $0280
    db !id_hannibal,      $80 : dw $1080, $0230
    db !id_money_bag,     $80 : dw $10E0, $0250
    db !id_hannibal,      $80 : dw $10F0, $0220
    db !id_chest,         $83 : dw $1110, $0218
    db !id_raft,          $83 : dw $1174, $02B0
    db !id_siren,         $80 : dw $1180, $0280
    db !id_chest,         $82 : dw $11B8, $0274
    db !id_raft,          $84 : dw $1254, $02B0
    db !id_siren,         $80 : dw $1290, $0280
    db !id_money_bag,     $80 : dw $12F8, $0260
    db !id_raft,          $85 : dw $1324, $02B0
    db !id_flying_killer, $80 : dw $1370, $02B0
    db !id_flying_killer, $80 : dw $13A0, $02B0
    db !id_siren,         $80 : dw $13A0, $0280
    db !id_flying_killer, $80 : dw $13C0, $02B0
    db !id_flying_killer, $80 : dw $1410, $02A0
    db !id_raft,          $86 : dw $1414, $02B0
    db !id_flying_killer, $80 : dw $1420, $02C0
    db !id_flying_killer, $80 : dw $1460, $02B8
    db !id_storm_cesaris, $8D : dw $15B0, $0340

.stage3:
if !version == 0 || !version == 1
    db $5D
elseif !version == 2
    db $59
endif

    db !id_chest,                 $9D : dw $0020, $0220
    db !id_killer,                $81 : dw $0028, $01F8
    db !id_lava_dropper,          $80 : dw $0028, $0208
if !version == 0 || !version == 1
    db !id_killer,                $81 : dw $0028, $0268
endif
    db !id_killer,                $81 : dw $0088, $02D8
    db !id_lava_dropper,          $80 : dw $0098, $0278
    db !id_killer,                $81 : dw $0098, $0268
    db !id_money_bag,             $86 : dw $00A0, $0254
    db !id_lava_dropper,          $80 : dw $00A8, $0208
    db !id_grilian,               $81 : dw $00C0, $0310
if !version == 0 || !version == 1
    db !id_killer,                $81 : dw $00C8, $0188
endif
    db !id_killer,                $81 : dw $00C8, $01F8
    db !id_lava_dropper,          $80 : dw $00C8, $0138
    db !id_grilian,               $81 : dw $00C8, $0240
if !version == 0 || !version == 1
    db !id_killer,                $81 : dw $00D8, $0128
endif
    db !id_killer,                $81 : dw $00F8, $0188
    db !id_grilian,               $81 : dw $0130, $0100
    db !id_money_bag,             $80 : dw $0138, $01D4
    db !id_killer,                $81 : dw $0148, $0278
    db !id_lava_pillar,           $80 : dw $0158, $0358
if !version == 0 || !version == 1
    db !id_killer,                $81 : dw $0158, $01F8
endif
    db !id_chest,                 $9A : dw $0160, $0120
    db !id_chest,                 $9C : dw $0160, $01C0
    db !id_money_bag,             $80 : dw $0170, $0114
    db !id_money_bag,             $80 : dw $0180, $0174
    db !id_killer,                $81 : dw $0188, $0128
    db !id_chest,                 $9B : dw $0188, $01A0
    db !id_lava_pillar,           $80 : dw $01B0, $0378
    db !id_lava_pillar,           $82 : dw $01F0, $0388
    db !id_conveyor_belt,         $83 : dw $0260, $0360
    db !id_conveyor_belt,         $88 : dw $0260, $03D0
    db !id_conveyor_belt,         $80 : dw $02C0, $0398
    db !id_conveyor_belt,         $87 : dw $02B0, $0440
    db !id_conveyor_belt,         $81 : dw $0300, $03A8
    db !id_conveyor_belt,         $87 : dw $02F0, $0498
    db !id_lava_pillar,           $82 : dw $0350, $0508
    db !id_lava_pillar,           $82 : dw $03A0, $0508
    db !id_lava_pillar,           $82 : dw $0400, $0518
    db !id_lava_pillar,           $80 : dw $0438, $0518
    db !id_arremer,               $80 : dw $05A0, $04B0
    db !id_tower_edge,            $83 : dw $0640, $047A
    db !id_tower_edge,            $90 : dw $0700, $044B
    db !id_bat_spawner,           $82 : dw $0700, $0500
    db !id_gargoyle_statue,       $80 : dw $0700, $0430
    db !id_gargoyle_statue,       $80 : dw $0740, $0420
    db !id_chest2,                $80 : dw $0780, $0400
    db !id_gargoyle_statue,       $80 : dw $07A0, $0400
    db !id_moving_platform,       $8C : dw $0900, $03C0
    db !id_money_bag,             $88 : dw $0980, $0380
    db !id_money_bag,             $80 : dw $09E0, $03A0
    db !id_tower_edge,            $85 : dw $0A40, $03BF
    db !id_gargoyle_statue,       $80 : dw $0AF8, $03A0
    db !id_tower_edge,            $94 : dw $0B00, $03BF
    db !id_bat_spawner,           $81 : dw $0B00, $0500
    db !id_chest2,                $81 : dw $0BE0, $03C0
    db !id_moving_platform,       $8C : dw $0C00, $03A0
    db !id_money_bag,             $88 : dw $0C80, $0360
    db !id_money_bag,             $80 : dw $0CC0, $0380
    db !id_tower_edge,            $83 : dw $0D40, $037A
    db !id_bat_spawner,           $80 : dw $0E20, $0380
    db !id_tower_edge,            $90 : dw $0E00, $034A
    db !id_gargoyle_statue,       $80 : dw $0E00, $0330
    db !id_gargoyle_statue,       $80 : dw $0E40, $0320
    db !id_chest2,                $82 : dw $0E40, $0330
    db !id_gargoyle_statue,       $80 : dw $0F40, $02E0
    db !id_gargoyle_statue,       $80 : dw $0F78, $02D2
    db !id_gargoyle_statue,       $80 : dw $0FB0, $02C4
    db !id_gargoyle_statue,       $80 : dw $0FE8, $02B6
    db !id_moving_platform,       $8E : dw $1100, $0280
    db !id_money_bag,             $88 : dw $1140, $0240
    db !id_money_bag,             $88 : dw $1140, $0240
    db !id_tower_edge,            $85 : dw $1240, $025F
    db !id_enemy_spawner,         $87 : dw $1280, $03A0 ;goblin spawner
    db !id_tower_edge,            $94 : dw $1300, $025F
    db !id_chest2,                $83 : dw $1300, $0220
    db !id_moving_platform,       $8E : dw $13F0, $0240
    db !id_money_bag,             $80 : dw $1440, $0220
    db !id_money_bag,             $88 : dw $14C0, $0200
    db !id_tower_edge,            $81 : dw $1560, $023B
    db !id_tower_edge,            $92 : dw $1620, $026A
    db !id_chest2,                $84 : dw $1640, $0268
    db !id_silk_platform,         $80 : dw $1810, $02C8
    db !id_silk_platform,         $80 : dw $1890, $02C8
    db !id_silk_platform,         $80 : dw $1910, $02C8
    db !id_silk_platform,         $82 : dw $1950, $02A8
    db !id_silk_platform,         $80 : dw $1990, $02C8
    db !id_silk_platform,         $80 : dw $19C0, $0288
    db !id_death_crawler_handler, $80 : dw $19F0, $0000
    db !id_silk_platform,         $80 : dw $1A10, $02C8
    db !id_silk_platform,         $80 : dw $1A90, $02C8
    db !id_silk_platform,         $80 : dw $1AD0, $02C8
    db !id_silk_gate,             $80 : dw $1AD8, $0280
    db !id_silk_gate,             $81 : dw $1AD8, $0280

.stage4:
if !version == 0 || !version == 1
    db $0A
elseif !version == 2
    db $09
endif

    db !id_stage4_transform,            $80 : dw $0000, $0000
    db !id_chest,                       $92 : dw $0020, $0360
    db !id_enemy_spawner,               $88 : dw $0080, $0380 ;eagler spawner
    db !id_rotating_platform,           $82 : dw $00A0, $0160
    db !id_money_bag,                   $80 : dw $0140, $0378
    db !id_money_bag,                   $88 : dw $01A0, $0358
    db !id_rotating_platform,           $81 : dw $01E0, $0270
    db !id_rotating_platform,           $80 : dw $0220, $0370
if !version == 0 || !version == 1
    db !id_skull_flower_multi_inactive, $83 : dw $0280, $0320
endif
    db !id_rotating_platform,           $83 : dw $0370, $0140

..r1: ;first rotation
    db $00

..r2: ;second rotation
if !version == 0 || !version == 1
    db $13
elseif !version == 2
    db $0F
endif

    db !id_skull_flower_multi_inactive, $80 : dw $0060, $0100
    db !id_skull_flower_multi_inactive, $80 : dw $00C0, $0100
    db !id_skull_flower_multi_inactive, $82 : dw $00D0, $0180
    db !id_money_bag,                   $88 : dw $00E0, $0178
    db !id_skull_flower_multi_inactive, $82 : dw $0120, $0180
    db !id_money_bag,                   $80 : dw $0160, $0108
if !version == 0 || !version == 1
    db !id_skull_flower_multi_inactive, $80 : dw $0170, $0100
    db !id_skull_flower_multi_inactive, $80 : dw $01C0, $0100
endif
    db !id_money_bag,                   $80 : dw $01D0, $0178
    db !id_money_bag,                   $80 : dw $01E0, $0108
    db !id_skull_flower_multi_inactive, $82 : dw $0220, $0180
    db !id_chest,                       $96 : dw $02A0, $0260
if !version == 0 || !version == 1
    db !id_skull_flower_multi_inactive, $80 : dw $02E0, $0100
    db !id_skull_flower_multi_inactive, $82 : dw $02E0, $0260
endif
    db !id_chest2,                      $8B : dw $02F0, $01D0
    db !id_money_bag,                   $80 : dw $0318, $0258
    db !id_skull_flower_multi_inactive, $83 : dw $0340, $0200
    db !id_money_bag,                   $80 : dw $0398, $0198
    db !id_chest,                       $98 : dw $03B0, $0160

..r3: ;third rotation
    db $01

    db !id_chest, $92 : dw $0298, $02C0

..r4: ;fourth rotation
    db $03

    db !id_stage4_exit, $80 : dw $0040, $0130
    db !id_chest2,      $94 : dw $0070, $00FA
    db !id_money_bag,   $88 : dw $0368, $00E8

..b:
if !version == 0 || !version == 1
    db $16
elseif !version == 2
    db $11
endif

    db !id_moving_platform, $82 : dw $0080, $02E4
    db !id_stage4_exit,     $81 : dw $0090, $00C8
    db !id_moving_platform, $80 : dw $00C0, $032C
    db !id_moving_platform, $88 : dw $00C0, $0290
    db !id_killer,          $80 : dw $0100, $0080
    db !id_enemy_spawner,   $8F : dw $0100, $0080 ;annihilation cell spawner
if !version == 0 || !version == 1
    db !id_geyser,          $01 : dw $0130, $0330
    db !id_geyser,          $00 : dw $0140, $02A0
endif
    db !id_geyser,          $01 : dw $0140, $0200
    db !id_geyser,          $00 : dw $0180, $00F8
    db !id_geyser,          $00 : dw $01C0, $03B0
if !version == 0 || !version == 1
    db !id_geyser,          $00 : dw $0200, $00F8
    db !id_geyser,          $00 : dw $0200, $0270
endif
    db !id_geyser,          $01 : dw $0240, $0338
    db !id_geyser,          $00 : dw $0280, $00F8
    db !id_geyser,          $01 : dw $0268, $0220
if !version == 0 || !version == 1
    db !id_geyser,          $00 : dw $02C0, $03C0
endif
    db !id_moving_platform, $84 : dw $0300, $017C
    db !id_moving_platform, $8A : dw $0320, $00E8
    db !id_moving_platform, $82 : dw $0330, $0134
    db !id_moving_platform, $84 : dw $0350, $01B8
    db !id_moving_platform, $86 : dw $0380, $039C

..c:
    db $01

    db !id_hydra, $8F : dw $0100, $0088

.stage5:
if !version == 0 || !version == 1
    db $31
elseif !version == 2
    db $2F
endif

    db !id_money_bag,            $80 : dw $0030, $0758
    db !id_chest,                $99 : dw $0040, $0880
    db !id_flower_bud,           $83 : dw $00D0, $07B8
    db !id_grilian,              $80 : dw $00E0, $0710
    db !id_money_bag,            $88 : dw $0140, $06E0
    db !id_grilian,              $80 : dw $0160, $05A8
    db !id_money_bag,            $88 : dw $0160, $0630
    db !id_flower_bud,           $83 : dw $0180, $07E0
    db !id_money_bag,            $80 : dw $0198, $0560
    db !id_flower_bud,           $83 : dw $01A0, $0728
    db !id_flower_bud,           $83 : dw $01C0, $0678
    db !id_grilian,              $80 : dw $01E0, $0820
    db !id_chest,                $94 : dw $0220, $0840
    db !id_flower_bud,           $83 : dw $0230, $06D0
    db !id_enemy_spawner,        $86 : dw $0380, $0580
    db !id_enemy_spawner,        $8A : dw $0400, $0580
    db !id_chest,                $92 : dw $0480, $0540
    db !id_money_bag,            $80 : dw $0480, $0573
    db !id_money_bag,            $80 : dw $0620, $055C
    db !id_chest,                $97 : dw $0660, $0540
    db !id_arremer,              $82 : dw $0680, $059E
    db !id_ice_bridge_spawner,   $80 : dw $0708, $05C3
    db !id_chest2,               $85 : dw $07A0, $0540
    db !id_mad_dog,              $80 : dw $0810, $0540
if !version == 0 || !version == 1
    db !id_mad_dog,              $81 : dw $0830, $0594
endif
    db !id_money_bag,            $80 : dw $0860, $0534
    db !id_mad_dog,              $81 : dw $08A0, $0580
    db !id_chest2,               $86 : dw $08A0, $0580
    db !id_mad_dog,              $82 : dw $08B0, $0550
    db !id_money_bag,            $88 : dw $0900, $0548
    db !id_mad_dog,              $82 : dw $0940, $0570
    db !id_money_bag,            $82 : dw $097C, $0525
    db !id_grilian,              $80 : dw $09A0, $0470
    db !id_mad_dog,              $80 : dw $0A00, $0418
    db !id_money_bag,            $82 : dw $0A00, $04AA
    db !id_mad_dog,              $80 : dw $0A40, $04E8
    db !id_chest2,               $88 : dw $0A40, $03C0
    db !id_money_bag,            $88 : dw $0A48, $041E
    db !id_grilian,              $80 : dw $0B40, $03C8
    db !id_avalanche,            $80 : dw $0B00, $0440
    db !id_mad_dog,              $81 : dw $0C10, $03AC
    db !id_avalanche,            $81 : dw $0C40, $0440
if !version == 0 || !version == 1
    db !id_mad_dog,              $81 : dw $0CC0, $037C
endif
    db !id_chest,                $93 : dw $0CD9, $0311
    db !id_grilian,              $80 : dw $0D00, $0360
    db !id_avalanche,            $82 : dw $0D80, $0440
    db !id_veil_allocen_spawner, $80 : dw $0E00, $02B1
    db !id_money_bag,            $80 : dw $0E7B, $032E
    db !id_avalanche,            $83 : dw $0E80, $0440

.stage6:
if !version == 0 || !version == 1
    db $10
elseif !version == 2
    db $0F
endif

    db !id_chest,                    $8E : dw $0080, $0380
if !version == 0 || !version == 1
    db !id_arremer,                  $84 : dw $0140, $0240
endif
    db !id_chest2,                   $8C : dw $0160, $0248
    db !id_money_bag,                $80 : dw $0160, $02B0
    db !id_arremer,                  $84 : dw $01A0, $0370
    db !id_enemy_spawner,            $8E : dw $0230, $02C0
    db !id_chest,                    $8E : dw $0268, $0120
    db !id_money_bag,                $80 : dw $0268, $0150
    db !id_cockatrice_head2_spawner, $80 : dw $0270, $0118
    db !id_chest2,                   $8E : dw $02C0, $0140
    db !id_arremer,                  $84 : dw $02D0, $022C
    db !id_money_bag,                $80 : dw $02F0, $0274
    db !id_chest2,                   $8D : dw $0300, $0230
    db !id_enemy_spawner,            $8E : dw $0340, $0260
    db !id_enemy_spawner,            $8E : dw $03B0, $0200
    db !id_astaroth,                 $80 : dw $04D0, $0138

.stage7:
if !version == 0 || !version == 1
    db $19
elseif !version == 2
    db $16
endif

    db !id_astaroth,                 $82 : dw $04D0, $0158
    db !id_chest2,                   $91 : dw $0130, $01C0
    db !id_mimic,                    $80 : dw $01C0, $01C4
    db !id_mimic,                    $80 : dw $0200, $0220
    db !id_chest,                    $86 : dw $0240, $0260
    db !id_enemy_spawner,            $89 : dw $0100, $02D0
    db !id_chest2,                   $98 : dw $01A0, $0380
    db !id_cockatrice_head2_spawner, $83 : dw $0180, $03C0
    db !id_cockatrice_head2_spawner, $82 : dw $0280, $03C0
    db !id_money_bag,                $88 : dw $0188, $0478
    db !id_chest2,                   $90 : dw $0240, $0480
    db !id_chest2,                   $97 : dw $0180, $04A0
if !version == 0 || !version == 1
    db !id_arremer,                  $86 : dw $0200, $04D0
endif
    db !id_chest2,                   $8F : dw $0100, $0540
    db !id_cockatrice_head2_spawner, $80 : dw $00E0, $0548
    db !id_money_bag,                $80 : dw $0118, $05F8
    db !id_cockatrice_head2_spawner, $80 : dw $0120, $0620
if !version == 0 || !version == 1
    db !id_killer,                   $81 : dw $0050, $0680
endif
    db !id_killer,                   $81 : dw $0118, $0680
    db !id_cockatrice_head2_spawner, $81 : dw $0070, $06E0
    db !id_money_bag,                $80 : dw $0078, $0714
    db !id_killer,                   $81 : dw $0118, $0720
    db !id_killer,                   $81 : dw $005A, $0740
if !version == 0 || !version == 1
    db !id_killer,                   $81 : dw $0118, $0760
endif
    db !id_chest2,                   $93 : dw $0040, $0780

.stage8:
    db $02
    db !id_samael,   $90 : dw $0080, $0180
    db !id_princess, $80 : dw $0100, $01A0

.game_over_time_over:
    db $01
    db !id_arthur_map, $80 : dw $0080, $0080

.map_screen:
    db $01
    db !id_arthur_map, $81 : dw $0100, $0180

.main_menu:
    db $01
    db !id_menu_control, $80 : dw $0080, $0080

.game_start_cutscene:
    db $02
    db !id_cutscene_arthur,   $80 : dw $0070, $00B8
    db !id_cutscene_princess, $80 : dw $0090, $00B8

.game_start_cutscene_2:
    db $02
    db !id_cutscene_arthur,   $80 : dw $007A, $00B8
    db !id_cutscene_princess, $81 : dw $0086, $00B8

.game_start_cutscene_3:
    db $02
    db !id_cutscene_arthur, $82 : dw $0030, $00B8
    db !id_satan,           $80 : dw $00A0, $0060

.ending:
    db $03
    db !id_sun,           $80 : dw $0040, $0094
    db !id_ending_object, $80 : dw $00C1, $008F
    db !id_ending_object, $81 : dw $00C0, $009D
}
