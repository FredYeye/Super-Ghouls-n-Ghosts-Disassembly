{
_00ED00: ;sprite related. sprite sets to load?
    ;todo: needs lots of cleanup
    dw .arthur_underwear, .arthur_steel, .weapon, .wolf, .FAC3, .eagler, .magician, .armor
    dw .grilian, .arremer, .arthur_upgraded_armor, .arthur_upgraded_armor_gold, .raft_hanging, .F455, .shield, .trap
    dw .arthur_plume, .arthur_face, .arthur_bee, .arthur_baby, .key_message, .siren, .key, .tower_edge
    dw .arthur_maiden, .arthur_seal, .magic, .armor_upgrade_vfx, .rotating_platform, .zombie, .miniwing, .cockatrice_wings
    dw .cockatrice_head, .cockatrice_legs, .cockatrice_body, .F917, .gate, .mimic, .mimic_ghost, .hydra
    dw .FCAC, .gate2, .FCED, .FCF5, .FD7C, .FD98, .tiny_goblin, .princess_dialogue
    dw .arremer, .astaroth, .nebiroth, .nebiroth_flame_laser, .cockatrice_neck_base
if !version == 0 || !version == 1
    dw $FFFF
elseif !version == 2
    dw .F1BF ;bracelet sparkle related
endif
    dw .veil_allocen_claws, .veil_allocen_projectile

;-----

.arthur_underwear:
    dw ..idle
    dw ..walk, ..walk+6, ..walk+12, ..walk+18, ..walk+24, ..walk+30
    dw ..jump_neutral
    dw ..jump_forward
    dw ..crouch
    dw ..shot, ..shot+6
    dw ..shot_crouch, ..shot_crouch+6
    dw ..climb, ..climb+6
    dw ..climb_top, ..climb_top+6
    dw .arthur_steel_victory
    dw ..double_jump_neutral
    dw ..double_jump_forward
    dw ..double_jump_crouch
    dw ..double_jump_flip, ..double_jump_flip+6, ..double_jump_flip+12
    dw .arthur_upgraded_armor_get_armor, .arthur_upgraded_armor_get_armor+6
    dw ..knockback, ..knockback+6, ..knockback+12, ..knockback+18, ..knockback+24, ..knockback+30

    ;address to uncompressed sprite data, size, [vram offset], terminator
..idle:
    dl arthur_sprites_underwear_idle : dw $01C0 : db $FF

..walk:
    dl arthur_sprites_underwear_walk_1 : dw $01A0 : db $FF
    dl arthur_sprites_underwear_walk_2 : dw $0200 : db $FF
    dl arthur_sprites_underwear_walk_3 : dw $01C0 : db $FF
    dl arthur_sprites_underwear_walk_4 : dw $0180 : db $FF
    dl arthur_sprites_underwear_walk_5 : dw $01C0 : db $FF
    dl arthur_sprites_underwear_walk_6 : dw $01E0 : db $FF

..jump_neutral:
    dl arthur_sprites_underwear_jump_neutral : dw $01E0 : db $FF

..jump_forward:
    dl arthur_sprites_underwear_jump_forward : dw $01E0 : db $FF

..crouch:
    dl arthur_sprites_underwear_crouch : dw $0100 : db $FF

..shot:
    dl arthur_sprites_underwear_shot_1 : dw $01E0 : db $FF
    dl arthur_sprites_underwear_shot_2 : dw $01E0 : db $FF

..shot_crouch:
    dl $0EBC60 : dw $0140 : db $FF
    dl $0EBDA0 : dw $0140 : db $FF

..climb:
    dl $0EBEE0 : dw $01C0 : db $FF
    dl $0EC0A0 : dw $01C0 : db $FF

..climb_top:
    dl $0EC260 : dw $0140 : db $FF
    dl $0EC3A0 : dw $0140 : db $FF

..double_jump_neutral:
    dl $0EC6A0 : dw $0200 : db $FF

..double_jump_forward:
    dl $0EC8A0 : dw $01E0 : db $FF

..double_jump_crouch:
    dl $0ECA80 : dw $0140 : db $FF

..double_jump_flip:
    dl $0ECBC0 : dw $0100 : db $FF
    dl $0ECCC0 : dw $0140 : db $FF
    dl $0ECE00 : dw $0140 : db $FF ;unused

..knockback:
    dl arthur_sprites_underwear_knockback : dw $01C0 : db $FF
    dl arthur_sprites_bones_knockback : dw $0180 : db $FF
    dl arthur_sprites_bones_falling_1 : dw $0200 : db $FF
    dl arthur_sprites_bones_falling_2 : dw $01A0 : db $FF
    dl arthur_sprites_bones_pile_1 : dw $0100 : db $FF
    dl arthur_sprites_bones_pile_2 : dw $00A0 : db $FF

;-----

.arthur_steel:
    dw ..idle
    dw ..walk, ..walk+6, ..walk+12, ..walk+18, ..walk+24, ..walk+30
    dw ..jump_neutral
    dw ..jump_forward
    dw ..crouch
    dw ..shot, ..shot+6
    dw ..shot_crouch, ..shot_crouch+6
    dw ..climb, ..climb+6
    dw ..climb_top, ..climb_top+6
    dw ..victory
    dw ..double_jump_neutral
    dw ..double_jump_forward
    dw ..double_jump_crouch
    dw ..double_jump_flip, ..double_jump_flip+6, ..double_jump_flip+12
    dw .arthur_upgraded_armor_get_armor, .arthur_upgraded_armor_get_armor+6
    dw ..knockback, .arthur_underwear_knockback+6, .arthur_underwear_knockback+12, .arthur_underwear_knockback+18, .arthur_underwear_knockback+24, .arthur_underwear_knockback+30

..idle:
    dl arthur_sprites_steel_idle : dw $01C0 : db $FF

..walk:
    dl arthur_sprites_steel_walk_1 : dw $01A0 : db $FF
    dl arthur_sprites_steel_walk_2 : dw $0200 : db $FF
    dl arthur_sprites_steel_walk_3 : dw $01C0 : db $FF
    dl arthur_sprites_steel_walk_4 : dw $0180 : db $FF
    dl arthur_sprites_steel_walk_5 : dw $01C0 : db $FF
    dl arthur_sprites_steel_walk_6 : dw $01E0 : db $FF

..jump_neutral:
    dl arthur_sprites_steel_jump_neutral : dw $01E0 : db $FF

..jump_forward:
    dl arthur_sprites_steel_jump_forward : dw $01E0 : db $FF

..crouch:
    dl $0E9000 : dw $0100 : db $FF

..shot:
    dl $0E9100 : dw $01E0 : db $FF
    dl $0E92E0 : dw $01E0 : db $FF

..shot_crouch:
    dl $0E94C0 : dw $0140 : db $FF
    dl $0E9600 : dw $0140 : db $FF

..climb:
    dl $0E9740 : dw $01C0 : db $FF
    dl $0E9900 : dw $01C0 : db $FF

..climb_top:
    dl $0E9AC0 : dw $0140 : db $FF
    dl $0E9C00 : dw $0140 : db $FF

..victory:
    dl $0E9D40 : dw $01C0 : db $FF

..double_jump_neutral:
    dl $0E9F00 : dw $0200 : db $FF

..double_jump_forward:
    dl $0EA100 : dw $01E0 : db $FF

..double_jump_crouch:
    dl $0EA2E0 : dw $0140 : db $FF

..double_jump_flip:
    dl $0EA420 : dw $0100 : db $FF
    dl $0EA520 : dw $0140 : db $FF
    dl $0EA660 : dw $0140 : db $FF ;unused

..knockback:
    dl arthur_sprites_underwear_knockback : dw $01C0, $0130 ;0130 = vram offset, load steel armor pickup gfx
    dl $0EFC20 : dw $00E0 : db $FF

;-----

.arthur_upgraded_armor:
    dw ..idle
    dw ..walk, ..walk+6, ..walk+12, ..walk+18, ..walk+24, ..walk+30
    dw ..jump_neutral
    dw ..jump_forward
    dw ..crouch
    dw ..shot, ..shot+6
    dw ..shot_crouch, ..shot_crouch+6
    dw ..climb, ..climb+6
    dw ..climb_top, ..climb_top+6
    dw ..victory
    dw ..double_jump_neutral
    dw ..double_jump_forward
    dw ..double_jump_crouch
    dw .arthur_steel_double_jump_flip, .arthur_steel_double_jump_flip+6, .arthur_steel_double_jump_flip+12
    dw ..get_armor, ..get_armor+6
    dw ..knockback_bronze, .arthur_underwear_knockback+6, .arthur_underwear_knockback+12, .arthur_underwear_knockback+18, .arthur_underwear_knockback+24, .arthur_underwear_knockback+30

..knockback_bronze:
    dl $0EC4E0 : dw $01C0, $0130
    dl $0EFDE0 : dw $00E0 : db $FF

..gold:
    dw ..idle
    dw ..walk, ..walk+6, ..walk+12, ..walk+18, ..walk+24, ..walk+30
    dw ..jump_neutral
    dw ..jump_forward
    dw ..crouch
    dw ..shot, ..shot+6
    dw ..shot_crouch, ..shot_crouch+6
    dw ..climb, ..climb+6
    dw ..climb_top, ..climb_top+6
    dw ..victory
    dw ..double_jump_neutral
    dw ..double_jump_forward
    dw ..double_jump_crouch
    dw .arthur_steel_double_jump_flip, .arthur_steel_double_jump_flip+6, .arthur_steel_double_jump_flip+12
    dw ..get_armor, ..get_armor+6
    dw ..knockback_gold, .arthur_underwear_knockback+6, .arthur_underwear_knockback+12, .arthur_underwear_knockback+18, .arthur_underwear_knockback+24, .arthur_underwear_knockback+30

..idle:
    dl $0F8000 : dw $01C0 : db $FF

..walk:
    dl $0F81C0 : dw $01A0 : db $FF
    dl $0F8360 : dw $0200 : db $FF
    dl $0F8560 : dw $01C0 : db $FF
    dl $0F8720 : dw $0180 : db $FF
    dl $0F88A0 : dw $01C0 : db $FF
    dl $0F8A60 : dw $01E0 : db $FF

..jump_neutral:
    dl $0F8C40 : dw $01E0 : db $FF

..jump_forward:
    dl $0F8E20 : dw $01E0 : db $FF

..crouch:
    dl $0F9000 : dw $0100 : db $FF

..shot:
    dl $0F9100 : dw $01E0 : db $FF
    dl $0F92E0 : dw $01E0 : db $FF

..shot_crouch:
    dl $0F94C0 : dw $0140 : db $FF
    dl $0F9600 : dw $0140 : db $FF

..climb:
    dl $0F9740 : dw $01C0 : db $FF
    dl $0F9900 : dw $01C0 : db $FF

..climb_top:
    dl $0F9AC0 : dw $0140 : db $FF
    dl $0F9C00 : dw $0140 : db $FF

..victory:
    dl $0F9D40 : dw $01C0 : db $FF

..double_jump_neutral:
    dl $0F9F00 : dw $0200 : db $FF

..double_jump_forward:
    dl $0FA100 : dw $01E0 : db $FF

..double_jump_crouch:
    dl $0FA2E0 : dw $0140 : db $FF

..get_armor:
    dl $0FA420 : dw $01A0 : db $FF
    dl $0FA5C0 : dw $01A0 : db $FF

..knockback_gold:
    dl $0EC4E0 : dw $01C0, $0130
    dl $0EFD00 : dw $00E0 : db $FF

;-----

.weapon:
    dw ..lance, ..lance2
    dw ..knife, ..knife2
    dw ..bowgun, ..bowgun2
    dw ..scythe, ..scythe2
    dw ..torch, ..torch2
    dw ..axe, ..axe2
    dw ..triblade, ..triblade2
    dw ..bracelet, ..bracelet
    dw ..F173

..lance:
    dl $0FBF00 : dw $02A0 : dw $FC38
    dl $0FB760 : dw $0040 : db $FF

..lance2:
    dl $0FBF00 : dw $02A0 : dw $FC38
    dl $0FB7A0 : dw $0040 : db $FF

..knife:
    dl $0FC1A0 : dw $0200 : dw $FC38
    dl $0FB7E0 : dw $0040 : db $FF

..knife2:
    dl $0FC1A0 : dw $0200 : dw $FC38
    dl $0FB820 : dw $0040 : db $FF

..bowgun:
    dl $0FC3A0 : dw $0080 : dw $FC38
    dl $0FB860 : dw $0040 : db $FF

..bowgun2:
    dl $0FC420 : dw $05A0 : dw $FC38
    dl $0FB8A0 : dw $0040 : db $FF

..scythe:
    dl $0FC9C0 : dw $0180 : dw $0100
    dl $0FCB40 : dw $0200 : dw $FB38
    dl $0FB8E0 : dw $0040 : db $FF

..scythe2:
    dl $0FC9C0 : dw $0180 : dw $0100
    dl $0FCD40 : dw $0200 : dw $0100
    dl $0FCF40 : dw $0140 : dw $FA38
    dl $0FB920 : dw $0040 : db $FF

..torch:
    dl $0FD680 : dw $0580 : dw $FC38
    dl $0FB960 : dw $0040 : db $FF

..torch2:
    dl $0FD080 : dw $0600 : dw $FC38
    dl $0FB9A0 : dw $0040 : db $FF

..axe:
    dl $0FDC00 : dw $0600 : dw $FC38 ;loads some triblade tiles
    dl $0FB9E0 : dw $0040 : db $FF

..axe2:
    dl $0FDC00 : dw $0600 : dw $FC38
    dl $0FBA20 : dw $0040 : db $FF

..triblade:
    dl $0FE180 : dw $01C0 : dw $FC38
    dl $0FBA60 : dw $0040 : db $FF

..triblade2:
    dl $0FE340 : dw $00C0 : dw $FC38
    dl $0FBAA0 : dw $0040 : db $FF

..bracelet:
    dl $0ED600 : dw $03A0 : dw $FC38
    dl $0FBAE0 : dw $0040 : db $FF

..F173:
    dl $0FD680 : dw $0600 : db $FF ;torch flames and axe, probably some leftover set

;-----

.armor:
    dw ..F17F, ..F185, ..F18B

..F17F:
    dl $0EFC20 : dw $00E0 : db $FF

..F185:
    dl $0EFD00 : dw $00E0 : db $FF

..F18B:
    dl $0EFDE0 : dw $00E0 : db $FF

;-----

.magician: ;also used for the bracelet sparkle
    dw ..F199, ..F1A6, ..F1AC, ..F1B2

..F199:
    dl $0EDE40 : dw $0140 : dw $0150
    dl $0EE400 : dw $0160 : db $FF

..F1A6:
    dl $0EDF80 : dw $0120 : db $FF

..F1AC:
    dl $0EE0A0 : dw $0360 : db $FF

..F1B2:
    dl $0EE0A0 : dw $0260 : dw $0150
    dl $0EE400 : dw $00C0 : db $FF

;-----

if !version == 2
.F1BF:
    dw .F1C1

.F1C1:
    dl $0EE500 : dw $0060 : db $FF
endif

;-----

.wolf:
    dw .F1D5, .F1E9 ;idle
    dw .F1FD, .F211 ;turn head
    dw .F225, .F239 ;jump
    dw .F24D ;land
    dw .F261 ;hit
    dw .F275, .F289, .F29D ;maybe running?

.F1D5:
    dl $7F0000 : dw $0080 : dw $0100
    dl $7F0080 : dw $0080 : dw $0100
    dl $7F0100 : dw $00A0 : db $FF

.F1E9:
    dl $7F01A0 : dw $0080 : dw $0100
    dl $7F0220 : dw $0080 : dw $0100
    dl $7F02A0 : dw $00A0 : db $FF

.F1FD:
    dl $7F0340 : dw $0080 : dw $0100
    dl $7F03C0 : dw $0080 : dw $0100
    dl $7F0440 : dw $0040 : db $FF

.F211:
    dl $7F0480 : dw $0040 : dw $0100
    dl $7F04C0 : dw $0040 : dw $0100
    dl $7F0500 : dw $00A0 : db $FF

.F225:
    dl $7F05A0 : dw $0080 : dw $0100
    dl $7F0620 : dw $0080 : dw $0100
    dl $7F06A0 : dw $00C0 : db $FF

.F239:
    dl $7F0760 : dw $0080 : dw $0100
    dl $7F07E0 : dw $0080 : dw $0100
    dl $7F0860 : dw $0100 : db $FF

.F24D:
    dl $7F0960 : dw $0080 : dw $0100
    dl $7F09E0 : dw $0080 : dw $0100
    dl $7F0A60 : dw $00C0 : db $FF

.F261:
    dl $7F0B20 : dw $0080 : dw $0100
    dl $7F0BA0 : dw $0080 : dw $0100
    dl $7F0C20 : dw $0080 : db $FF

.F275:
    dl $7F0CA0 : dw $00C0 : dw $0100
    dl $7F0D60 : dw $00C0 : dw $0100
    dl $7F0E20 : dw $00A0 : db $FF

.F289:
    dl $7F0EC0 : dw $00C0 : dw $0100
    dl $7F0F80 : dw $00C0 : dw $0100
    dl $7F1040 : dw $0060 : db $FF

.F29D:
    dl $7F10A0 : dw $00C0 : dw $0100
    dl $7F1160 : dw $00C0 : dw $0100
    dl $7F1220 : dw $0040 : db $FF

;-----

.zombie:
    dw ..F2D3, ..F2D3+20 ;coffin
    dw ..F2FB ;falling
    dw ..F30F, ..F30F+20 ;init walk
    dw ..F337, ..F34B, ..F35F, ..F373, ..F387 ;walk
    dw ..F39B, ..F3AF, ..F3C3, ..F3D7, ..F3EB ;coffin crumble
    dw ..F3F8, ..F3F8+20 ;burrow

..F2D3:
    dl $7F19A0 : dw $00C0 : dw $0100
    dl $7F1A60 : dw $00C0 : dw $0100
    dl $7F1B20 : dw $00C0 : db $FF

    dl $7F1BE0 : dw $00C0 : dw $0100
    dl $7F1CA0 : dw $00C0 : dw $0100
    dl $7F1D60 : dw $00C0 : db $FF

..F2FB:
    dl $7F1E20 : dw $00C0 : dw $0100
    dl $7F1EE0 : dw $00C0 : dw $0100
    dl $7F1FA0 : dw $0080 : db $FF

..F30F:
    dl $7F2020 : dw $0080 : dw $0100
    dl $7F20A0 : dw $0080 : dw $0100
    dl $7F2120 : dw $0080 : db $FF

    dl $7F21A0 : dw $0080 : dw $0100
    dl $7F2220 : dw $0080 : dw $0100
    dl $7F22A0 : dw $00A0 : db $FF

..F337:
    dl $7F2340 : dw $0080 : dw $0100
    dl $7F23C0 : dw $0080 : dw $0100
    dl $7F2440 : dw $00E0 : db $FF
..F34B:
    dl $7F2520 : dw $0080 : dw $0100
    dl $7F25A0 : dw $0080 : dw $0100
    dl $7F2620 : dw $00E0 : db $FF
..F35F:
    dl $7F2700 : dw $0080 : dw $0100
    dl $7F2780 : dw $0080 : dw $0100
    dl $7F2800 : dw $00E0 : db $FF
..F373:
    dl $7F28E0 : dw $0080 : dw $0100
    dl $7F2960 : dw $0080 : dw $0100
    dl $7F29E0 : dw $00C0 : db $FF
..F387:
    dl $7F2AA0 : dw $0080 : dw $0100
    dl $7F2B20 : dw $0080 : dw $0100
    dl $7F2BA0 : dw $00E0 : db $FF

..F39B:
    dl $7F2C80 : dw $0100 : dw $0100
    dl $7F2D80 : dw $0100 : dw $0100
    dl $7F2E80 : dw $00E0 : db $FF
..F3AF:
    dl $7F2F60 : dw $00C0 : dw $0100
    dl $7F3020 : dw $0100 : dw $0100
    dl $7F3120 : dw $00C0 : db $FF
..F3C3:
    dl $7F31E0 : dw $00C0 : dw $0100
    dl $7F32A0 : dw $00C0 : dw $0100
    dl $7F3360 : dw $00A0 : db $FF
..F3D7:
    dl $7F3400 : dw $0080 : dw $0100
    dl $7F3480 : dw $0080 : dw $0100
    dl $7F3500 : dw $0080 : db $FF
..F3EB:
    dl $7F3580 : dw $0040 : dw $0100
    dl $7F35C0 : dw $0080 : db $FF

..F3F8:
    dl $7F3640 : dw $0080 : dw $0100
    dl $7F36C0 : dw $0080 : dw $0100
    dl $7F3740 : dw $0020 : db $FF

    dl $7F3760 : dw $0080 : dw $0100
    dl $7F37E0 : dw $0080 : db $FF

;-----

.raft_hanging:
    dw ..F421, ..F42E, ..F43B, ..F448 ;todo: grouping

..F421:
    dl $7F0A00 : dw $0040 : dw $0100
    dl $7F0A40 : dw $0040 : db $FF

..F42E:
    dl $7F0A80 : dw $0040 : dw $0100
    dl $7F0AC0 : dw $0040 : db $FF

..F43B:
    dl $7F0B00 : dw $0040 : dw $0100
    dl $7F0B40 : dw $0040 : db $FF

..F448:
    dl $7F0B80 : dw $0040 : dw $0100
    dl $7F0BC0 : dw $0040 : db $FF

;-----

.F455:
    dw ..item_lance
    dw ..item_knife
    dw ..item_bowgun
    dw ..item_scythe
    dw ..item_torch
    dw ..item_axe
    dw ..item_triblade
    dw ..item_shield
    dw ..bracelet_fairy
    dw ..item_bracelet

..item_lance:
    dl $0ED9A0 : dw $0080 : db $FF

..item_knife:
    dl $0EDCA0 : dw $0040 : db $FF

..item_bowgun:
    dl $0EDAA0 : dw $0080 : db $FF

..item_scythe:
    dl $0EDB20 : dw $0080 : db $FF

..item_torch:
    dl $0EDBA0 : dw $0080 : db $FF

..item_axe:
    dl $0EDC20 : dw $0080 : db $FF

..item_triblade:
    dl $0EDA20 : dw $0080 : db $FF

..item_shield:
    dl $0EDCE0 : dw $0060 : db $FF

..bracelet_fairy:
    dl $0EDD40 : dw $0080 : db $FF

..item_bracelet:
    dl $0EDDC0 : dw $0080 : db $FF

;-----

.shield:
    dw ..F4B7, ..F4BD, ..F4C3, ..F4C9, ..F4CF, ..F4D5, ..F4DB, ..F4E1, ..F4E7

..F4B7:
    dl $0EF580 : dw $0060 : db $FF
..F4BD:
    dl $0EF5E0 : dw $00C0 : db $FF
..F4C3:
    dl $0EF6A0 : dw $00C0 : db $FF
..F4C9:
    dl $0EF760 : dw $00C0 : db $FF
..F4CF:
    dl $0EF820 : dw $0080 : db $FF
..F4D5:
    dl $0EF8A0 : dw $00A0 : db $FF
..F4DB:
    dl $0EF940 : dw $0080 : db $FF
..F4E1:
    dl $0EF9C0 : dw $0080 : db $FF
..F4E7:
    dl $0EFA40 : dw $0060 : db $FF

;-----

.trap:
    dw ..F4F1, ..F4F7

..F4F1:
    dl $0FBE20 : dw $0060 : db $FF

..F4F7:
    dl $0FBE80 : dw $0080 : db $FF

;-----

.arthur_plume:
    dw ..F517, ..F51D, ..F523, ..F529, ..F52F, ..F535, ..F53B, ..F541
    dw ..F547, ..F54D, ..F553, ..F559, ..F55F

..F517:
    dl $0EE560 : dw $0060 : db $FF
..F51D:
    dl $0EE5C0 : dw $0040 : db $FF
..F523:
    dl $0EE600 : dw $0060 : db $FF
..F529:
    dl $0EE660 : dw $0060 : db $FF
..F52F:
    dl $0EE6C0 : dw $0060 : db $FF
..F535:
    dl $0EE720 : dw $0060 : db $FF
..F53B:
    dl $0EE780 : dw $0060 : db $FF
..F541:
    dl $0EE7E0 : dw $0060 : db $FF
..F547:
    dl $0EE840 : dw $0040 : db $FF
..F54D:
    dl $0EE880 : dw $0040 : db $FF
..F553:
    dl $0EE8C0 : dw $0060 : db $FF
..F559:
    dl $0EE920 : dw $0040 : db $FF
..F55F:
    dl $0EE960 : dw $0040 : db $FF

;-----

.arthur_face:
    dw ..F569, ..F56F

..F569:
    dl $0FBD60 : dw $0020 : db $FF
..F56F:
    dl $0FBD80 : dw $0020 : db $FF ;face when shooting

;-----

.arthur_bee:
    dw ..F577

..F577:
    dl $0EEE80 : dw $01A0 : db $FF

;-----

.arthur_baby:
    dw ..walk, ..F58D, ..F593
    dw ..jump, ..F59F

..walk:
    dl $0EF020 : dw $00E0 : db $FF
..F58D:
    dl $0EF100 : dw $00E0 : db $FF
..F593:
    dl $0EF1E0 : dw $00E0 : db $FF

..jump:
    dl $0EF2C0 : dw $0140 : db $FF
..F59F:
    dl $0EF400 : dw $0180 : db $FF

;-----

.key_message: ;todo: rename. also used for other messages (ready go)
    dw ..F5A7

..F5A7:
    dl $7F9200 : dw $0600 : db $FF

;-----

.siren: ;todo: fix grouping
    dw ..F5C5, ..F5CB, ..F5D1, ..F5D7, ..F5DD, ..F5E3, ..F5E9, ..F5EF, ..F5F5, ..F5FB, ..F601, ..F607

..F5C5:
	dl $7F1500 : dw $0400 : db $FF

..F5CB:
	dl $7F1900 : dw $0400 : db $FF

..F5D1:
	dl $7F1D00 : dw $0400 : db $FF

..F5D7:
	dl $7F2100 : dw $0400 : db $FF

..F5DD:
	dl $7F2500 : dw $0400 : db $FF

..F5E3:
	dl $7F2900 : dw $0400 : db $FF

..F5E9:
	dl $7F2D00 : dw $0400 : db $FF

..F5EF:
	dl $7F3100 : dw $0400 : db $FF

..F5F5:
	dl $7F3500 : dw $0400 : db $FF

..F5FB:
	dl $7F3900 : dw $0400 : db $FF

..F601:
	dl $7F3D00 : dw $0400 : db $FF

..F607:
	dl $7F4100 : dw $00C0 : db $FF

;-----

.key:
    dw ..F60F

..F60F:
    dl $0FBDA0 : dw $0080 : db $FF

;-----

.tower_edge: ;todo: fix grouping
    dw ..F627, ..F634, ..F641, ..F64E, ..F65B, ..F668, ..F675, ..F682, ..F68F

..F627:
    dl $7F22A0 : dw $0100 : dw $0100
    dl $7F23A0 : dw $0080 : db $FF

..F634:
    dl $7F2420 : dw $0100 : dw $0100
    dl $7F2520 : dw $0080 : db $FF

..F641:
    dl $7F25A0 : dw $0100 : dw $0100
    dl $7F26A0 : dw $0080 : db $FF

..F64E:
    dl $7F2720 : dw $0100 : dw $0100
    dl $7F2820 : dw $0100 : db $FF

..F65B:
    dl $7F2920 : dw $0100 : dw $0100
    dl $7F2A20 : dw $0100 : db $FF

..F668:
    dl $7F2B20 : dw $0100 : dw $0100
    dl $7F2C20 : dw $0100 : db $FF

..F675:
    dl $7F2D20 : dw $0100 : dw $0100
    dl $7F2E20 : dw $0080 : db $FF

..F682:
    dl $7F2EA0 : dw $0100 : dw $0100
    dl $7F2FA0 : dw $0080 : db $FF

..F68F:
    dl $7F3020 : dw $0100 : dw $0100
    dl $7F3120 : dw $0080 : db $FF

;-----

.arthur_maiden:
    dw ..F6AA, ..F6B0, ..F6B6, ..F6BC, ..F6C2, ..F6C8, ..F6CE

..F6AA:
    dl $0FAE80 : dw $0140 : db $FF

..F6B0:
    dl $0FAFC0 : dw $0180 : db $FF

..F6B6:
    dl $0FB140 : dw $0120 : db $FF

..F6BC:
    dl $0FB260 : dw $0140 : db $FF

..F6C2:
    dl $0FB3A0 : dw $0100 : db $FF

..F6C8:
    dl $0FB4A0 : dw $0160 : db $FF

..F6CE:
    dl $0FB600 : dw $0160 : db $FF

;-----

.arthur_seal:
    dw ..F6E0, ..F6E6, ..F6EC, ..F6F2, ..F6F8, ..F6FE

..F6E0:
    dl $0FA760 : dw $0120 : db $FF

..F6E6:
    dl $0FA880 : dw $0140 : db $FF

..F6EC:
    dl $0FA9C0 : dw $0140 : db $FF

..F6F2:
    dl $0FAB00 : dw $0140 : db $FF

..F6F8:
    dl $0FAC40 : dw $0140 : db $FF

..F6FE:
    dl $0FAD80 : dw $0100 : db $FF

;-----

.magic:
    dw ..thunder, ..fire_dragon, ..seek, ..tornado, ..shield, ..lightning, ..nuclear, ..F776

..thunder:
    dl $0FE400 : dw $0580 : dw $F970
    dl $0FBB60 : dw $0040 : db $FF

..fire_dragon:
    dl $0FE980 : dw $0380 : dw $F970
    dl $0FBBA0 : dw $0040 : db $FF

..seek:
    dl $0FED00 : dw $0240 : dw $F970
    dl $0FBBE0 : dw $0040 : db $FF

..tornado:
    dl $0FED00 : dw $0520 : dw $F970
    dl $0FBC20 : dw $0040 : db $FF

..shield:
    dl $0FF220 : dw $0400 : dw $F970
    dl $0FBC60 : dw $0040 : db $FF

..lightning:
    dl $0FF620 : dw $0220 : dw $0120
    dl $0FE640 : dw $0340 : dw $F850
    dl $0FBCA0 : dw $0040 : db $FF

..nuclear:
    dl $0FF840 : dw $0580 : dw $F970
    dl $0FBCE0 : dw $0040 : db $FF

..F776:
    dl $1001C0 : dw $0020 : dw $F970 ;random address
    dl $0FBD20 : dw $0040 : db $FF ;4 blanked out tiles

;-----

.armor_upgrade_vfx:
    dw ..F785

..F785:
    dl $0EE9A0 : dw $04E0 : db $FF

;-----

.miniwing: ;todo: fix grouping
    dw ..F7A1, ..F7AE, ..F7BB, ..F7C8, ..F7D5, ..F7E2, ..F7EF, ..F7FC
    dw ..F809, ..F816, ..F823

..F7A1:
    dl $7F3100 : dw $0100 : dw $0100
    dl $7F3200 : dw $0100 : db $FF

..F7AE:
    dl $7F3300 : dw $0100 : dw $0100
    dl $7F3400 : dw $0100 : db $FF

..F7BB:
    dl $7F3500 : dw $0100 : dw $0100
    dl $7F3600 : dw $0100 : db $FF

..F7C8:
    dl $7F3700 : dw $0100 : dw $0100
    dl $7F3800 : dw $0100 : db $FF

..F7D5:
    dl $7F3900 : dw $0100 : dw $0100
    dl $7F3A00 : dw $0100 : db $FF

..F7E2:
    dl $7F3B00 : dw $0100 : dw $0100
    dl $7F3C00 : dw $0100 : db $FF

..F7EF:
    dl $7F3D00 : dw $0100 : dw $0100
    dl $7F3E00 : dw $0100 : db $FF

..F7FC:
    dl $7F3F00 : dw $0100 : dw $0100
    dl $7F4000 : dw $0100 : db $FF

..F809:
    dl $7F4100 : dw $0100 : dw $0100
    dl $7F4200 : dw $0100 : db $FF

..F816:
    dl $7F4300 : dw $0100 : dw $0100
    dl $7F4400 : dw $0100 : db $FF

..F823:
    dl $7F4500 : dw $0100 : dw $0100
    dl $7F4600 : dw $0100 : db $FF

;-----

.cockatrice_wings: ;todo: fix grouping
    dw ..F838, ..F845, ..F852, ..F85F

..F838:
    dl $7F0380 : dw $0980 : dw $0500
    dl $7F0D00 : dw $0180 : db $FF

..F845:
    dl $7F0E80 : dw $04C0 : dw $0300
    dl $7F1340 : dw $00C0 : db $FF

..F852:
    dl $7F1400 : dw $0900 : dw $0500
    dl $7F1D00 : dw $0100 : db $FF

..F85F:
    dl $7F1E00 : dw $05C0 : dw $0300
    dl $7F23C0 : dw $01C0 : db $FF

;-----

.cockatrice_head: ;todo: fix grouping
    dw ..F876, ..F883, ..F890, ..F89D, ..F8AA

..F876:
    dl $7F0000 : dw $01C0 : dw $0100
    dl $7F01C0 : dw $01C0 : db $FF

..F883:
    dl $7F0380 : dw $01C0 : dw $0100
    dl $7F0540 : dw $01C0 : db $FF

..F890:
    dl $7F0700 : dw $0180 : dw $0100
    dl $7F0880 : dw $0180 : db $FF

..F89D:
    dl $7F0A00 : dw $0180 : dw $0100
    dl $7F0B80 : dw $0180 : db $FF

..F8AA:
    dl $7F0D00 : dw $01C0 : dw $0100
    dl $7F0EC0 : dw $01C0 : db $FF

;-----

.cockatrice_legs: ;todo: fix grouping
    dw ..F8BD, ..F8D1, ..F8E5

..F8BD:
    dl $7F2580 : dw $0040 : dw $0100
    dl $7F25C0 : dw $0180 : dw $0120
    dl $7F2740 : dw $0140 : db $FF

..F8D1:
    dl $7F2880 : dw $0040 : dw $0100
    dl $7F28C0 : dw $0200 : dw $0120
    dl $7F2AC0 : dw $01C0 : db $FF

..F8E5:
    dl $7F2C80 : dw $0040 : dw $0100
    dl $7F2CC0 : dw $0240 : dw $0120
    dl $7F2F00 : dw $0200 : db $FF

;-----

.cockatrice_body:
    dw ..F8FB

..F8FB:
    dl $7F0000 : dw $01C0 : dw $0100
    dl $7F01C0 : dw $01C0 : db $FF

;-----

.cockatrice_neck_base:
    dw ..F90A

..F90A:
    dl $7F1080 : dw $0040 : dw $0100
    dl $7F10C0 : dw $0040 : db $FF

;-----

.F917: ;?
    dw ..F919

..F919:
    dl $000000 : dw $0800 : db $FF

;-----

.gate:
    dw ..F921

..F921:
    dl $7FF4C0 : dw $0140 : dw $0100
    dl $7FF600 : dw $0140 : db $FF

;-----

.mimic:
    dw ..F93E, ..F944, ..F94A, ..F950, ..F956, ..F95C, ..F962, ..F968 ;todo: fix grouping

..F93E:
    dl $7F0000 : dw $0120 : db $FF

..F944:
    dl $7F0120 : dw $0140 : db $FF

..F94A:
    dl $7F0260 : dw $0160 : db $FF

..F950:
    dl $7F03C0 : dw $0140 : db $FF

..F956:
    dl $7F0500 : dw $0160 : db $FF

..F95C:
    dl $7F0660 : dw $0160 : db $FF

..F962:
    dl $7F07C0 : dw $0140 : db $FF

..F968:
    dl $7F0900 : dw $0140 : db $FF

;-----

.mimic_ghost:
    dw ..F974, ..F97A, ..F980 ;todo: fix grouping

..F974:
    dl $7F0A40 : dw $00A0 : db $FF

..F97A:
    dl $7F0AE0 : dw $00A0 : db $FF

..F980:
    dl $7F0B80 : dw $00A0 : db $FF

;-----

.grilian:
    dw ..F992, ..F99F, ..F9AC
    dw ..F9B9
    dw ..F9C6, ..F9E8

..F992:
    dl $7F0000 : dw $0400, $0200
    dl $7F0400 : dw $0400 : db $FF
..F99F:
    dl $7F0000 : dw $0400, $0200
    dl $7F0800 : dw $0400 : db $FF
..F9AC:
    dl $7F0000 : dw $0400, $0200
    dl $7F0C00 : dw $0400 : db $FF

..F9B9:
    dl $7F1000 : dw $0400, $0200
    dl $7F1400 : dw $0400 : db $FF

..F9C6:
    dl $7F1800 : dw $0400, $0200
    dl $7F1C00 : dw $0100, $0080
    dl $7F0900 : dw $0100, $0080
    dl $7F1E00 : dw $0100, $0080
    dl $7F0B00 : dw $0100 : db $FF
..F9E8:
    dl $7F1D00 : dw $0100, $0080
    dl $7F2000 : dw $0100, $0080
    dl $7F1F00 : dw $0100, $0080
    dl $7F2200 : dw $0100, $0080
    dl $7F2100 : dw $0100, $0080
    dl $7F0900 : dw $0100, $0080
    dl $7F2300 : dw $0100, $0080
    dl $7F0B00 : dw $0100 : db $FF

;-----

.arremer:
    dw ..FA33, ..FA47, ..FA54, ..FA61, ..FA6E, ..FA82, ..FA8F, ..FA9C
    dw ..FAA9, ..FAB6

..FA33:
    dl $7F0000 : dw $01A0, $0100
    dl $7F01A0 : dw $0100, $0100
    dl $7F02A0 : dw $0200 : db $FF

..FA47:
    dl $7F04A0 : dw $01E0, $0100
    dl $7F0680 : dw $0100 : db $FF

..FA54:
    dl $7F0780 : dw $01C0, $0100
    dl $7F0940 : dw $0100 : db $FF

..FA61:
    dl $7F0A40 : dw $01E0, $0100
    dl $7F0C20 : dw $0140 : db $FF

..FA6E:
    dl $7F0D60 : dw $0200, $0100
    dl $7F0F60 : dw $0200, $0100
    dl $7F1160 : dw $00C0 : db $FF

..FA82:
    dl $7F1220 : dw $0200, $0100
    dl $7F1420 : dw $01E0 : db $FF

..FA8F:
    dl $7F1600 : dw $01E0, $0100
    dl $7F17E0 : dw $0140 : db $FF

..FA9C:
    dl $7F1920 : dw $0200, $0100
    dl $7F1B20 : dw $0120 : db $FF

..FAA9:
    dl $7F1C40 : dw $0200, $0100
    dl $7F1E40 : dw $0140 : db $FF

..FAB6:
    dl $7F1F80 : dw $01E0, $0100
    dl $7F2160 : dw $0100 : db $FF

;-----

.FAC3: ;?
    dw ..FACF, ..FADC, ..FAE9, ..FAF6, ..FB03, ..FB10

..FACF:
    dl $7F03E0 : dw $0200 : dw $0100
    dl $7F05E0 : dw $0200 : db $FF

..FADC:
    dl $7F07E0 : dw $0040 : dw $0100
    dl $7F0A40 : dw $0040 : db $FF

..FAE9:
    dl $7F0860 : dw $0100 : dw $0100
    dl $7F0960 : dw $0100 : db $FF

..FAF6:
    dl $7F0A60 : dw $0100 : dw $0100
    dl $7F0B60 : dw $0100 : db $FF

..FB03:
    dl $7F0C60 : dw $0100 : dw $0100
    dl $7F0D60 : dw $0100 : db $FF

..FB10:
    dl $7F0E60 : dw $0100 : dw $0100
    dl $7F0F60 : dw $0100 : db $FF

;-----

.eagler:
    dw ..FB31, ..FB45, ..FB59, ..FB6D, ..FB81, ..FB95, ..FBA9, ..FBB6
    dw ..FBCA, ..FBD7

..FB31:
    dl $7F0000 : dw $0100 : dw $0100
    dl $7F0100 : dw $0100 : dw $0100
    dl $7F0200 : dw $0100 : db $FF

..FB45:
    dl $7F0300 : dw $0100 : dw $0100
    dl $7F0400 : dw $0100 : dw $0100
    dl $7F0500 : dw $0100 : db $FF

..FB59:
    dl $7F0600 : dw $0100 : dw $0100
    dl $7F0700 : dw $0100 : dw $0100
    dl $7F0800 : dw $0100 : db $FF

..FB6D:
    dl $7F0900 : dw $0100 : dw $0100
    dl $7F0A00 : dw $0100 : dw $0100
    dl $7F0B00 : dw $0100 : db $FF

..FB81:
    dl $7F0C00 : dw $0100 : dw $0100
    dl $7F0D00 : dw $0100 : dw $0100
    dl $7F0E00 : dw $0100 : db $FF

..FB95:
    dl $7F0F00 : dw $0100 : dw $0100
    dl $7F1000 : dw $0100 : dw $0100
    dl $7F1100 : dw $0100 : db $FF

..FBA9:
    dl $7F1200 : dw $0040 : dw $0100
    dl $7F1240 : dw $0040 : db $FF

..FBB6:
    dl $7F1280 : dw $0040 : dw $0100
    dl $7F12C0 : dw $0040 : dw $0100
    dl $7F1300 : dw $0080 : db $FF

..FBCA:
    dl $7F1400 : dw $0100 : dw $0100
    dl $7F1500 : dw $0100 : db $FF

..FBD7:
    dl $7F1600 : dw $0100 : dw $0100
    dl $7F1700 : dw $0100 : dw $0100
    dl $7F1800 : dw $00A0 : db $FF

;-----

.rotating_platform:
    dw ..FBF3, ..FC07, ..FC1B, ..FC2F

..FBF3:
    dl $7F03E0 : dw $0040 : dw $0100
    dl $7F0420 : dw $0040 : dw $0100
    dl $7F0460 : dw $00A0 : db $FF
..FC07:
    dl $7F0500 : dw $0080 : dw $0100
    dl $7F0580 : dw $0080 : dw $0100
    dl $7F0600 : dw $0060 : db $FF
..FC1B:
    dl $7F0660 : dw $00C0 : dw $0100
    dl $7F0720 : dw $00C0 : dw $0100
    dl $7F07E0 : dw $00C0 : db $FF
..FC2F:
    dl $7F08A0 : dw $0100 : dw $0100
    dl $7F09A0 : dw $0100 : dw $0100
    dl $7F0AA0 : dw $0100 : db $FF

;-----

.hydra:
    dw ..FC51, ..FC5E, ..FC6B, ..FC78, ..FC85, ..FC92, ..FC9F

..FC51:
    dl $7F0000 : dw $0180 : dw $0100
    dl $7F0180 : dw $0180 : db $FF

..FC5E:
    dl $7F0300 : dw $01C0 : dw $0100
    dl $7F04C0 : dw $01C0 : db $FF

..FC6B:
    dl $7F0680 : dw $01C0 : dw $0100
    dl $7F0840 : dw $01C0 : db $FF

..FC78:
    dl $7F0A00 : dw $0180 : dw $0100
    dl $7F0B80 : dw $0180 : db $FF

..FC85:
    dl $7F0D00 : dw $01C0 : dw $0100
    dl $7F0EC0 : dw $01C0 : db $FF

..FC92:
    dl $7F1080 : dw $01C0 : dw $0100
    dl $7F1240 : dw $01C0 : db $FF

..FC9F:
    dl $7F1400 : dw $01C0 : dw $0100
    dl $7F15C0 : dw $01C0 : db $FF

;-----

.FCAC: ;?
    dw ..FCAE

..FCAE:
    dl $7F3940 : dw $0040 : dw $0100
    dl $7F3B80 : dw $0040 : dw $0100
    dl $7F3DC0 : dw $0040 : dw $0100
    dl $7F4000 : dw $0040 : dw $0100
    dl $7F4240 : dw $0040 : dw $0100
    dl $7F4480 : dw $0040 : dw $0100
    dl $7F4500 : dw $1400 : db $FF

;-----

.gate2:
    dw ..FCE0

..FCE0:
    dl $7FA000 : dw $00C0 : dw $0100
    dl $7FA0C0 : dw $00C0 : db $FF

;-----

.FCED: ;?
    dw ..FCEF

..FCEF:
    dl $7F2D00 : dw $0800 : db $FF

;-----

.FCF5: ;?
    dw ..FD07, ..FD14, ..FD21, ..FD2E, ..FD3B, ..FD48, ..FD55, ..FD62, ..FD6F

..FD07:
    dl $7F2D00 : dw $0180 : dw $0100
    dl $7F2E80 : dw $0180 : db $FF

..FD14:
    dl $7F3000 : dw $0100 : dw $0100
    dl $7F3100 : dw $0100 : db $FF

..FD21:
    dl $7F3200 : dw $0180 : dw $0100
    dl $7F3380 : dw $0180 : db $FF

..FD2E:
    dl $7F3500 : dw $0180 : dw $0100
    dl $7F3680 : dw $0180 : db $FF

..FD3B:
    dl $7F3800 : dw $0100 : dw $0100
    dl $7F3900 : dw $0100 : db $FF

..FD48:
    dl $7F3A00 : dw $0100 : dw $0100
    dl $7F3B00 : dw $0100 : db $FF

..FD55:
    dl $7F3C00 : dw $0100 : dw $0100
    dl $7F3D00 : dw $0100 : db $FF

..FD62:
    dl $7F3E00 : dw $0100 : dw $0100
    dl $7F3F00 : dw $0100 : db $FF

..FD6F:
    dl $7F4000 : dw $00C0 : dw $0100
    dl $7F40C0 : dw $00C0 : db $FF

;-----

.FD7C: ;?
    dw ..FD80, ..FD8D

..FD80: ;broken data
    dl $158000 : dw $1400 : dw $0100
    dl $159400 : dw $00E0 : db $FF

..FD8D:
    dl $1594E0 : dw $0120
    dl $159600 : dw $0120 : db $FF

;-----

.FD98: ;?
    dw ..FD9A

..FD9A:
    dl $7F22A0 : dw $0800 : db $FF

;-----

.tiny_goblin:
    dw ..FDAC, ..FDB2, ..FDB8, ..FDBE, ..FDC4, ..FDCA

..FDAC:
    dl $7F35A0 : dw $0180 : db $FF

..FDB2:
    dl $7F3720 : dw $0180 : db $FF

..FDB8:
    dl $7F38A0 : dw $0180 : db $FF

..FDBE:
    dl $7F3A20 : dw $0180 : db $FF

..FDC4:
    dl $7F3BA0 : dw $0200 : db $FF

..FDCA:
    dl $7F3DA0 : dw $0100 : db $FF

;-----

.astaroth:

    dw ..FDD8, ..FDFA, ..FE1C, ..FE3E

..FDD8:
    dl $7F0000 : dw $0180 : dw $00C0
    dl $7F1680 : dw $0080 : dw $0040
    dl $7F0180 : dw $0180 : dw $00C0
    dl $7F1700 : dw $0240 : dw $0140
    dl $7F1940 : dw $01C0 : db $FF

..FDFA:
    dl $7F0300 : dw $0180 : dw $00C0
    dl $7F1200 : dw $0080 : dw $0040
    dl $7F0480 : dw $0180 : dw $00C0
    dl $7F1280 : dw $0240 : dw $0140
    dl $7F14C0 : dw $01C0 : db $FF

..FE1C:
    dl $7F0300 : dw $0180 : dw $00C0
    dl $7F0D80 : dw $0080 : dw $0040
    dl $7F0480 : dw $0180 : dw $00C0
    dl $7F0E00 : dw $0240 : dw $0140
    dl $7F1040 : dw $01C0 : db $FF

..FE3E:
    dl $7F0600 : dw $0180 : dw $00C0
    dl $7F0D80 : dw $0080 : dw $0040
    dl $7F0780 : dw $0180 : dw $00C0
    dl $7F0E00 : dw $0240 : dw $0140
    dl $7F0BC0 : dw $01C0 : db $FF

;-----

.nebiroth:
    dw ..FE68, ..FE8A, ..FEAC, ..FECE

..FE68:
    dl $7F0000 : dw $0180 : dw $00C0
    dl $7F1680 : dw $0080 : dw $0040
    dl $7F0180 : dw $0180 : dw $00C0
    dl $7F1700 : dw $0240 : dw $0140
    dl $7F1940 : dw $01C0 : db $FF

..FE8A:
    dl $7F0300 : dw $0180 : dw $00C0
    dl $7F1200 : dw $0080 : dw $0040
    dl $7F0480 : dw $0180 : dw $00C0
    dl $7F1280 : dw $0240 : dw $0140
    dl $7F14C0 : dw $01C0 : db $FF

..FEAC:
    dl $7F0300 : dw $0180 : dw $00C0
    dl $7F0D80 : dw $0080 : dw $0040
    dl $7F0480 : dw $0180 : dw $00C0
    dl $7F0E00 : dw $0240 : dw $0140
    dl $7F1040 : dw $01C0 : db $FF

..FECE:
    dl $7F0600 : dw $0180 : dw $00C0
    dl $7F0D80 : dw $0080 : dw $0040
    dl $7F0780 : dw $0180 : dw $00C0
    dl $7F0E00 : dw $0240 : dw $0140
    dl $7F0BC0 : dw $01C0 : db $FF

;-----

.nebiroth_flame_laser:
    dw ..FEF2

..FEF2:
    dl $7F1B00 : dw $0800 : db $FF

;-----

.veil_allocen_claws:
    dw ..FF00, ..FF0D, ..FF1A, ..FF27

..FF00:
    dl $7F1F40 : dw $0180 : dw $0100
    dl $7F20C0 : dw $0180 : db $FF

..FF0D:
    dl $7F2240 : dw $0180 : dw $0100
    dl $7F23C0 : dw $0180 : db $FF

..FF1A:
    dl $7F2540 : dw $0180 : dw $0100
    dl $7F26C0 : dw $0180 : db $FF

..FF27:
    dl $7F2840 : dw $0140 : dw $0100
    dl $7F2980 : dw $0140 : db $FF

;-----

.veil_allocen_projectile:
    dw ..FF36

..FF36:
    dl $7F1800 : dw $0740 : db $FF

;-----

.princess_dialogue:
    dw ..FF3E

..FF3E:
    dl $7F0100 : dw $0800 : db $FF
}
