org $048000

if !version == 1 || !version == 2
{ ;8000 - 84B2
    incsrc "various/text.asm"
}
endif

if !version == 2
{ ;84B9 - 8592
_0484B9:
    phb
    lda #$04 : pha : plb
    stz $1EC3
    stz $1EC4
    lda $0055,Y : asl : tay
    !AX16
    lda.w text,Y
    tay
.84CF:
    ldx.w text_base,Y
    iny #2
.84D4:
    !A8
    lda #$04 : jsl _01A717_A728
.84DC:
    lda.w text_base,Y
    cmp #$FF
    bne .84E8

    plb
    jml _01A717

.84E8:
    cmp #$FD
    beq .new_line

    cmp #$FE
    beq .move_cursor

    cmp #$FB
    beq .clear_text

    cmp #$FA
    beq .new_page

    cmp #$FC
    beq .pause

    cmp #$F8
    beq .8513

    jsr .857A
    bra .84D4

;-----

.new_page:
    iny
    bra .84CF

;-----

.pause:
    iny
    lda.w text_base,Y : jsl _01A717_A728
    iny
    bra .84DC

;-----

.8513:
    iny
    lda.w text_base,Y
    !A16
    asl #10
    and #$1C00
    sta $1EC3
    !A8
    iny
    bra .84DC

;-----

.move_cursor:
    iny
    lda.w text_base,Y
    asl
    !A16
    stx $1EBD
    clc
    adc $1EBD
    tax
    !A8
    iny
    bra .84DC

;-----

.new_line:
    !A16
    txa
    clc
    adc #$0080
    and #$FF80
    tax
    iny
    !A8
    jmp .84D4

;-----

.clear_text:
    phx
    !A16
    ldx #$0000
    lda #$0400 : sta $1EBF
    lda #$21C5
    ora $1EC3
.8565:
    sta $7F9000,X
    inx #2
    dec $1EBF
    bne .8565

    !A8
    inc $0323
    plx
    iny
    jmp .84DC

;-----

.857A:
    !A16
    and #$00FF
    clc
    adc #$2180
    ora $1EC3
    sta $7F9000,X
    !A8
    inc $0323
    iny
    inx #2
    rts
}
endif

{ ;8000 - 8A6A
_048000:
    dw offset(_048000, .stage1), offset(_048000, .stage2), offset(_048000, .stage3), offset(_048000, .stage4)
    dw offset(_048000, .stage4_b), offset(_048000, .stage4_c), offset(_048000, .stage5), offset(_048000, .stage6)
    dw offset(_048000, .stage7), offset(_048000, .stage8), offset(_048000, .game_over_time_over), offset(_048000, .map_screen)
    dw offset(_048000, .main_menu), offset(_048000, .main_menu), offset(_048000, .main_menu), offset(_048000, .main_menu)
    dw offset(_048000, .stage4_r1), offset(_048000, .stage4_r2), offset(_048000, .stage4_r3), offset(_048000, .stage4_r4)
    dw offset(_048000, .game_start_cutscene), offset(_048000, .game_start_cutscene_2), offset(_048000, .game_start_cutscene_3), offset(_048000, .ending)

    ;initial byte is obj count
    ;list of objects to place: type, 07, Xpos, Ypos

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
    db !id_arthur_cutscene,   $80 : dw $0070, $00B8
    db !id_princess_cutscene, $80 : dw $0090, $00B8

.game_start_cutscene_2:
    db $02
    db !id_arthur_cutscene,   $80 : dw $007A, $00B8
    db !id_princess_cutscene, $81 : dw $0086, $00B8

.game_start_cutscene_3:
    db $02
    db !id_arthur_cutscene, $82 : dw $0030, $00B8
    db !id_satan_cutscene,  $80 : dw $00A0, $0060

.ending:
    db $03
    db !id_sun,        $80 : dw $0040, $0094
    db !id_ending_obj, $80 : dw $00C1, $008F
    db !id_ending_obj, $81 : dw $00C0, $009D
}

{ ;8A6B - 8AD2
_048A6B: ;a8 x8
    phd
    lda #$00 : pha : pha
    pld
    phb
    lda #$04 : pha : plb
    jsr _048BB8
    !A16
    ldy $1FD2
    clc
    lda $15DD,Y
    pha
    adc #$0120
    lsr #5
    sta $1E9A
    lda $15DD,Y : sta $1E9E
    pla
    sec
    sbc #$0020
    lsr #5
    sta $1E9C
    !AX8
    tax
    lda.w stage
    cmp #$10
    beq .8AD0

    cmp #$11
    beq .8AD0

    cmp #$12
    beq .8AD0

    cmp #$13
    beq .8AD0

    ldy #$0B
    cmp #$03
    beq .8AC1

    cmp #$04
    bne .8AC5

.8AC1:
    ldy #$22
    ldx #$00
.8AC5:
    phy
    phx
    jsr _048B2B_8B2C
    plx
    ply
    inx
    dey
    bne .8AC5

.8AD0:
    plb
    pld
    rtl
}

{ ;8AD3 - 8B2A
_048AD3:
    dw $FFE0, $0020
    dw $0101, $FFFF

.8ADB: ;a8 x8
    lda.w stage
    cmp #$04
    beq .ret2

    phb
    lda #$04 : pha : plb
    !A16
    ldx #$00
    ldy $1FD2
    sec
    lda $15DD,Y
    sbc $1E9E
    bpl .8AFD

    inx #2
    eor #$FFFF
    inc
.8AFD:
    cmp #$0020
    bcc .ret

    lda $1E9E : sbc _048AD3,X : sta $1E9E
    !AX8
    clc
    lda _048AD3+4,X
    pha
    adc $1E9A
    sta $1E9A
    pla
    clc
    adc $1E9C
    sta $1E9C
    lda $1E9A,X
    tax
    jsr _048B2B_8B2C
.ret:
    !AX8
    plb
.ret2:
    rtl
}

{ ;8B2B - 8BB7
_048B2B:
    rts

.8B2C: ;a8 x16
    lda $1B9A,X
    beq _048B2B

    sta $00
    stz $01
    !A16
    lda $1C9A,X
    and #$00FF
    sta $06
    asl
    sta $02
    asl
    clc
    adc $02
    clc
    adc $3B
    sta $04
.8B4B:
    !A8
    ldy $06
    lda $1D9A,Y
    bne .8BA5

    !X16
    ldx $04
    bit.w _048000+1,X
    !X8
    jsl get_object_slot
    bmi .ret

    ldy $04
    lda #$0C : sta $0000,X
    lda #$00 : pha
    lda.w _048000+0,Y : sta.w obj.type,X
    pha
    lda.w _048000+1,Y
    pha
    and #$1F
    sta $0007,X
    lda.w _048000+2,Y : sta.w obj.pos_x+1,X
    lda.w _048000+3,Y : sta.w obj.pos_x+2,X
    lda.w _048000+4,Y : sta.w obj.pos_y+1,X
    lda.w _048000+5,Y : sta.w obj.pos_y+2,X
    ldy $06
    pla : ora #$01 : sta $1D9A,Y
    tya
    sta $002C,X
    plx
    inc.w obj_type_count,X
.8BA5:
    !A16
    clc
    lda $04 : adc #$0006 : sta $04
    inc $06
    dec $00
    bne .8B4B

.ret:
    !AX8
    rts
}

{ ;8BB8 -
_048BB8: ;a8 x-
    !X16
    ldx #$0307
-:
    stz $1B9A,X
    dex
    bpl -

    !A16
    lda #$FFFF : sta $02
    ldx.w stage
    lda .8C2B,X : sta $1FD2
    txa
    asl
    tax
    ldy.w _048000,X : sty $3B
    inc $3B
    lda.w _048000,Y
    and #$00FF
    beq .8C28

    pha
    and #$007F
    sta $00
    pla
    and #$0080
    beq .8BF3

    iny #2
.8BF3:
    lda $1FD2
    and #$00FF
    bne .8C00

    lda.w _048000+3,Y
    bra .8C03

.8C00:
    lda.w _048000+5,Y
.8C03:
    lsr #5
    tax
    !A8
    inc $1B9A,X
    inc $03
    txa
    cmp $02
    beq +

    sta $02
    lda $03 : sta $1C9A,X
+:
    !A16
    clc
    tya
    adc #$0006
    tay
    dec $00
    bne .8BF3

.8C28:
    !AX8
    rts

.8C2B:
    db $00, $00, $00, $00, $00, $00, $00, $00
    db $04, $00, $00, $00, $00, $00, $00, $00
    db $00, $00, $00, $00, $00, $00, $00, $00
}

{ ;8C43 - 8DF8
_048C43: ;a8 x8
    ;setup intro cutscenes

    stz $02F2
    jsl _0180B9
    jsl _0180A6
    jsl _01951E
    jsl _018049_804D
    lda #$15 : jsl _01834C
    jsl disable_nmi
    lda #$03 : sta.w OBSEL
    jsl _018074
    inc $0379
    jsl _018366
    lda #$0C : sta.w stage
    jsl _019136
    jsl _058000
    stz.w stage
    jsl _01AF04
    ldy #$F5 : jsl _01A21D_decompress_graphics
    ldx #$C4 : jsl _0180C7_ram_to_vram
    ldx #$D2 : jsl _0180C7_ram_to_vram
    ldx #$D9 : jsl _0180C7_ram_to_vram
    ldx #$E0 : jsl _0180C7_ram_to_vram
    ldy #$FC : jsl _01A21D_decompress_graphics
    ldx #$27 : jsl _0180C7
    lda #$13 : jsr _048E68_local
    lda #$0D : sta.w stage
    jsl _019136
    lda #$0E : jsl _0190B9_palette_to_ram
    jsl _019539
    jsl enable_nmi
    stz.w stage
    jsl _018CE2
    ldy #$00 : jsl _048E3F
    stz $1FB3
    jsr _049219_9228
    jsl _018021
    lda #$3E : jsl _01A717_A728
.8CE7:
    jsl _018021
    jsr _048E47
    lda $1FB3
    beq .8CE7

    jsr _049219_922E
    lda #$3E : jsl _01A717_A728
    jsl _048DF9
    jsr _049219_9228
if !version == 0 || !version == 1
    jsl _018360
    jsl enable_nmi
    stz $02F2
elseif !version == 2
    stz $02F2
    jsl enable_nmi
endif
    stz.w stage
    jsl _018CE2
    ldy #$08 : jsl _048E3F
    ldy #$0A : jsl _048E3F
    jsl _018021
    lda #$3E : jsl _01A717_A728
    lda #$A0 : sta $0333
.8D30:
    jsl _018021
    jsr _048E47
    dec $0333 : bne .8D30

    jsr _049219_922E
    lda #$3E : jsl _01A717_A728
    jsl _01834C
    jsl disable_nmi
    jsl _018074
    jsl _018366
    stz.w stage
    jsl _01AF04
    ldy #$F5 : jsl _01A21D_decompress_graphics
    ldx #$C4 : jsl _0180C7_ram_to_vram
    ldx #$D2 : jsl _0180C7_ram_to_vram
    ldx #$F5 : jsl _0180C7_ram_to_vram
    ldx #$FC : jsl _0180C7_ram_to_vram
    ldx #$25 : jsl _0180C7
    ldx #$26 : jsl _0180C7
    ldy #$FC : jsl _01A21D_decompress_graphics
    ldx #$27 : jsl _0180C7
    lda #$17 : jsr _048E68_local
    lda #$0D : sta.w stage
    jsl _019136
    lda #$10 : jsl _0190B9_palette_to_ram
    jsl _019539
    jsl enable_nmi
    jsr _049219_9228
    lda #$3E : jsl _01A717_A728
    stz.w stage
    jsl _018CE2
    ldy #$0C : jsl _048E3F
    stz $1FB3
-:
    jsl _018021
    jsr _048E47
    lda $1FB3
    beq -

    jsr _049219_922E
    lda #$3E : jsl _01A717_A728
    stz $1FB3
    lda #$0F : sta $02F2
-:
    jsl _018021
    jsr _048E47
    lda $1FB3
    beq -

    jsr _049219_921D
    lda #$3E : jml _01A717_A728
}

{ ;8DF9 - 8E3E
_048DF9: ;a8 x8
    ;2nd scene in intro, also used in game start cutscene (castle indoors)
    jsl _01834C
    jsl disable_nmi
    jsl _018074
    jsl _018366
    ldy #$F5 : jsl _01A21D_decompress_graphics
    ldx #$E7 : jsl _0180C7_ram_to_vram
    ldx #$EE : jsl _0180C7_ram_to_vram
    ldy #$FC : jsl _01A21D_decompress_graphics
    ldx #$27 : jsl _0180C7
    lda #$11 : jsr _048E68_local
    lda #$0D : sta.w stage
    jsl _019136
    lda #$0F : jsl _0190B9_palette_to_ram
    jml _019539
}

{ ;8E3F - 8E46
_048E3F: ;a8 x8
    ;init some cutscene object
    ldx #$00
    lda #$B3
    jml _018C55
}

{ ;8E47 - 8E67
_048E47: ;a8 x8
    lda.w p1_button_press+1
    bit #!start
    bne .8E4F

    rts

.8E4F: ;skip cutscene
    pla
    pla
    stz $0332
    inc $0331
    lda $1FEF
    beq +

    inc $1FEF
+:
    jsr _049219_922E
    lda #$3E
    jml _01A717_A728
}

{ ;8E68 - 8EAC
_048E68: ;a8 x-
    jsr .local
    rtl

.local:
    sta $02D5
    sta $02D6
    lda #$01 : sta $02F1
    ora #$08 : sta $02D9
    lda #$01
    stz $02DC
    lda #$02 : sta $02E0
    lda #$18 : sta $02DE
    lda #$05 : sta $02E1
    stz $032E
    !AX16
    lda #$1800 : sta $0318
    lda #$0800 : sta $031A
    !AX8
    lda #$00
    xba
    lda #$45
    jsl _018061_8064
    rts
}

{ ;8EAD - 8FDC
_048EAD: ;a8 x8
    ;runs when closing the options menu
    jsr set_stage_result_discarded
    jsl _0180B9
    jsl _0180A6
    stz.w stage
    stz $028E
    stz.w checkpoint
    jsl _01951E
    jsl _018049_804D
    jsl _01834C
    lda #$0F : jsl _01A717_A728
    jsl disable_nmi
    jsl _018074
    jsl _018366
    ldy #$00 : jsl _01A21D_decompress_graphics
    ldx #$54 : jsl _0180C7_ram_to_vram
    ldx #$5B : jsl _0180C7_ram_to_vram
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldx #$62 : jsl _0180C7_ram_to_vram
    lda #$05 : jsr _048E68_local
if !version == 0
    lda #$02 : jsl _0183D4_83DB
elseif !version == 1 || !version == 2
    lda #$06 : jsl _0183D4_83DB
endif
    lda #$0B : jsl _0190B9_palette_to_ram
    jsl _018CE2
    lda #$0C : sta.w stage
    jsl _048A6B
    stz.w stage
    jsl enable_nmi
    lda $1FEF
    beq .8F30

    stz $1FEF
    jsl _018360
    bra .8F3D

.8F30:
    jsr _049219
    jsl _018021
    lda #$3E : jsl _01A717_A728
.8F3D:
    !A16
    lda #$01E0 : sta $0333 ;timer until demo plays
    stz $1FB3
    !A8
.8F4A:
    jsl _018021
    lda $1FB4 ;if set, go to... proto menu? not sure
    bne .8F7E

    !A16
    dec $0333
    !A8
    bne .8F4A

    inc $0279
    rtl

.8F60:
    jsl _049252
    jsr _049219_921D
    lda #$43 : jsl _018049_8053 ;ice sfx
    lda #$3E : jsl _01A717_A728
    lda #$30 : sta $02EB
    lda #$05 : sta $0279
    rtl

.8F7E:
    lda $1FB3
    bne .8F60

    jsr _049219_921D
    lda #$3E : jsl _01A717_A728
    jsl _01834C
    jsl disable_nmi
    ldy #$BD : jsl _01A21D_decompress_graphics
    ldx #$70 : jsl _0180C7_ram_to_vram
    ldy #$B6 : jsl _01A21D_decompress_graphics
    ldx #$A1 : jsl _0180C7_ram_to_vram
    jsl enable_nmi
.8FB0:
    stz $1FB3
    stz $1FB4
    lda #$05 : jsr _048E68_local
    jsl _018021
    jsr _049219
    lda #$3E : jsl _01A717_A728
.8FC8:
    jsl _018021
    jsl _01B5AB
    lda $1FB4
    bne .8FB0

    lda $1FB3
    beq .8FC8

    jmp _048EAD ;reaches here upon exiting options menu
}

{ ;8FDD - 9069
_048FDD:
    jsl _0180A6
    stz $1FB5
    jsl _018366
    jsl _01951E
    jsl _018049_804D
    lda #$01 : sta $02F1
    stz $02D5
    stz $02D6
    jsl _018074
    jsl _018366
    lda #$10 : sta $02D5 : sta $02D6
    stz.w hud_visible
    jsl _018CE2
    jsr _049234
    lda.w stage : pha
    lda #$0A : sta.w stage
    jsl disable_nmi
    jsl _01834C
    jsl _019136
    jsl _058000
    ldy #$4D : jsl _01A21D_decompress_graphics
    ldx #$4D : jsl _0180C7_ram_to_vram
    jsr _04906A
    jsl _018360
    jsl enable_nmi
    jsl _048A6B
    pla : sta.w stage
    jsr _049219
    lda #$F0
.9052:
    pha
    jsl _018021
    pla
    dec
    bne .9052

    jsr _049219_921D
    lda #$3E : jsl _01A717_A728
    lda #$30 : sta $02EB
    rtl
}

{ ;906A - 9084
_04906A: ;a- x8
    !A16
    ldx #$00
    stx $0332
.9071:
    lda.l _04984F_A0C5,X : sta $7EF582,X ;load game over text palette
    inx #2
    cpx #$06
    bne .9071

    !A8
    inc $0331
    rts
}

{ ;9085 - 9120
_049085: ;a8 x8
    jsl _0180A6
    stz $1FB5
    jsl _018366
    jsl _01951E
    jsl _018049_804D
    lda #$01 : sta $02F1
    stz $02D5
    stz $02D6
    jsl _018074
    jsl _018366
    lda #$10
    sta $02D5
    sta $02D6
    stz $032E
    jsl _018CE2
    jsr _049234
    lda.w stage
    pha
    jsl disable_nmi
    jsl _01834C
    stz.w stage
    jsl _01AF04
    lda #$0A : sta.w stage
    jsl _019136
    jsl _058000
    ldy #$4D : jsl _01A21D_decompress_graphics
    ldx #$4D : jsl _0180C7_ram_to_vram
    jsr _04906A
    jsl enable_nmi
    jsl _048A6B
    pla
    sta.w stage
    jsr _049219
    lda #$3E : jsl _01A717_A728
    lda #$11 : jsl _018049_8053 ;game over music?
    lda #$F0
.9109:
    pha
    jsl _018021
    pla
    dec
    bne .9109

    jsr _049219_921D
    lda #$3E : jsl _01A717_A728
    lda #$30
    sta $02EB
    rtl
}

{ ;9121 - 9218
_049121: ;a? x?
    jsl disable_nmi
    jsl _01834C
    ldy #$93 : jsl _01A21D_decompress_graphics
    ldx #$54 : jsl _0180C7_ram_to_vram
    ldy #$9A : jsl _01A21D_decompress_graphics
    ldx #$70 : jsl _0180C7_ram_to_vram
    lda #$0B : jsl _0190B9_palette_to_ram
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldx #$62 : jsl _0180C7_ram_to_vram
    lda #$15 : jsr _048E68_local
    lda #$04 : jsl _0183D4_83DB
    jsr .91E8
    jsr .91DE
    jsl _018CE2
    jsl enable_nmi
    lda #$13 : jsl _018049_8053
    ldx #$00 : lda #$33 : jsl _01F6C9
    ldx #$0E : lda #$34 : jsl _01F6C9
    ldx #$1C : lda #$35 : jsl _01F6C9
    jsr _049234
    lda #!id_intro_cutscene_obj : ldx #$00 : ldy #$18 : jsl _018C55
    jsl _018021
    jsr _049219_9228
    lda #$3E : jsl _01A717_A728
    lda.w stage : pha
    lda #$0A : sta.w stage
    jsl _048A6B
    pla : sta.w stage
.91B5:
    jsl _018021
    jsl _01B5AB
    lda $1FB4
    beq .91B5

    lda $1FB3
    beq .91CA

    jsr .91D3
.91CA:
    jsr _049219_922E
    lda #$3E : jml _01A717_A728
.91D3:
    sed
    lda.w continues : sec : sbc #$01 : sta.w continues
    cld
.91DE:
    !X16
    ldx #$06FA
    lda.w continues
    bra .91F6

.91E8:
    !X16
    lda #$46 : sta $7F9688
    ldx #$068A
    lda.w money_bag_count
.91F6:
    pha
    lsr #4
    beq .9200

    jsr .920C
.9200:
    pla
    and #$0F
    jsr .920C
    !X8
    inc $0323
    rts

;-----

.920C:
    sta $7F9000,X
    inx
    lda #$04 : sta $7F9000,X
    inx
    rts
}

{ ;9219 - 9233
_049219:
    lda.b #_01FF00_1C
    bra .921F

.921D:
    lda.b #_01FF00_20
.921F:
    ldx #$02
.9221:
    ldy #$90
    jsl _01A6FE
    rts

.9228: ;a8 x8
    lda.b #_01FF00_08
    ldx #$04
    bra .9221

.922E: ;a8 x8
    lda.b #_01FF00_0C
    ldx #$04
    bra .9221
}

{ ;9234 - 9241
_049234: ;a8 x-
    !X16
    ldx #$0061
-:
    stz $1500,X
    dex
    bne -

    !X8
    rts
}

{ ;9242 - 9251
set_stage_result_discarded: ;a8 x8
    ;sets stage & checkpoint values incorrectly, but shortly after gets zeroed and set elsewhere anyway!
    lda.w options.stage_checkpoint
    tax
    and #$01
    sta.w checkpoint
    lda.w _00DDF6,X : sta.w stage
    rts
}

{ ;9252 - 9261
_049252: ;a8 x8
    lda.w stage : asl
    clc
    adc.w checkpoint
    tax
    lda.w _00DDF6,X : sta.w stage
    rtl
}

{ ;9262 - 926A
_049262: ;a8 x-
    !X16
    ldy.w _00DE0A,X ;menu text to load?
    jml _0183D4
}

{ ;926B - 930F
_04926B:
    ;count, Y offset, text
    db $0B : dw $0094, $1C18, $1C19, $1C1D, $1C12, $1C18, $1C17, $0045, $1C16, $1C18, $1C0D, $1C0E ;"option mode"
    db $0A : dw $0116, $1810, $180A, $1816, $180E, $0045, $1815, $180E, $181F, $180E, $1815        ;"game level"
    db $0B : dw $0214, $180C, $1818, $1817, $181D, $181B, $1818, $1815, $0045, $1819, $180A, $180D ;"control pad"
    db $06 : dw $039A, $1819, $1815, $180A, $1822, $180E, $181B                                    ;"player"
    db $0A : dw $0496, $181C, $1818, $181E, $1817, $180D, $0045, $1816, $1818, $180D, $180E        ;"sound mode"
    dw $0000

.92DC:
    db $05 : dw $015C, $181C, $181D, $180A, $1810, $180E ;"stage"
    db $04 : dw $025C, $180A, $181B, $180E, $180A        ;"area"
    db $05 : dw $035C, $1816, $181E, $181C, $1812, $180C ;"music"
    db $05 : dw $045C, $181C, $1818, $181E, $1817, $180D ;"sound"
    dw $0000
}

{ ;9310 - 93F1
_049310: ;a8 x8
    ;map screen

    jsl _018049_804D
    jsl _01834C
    jsl _0180B9
    jsl _01951E
    lda #$01 : sta $02F1
    jsl _0180A6
    jsl disable_nmi
    jsl _018CE2
    jsl _018074
    ldy #$07 : jsl _01A21D_decompress_graphics
    ldx #$54 : jsl _0180C7_ram_to_vram
    ldy #$85 : jsl _01A21D_decompress_graphics
    ldx #$70 : jsl _0180C7_ram_to_vram
    jsl _019539
    lda #$11 : sta $02D5
    jsl _018366
    ldx #$00
.935C:
    lda.l _09E800_F400,X : sta $7EF400,X : sta $7EF500,X ;palette will be DMA'd in NMI i think
    inx
    bne .935C

    inc $0331
    lda #$12 : jsl _018049_8053 ;map music
    lda.w stage : pha
    lda #$0B : sta.w stage
    jsl _048A6B
    jsl _058000
    pla : sta.w stage
    jsl _018360
    inc $0379

    jsl enable_nmi
    stz.w camera_x+1
    stz.w camera_x+2
    jsl _01B90E
    lda #$F0
.93A0: ;map mosaic fade-in
    pha
    ora #$01
    sta !MOSAIC
    lda #$03 : jsl _01A717_A728
    pla
    sec
    sbc #$10
    bne .93A0

    stz !MOSAIC
    stz $00E5
.93B8:
    jsl _018021
    lda.w p1_button_press+1
    bit #!b|!y|!start
    bne .93D5

    lda.w p1_button_press
    bit #!x|!a
    bne .93D5

    dec $00E5
    bne .93B8

    lda #$3C : jsl _01A717_A728
.93D5:
    lda #$01 : sta $02D5
    lda #$00
.93DC:
    pha
    ora #$01
    sta !MOSAIC
    lda #$03 : jsl _01A717_A728
    pla
    clc
    adc #$10
    bne .93DC

    stz !MOSAIC
    rtl
}

{ ;93F2 - 984E
_0493F2:
    ;byte pairs
    db $6D, $02, $30, $10, $2C, $02, $00, $00, $00, $00, $00, $00, $47, $03, $10, $06, $10, $06, $00, $00
    db $60, $0E, $10, $2B, $2D, $13, $00, $00, $00, $00, $00, $00, $12, $36, $0F, $12, $0F, $12, $00, $00
    db $00, $00, $D0, $04, $70, $0F, $10, $03, $00, $00, $00, $00, $4A, $12, $00, $00, $00, $00, $00, $00

;-----

.942E:
    dw offset(.9446, .947E), offset(.9446, .950A), offset(.9446, .95FB), offset(.9446, .96DA)
    dw offset(.9446, .970F), offset(.9446, .9710), offset(.9446, .971B), offset(.9446, .97CE)
    dw offset(.9446, .97CE), offset(.9446, .97CE), offset(.9446, .97CE), offset(.9446, .94C5)

;-----

.9446:
    db $00, $01, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7A, $7B, $7C, $7D
    db $7E, $7F, $0F, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D
    db $3E, $3F, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F, $17
    db $18, $19, $1A, $1B, $1C, $1D, $1E, $1F

;-----

    ;byte pairs, offset+data, FF terminates sequence
.947E:
    db $38, $01, $39, $01, $3A, $01, $3B, $01, $3C, $01, $3D, $01, $3E, $01, $3F, $01
    db $40, $01, $41, $01, $42, $01, $43, $01, $44, $01, $45, $01, $46, $01, $47, $01
    db $48, $01, $49, $70, $4A, $01, $50, $2E, $51, $7E, $52, $27, $53, $70, $54, $7E
    db $55, $3D, $56, $78, $57, $2B, $60, $78, $61, $70, $62, $23, $63, $27, $64, $1F
    db $65, $01, $67, $17, $6D, $70, $FF

.94C5:
    db $4A, $01, $4B, $70, $4C, $70, $4D, $70, $4E, $01, $4F, $70, $50, $78, $51, $01
    db $52, $01, $53, $70, $54, $70, $55, $01, $56, $01, $57, $70, $58, $70, $59, $01
    db $5A, $70, $5B, $01, $5C, $01, $5D, $01, $5E, $01, $60, $70, $61, $7C, $62, $2F
    db $63, $01, $64, $2B, $65, $23, $66, $27, $67, $28, $68, $17, $69, $1F, $6A, $01
    db $6B, $01, $6C, $7C, $FF

.950A:
    db $01, $3F, $02, $3D, $03, $3B, $04, $39, $05, $37, $06, $35, $07, $33, $08, $31
    db $09, $3D, $0A, $3B, $0B, $35, $0C, $33, $0D, $37, $0E, $39, $0F, $3D, $10, $72
    db $11, $72, $12, $77, $13, $73, $14, $76, $15, $77, $16, $78, $17, $79, $18, $78
    db $19, $79, $1A, $7A, $1B, $7B, $1C, $7C, $1D, $7D, $1E, $7E, $1F, $77, $20, $70
    db $21, $71, $22, $72, $23, $73, $24, $74, $25, $75, $26, $76, $27, $77, $28, $7F
    db $29, $01, $2A, $01, $2B, $01, $2C, $01, $2D, $72, $2E, $7F, $2F, $72, $30, $72
    db $31, $7A, $32, $73, $33, $7B, $34, $7A, $35, $72, $36, $01, $37, $01, $38, $01
    db $39, $00, $3A, $3D, $3B, $00, $3C, $00, $3D, $00, $3E, $00, $3F, $74, $40, $35
    db $41, $37, $43, $3D, $44, $3B, $45, $39, $46, $37, $47, $35, $48, $01, $49, $01
    db $4A, $01, $4B, $01, $4C, $70, $4D, $39, $4E, $2F, $4F, $01, $50, $23, $51, $27
    db $52, $2B, $53, $2F, $54, $01, $55, $01, $56, $70, $57, $3F, $58, $70, $59, $70
    db $5A, $70, $5B, $70, $5C, $70, $5D, $01, $5E, $3F, $5F, $3F, $60, $2B, $61, $31
    db $62, $33, $63, $35, $64, $37, $65, $39, $66, $3B, $67, $3D, $68, $3F, $69, $01
    db $6A, $01, $6B, $01, $71, $31, $72, $33, $73, $35, $74, $37, $75, $01, $76, $3B
    db $78, $01, $79, $33, $7A, $31, $7B, $3D, $7C, $01, $7D, $7F, $7E, $3B, $7F, $7E
    db $FF

.95FB:
    db $01, $70, $02, $70, $03, $0F, $04, $1F, $05, $17, $06, $00, $07, $70, $08, $70
    db $09, $70, $0A, $70, $0B, $70, $0C, $70, $0D, $70, $0E, $70, $0F, $70, $10, $01
    db $11, $01, $12, $00, $13, $00, $14, $01, $15, $1F, $16, $01, $17, $01, $18, $01
    db $19, $2F, $1A, $2B, $1B, $27, $1C, $23, $1D, $78, $1E, $70, $1F, $70, $20, $00
    db $21, $00, $22, $00, $23, $00, $24, $00, $25, $00, $26, $00, $27, $00, $28, $00
    db $29, $00, $2A, $00, $2B, $00, $2C, $00, $2D, $70, $2E, $70, $2F, $00, $30, $00
    db $31, $70, $32, $70, $33, $70, $34, $2F, $35, $2B, $36, $27, $37, $23, $38, $2F
    db $39, $2B, $3A, $70, $3B, $23, $3C, $01, $3D, $01, $3E, $00, $3F, $01, $41, $70
    db $43, $1F, $46, $17, $60, $70, $61, $70, $62, $70, $63, $70, $64, $70, $65, $70
    db $66, $01, $67, $01, $68, $70, $69, $70, $6A, $70, $6D, $70, $7E, $70, $7F, $70
    db $A0, $70, $A1, $70, $A2, $70, $A3, $70, $A4, $70, $A5, $70, $A6, $70, $A7, $70
    db $A8, $70, $A9, $70, $AA, $70, $AB, $70, $AC, $70, $AD, $70, $AE, $70, $AF, $01
    db $B1, $70, $B2, $70, $B3, $70, $B4, $70, $B5, $70, $B6, $70, $B7, $70, $B8, $70
    db $B9, $70, $BA, $70, $BB, $70, $BC, $70, $BD, $70, $BE, $70, $BF, $70, $FF

.96DA:
    db $00, $70, $01, $70, $02, $70, $03, $70, $04, $70, $05, $70, $06, $70, $07, $70
    db $08, $70, $09, $70, $0A, $70, $0B, $70, $0C, $70, $0D, $70, $0E, $70, $0F, $70
    db $10, $70, $11, $70, $12, $70, $13, $70, $14, $70, $15, $70, $16, $70, $17, $70
    db $18, $70, $19, $70, $FF

.970F:
    db $FF

.9710:
    db $05, $70, $06, $71, $07, $70, $0D, $71, $0E, $70, $FF

.971B:
    db $01, $70, $02, $70, $03, $78, $04, $78, $05, $0F, $06, $01, $07, $01, $08, $2F
    db $09, $2B, $0A, $27, $0B, $23, $0C, $01, $0D, $01, $0E, $1F, $0F, $17, $10, $01
    db $11, $01, $12, $01, $13, $2F, $14, $01, $15, $1F, $16, $01, $17, $01, $18, $01
    db $19, $2F, $1A, $2B, $1B, $27, $1C, $23, $1D, $78, $1E, $70, $1F, $70, $20, $78
    db $21, $70, $22, $70, $23, $0F, $24, $0F, $25, $01, $26, $01, $27, $01, $28, $2F
    db $29, $2B, $2A, $27, $2B, $23, $2C, $01, $2D, $01, $2E, $1F, $2F, $17, $30, $78
    db $31, $1F, $32, $17, $33, $2F, $34, $2B, $35, $70, $36, $70, $37, $0F, $38, $70
    db $39, $01, $3A, $78, $3B, $01, $3C, $01, $3D, $27, $3E, $23, $3F, $01, $40, $2B
    db $41, $27, $42, $23, $43, $17, $44, $1F, $45, $17, $46, $01, $47, $70, $48, $00
    db $49, $00, $A1, $1F, $A2, $17, $A3, $2F, $A4, $2B, $A5, $70, $A6, $70, $A7, $0F
    db $A9, $01, $AA, $78, $AB, $01, $AC, $01, $AD, $27, $AE, $23, $AF, $01, $B1, $78
    db $B2, $78, $FF

.97CE:
    db $01, $70, $02, $70, $03, $70, $04, $2F, $05, $2B, $06, $27, $07, $23, $08, $70
    db $09, $70, $0A, $70, $0B, $70, $0C, $70, $0D, $70, $0E, $70, $0F, $70, $10, $70
    db $11, $00, $12, $00, $13, $00, $14, $70, $15, $70, $16, $70, $17, $70, $18, $70
    db $19, $70, $1A, $2F, $1B, $2B, $1C, $27, $1D, $23, $1E, $01, $1F, $00, $20, $70
    db $21, $70, $28, $70, $29, $70, $2A, $70, $3A, $70, $3B, $70, $3C, $70, $3D, $01
    db $3E, $70, $3F, $01, $5B, $70, $5C, $70, $5D, $70, $5E, $70, $5F, $70, $7B, $01
    db $7E, $70, $7F, $70, $80, $70, $81, $70, $82, $01, $83, $2F, $84, $2B, $85, $27
    db $86, $23, $88, $70, $8C, $70, $8E, $70, $90, $70, $91, $70, $92, $70, $93, $70
    db $FF
}

{ ;984F - A0F4
_04984F:
    dw offset(_04984F, .990F), offset(_04984F, .9987), offset(_04984F, .99FF), offset(_04984F, .9A77)
    dw offset(_04984F, .9AEF), offset(_04984F, .9B67), offset(_04984F, .9BDF), offset(_04984F, .9C57)
    dw offset(_04984F, .9CCF), offset(_04984F, .9D47), offset(_04984F, .A0C5), offset(_04984F, .A0C5)
    dw offset(_04984F, .A0C5), offset(_04984F, .9DBF), offset(_04984F, .9879), offset(_04984F, .9897)
    dw offset(_04984F, .9E37), offset(_04984F, .9EAF), offset(_04984F, .9F9F), offset(_04984F, .9F27)
    dw offset(_04984F, .A017)

;-----

    ;sprite palettes

.9879: ;grayscale
    dw $0426, $027E, $00BA, $0000, $4210, $739C, $6318, $0000, $0190, $531C, $0000, $0000, $418A, $624E, $6B5A

.9897: ;stage 2, 3?
    dw $418A, $520E, $6292, $6AD4, $7BDE, $4B18, $3A94, $014E, $0190, $3A56, $531C, $5980, $0198, $0010, $0421
    dw $418A, $520E, $6292, $6AD4, $7BDE, $3B5A, $2AD6, $0210, $018C, $4BE6, $32C0, $2200, $025E, $0158, $0421
    dw $3800, $4800, $60C0, $7A00, $6F9E, $43DE, $3B18, $2210, $118C, $3A98, $0190, $014E, $00DA, $0094, $0421
    dw $004E, $00D4, $0158, $01DA, $739C, $56B5, $3DEF, $2108, $021E, $1A9C, $7ACC, $6A4A, $61C6, $4142, $0421

.990F:
    dw $010F, $1D51, $25F3, $3A78, $29D2, $3E77, $5B5C, $0019, $000F, $0000, $0000, $6739, $4A52, $39CE, $0842
    dw $5540, $65C0, $66A0, $77B6, $7FFF, $7337, $5671, $41ED, $294A, $4EB5, $02DE, $019A, $00D6, $0031, $0421
    dw $1463, $20A5, $498D, $72D5, $7FFF, $0924, $1187, $1E2D, $1FFC, $0000, $0000, $0000, $0000, $0000, $0842
    dw $3A56, $531C, $0000, $0000, $0000, $7BDC, $7B54, $6ACE, $59C0, $0275, $329C, $1595, $008B, $0047, $0842

.9987:
    dw $214A, $298C, $3A10, $4A94, $5B18, $7BDE, $0010, $0096
    dw $0000, $0000, $218C, $194A, $1108, $08C6, $0842, $2906
    dw $3148, $398A, $4A0E, $5250, $7BDE, $014E, $01D2, $029A
    dw $039E, $018A, $020C, $028C, $0312, $0842, $3A98, $1DF4
    dw $1572, $08ED, $0089, $0040, $0046, $56F3, $424E, $35EB
    dw $2567, $1904, $10C2, $0880, $0421, $1D25, $2DA9, $424E
    dw $5B14, $73BB, $0046, $0069, $1191, $3677, $0000, $6F9E
    dw $4233, $212B, $0C86, $0842

.99FF:
    dw $000E, $0114, $0198, $021C, $02DE, $210A, $318E, $4212, $5294, $7BDE, $0300, $0180, $0140, $0100, $0842, $000E
    dw $0091, $0156, $01F8, $02BC, $7BDE, $4080, $5964, $7208, $7E8C, $6318, $5294, $39CE, $2529, $0842, $039E, $000E
    dw $0012, $0116, $021C, $0000, $0000, $3800, $4800, $5900, $75A0, $0000, $0000, $0000, $0421, $010E, $0112, $019A
    dw $021E, $02DE, $318C, $4210, $5294, $6318, $7BDE, $7300, $6A80, $51C0, $4140, $0421

.9A77: ;stage 4 start
    dw $0982, $120E, $1A94, $02DA, $035E, $7BDE, $5B1B, $4698
    dw $3614, $29B1, $1D4E, $0CCA, $0488, $1084, $0842, $5540
    dw $65C0, $66A0, $77B6, $7FFF, $7337, $5671, $41ED, $294A
    dw $4EB5, $63D4, $434C, $0280, $01C0, $0421, $3940, $51C0
    dw $6A80, $7314, $400C, $5190, $61D4, $7258, $018E, $01D2
    dw $2A56, $32DA, $6318, $4A52, $0842, $0066, $08CA, $194E
    dw $3214, $4298, $5B1B, $0000, $0000, $0000, $0000, $0000
    dw $0000, $0000, $0000, $0421

.9AEF: ;stage 4b
    dw $4550, $51B3, $72BB, $7EDE, $7FFF, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $3080, $4900, $5980, $6A00, $7280, $7B00, $300C, $380E, $4912, $699A, $7A1E, $7BDE, $739C, $39CE, $0421
    dw $77BD, $40C6, $5148, $59CA, $624C, $0000, $0000, $000E, $0012, $0116, $29DD, $0000, $0000, $0000, $0421
    dw $00EB, $0D4E, $1590, $2E56, $471C, $77BD, $001D, $0011, $000B, $0007, $0000, $0000, $0000, $0000, $0000

.9B67: ;hydra
    dw $0100, $0D63, $1DE7, $4B52, $739C, $4631, $2D6B, $000E, $001B, $000E, $4751, $19E6, $0962, $0100, $0421
    dw $086C, $2132, $3E19, $675F, $7BDE, $4A52, $318C, $25E0, $4F20, $000E, $633F, $39F9, $1D12, $044C, $0421
    dw $000B, $0012, $0018, $0159, $01FB, $2ADC, $3B5D, $7BDE, $0000, $0000, $0000, $0000, $0000, $0000, $0000
    dw $00B0, $0175, $02B8, $3FDF, $7FFF, $4E73, $35AD, $01F1, $033B, $000E, $7FFF, $56B5, $39CE, $1CE7, $0421

.9BDF: ;stage 5
    dw $51C8, $628A, $730E, $7B94, $7BDE, $4A0E, $5A92, $6B18, $7B9C, $048D, $14EF, $1D32, $2999, $39FF, $0842
    dw $6980, $7686, $7AEA, $7FB0, $7FFF, $63D6, $5350, $3A88, $2A04, $01D8, $225A, $3B1C, $6318, $4A52, $0421
    dw $318C, $39CE, $4A52, $5AD6, $6B5A, $5100, $5946, $756C, $7A8E, $7FDC, $7318, $6252, $49CE, $394A, $0842
    dw $418A, $51CC, $6A50, $72D4, $7B9A, $318C, $4210, $5294, $6318, $7FFF, $031E, $025C, $0198, $0110, $0842

.9C57: ;stage 6
    dw $000E, $0114, $0198, $021C, $02DE, $210A, $318E, $4212, $5294, $7BDE, $0300, $0180, $0140, $0100, $0842
    dw $000E, $0091, $0156, $01F8, $02BC, $7BDE, $4080, $5964, $7208, $7E8C, $6318, $5294, $39CE, $2529, $0842
    dw $014E, $21D2, $3256, $4ADA, $000E, $0012, $0198, $025A, $5140, $61C8, $724C, $7B10, $5AD6, $4210, $0421
    dw $023A, $0195, $0132, $08C8, $152B, $218E, $3633, $5F3B, $012D, $01B1, $02B9, $77BD, $5294, $39CE, $0421

.9CCF: ;stage 7
    dw $214A, $298C, $3A10, $4A94, $5B18, $7BDE, $0010, $0096, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $000E, $0091, $0156, $01F8, $02BC, $7BDE, $4080, $5964, $7208, $7E8C, $6318, $5294, $39CE, $2529, $0842
    dw $77BD, $40C6, $5148, $59CA, $624C, $0000, $0000, $000E, $0012, $0116, $29DD, $0000, $0000, $0000, $0421
    dw $6B5B, $4632, $2D6C, $0863, $18E7, $31AD, $4231, $6B7B, $2549, $39EE, $6338, $7BDE, $7DC8, $6800, $0421

.9D47: ;stage 8
    dw $431E, $429A, $29D4, $0150, $190C, $499E, $6292, $7316, $7BDE, $7B0E, $6A4C, $61C8, $5140, $40C0, $0842
    dw $004E, $00D4, $0158, $01DA, $739C, $56B5, $3DEF, $2108, $021E, $1A9C, $7ACC, $6A4A, $61C6, $4142, $0421
    dw $000B, $0012, $0018, $0159, $01FB, $2ADC, $3B5D, $7BDE, $0000, $0000, $0000, $0000, $0000, $0000, $0000
if !version == 0 || !version == 1
    dw $000E, $0054, $017D, $00CE, $0171, $1697, $377E, $7FFF, $6739, $4210, $2D6B, $40E3, $55A9, $7690, $0421
elseif !version == 2
    dw $000E, $0054, $017D, $004A, $010E, $0276, $377E, $7FFF, $6739, $4210, $2D6B, $40C2, $5588, $766F, $0421
endif

.9DBF: ;villagers, fireworks
    dw $40E0, $520E, $6292, $6AD4, $7BDE, $4B18, $3A94, $014E, $0190, $3A56, $531C, $5980, $0198, $0010, $0842
    dw $394A, $418C, $6A10, $6A94, $7BDE, $3318, $2252, $014E, $0190, $3A56, $531C, $4196, $3152, $290E, $0421
    dw $30C6, $414A, $59CE, $7252, $7B5A, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $5980, $6A00, $728C, $7B10, $7BDE, $0010, $0154, $01D8, $025C, $039E, $7A9E, $61D8, $5154, $4090, $0421

.9E37:
    dw $40E0, $520E, $6292, $6AD4, $7BDE, $4B18, $3A94, $014E, $0190, $3A56, $531C, $5980, $0198, $0010, $0842 ;princess
    dw $7200, $000C, $0010, $0014, $0156, $3256, $31D2, $294A, $39CE, $4A52, $5AD6, $4000, $4900, $6140, $0421 ;satan
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421

.9EAF: ;talking time
    dw $531F, $429A, $29D4, $0150, $190C, $499F, $6292, $7316, $7BDE, $7B0E, $6A4C, $61C8, $5140, $40C0, $0842
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421

.9F27: ;ending credits
    dw $40E0, $520E, $6292, $6AD4, $7BDE, $4B18, $3A94, $014E, $0190, $3A56, $531C, $5980, $0198, $0010, $0842
    dw $2CC7, $498D, $51F0, $6ED7, $7FFF, $10C9, $1D4F, $3657, $5B1E, $6907, $7986, $0051, $08F8, $1E7C, $0421
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $004E, $00D4, $0158, $01DA, $739C, $56B5, $3DEF, $2108, $021E, $1A9C, $7ACC, $6A4A, $61C6, $4142, $0421

.9F9F: ;ending credits
    dw $46D8, $42B7, $3E96, $3A54, $3612, $31D0, $2D8E, $2D4C, $292A, $0000, $0000, $0000, $0000, $0000, $0421
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0421

.A017: ;ending credits
    dw $0D31, $02DA, $039C, $0000, $000F, $111B, $4A5E, $0000, $294A, $5AD6, $7FDE, $0000, $025C, $02DA, $5000

.A035:
    dw $4905, $66CE, $7FFB ;hud lance
    dw $4905, $66CE, $7FFB ;hud lance 2
    dw $01FF, $6A44, $739C ;hud knife
    dw $59C0, $7288, $739C
    dw $221E, $02DE, $6B5A ;hud bowgun
    dw $221E, $02DE, $6B5A
    dw $01FF, $6A44, $739C ;hud scythe
    dw $01FF, $6A44, $739C
    dw $4940, $7246, $7FDE ;hud torch
    dw $59C0, $7246, $7FDE
    dw $61C6, $5294, $7BDE ;hud axe
    dw $01B0, $3B1A, $73FF
    dw $01FF, $6A44, $739C ;hud triblade, hud lance magic
    dw $01FF, $6A44, $739C ;hud triblade 2
    dw $01FF, $6A44, $739C ;hud knife magic
    dw $01FF, $6A44, $739C ;?
    dw $49FF, $66CE, $7FFB ;hud bowgun magic
    dw $4940, $7246, $7FDE ;?
    dw $49FF, $66CE, $7FFB ;hud scythe magic
    dw $4905, $66CE, $7FFB ;?
    dw $49FF, $66DE, $7FFB ;hud torch magic
    dw $4905, $66DE, $7FFB ;?
    dw $0180, $328C, $4BB2 ;hud axe magic
    dw $001F, $001F, $001F ;?
.A0C5:
    dw $0426, $027E, $00BA ;hud triblade magic
    dw $035E, $029E, $01DC ;?
    dw $0018, $0014, $0010 ;?

.A0D7: ;grayscale palette
    dw $3DEF, $39CE, $35AD, $318C, $2D6B, $294A, $2529, $2108, $1CE7, $18C6, $14A5, $1084, $0C63, $0842, $0421
}

{ ;A0F5 - A121
_04A0F5:
    lda #$08 : sta $F2FC
    lda #$FF : sta $F2FF
    lda #$00 : sta $F2FE
    lda !SLHV
    lda !STAT78
    lda !OPVCT : sta $F2FD
    lda $F31B : and #$3F : ora #$80 : sta $F31B
    lda #$01 : jsl _01A717_A728
    bra _04A0F5
}

{ ;A122 - A7DB
    incsrc "various/text_tilemaps.asm"
}

if !version == 0
{ ;A7DC - EFFF
    incbin "fill_bytes/jp/bank04a.bin" ;partially duplicated tilemap data
    fillbyte $FF : fill 17865
}
elseif !version == 1
    incbin "fill_bytes/eng/bank04a.bin"
elseif !version == 2
{ ;? - DFFF
    db $00, $00, $00, $00
    incbin "fill_bytes/eng/bank04a.bin":0..13158
}

{ ;E000 - E7FF
_04E000:
    ;new capcom logo tilemap?
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0000, $0001, $0002, $0003, $0004, $0005
    dw $0006, $0007, $0008, $0009, $000A, $000B, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $000C, $000D, $000E, $000F, $0010, $0011
    dw $0012, $0013, $0014, $0015, $0016, $0017, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0018, $0019, $001A, $001B, $001C, $001D
    dw $001E, $001F, $0020, $0021, $0022, $0023, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
    dw $0024, $0024, $0024, $0024, $0024, $0024, $0024, $0024
}

{ ;E800 - EC9F
_04E800:
    ;new capcom logo tiles?
    dw $0000, $0000, $0000, $0100, $0700, $0F00, $1C03, $1804
    dw $0000, $0000, $0000, $0101, $0707, $0F0F, $1C1F, $181F
    dw $0000, $0000, $0000, $FC00, $FF00, $07F8, $01FE, $7081
    dw $0000, $0000, $0000, $FCFC, $FFFF, $07FF, $01FF, $70FF
    dw $0000, $0000, $0000, $0300, $0300, $8601, $C601, $C600
    dw $0000, $0000, $0000, $0303, $0303, $8687, $C6C7, $C6C7
    dw $0000, $0000, $0000, $F000, $F000, $18E0, $0830, $C8D0
    dw $0000, $0000, $0000, $F0F0, $F0F0, $18F8, $08F8, $0838
    dw $0000, $0000, $0000, $FF00, $FF00, $C03F, $C000, $7F1F
    dw $0000, $0000, $0000, $FFFF, $FFFF, $C0FF, $C0FF, $6060
    dw $0000, $0000, $0000, $F000, $F800, $38C0, $0D30, $E5E8
    dw $0000, $0000, $0000, $F0F0, $F8F8, $38F8, $0DFD, $051D
    dw $0000, $0000, $0000, $1F00, $7F00, $F00F, $C03F, $8748
    dw $0000, $0000, $0000, $1F1F, $7F7F, $F0FF, $C0FF, $87FF
    dw $0000, $0000, $0000, $C000, $F000, $7980, $1BE0, $0E11
    dw $0000, $0000, $0000, $C0C0, $F0F0, $79F9, $1BFB, $0EFF
    dw $0000, $0000, $0000, $3F00, $FF00, $C435, $1F9F, $EEB1
    dw $0000, $0000, $0000, $3F3F, $FFFF, $C0FB, $00E0, $0E1F
    dw $0000, $0000, $0000, $8300, $E300, $7281, $1A20, $CF90
    dw $0000, $0000, $0000, $8383, $E3E3, $72F3, $1AFB, $0F3F
    dw $0000, $0000, $0000, $F800, $FD00, $0FF0, $0F10, $AFA0
    dw $0000, $0000, $0000, $F8F8, $FDFD, $0FFF, $0FFF, $0F5F
    dw $0000, $0000, $0000, $FE00, $FE00, $827C, $8240, $AE28
    dw $0000, $0000, $0000, $FEFE, $FEFE, $82FE, $82FE, $86D6
    dw $063F, $0635, $0E69, $0A65, $026D, $1E00, $001E, $001B
    dw $3039, $3039, $6171, $6171, $6171, $7F61, $7F61, $7F60
    dw $07FE, $06CD, $048F, $0086, $0080, $0000, $0000, $0000
    dw $F8F8, $C9C9, $8B8B, $8686, $8080, $8080, $8080, $C3C3
    dw $01CD, $038E, $030C, $051A, $001F, $0600, $010E, $0001
    dw $CCCE, $8C8C, $0C0C, $1818, $1919, $1F19, $3F30, $BFB0
    dw $E0EC, $F014, $38CC, $28D6, $04FE, $1C00, $E01C, $00E0
    dw $0C1C, $040C, $C4C4, $C6C6, $E2E2, $FEE2, $FF03, $FF01
    dw $186F, $186F, $1867, $0877, $007F, $1800, $0019, $0000
    dw $6767, $6767, $6767, $6767, $6767, $7F67, $7F66, $7F60
    dw $70D7, $38EF, $38E6, $28DE, $00FE, $7100, $00E1, $0081
    dw $878F, $C7C7, $C6C7, $C6C7, $CECF, $FF8E, $FF1E, $F776
    dw $60FF, $605F, $E09F, $A05F, $20DF, $E000, $00E0, $00B0
    dw $0F9F, $0F9F, $1F1F, $1F1F, $1F1F, $FF1F, $FF1F, $FF0F
    dw $71EF, $61DE, $40FD, $02FD, $00FF, $0300, $0003, $0002
    dw $8E8E, $9C9E, $BCBE, $FCFC, $FCFC, $FFFC, $FFFC, $FFFC
    dw $C07F, $C07F, $807F, $807F, $807F, $8000, $8000, $00C0
    dw $1F3F, $3F3F, $3F7F, $7F7F, $7F7F, $FF7F, $FF7F, $FF3F
    dw $70DF, $70DF, $18EF, $18E7, $08F7, $3800, $2019, $0068
    dw $0F8F, $878F, $87C7, $C7C7, $C7C7, $FFC7, $FFC6, $FF86
    dw $F05F, $F86F, $58A7, $55BA, $08F7, $CF00, $00CD, $0202
    dw $070F, $0707, $2227, $2022, $3030, $FF30, $FF30, $FD3A
    dw $78D4, $F8B4, $D02C, $50EC, $807C, $9800, $009C, $0000
    dw $0484, $0404, $2424, $2424, $6464, $FE66, $FE62, $FEE2
    dw $0009, $000C, $393D, $1C1E, $0F0F, $0707, $0101, $0000
    dw $7F70, $3F30, $3E01, $1F00, $0F00, $0700, $0100, $0000
    dw $0000, $0181, $BBB9, $FFF9, $3F23, $FFFF, $FFFF, $0000
    dw $FFFF, $FE7F, $7C83, $00FF, $C03F, $FF00, $FF00, $0000
    dw $0404, $0C0C, $FFFF, $FFEF, $FFE7, $FFFF, $FFFF, $0000
    dw $BBB5, $F3EF, $E31C, $E31C, $C13E, $FF00, $FF00, $0000
    dw $0808, $0C0C, $FFFF, $FFFD, $FFF8, $FFFF, $FFFF, $0000
    dw $F7F9, $F3FD, $F807, $F807, $F00F, $FF00, $FF00, $0000
    dw $080A, $1818, $FFFF, $FFEF, $FFC3, $FFFF, $FFFF, $0000
    dw $7769, $E7FF, $E718, $E718, $41BE, $FF00, $FF00, $0000
    dw $0000, $0000, $0303, $8181, $8080, $8080, $8080, $0000
    dw $E7E7, $C3C3, $0300, $8100, $8000, $8000, $8000, $0000
    dw $0090, $00C8, $9BDB, $CFEF, $F3F2, $7F7F, $1F1F, $0000
    dw $FF0F, $FF07, $E718, $F00F, $FC03, $7F00, $1F00, $0000
    dw $0000, $1010, $BF9F, $FF9F, $FD3D, $FCFC, $FCFC, $0000
    dw $FFFE, $EFFE, $CF30, $0FF0, $0DF0, $FC00, $FC00, $0000
    dw $0040, $8080, $6E2E, $FFCE, $FFF1, $FFFF, $3F3F, $0000
    dw $FF3F, $7F9F, $9F60, $807F, $E01F, $FF00, $3F00, $0000
    dw $0141, $2121, $DF9F, $FF7E, $F7F4, $E7E7, $8787, $0000
    dw $FE8F, $DE2F, $3EC1, $3EC1, $F403, $E700, $8700, $0000
    dw $0202, $C2C0, $FFFF, $FFFF, $F838, $F8F8, $F8F8, $0000
    dw $FD3A, $3DFF, $3FC0, $3FC0, $18E0, $F800, $F800, $0000
    dw $1010, $1C1C, $FFFF, $FFEF, $FFE3, $FFFF, $FFFF, $0000
    dw $EEF2, $E3FF, $E31C, $E31C, $C13E, $FF00, $FF00, $0000
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
}

{ ;ECA0 - ECFF
    incbin "fill_bytes/eng/bank04a.bin":16390..16486
}

{ ;ED00 - ED7F
_04ED00:
    ;new capcom logo palettes
    dw $0000, $77FF, $17DF, $135C, $02DA, $0256, $6F9E, $02DC
    dw $01F5, $0150, $00ED, $5525, $5104, $4CE3, $48C2, $0842

    dw $0000, $17DF, $77FF, $135C, $02DA, $0256, $02DC, $6F9E
    dw $01F5, $0150, $00ED, $48C2, $5525, $5104, $4CE3, $0842

    dw $0000, $135C, $17DF, $77FF, $02DA, $0256, $00ED, $02DC
    dw $6F9E, $01F5, $0150, $4CE3, $48C2, $5525, $5104, $0842

    dw $0000, $0ADA, $135C, $17DF, $77FF, $77FF, $0150, $01F5
    dw $02DC, $6F9E, $6F9E, $5104, $4CE3, $48C2, $5525, $0000
}

{ ;ED80 - EFFF
    incbin "fill_bytes/eng/bank04a.bin":16614..0
}
endif

{ ;F000 - F002
_04F000: ;a8 x8
    jmp _04F009
}

{ ;F003 - F008
_04F003: ;a x
    jmp _04F021_F025

;-----

    jmp _04F021_F025 ;likely unused?
}

{ ;F009 - F020
_04F009: ;a8 x8
    lda.w stage : asl : tax
    lda.l _04F0E0+0,X : sta $4C
    lda.l _04F0E0+1,X : sta $4D
    stz $0346
    stz $0347
    rtl
}

{ ;F021 - F0DF
_04F021:
    !AX8
    plb
    rtl

.F025:
    phb
    lda #$04 : pha : plb
    !A16
    clc
    lda.w camera_x+1 : adc #$0080 : sta $0000
    ldy #$00
    lda ($4C),Y ;has offset from _04F0E0
    cmp $00
    bcs _04F021

    ldy #$02
    lda ($4C),Y
    tax
    clc
    lda $004C : adc #$0003 : sta $004C
    !X16
    phx
    ldy _04F0E0_F1FA,X
    iny
    lda _04F0E0_F1FA-1,Y
    beq .F08A

    sta $0002
    stz $0003
.F05F:
    ldx _04F0E0_F1FA,Y
    iny #2
    lda _04F0E0_F1FA,Y
    iny
    sta $0004
    stz $0005
    !A16
.F070:
    lda _04F0E0_F1FA,Y : sta $7EF400,X
    inx #2
    iny #2
    dec $0004 : bne .F070

    dec $0002 : bne .F05F

    !A8
    inc $0331
.F08A:
    plx
    ldy _04F0E0_FAF2,X
    lda #$00
    xba
    lda $037B
    asl #3
    tax
    iny
    lda _04F0E0_FAF2-1,Y
    beq .F0DC

    sta $0002
    stz $0003
    clc
    adc $037B
    sta $037B
    !A16
.F0AD:
    lda _04F0E0_FAF2+0,Y : sta $037C,X
    lda _04F0E0_FAF2+2,Y : sta $037E,X
    lda _04F0E0_FAF2+4,Y : sta $0380,X
    lda _04F0E0_FAF2+6,Y : and #$00FF : ora #$8000 : sta $0382,X
    clc : tya : adc #$0007 : tay
    clc : txa : adc #$0008 : tax
    dec $0002 : bne .F0AD

.F0DC:
    !AX8
    plb
    rtl
}

{ ;F0E0 - FE8D
_04F0E0:
    ;offset based on current stage
    dw .stage1, .stage2, .stage3, .F187, .F187, .F187, .F1A1, .F1D0, .F1DE, .F1EF

;-----

    ;camera position, offset into F1FA/FAF2
.stage1:
    dw $0240 : db $0C
    dw $0398 : db $12
    dw $0630 : db $2C
    dw $0840 : db $14
    dw $0870 : db $1A
    dw $0982 : db $00
    dw $0983 : db $D4
    dw $0984 : db $1E
    dw $0985 : db $D6
    dw $09A0 : db $02
    dw $0A02 : db $0E
    dw $0B80 : db $10
    dw $0C40 : db $04
    dw $0C70 : db $0A
    dw $0D74 : db $16
    dw $0E40 : db $06
    dw $1268 : db $1C
    dw $1280 : db $08
    dw $1281 : db $2E
    dw $12E0 : db $18
    dw $7FFF

.stage2:
    dw $01A0 : db $22
    dw $01C0 : db $3A
    dw $0940 : db $24
    dw $0969 : db $30
    dw $096B : db $E8
    dw $09B6 : db $20
    dw $0A18 : db $26
    dw $0A20 : db $28
    dw $0A40 : db $3E
    dw $0A80 : db $2A
    dw $14D0 : db $32
    dw $14E0 : db $34
    dw $14F0 : db $36
    dw $1500 : db $38
    dw $7FFF

.stage3:
    dw $0020 : db $58
    dw $01C6 : db $5A
    dw $0560 : db $4A
    dw $0568 : db $56
    dw $05F8 : db $4E
    dw $0602 : db $44
    dw $0608 : db $46
    dw $0610 : db $40
    dw $05FC : db $54
    dw $0D80 : db $50
    dw $0F04 : db $48
    dw $1720 : db $4C
    dw $1980 : db $52
    dw $7FFF

.F187:
    dw $0000 : db $A0
    dw $0002 : db $A2
    dw $0004 : db $A4
    dw $0006 : db $A6
    dw $0008 : db $A8
    dw $000A : db $AA
    dw $000C : db $AC
    dw $000E : db $AE
    dw $7FFF

.F1A1:
    dw $0020 : db $DC
    dw $0280 : db $C0
    dw $0500 : db $C2
    dw $0602 : db $C4
    dw $0650 : db $DA
    dw $0700 : db $D8
    dw $0750 : db $C6
    dw $07C0 : db $CC
    dw $0900 : db $BE
    dw $0982 : db $CA
    dw $0992 : db $C8
    dw $0E80 : db $DE
    dw $0E82 : db $CE
    dw $0F00 : db $D0
    dw $1000 : db $D2
    dw $7FFF

.F1D0:
    dw $0022 : db $E6
    dw $0430 : db $E0
    dw $0438 : db $E2
    dw $0440 : db $E4
    dw $7FFF

.F1DE:
    dw $0020 : db $F4
    dw $0220 : db $F8
    dw $0240 : db $F6
    dw $0380 : db $F2
    dw $03A0 : db $F0
    dw $7FFF

.F1EF:
    dw $0020 : db $FA
    dw $0022 : db $FC
    dw $0024 : db $FE
    dw $7FFF

;-----

.F1FA:
    dw offset(.F1FA, .FE8C), offset(.F1FA, .F2FA), offset(.F1FA, .F31A), offset(.F1FA, .F373)
    dw offset(.F1FA, .F395), offset(.F1FA, .F3DD), offset(.F1FA, .F41C), offset(.F1FA, .F43E)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .F460), offset(.F1FA, .F46C), offset(.F1FA, .F48E)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .F4D2), offset(.F1FA, .F4F4), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .F533), offset(.F1FA, .FE8C), offset(.F1FA, .F576), offset(.F1FA, .F582)
    dw offset(.F1FA, .F5A2), offset(.F1FA, .F5E1), offset(.F1FA, .FE8C), offset(.F1FA, .F603)
    dw offset(.F1FA, .F617), offset(.F1FA, .F639), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .F697), offset(.F1FA, .FE8C), offset(.F1FA, .F6B7)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .F716), offset(.F1FA, .F6F8), offset(.F1FA, .F738), offset(.F1FA, .F75A)
    dw offset(.F1FA, .F79E), offset(.F1FA, .F7A4), offset(.F1FA, .F77C), offset(.F1FA, .F7B8)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .F827), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .F849)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .F97A)
    dw offset(.F1FA, .FE8C), offset(.F1FA, .F85D), offset(.F1FA, .F87F), offset(.F1FA, .F8B6)
    dw offset(.F1FA, .F8D2), offset(.F1FA, .F8F7), offset(.F1FA, .F934), offset(.F1FA, .F94C)
    dw offset(.F1FA, .F958), offset(.F1FA, .F99A), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .F9AE), offset(.F1FA, .F9D0), offset(.F1FA, .FE8C), offset(.F1FA, .F9F2)
    dw offset(.F1FA, .FA14), offset(.F1FA, .FE8C), offset(.F1FA, .FA36), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FA50), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FA75), offset(.F1FA, .FA8F), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)
    dw offset(.F1FA, .FAD2), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C), offset(.F1FA, .FE8C)

;-----

;count
;cgram dest, count
;palette

.F2FA:
    db $01
    dw $01C2 : db $0E
    dw $0010, $0094, $1118, $219A, $29DE, $18C6, $4210, $5AD6, $6B5A, $7BDE, $761A, $6996, $5910, $408E

.F31A:
    db $04
    dw $0042 : db $0F
    dw $63BD, $571B, $4255, $31CF, $216B, $1909, $0C85, $0069, $0DAB, $6F57, $6B2F, $330D, $26A4, $09E1, $0C21
    dw $0082 : db $0F
    dw $558A, $4947, $4254, $31CF, $214B, $18E7, $0C85, $006A, $09A0, $788F, $646D, $5047, $3444, $2423, $1021
    dw $0020 : db $04
    dw $0000, $1C04, $1403, $0C02
    dw $0028 : db $04
    dw $0000, $2C63, $2442, $1821

.F373:
    db $01
    dw $00A2 : db $0F
    dw $212B, $190A, $10C8, $10A7, $0885, $0044, $0023, $00C9, $00A8, $0087, $0066, $0065, $0044, $0023, $0000

.F395:
    db $03
    dw $0042 : db $0F
    dw $52D7, $4274, $31CF, $214B, $18E7, $10A6, $0864, $158D, $08E9, $08C7, $0886, $0884, $0443, $0421, $0000
    dw $0082 : db $08
    dw $4274, $31CF, $214B, $18E7, $10A6, $0C64, $0443, $156C
    dw $00A2 : db $08
    dw $31CF, $214B, $18E7, $10A6, $0884, $0443, $0422, $00C8

.F3DD: ;stage 1b
    db $02
    dw $01A2 : db $0E
    dw $0090, $10D6, $1558, $19DA, $2E7C, $4B1E, $7506, $5148, $69CA, $7A4E, $7A92, $7BDE, $739C, $39CE
    dw $01E2 : db $0E
    dw $198E, $21D0, $4298, $535E, $0000, $7BDE, $6B5A, $4A52, $294A, $0092, $0156, $01D8, $025A, $035E

.F41C:
    db $01
    dw $00C2 : db $0F
    dw $0041, $00A0, $43FB, $0144, $0268, $0384, $03F9, $4FFF, $4F3F, $4D5B, $0D14, $00CA, $0067, $02F9, $00A2

.F43E: ;shortly after 1st wave crash
    db $01
    dw $00C2 : db $0F
    dw $7BDF, $635A, $4231, $1D2A, $0CA6, $275E, $00B3, $5694, $39CF, $192A, $08A6, $0275, $02EE, $0163, $0000

.F460:
    db $01
    dw $0038 : db $04
    dw $0000, $1908, $31AD, $216B

.F46C:
    db $01
    dw $00C2 : db $0F
    dw $0086, $56FB, $329C, $19B6, $08CE, $04AA, $0067, $0143, $01C6, $4B3D, $42DB, $329C, $21D6, $08F1, $0064

.F48E:
    db $01
    dw $00C2 : db $0F
    dw $3A12, $29CE, $216C, $192B, $10E8, $08A6, $0064, $0044, $0000, $0006, $0D0C, $0889, $0466, $0443, $0421

.F4B0: ;unused, doesn't have an offset pointing to it
    db $01
    dw $00E2 : db $0F
    dw $0000, $0000, $0123, $0123, $01E7, $02AA, $038E, $0773, $1FFA, $0143, $42DB, $329C, $19B6, $08CE, $0082

.F4D2:
    db $01
    dw $0062 : db $0F
    dw $5440, $6580, $59E0, $76C0, $7F54, $5440, $5440, $3000, $5440, $5440, $3C00, $5440, $3C00, $04AA, $0067

.F4F4:
    db $02
    dw $0182 : db $0E
    dw $77BD, $6318, $4A52, $318C, $00F1, $1DD5, $367B, $46FF, $25B2, $3A57, $573D, $001B, $0012, $000D
    dw $01E2 : db $0E
    dw $1EF4, $01EC, $0147, $000C, $0071, $00D4, $019A, $023F, $25B1, $3A56, $573D, $6F7B, $4A52, $318C

.F533:
    db $02
    dw $0042 : db $0F
    dw $59C0, $5180, $4940, $7310, $728C, $6204, $39CE, $4296, $19AF, $0D4C, $0CE9, $0CA7, $00A6, $0085, $0421
    dw $0062 : db $0F
    dw $6B5A, $72CA, $6A04, $6180, $5900, $4880, $0000, $0000, $0000, $0000, $0000, $6644, $40E0, $6644, $40E0

.F576:
    db $01
    dw $01F6 : db $04
    dw $7ACC, $6A4A, $61C6, $4142

.F582:
    db $01
    dw $01C2 : db $0E
    dw $3990, $4A14, $5256, $5ADA, $6B5C, $0114, $0198, $021A, $02DE, $7BDE, $0180, $0240, $02C0, $0380

.F5A2: ;stage 2, around the first vortex
    db $02
    dw $0182 : db $0E
    dw $0100, $0986, $1A2A, $2AAE, $3B74, $77BD, $0152, $4A52, $39CE, $218C, $3A52, $539C, $0218, $0194
    dw $01A2 : db $0E
    dw $01C0, $2244, $3B06, $4BC8, $7BDE, $0012, $0156, $021C, $1ADE, $33DE, $598C, $6210, $6A52, $7AD6

.F5E1: ;stage 2 ^
    db $01
    dw $00A2 : db $0F
    dw $59C0, $5180, $4940, $7310, $728C, $6204, $39CE, $3A54, $116D, $050A, $04A7, $0465, $0044, $0023, $0421

.F603:
    db $01
    dw $01C2 : db $08
    dw $000B, $0012, $0018, $0159, $01FB, $2ADC, $3B5D, $7FFF

.F617: ;stage 2 at midway raft
    db $01
    dw $00E2 : db $0F
    dw $6180, $5900, $4880, $6B5A, $72CA, $6A04, $39CE, $40E0, $34A0, $2C60, $6A04, $5560, $4D00, $6644, $40E0

.F639: ;stage 2, pre-boss
    db $03
    dw $0182 : db $0E
    dw $0044, $0CE9, $1D6D, $35F1, $4677, $77BD, $6739, $4E73, $0161, $01A3, $0A86, $22CC, $43D4, $0000
    dw $01A2 : db $0E
    dw $194C, $29D0, $3E75, $531A, $677F, $7FFF, $6B5A, $5294, $0011, $0135, $01B9, $01FF, $0000, $0000
    dw $01C2 : db $0E
    dw $00EA, $116E, $21F2, $42FA, $5B7F, $7FFF, $5EF7, $3DEF, $000A, $0010, $00B4, $0117, $019F, $0000

.F697: ;early stage 2, mimic palette
    db $01
    dw $01C2 : db $0E
    dw $3996, $41DA, $525C, $62DE, $7BDE, $11CE, $2A52, $3B18, $439C, $4210, $2112, $215A, $21DC, $229E

.F6B7: ;stage 2, right after F5A2
    db $02
    dw $0082 : db $0E
    dw $625F, $291F, $187E, $1039, $1013, $100D, $1006, $254A, $2108, $18E7, $18C6, $10A5, $1084, $0000
    dw $00C2 : db $0F
    dw $7675, $45F2, $3D6B, $3506, $2881, $3516, $24AF, $000A, $0000, $0000, $14A5, $1084, $0C63, $0842, $0000

.F6F8: ;stage 3, arremer
    db $01
    dw $0182 : db $0D
    dw $6B7C, $6318, $4E73, $4211, $35CF, $318F, $256D, $210B, $18E9, $10C8, $0886, $0884, $0463

.F716: ;stage 3, mid third tower
    db $01
    dw $01A2 : db $0F
    dw $010C, $2190, $3214, $531A, $7BDE, $5AD6, $0010, $0198, $025A, $0000, $5940, $7280, $39CE, $4A52, $0421

.F738: ;stage 3, last tower
    db $01
    dw $01E2 : db $0F
    dw $639E, $4AD8, $3A54, $25AF, $194C, $04A7, $0000, $0000, $0000, $739C, $5EF7, $3DEF, $2529, $1CE7, $0000

.F75A: ;stage 3, first tower
    db $01
    dw $01E2 : db $0F
    dw $004E, $00D4, $0158, $01DA, $739C, $4A52, $39CE, $294A, $0000, $0000, $0000, $0000, $0000, $0000, $0421

.F77C: ;stage 3, first tower
    db $01
    dw $01C2 : db $0F
    dw $7BDF, $77BE, $5B1A, $4A75, $39F1, $2D8E, $254B, $18E9, $14C7, $14A5, $000C, $0092, $0198, $021C, $0421

.F79E: ;stage 3, third tower
    db $01
    dw $00BA : db $01
    dw $0C8C

.F7A4: ;stage 3, silk platforms
    db $01
    dw $01C2 : db $08
    dw $000B, $0012, $0018, $0159, $01FB, $2ADC, $3B5D, $7FFF

.F7B8: ;stage 3, arremer
    db $06
    dw $0020 : db $04
    dw $0000, $2860, $2040, $1420
    dw $0028 : db $04
    dw $0000, $0000, $3060, $2460
    dw $0030 : db $04
    dw $0000, $0000, $2840, $1420
    dw $0038 : db $04
    dw $0000, $0000, $2840, $1420
    dw $0042 : db $0F
    dw $39CE, $35AD, $316C, $294A, $252A, $2129, $2108, $1CE7, $18C6, $14A5, $1485, $10A4, $0424, $0424, $0026
    dw $00C2 : db $0F
    dw $6B7C, $6318, $4E73, $4211, $35CF, $318F, $256D, $210B, $18E9, $10C8, $0886, $0884, $0421, $0421, $0421

.F827: ;stage 3, conveyor belts
    db $01
    dw $01C2 : db $0F
    dw $008A, $08CC, $1150, $3216, $531E, $7BDE, $6318, $4A52, $318C, $2108, $0007, $000C, $0012, $001C, $0421

.F849: ;stage 4c
    db $01
    dw $01C2 : db $08
    dw $000B, $0012, $0018, $0159, $01FB, $2ADC, $3B5D, $7FFF

.F85D: ;stage 5 ice tunnel
    db $01
    dw $01A2 : db $0F
    dw $000E, $0091, $0156, $01F8, $02BC, $7BDE, $4080, $5964, $7208, $7E8C, $6318, $5294, $39CE, $2529, $0842

.F87F: ;stage 5 ice tunnel
    db $02
    dw $0042 : db $0A
    dw $7B3A, $7AB5, $7252, $6D8F, $614D, $510A, $48C8, $3CA7, $2C65, $2083
    dw $00C2 : db $0E
    dw $6D8F, $614D, $510A, $48C8, $3CA7, $2C65, $2083, $2044, $1423, $0C02, $280A, $1C07, $1004, $0802

.F8B6: ;stage 5-2
    db $01
    dw $0062 : db $0C
    dw $7F7F, $7EBD, $6215, $5572, $490E, $3CEA, $2867, $1C44, $7F7F, $6635, $6635, $6635

.F8D2: ;stage 5-2
    db $04
    dw $0022 : db $03
    dw $51CE, $4929, $30C6
    dw $002A : db $03
    dw $3508, $2CC6, $1883
    dw $0032 : db $03
    dw $5A10, $51AD, $456B
    dw $003A : db $03
    dw $51AB, $3927, $24A3

.F8F7: ;stage 5-2
    db $02
    dw $0082 : db $0F
    dw $7FFF, $7FDA, $7F51, $7EAC, $5E2E, $522E, $35C8, $2D65, $2124, $1CE4, $4D24, $3902, $28A2, $1C60, $0000
    dw $00A2 : db $0D
    dw $7FDD, $7FBB, $7F99, $7B35, $76D1, $6E4C, $65CA, $7FDD, $7FDD, $7FDD, $7FDD, $7FBB ;mistake: loads 2 bytes from the next section

.F934: ;stage 5-2
    db $01
    dw $00E2 : db $0A
    dw $48C8, $3CA7, $2C65, $2083, $2044, $1423, $0C02, $0801, $0000, $0000

.F94C: ;stage 5 boss
    db $01
    dw $0056 : db $04
    dw $4E10, $418C, $3108, $20C6

.F958: ;stage 5 boss
    db $01
    dw $01E2 : db $0F
    dw $7B3A, $7AB5, $7252, $6D8F, $614D, $510A, $48C8, $3CA7, $2C65, $2083, $4E10, $418C, $3108, $20C6, $0421

.F97A: ;stage 5-2
    db $01
    dw $01E2 : db $0E
    dw $418A, $51CC, $6A50, $72D4, $7B9A, $318C, $4210, $5294, $6318, $7FFF, $031E, $025C, $0198, $0110

.F99A: ;stage 5 boss
    db $01
    dw $01C2 : db $08
    dw $000B, $0012, $0018, $0159, $01FB, $2ADC, $3B5D, $7FFF

.F9AE: ;stage 5-2
    db $01
    dw $0182 : db $0F
    dw $35AD, $4631, $5EF7, $6B5A, $29F1, $42B7, $63BF, $0019, $000F, $0000, $0000, $6F39, $5673, $45EF, $0842

.F9D0: ;stage 5 ice tunnel end
    db $01
    dw $01E2 : db $0F
    dw $7B3A, $7AB5, $7252, $6D8F, $614D, $510A, $48C8, $3CA7, $2C65, $2083, $4E10, $418C, $3108, $20C6, $0421

.F9F2: ;stage 5 boss
    db $01
    dw $0182 : db $0F
    dw $1000, $2400, $4000, $4D27, $69AF, $7654, $7F1A, $7FFF, $6317, $5293, $420F, $318B, $0000, $0000, $0421

.FA14: ;stage 6 boss
    db $01
    dw $0182 : db $0F
    dw $000B, $0010, $0015, $0176, $294A, $3DEF, $5EF7, $7BDE, $46B7, $3212, $1D6D, $4469, $6150, $7A16, $0842

.FA36: ;stage 6 boss
    db $01
    dw $01C2 : db $0B
    dw $000B, $0012, $0018, $0159, $01FB, $2ADC, $3B5D, $7FFF, $0006, $0005, $0003

.FA50: ;stage 2 at midway raft
    db $04
    dw $0022 : db $03
    dw $61C0, $5940, $5100
    dw $002A : db $03
    dw $5100, $4000, $61C0
    dw $0032 : db 03
    dw $5100, $4000, $3000
    dw $003A : db 03
    dw $4000, $3000, $2000

.FA75: ;stage 7-2
    db $01
    dw $01C2 : db $0B
    dw $000B, $0012, $0018, $0159, $01FB, $2ADC, $3B5D, $7FFF, $0006, $0005, $0003

.FA8F: ;stage 7-2
    db $02
    dw $0182 : db $0F
    dw $000B, $0010, $0015, $0176, $294A, $3DEF, $5EF7, $7BDE, $46B7, $3212, $1D6D, $44A9, $6150, $7A16, $0842
    dw $01A2 : db $0F
    dw $3000, $54A0, $6940, $79C0, $018E, $0253, $3739, $7BDE, $33E5, $0E60, $0180, $39CF, $5295, $7BDF, $0842

.FAD2: ;stage 7-2
    db $01
    dw $01C2 : db $0E
    dw $598E, $69D0, $7254, $7AD8, $7BDE, $11CE, $2A52, $3B18, $439C, $4210, $2112, $215A, $21DC, $229E

;-----

.FAF2:
    dw offset(.FAF2, .FBF2), offset(.FAF2, .FBFA), offset(.FAF2, .FC02), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FC0A), offset(.FAF2, .FC20), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FC2F), offset(.FAF2, .FE8C), offset(.FAF2, .FC5A), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FC69), offset(.FAF2, .FC78), offset(.FAF2, .FE8C), $0195
    dw $019D, $01BA, offset(.FAF2, .FE8C), $01C2
    dw $01CA, $01D2, $01E8, offset(.FAF2, .FCE9)
    dw $01FF, offset(.FAF2, .FD07), offset(.FAF2, .FD0F), $0225
    dw $022D, offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), $0235
    dw $023D, offset(.FAF2, .FE8C), $0245, $024D
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), $025C, offset(.FAF2, .FD56)
    dw offset(.FAF2, .FE8C), $0284, $026C, offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FD66), offset(.FAF2, .FD6E), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw $028C, $0294, $029C, $02A4
    dw $02AC, $02B4, $02BC, $02C4
    dw $02CC, offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), $0333
    dw $02D4, offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw $02DC, $02E4, offset(.FAF2, .FE8C), $02EC
    dw $02F4, $02FC, $0304, $030C
    dw offset(.FAF2, .FE8C), $031B, offset(.FAF2, .FE15), offset(.FAF2, .FE1D)
    dw $033B, $0343, $034B, $0353
    dw offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C), offset(.FAF2, .FE8C)
    dw $036A, $035B, $0372, $037A
    dw offset(.FAF2, .FE8C), $0382, $038A, $0392

;-----

;vram dst addr, ram src addr, size

.FBF2:
    db $01
    dw $3100 : dl $7FA000 : dw $0E00

.FBFA:
    db $01
    dw $7900 : dl $7F06C0 : dw $09E0

.FC02:
    db $01
    dw $3800 : dl $7FC000 : dw $1000

.FC0A:
    db $03
    dw $5000 : dl $7FD2C0 : dw $0600
    dw $3300 : dl $7FDE60 : dw $0200
    dw $3500 : dl $7FE060 : dw $0200

.FC20:
    db $02
    dw $7200 : dl $7F6A00 : dw $0E00
    dw $7900 : dl $7F10A0 : dw $0900

.FC2F:
    db $06
    dw $2100 : dl $7FE760 : dw $0200
    dw $2500 : dl $7FE960 : dw $0200
    dw $2900 : dl $7FEB60 : dw $0200
    dw $2F00 : dl $7FEF60 : dw $0200
    dw $2D00 : dl $7FED60 : dw $0200
    dw $2B00 : dl $7FF740 : dw $0200

.FC5A:
    db $02
    dw $3000 : dl $7FDC40 : dw $0200
    dw $20F0 : dl $7FDE40 : dw $0020

.FC69:
    db $02
    dw $3E00 : dl $7FE260 : dw $0400
    dw $2E00 : dl $7FF4C0 : dw $0280

.FC78:
    db $02
    dw $2300 : dl $7FD9C0 : dw $0200
    dw $2780 : dl $7FDBC0 : dw $0080

    db $01
    dw $5500 : dl $7FB600 : dw $0A00

    db $04
    dw $4800 : dl $7FA000 : dw $1000
    dw $7200 : dl $7F0C00 : dw $0900
    dw $3500 : dl $7FE000 : dw $0200
    dw $5000 : dl $7FE200 : dw $0800

    db $01
    dw $7200 : dl $7F4FC0 : dw $0400

    db $01
    dw $7700 : dl $7F45C0 : dw $0A00

    db $01
    dw $7E00 : dl $7F41C0 : dw $0400

    db $03
    dw $3100 : dl $7FB000 : dw $0200
    dw $3300 : dl $7FDE00 : dw $0200
    dw $5400 : dl $7FEE00 : dw $0200

    db $02
    dw $2120 : dl $7FF160 : dw $01C0
    dw $5300 : dl $7FF320 : dw $01A0

.FCE9:
    db $01
    dw $6C00 : dl $7F62E0 : dw $0720

    db $03
    dw $5A00 : dl $7FB200 : dw $0400
    dw $4000 : dl $7FB600 : dw $1000
    dw $3F00 : dl $7FEA00 : dw $0200

.FD07: ;storm cesaris
    db $01
    dw $7000 : dl $7F53C0 : dw $0400

.FD0F:
    db $01
    dw $7440 : dl $7F57C0 : dw $0100

    db $01
    dw $7540 : dl $7F58C0 : dw $0100

    db $01
    dw $7600 : dl $7F59C0 : dw $1400

    db $01
    dw $3700 : dl $7FEC00 : dw $0200

    db $01
    dw $5800 : dl $7FA000 : dw $0600

    db $01
    dw $4000 : dl $7FA600 : dw $1000

    db $02
    dw $2400 : dl $7FB600 : dw $0800
    dw $3C00 : dl $7FBE00 : dw $0800

    db $01
    dw $7400 : dl $7F0CA0 : dw $0800

.FD56: ;stage 3
    db $01
    dw $7C00 : dl $7F31A0 : dw $0400

    db $01
    dw $7500 : dl $7F14A0 : dw $0E00

.FD66: ;stage 3
    db $01
    dw $7600 : dl $7F8500 : dw $03E0

.FD6E: ;stage 3
    db $01
    dw $7600 : dl $7F0800 : dw $04A0

    db $01
    dw $6C00 : dl $7F88E0 : dw $0720

    db $01
    dw $70E0 : dl $7F1780 : dw $0040

    db $01
    dw $71E0 : dl $7F17C0 : dw $0040

    db $01
    dw $72E0 : dl $7F1800 : dw $0040

    db $01
    dw $73E0 : dl $7F1840 : dw $0040

    db $01
    dw $74E0 : dl $7F1880 : dw $0040

    db $01
    dw $75E0 : dl $7F18C0 : dw $0040

    db $01
    dw $7600 : dl $7F1900 : dw $1400

    db $01
    dw $6C00 : dl $7F4180 : dw $0720

    db $01
    dw $2EA0 : dl $7FA000 : dw $0000

    db $01
    dw $7C00 : dl $7F1400 : dw $0800

    db $01
    dw $5800 : dl $7FA000 : dw $0800

    db $01
    dw $4400 : dl $7FB080 : dw $0800

    db $01
    dw $2100 : dl $7FB000 : dw $0080

    db $01
    dw $7E00 : dl $7F0000 : dw $0200

    db $01
    dw $6C00 : dl $7F75C0 : dw $0720

    db $01
    dw $5000 : dl $7FAE00 : dw $0800

    db $02
    dw $3E00 : dl $7FD8C0 : dw $0100
    dw $3F00 : dl $7FE660 : dw $0100

    db $01
    dw $7B00 : dl $7F0000 : dw $0200

.FE15: ;stage 5
    db $01
    dw $7B00 : dl $7F1C00 : dw $0100

.FE1D: ;stage 5 boss
    db $01
    dw $7400 : dl $7F0400 : dw $1400

    db $01
    dw $7B00 : dl $7F1C00 : dw $0100

    db $01
    dw $7800 : dl $7F7460 : dw $1000

    db $01
    dw $7400 : dl $7F8460 : dw $0360

    db $01
    dw $6C00 : dl $7F5240 : dw $0720

    db $01
    dw $7400 : dl $7F0000 : dw $0100

    db $02
    dw $7400 : dl $7F7E80 : dw $0360
    dw $7800 : dl $7F6E80 : dw $1000

    db $01
    dw $6C00 : dl $7F4C60 : dw $0720

    db $01
    dw $7200 : dl $7F3C60 : dw $03E0

    db $01
    dw $7200 : dl $7F81E0 : dw $0E00

    db $01
    dw $7000 : dl $7F0000 : dw $1000

    db $01
    dw $7800 : dl $7F1000 : dw $1000

    db $01
    dw $6C00 : dl $7F2000 : dw $0720

.FE8C:
    db $00

    db $00 ;trailing zero, end of table maybe?
}

{ ;FE8E - FFFF
if !version == 0
    fillbyte $FF : fill 370
elseif !version == 1 || !version == 2
    incbin "fill_bytes/eng/bank04b.bin"
endif
}
