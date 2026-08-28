org $108000

;banks 10-1D all contain graphics / tilemaps

check bankcross off

if !version == !JP
    gfx_stage_1_tiles:   incbin "graphics/stage_1_tiles.bin"
    gfx_stage_1_tiles_2: incbin "graphics/stage_1_tiles_2.bin"
elseif !version == !US || !version == !EU
    gfx_stage_1_tiles:   incbin "graphics/stage_1_tiles_us.bin"
    gfx_stage_1_tiles_2: incbin "graphics/stage_1_tiles_2_us.bin"
endif
    gfx_stage_2_tiles:   incbin "graphics/stage_2_tiles.bin"
    gfx_stage_2_tiles_2: incbin "graphics/stage_2_tiles_2.bin"
    gfx_unk18:           incbin "graphics/unknown18.bin"
if !version == !JP
    gfx_logo:            incbin "graphics/logo.bin" ;also has other stuff in it
elseif !version == !US || !version == !EU
    gfx_logo:            incbin "graphics/logo_us.bin"
endif
    gfx_map:             incbin "graphics/map.bin"
    gfx_unk19:           incbin "graphics/unknown19.bin"
    gfx_stage_4c_tiles:  incbin "graphics/stage_4c_tiles.bin"
    gfx_stage_4a_tiles:  incbin "graphics/stage_4a_tiles.bin"
    tilemap_map:         incbin "graphics/tilemap_map.bin"
                         incbin "graphics/unknown38.bin"
    gfx_unk27:           incbin "graphics/unknown27.bin"
    gfx_continue:        incbin "graphics/continue.bin"
    gfx_continue2:       incbin "graphics/continue2.bin"
    gfx_stage_5_tiles:   incbin "graphics/stage_5_tiles.bin"
    gfx_stage_5_tiles_2: incbin "graphics/stage_5_tiles_2.bin" ;also contains a tilemap in the middle, consider splitting
    gfx_options:         incbin "graphics/options.bin"
    tilemap_options:     incbin "graphics/tilemap_options.bin"
                         incbin "graphics/unknown39.bin" ;temp / debug gfx
    gfx_unk35:           incbin "graphics/unknown35.bin"
    gfx_unk34:           incbin "graphics/unknown34.bin"
    gfx_unk31:           incbin "graphics/unknown31.bin"
    gfx_death_crawler:   incbin "graphics/death_crawler.bin"
    gfx_unk21:           incbin "graphics/unknown21.bin" ;related to death crawler, tile map or really graphics?
    gfx_unk24:           incbin "graphics/unknown24.bin" ;stage 4a tilemap?
    gfx_unk05:           incbin "graphics/unknown05.bin" ;graphics + tilemaps?
    gfx_intro_castle:    incbin "graphics/game_start_cutscene_castle.bin"
    tilemap_game_start_broken_window: incbin "graphics/tilemap_game_start_broken_window.bin"

if !version == !JP
{ ;BBE6 - BC47
    incbin "fill_bytes/jp/bank18a.bin" ;leftover copies of above data?
}

{ ;BC48 - BFFF
    ;compressed data? had problems decompressing it
    incbin "fill_bytes/jp/bank18b.bin"
}
elseif !version == !US || !version == !EU
    incbin "fill_bytes/eng/bank18a.bin"
endif

if !version == !JP
    gfx_stage1_objects: incbin "graphics/stage1_objects.bin"
elseif !version == !US || !version == !EU
    gfx_stage1_objects: incbin "graphics/stage1_objects_us.bin"
endif

    gfx_stage2_objects:    incbin "graphics/stage2_objects.bin"
    gfx_stage3_objects:    incbin "graphics/stage3_objects.bin"
    gfx_stage_4_objects:   incbin "graphics/stage_4_objects.bin"
    gfx_geyser_platform:   incbin "graphics/geyser_platform.bin"
    gfx_hydra:             incbin "graphics/hydra.bin"
    gfx_stage5_objects:    incbin "graphics/stage5_objects.bin"
    gfx_eagler_tail:       incbin "graphics/eagler_tail.bin"
    gfx_princess_dialogue: incbin "graphics/princess_dialogue.bin" ;contains unused projectile as well?
    gfx_samael:            incbin "graphics/samael.bin"
    gfx_cockatrice_head:   incbin "graphics/cockatrice_head.bin"
    gfx_skull_flower:      incbin "graphics/skull_flower.bin"
    gfx_wolf:              incbin "graphics/wolf.bin"
    gfx_grilian:           incbin "graphics/grilian.bin"
    gfx_arremer:           incbin "graphics/arremer.bin"
    gfx_killer:            incbin "graphics/killer.bin"
    gfx_eagler:            incbin "graphics/eagler.bin"
    gfx_ghost:             incbin "graphics/ghost.bin"
    gfx_mimic:             incbin "graphics/mimic.bin"
    gfx_boss_explosion:    incbin "graphics/boss_explosion.bin"
    gfx_cockatrice:        incbin "graphics/cockatrice.bin"
    gfx_items_enemy_hits:  incbin "graphics/items_enemy_hits.bin"
    gfx_game_over:         incbin "graphics/game_over.bin"
    gfx_capcom:            incbin "graphics/capcom_presents.bin"
    gfx_font_hud:          incbin "graphics/font_hud.bin" ;font etc?
    gfx_astaroth:          incbin "graphics/astaroth.bin"
    gfx_nebiroth:          incbin "graphics/nebiroth.bin"
    gfx_unk13:             incbin "graphics/unknown13.bin" ;intro stuff, but also 2bpp graphics! sort out later
    gfx_veil_allocen:      incbin "graphics/veil_allocen.bin"
    gfx_rosebud:           incbin "graphics/rosebud.bin"

if !version == !JP
{ ;F642 - FFFF
    ;not sure if this is compressed data, i wasn't able to decompress/recompress it properly
    incbin "fill_bytes/jp/bank1Da.bin" ;unused data
}
elseif !version == !US || !version == !EU
    gfx_us_font_extra: incbin "graphics/us_font_extra.bin" ;question mark, apostrophe, opening and closing quotation marks
    incbin "fill_bytes/eng/bank1Da.bin"
endif

check bankcross full
