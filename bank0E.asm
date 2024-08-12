org $0E8000

{ ;8000 -
arthur_sprites:

;----------------------------------------
.steel:
;----------------------------------------

..idle:
	incbin "graphics/arthur_steel_armor.bin":(000*32)..(014*32)
..walk_1:
	incbin "graphics/arthur_steel_armor.bin":(014*32)..(027*32)
..walk_2:
	incbin "graphics/arthur_steel_armor.bin":(027*32)..(043*32)
..walk_3:
	incbin "graphics/arthur_steel_armor.bin":(043*32)..(057*32)
..walk_4:
	incbin "graphics/arthur_steel_armor.bin":(057*32)..(069*32)
..walk_5:
	incbin "graphics/arthur_steel_armor.bin":(069*32)..(083*32)
..walk_6:
	incbin "graphics/arthur_steel_armor.bin":(083*32)..(098*32)
..jump_neutral:
	incbin "graphics/arthur_steel_armor.bin":(098*32)..(113*32)
..jump_forward:
	incbin "graphics/arthur_steel_armor.bin":(113*32)..(128*32)
..crouch:
	incbin "graphics/arthur_steel_armor.bin":(128*32)..(136*32)
..shot_1:
	incbin "graphics/arthur_steel_armor.bin":(136*32)..(151*32)
..shot_2:
	incbin "graphics/arthur_steel_armor.bin":(151*32)..(166*32)
..crouch_shot_1:
	incbin "graphics/arthur_steel_armor.bin":(166*32)..(176*32)
..crouch_shot_2:
	incbin "graphics/arthur_steel_armor.bin":(176*32)..(186*32)
..ladder_1:
	incbin "graphics/arthur_steel_armor.bin":(186*32)..(200*32)
..ladder_2:
	incbin "graphics/arthur_steel_armor.bin":(200*32)..(214*32)
..butt_frame_1:
	incbin "graphics/arthur_steel_armor.bin":(214*32)..(224*32)
..butt_frame_2:
	incbin "graphics/arthur_steel_armor.bin":(224*32)..(234*32)
..victory_pose:
	incbin "graphics/arthur_steel_armor.bin":(234*32)..(248*32)
..double_jump_neutral:
	incbin "graphics/arthur_steel_armor.bin":(248*32)..(264*32)
..double_jump_forward:
	incbin "graphics/arthur_steel_armor.bin":(264*32)..(279*32)
..double_jump_crouch:
	incbin "graphics/arthur_steel_armor.bin":(279*32)..(289*32)
..double_jump_flip_1:
	incbin "graphics/arthur_steel_armor.bin":(289*32)..(297*32)
..double_jump_flip_2:
	incbin "graphics/arthur_steel_armor.bin":(297*32)..(307*32)
..double_jump_flip_3: ;unused
	incbin "graphics/arthur_steel_armor.bin":(307*32)..(317*32)

;----------------------------------------
.underwear:
;----------------------------------------

..idle:
	incbin "graphics/arthur_underwear.bin":(000*32)..(014*32)
..walk_1:
	incbin "graphics/arthur_underwear.bin":(014*32)..(027*32)
..walk_2:
	incbin "graphics/arthur_underwear.bin":(027*32)..(043*32)
..walk_3:
	incbin "graphics/arthur_underwear.bin":(043*32)..(057*32)
..walk_4:
	incbin "graphics/arthur_underwear.bin":(057*32)..(069*32)
..walk_5:
	incbin "graphics/arthur_underwear.bin":(069*32)..(083*32)
..walk_6:
	incbin "graphics/arthur_underwear.bin":(083*32)..(098*32)
..jump_neutral:
	incbin "graphics/arthur_underwear.bin":(098*32)..(113*32)
..jump_forward:
	incbin "graphics/arthur_underwear.bin":(113*32)..(128*32)
..crouch:
	incbin "graphics/arthur_underwear.bin":(128*32)..(136*32)
..shot_1:
	incbin "graphics/arthur_underwear.bin":(136*32)..(151*32)
..shot_2:
	incbin "graphics/arthur_underwear.bin":(151*32)..(166*32)
..crouch_shot_1:
	incbin "graphics/arthur_underwear.bin":(166*32)..(176*32)
..crouch_shot_2:
	incbin "graphics/arthur_underwear.bin":(176*32)..(186*32)
..ladder_1:
	incbin "graphics/arthur_underwear.bin":(186*32)..(200*32)
..ladder_2:
	incbin "graphics/arthur_underwear.bin":(200*32)..(214*32)
..butt_frame_1:
	incbin "graphics/arthur_underwear.bin":(214*32)..(224*32)
..butt_frame_2:
	incbin "graphics/arthur_underwear.bin":(224*32)..(234*32)
..knockback:
	incbin "graphics/arthur_underwear.bin":(234*32)..(248*32)
..double_jump_neutral:
	incbin "graphics/arthur_underwear.bin":(248*32)..(264*32)
..double_jump_forward:
	incbin "graphics/arthur_underwear.bin":(264*32)..(279*32)
..double_jump_crouch:
	incbin "graphics/arthur_underwear.bin":(279*32)..(289*32)
..double_jump_flip_1:
	incbin "graphics/arthur_underwear.bin":(289*32)..(297*32)
..double_jump_flip_2:
	incbin "graphics/arthur_underwear.bin":(297*32)..(307*32)
..double_jump_flip_3: ;unused
	incbin "graphics/arthur_underwear.bin":(307*32)..(317*32)

;----------------------------------------
.bones:
;----------------------------------------

..knockback:
	incbin "graphics/arthur_bones.bin":(000*32)..(012*32)
..falling_1:
	incbin "graphics/arthur_bones.bin":(012*32)..(028*32)
..falling_2:
	incbin "graphics/arthur_bones.bin":(028*32)..(041*32)
..pile_1:
	incbin "graphics/arthur_bones.bin":(041*32)..(049*32)
..pile_2:
	incbin "graphics/arthur_bones.bin":(049*32)..(054*32)
}

incbin "graphics/weapon_bracelet.bin"
incbin "graphics/item_lance.bin"
incbin "graphics/item_triblade.bin"
incbin "graphics/item_bowgun.bin"
incbin "graphics/item_scythe.bin"
incbin "graphics/item_torch.bin"
incbin "graphics/item_axe.bin"
incbin "graphics/item_knife.bin"
incbin "graphics/item_shield.bin"
incbin "graphics/bracelet_fairy.bin"
incbin "graphics/item_bracelet.bin"
incbin "graphics/magician.bin"
incbin "graphics/plume.bin"
incbin "graphics/armor_up_charge_vfx.bin"
incbin "graphics/arthur_bee.bin"
incbin "graphics/arthur_baby.bin"
incbin "graphics/shield.bin"
incbin "graphics/placeholder.bin"
incbin "graphics/item_armor_steel.bin"
incbin "graphics/item_armor_gold.bin"
incbin "graphics/item_armor_bronze.bin"

fillbyte $FF : fill 320
