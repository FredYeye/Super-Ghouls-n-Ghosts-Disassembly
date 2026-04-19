{ ;music / sfx IDs
    !mus_stage_1                   = $01
    !mus_stage_2                   = $02
    !mus_stage_5                   = $03 ;stage 3 & 5 were swapped during development. the music still has the old order
    !mus_stage_4                   = $04
    !mus_stage_3                   = $05
    !mus_stage_6_7                 = $06
    !mus_samael                    = $08
    !mus_stage_1_boss              = $09
    !mus_stage_2_boss              = $0A
    !mus_stage_5_boss              = $0B ;oversight: used in stage 3
    !mus_stage_4_boss              = $0C
    !mus_stage_3_boss              = $0D ;oversight: used in stage 5
    !mus_stage_6_7_boss            = $0E
    !mus_defeat_boss               = $10
    !mus_game_over                 = $11
    !mus_map                       = $12
    !mus_continue                  = $13
    !mus_talk_princess             = $14
    !mus_intro                     = $15
    !mus_ending                    = $16

    !sfx_lance                     = $20
    !sfx_knife                     = $22
    !sfx_scythe                    = $23
    !sfx_lance2                    = $27
    !sfx_laser                     = $29 ;knife2, knife2_shimmer, magician_orb, samael_laser
    !sfx_jump                      = $2B
    !sfx_land                      = $2C
    !sfx_armor_1                   = $2D
    !sfx_armor_2                   = $2E
    !sfx_armor_shatter             = $2F
    !sfx_arthur_death              = $31
    !sfx_wave_rise                 = $32
    !sfx_wave_crash                = $33
    !sfx_pause                     = $36
    !sfx_menu_move                 = $37
    !sfx_hit                       = $38
    !sfx_impact                    = $39
    !sfx_bracelet                  = $3A
    !sfx_death                     = $3B
    !sfx_raft_pulley               = $3D
    !sfx_vortex                    = $3E
    !sfx_ghost_spawn               = $3F
    !sfx_guillotine                = $40
    !sfx_ice                       = $43
    !sfx_bars                      = $44
    !sfx_grow                      = $45
    !sfx_flying_knight             = $46
    !sfx_shatter                   = $47
    !sfx_gate_open                 = $48
    !sfx_rosebud_grow              = $49
    !sfx_ship_creak                = $4A
    !sfx_fireworks                 = $4B
    !sfx_cockatrice_spew           = $4C
    !sfx_skulls                    = $4D
    !sfx_rosebud_explode           = $4E
    !sfx_ghost_destroy             = $4F
    !sfx_mimic_shake               = $50
    !sfx_mimic_jump                = $51
    !sfx_magic_charge              = $52
    !sfx_magic_thunder_fire_dragon = $53
    !sfx_magic_seek                = $54
    !sfx_magic_tornado             = $55
    !sfx_magic_shield              = $56
    !sfx_magic_lightning           = $57
    !sfx_astaroth_nebiroth_laser   = $58
    !sfx_transform                 = $5A
    !sfx_rotation                  = $5B
    !sfx_rotation_end              = $5C
    !sfx_lightning                 = $5D
    !sfx_axe2_triblade2            = $5F
    !sfx_1up                       = $61
    !sfx_capcom_logo               = $62
    !sfx_death_crawler_spin        = $64
    !sfx_hydra_transform           = $65
}

{ ;sound commands
    macro toggle_triplet()
        db $00
    endmacro

    macro toggle_portamento()
        db $01
    endmacro

    macro set_dotted_note()
        db $02
    endmacro

    macro toggle_2_octaves_up()
        db $03
    endmacro

    macro toggle_triplet_portamento_2_octave_up(value)
        db $04, <value>
    endmacro

    macro tempo(value) ;bpm = value * 60098813 / (8000 * 48 * 512), supposedly
        db $05 : dw be(<value>)
    endmacro

    macro duration(value)
        db $06, <value>
    endmacro

    macro volume(value)
        db $07, <value>
    endmacro

    macro instrument(value)
        db $08, <value>
    endmacro

    macro octave(value)
        db $09, <value>
    endmacro

    macro global_transpose(value)
        db $0A, <value>
    endmacro

    macro per_voice_transpose(value)
        db $0B, <value>
    endmacro

    macro tuning(value)
        db $0C, <value>
    endmacro

    macro portamento_time(value)
        db $0D, <value>
    endmacro

    macro loop(n, count, offset)
        db $0E+<n>, <count> : dw be(<offset>)
    endmacro

    macro loop_break(n, count, offset)
        db $12+<n>, <count> : dw be(<offset>)
    endmacro

    macro goto(value)
        db $16 : dw be(<value>)
    endmacro

    macro end_track()
        db $17
    endmacro

    macro pan(value)
        db $18, <value>
    endmacro

    macro master_volume(value)
        db $19, <value>
    endmacro

    macro lfo(type, value)
        db $1A, <type>, <value>
    endmacro

    macro release(value)
        db $1D, <value>
    endmacro

    macro unk1E()
        db $1E
    endmacro

    macro note(note, duration)
        db (<note>&$1F)|((<duration>)<<5)
    endmacro
}
