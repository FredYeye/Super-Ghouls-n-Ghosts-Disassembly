org $0F8000

arthur_sprites_upgraded_armor:

.idle:                incbin "graphics/arthur_upgraded_armor.bin":(000*32)..(014*32)
.walk_1:              incbin "graphics/arthur_upgraded_armor.bin":(014*32)..(027*32)
.walk_2:              incbin "graphics/arthur_upgraded_armor.bin":(027*32)..(043*32)
.walk_3:              incbin "graphics/arthur_upgraded_armor.bin":(043*32)..(057*32)
.walk_4:              incbin "graphics/arthur_upgraded_armor.bin":(057*32)..(069*32)
.walk_5:              incbin "graphics/arthur_upgraded_armor.bin":(069*32)..(083*32)
.walk_6:              incbin "graphics/arthur_upgraded_armor.bin":(083*32)..(098*32)
.jump_neutral:        incbin "graphics/arthur_upgraded_armor.bin":(098*32)..(113*32)
.jump_forward:        incbin "graphics/arthur_upgraded_armor.bin":(113*32)..(128*32)
.crouch:              incbin "graphics/arthur_upgraded_armor.bin":(128*32)..(136*32)
.shot_1:              incbin "graphics/arthur_upgraded_armor.bin":(136*32)..(151*32)
.shot_2:              incbin "graphics/arthur_upgraded_armor.bin":(151*32)..(166*32)
.crouch_shot_1:       incbin "graphics/arthur_upgraded_armor.bin":(166*32)..(176*32)
.crouch_shot_2:       incbin "graphics/arthur_upgraded_armor.bin":(176*32)..(186*32)
.ladder_1:            incbin "graphics/arthur_upgraded_armor.bin":(186*32)..(200*32)
.ladder_2:            incbin "graphics/arthur_upgraded_armor.bin":(200*32)..(214*32)
.butt_frame_1:        incbin "graphics/arthur_upgraded_armor.bin":(214*32)..(224*32)
.butt_frame_2:        incbin "graphics/arthur_upgraded_armor.bin":(224*32)..(234*32)
.victory_pose:        incbin "graphics/arthur_upgraded_armor.bin":(234*32)..(248*32)
.double_jump_neutral: incbin "graphics/arthur_upgraded_armor.bin":(248*32)..(264*32)
.double_jump_forward: incbin "graphics/arthur_upgraded_armor.bin":(264*32)..(279*32)
.double_jump_crouch:  incbin "graphics/arthur_upgraded_armor.bin":(279*32)..(289*32)
.get_armor_1:         incbin "graphics/arthur_upgraded_armor.bin":(289*32)..(302*32)
.get_armor_2:         incbin "graphics/arthur_upgraded_armor.bin":(302*32)..(315*32)

                       incbin "graphics/arthur_seal.bin"
                       incbin "graphics/arthur_maiden.bin"
gfx_hud_lance:         incbin "graphics/hud_lance.bin"
gfx_hud_knife:         incbin "graphics/hud_knife.bin"
gfx_hud_knife2:        incbin "graphics/hud_knife2.bin"
gfx_hud_bowgun:        incbin "graphics/hud_bowgun.bin"
gfx_hud_scythe:        incbin "graphics/hud_scythe.bin"
gfx_hud_scythe2:       incbin "graphics/hud_scythe2.bin"
gfx_hud_torch:         incbin "graphics/hud_torch.bin"
gfx_hud_torch2:        incbin "graphics/hud_torch2.bin"
gfx_hud_axe:           incbin "graphics/hud_axe.bin"
gfx_hud_axe2:          incbin "graphics/hud_axe2.bin"
gfx_hud_triblade:      incbin "graphics/hud_triblade.bin"
gfx_hud_triblade2:     incbin "graphics/hud_triblade2.bin"
gfx_hud_bracelet:      incbin "graphics/hud_bracelet.bin"
                       incbin "graphics/pu07.bin" ;the characters P, U, 0, 7
gfx_hud_thunder:       incbin "graphics/hud_thunder.bin"
gfx_hud_fire_dragon:   incbin "graphics/hud_fire_dragon.bin"
gfx_hud_seek:          incbin "graphics/hud_seek.bin"
gfx_hud_tornado:       incbin "graphics/hud_tornado.bin"
gfx_hud_shield:        incbin "graphics/hud_shield.bin"
gfx_hud_lightning:     incbin "graphics/hud_lightning.bin"
gfx_hud_nuclear:       incbin "graphics/hud_nuclear.bin"
                       fillbyte $FF : fill 64
gfx_arthur_face_1:     incbin "graphics/arthur_face.bin":(000*32)..(001*32)
gfx_arthur_face_2:     incbin "graphics/arthur_face.bin":(001*32)..(002*32)
gfx_key:               incbin "graphics/key.bin"
gfx_trap_1:            incbin "graphics/trap.bin":(000*32)..(003*32)
gfx_trap_2:            incbin "graphics/trap.bin":(003*32)..(007*32)
gfx_lance:             incbin "graphics/weapon_lance.bin"
gfx_knife:             incbin "graphics/weapon_knife.bin"
gfx_bowgun:            incbin "graphics/weapon_bowgun.bin"
gfx_bowgun2:           incbin "graphics/weapon_bowgun2.bin"
gfx_scythe_slash:      incbin "graphics/weapon_scythe_slash.bin"
gfx_scythe:            incbin "graphics/weapon_scythe.bin"
gfx_scythe2:           incbin "graphics/weapon_scythe2.bin"
gfx_scythe2_trail:     incbin "graphics/weapon_scythe2_trail.bin"
gfx_torch2:            incbin "graphics/weapon_torch2.bin"
gfx_torch:             incbin "graphics/weapon_torch.bin"
gfx_axe:               incbin "graphics/weapon_axe.bin"
gfx_triblade:          incbin "graphics/weapon_triblade.bin"
gfx_triblade2:         incbin "graphics/weapon_triblade2.bin"
gfx_magic_thunder:     incbin "graphics/magic_thunder.bin":(000*32)..(018*32)
gfx_magic_arthur_pose: incbin "graphics/magic_thunder.bin":(018*32)..(044*32)
gfx_fire_dragon:       incbin "graphics/magic_fire_dragon.bin"
gfx_magic_seek:        ;blank
gfx_magic_tornado:     incbin "graphics/magic_tornado.bin"
gfx_magic_shield:      incbin "graphics/magic_shield.bin"
gfx_magic_lightning:   incbin "graphics/magic_lightning.bin"
gfx_magic_nuclear:     incbin "graphics/magic_nuclear.bin"

{ ;FDC0 - FFFF
if !version == 0
    fillbyte $FF : fill 576
elseif !version == 1 || !version == 2
    incbin "fill_bytes/eng/bank0Fa.bin"
endif
}
