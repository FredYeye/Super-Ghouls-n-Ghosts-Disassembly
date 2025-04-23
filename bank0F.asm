org $0F8000

incbin "graphics/arthur_upgraded_armor.bin"
incbin "graphics/arthur_seal.bin"
incbin "graphics/arthur_maiden.bin"
incbin "graphics/hud_lance.bin"
incbin "graphics/hud_knife.bin"
incbin "graphics/hud_knife2.bin"
incbin "graphics/hud_bowgun.bin"
incbin "graphics/hud_scythe.bin"
incbin "graphics/hud_scythe2.bin"
incbin "graphics/hud_torch.bin"
incbin "graphics/hud_torch2.bin"
incbin "graphics/hud_axe.bin"
incbin "graphics/hud_axe2.bin"
incbin "graphics/hud_triblade.bin"
incbin "graphics/hud_triblade2.bin"
incbin "graphics/hud_bracelet.bin"
incbin "graphics/pu07.bin" ;the characters P, U, 0, 7
incbin "graphics/hud_thunder.bin"
incbin "graphics/hud_fire_dragon.bin"
incbin "graphics/hud_seek.bin"
incbin "graphics/hud_tornado.bin"
incbin "graphics/hud_shield.bin"
incbin "graphics/hud_lightning.bin"
incbin "graphics/hud_nuclear.bin"

fillbyte $FF : fill 64

incbin "graphics/arthur_face.bin"
incbin "graphics/key.bin"
incbin "graphics/trap.bin"
incbin "graphics/weapon_lance.bin"
incbin "graphics/weapon_knife.bin"
incbin "graphics/weapon_bowgun.bin"
incbin "graphics/weapon_bowgun2.bin"
incbin "graphics/weapon_scythe_slash.bin"
incbin "graphics/weapon_scythe.bin"
incbin "graphics/weapon_scythe2.bin"
incbin "graphics/weapon_scythe2_trail.bin"
incbin "graphics/weapon_torch2.bin"
incbin "graphics/weapon_torch.bin"
incbin "graphics/weapon_axe.bin"
incbin "graphics/weapon_triblade.bin"
incbin "graphics/weapon_triblade2.bin"
incbin "graphics/magic_thunder.bin" ;todo: maybe split out arthur casting sprite? also used in lightning
incbin "graphics/magic_fire_dragon.bin"
incbin "graphics/magic_tornado.bin"
incbin "graphics/magic_shield.bin"
incbin "graphics/magic_lightning.bin"
incbin "graphics/magic_nuclear.bin"

{ ;FDC0 - FFFF
if !version == 0
    fillbyte $FF : fill 576
elseif !version == 1
    incbin "us_fill_bytes/bank0Fa.bin"
endif
}
