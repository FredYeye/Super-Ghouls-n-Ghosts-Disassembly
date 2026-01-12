    asar 1.90

    lorom

{ ;rom version to assemble
    ;todo: create defines for regions
    ;0 = JP
    ;1 = US
    ;2 = EU
    !version = 0
}

{ ;asar functions
    ;general use: calculate distance from label A to B
    function offset(a, b) = b-a

    ;specific use: bank 3, screen list data format
    function screen(index) = (index^$8000)>>7

    ;specific use: bank 6, big endian labels
    function be(label) = (label>>8)|(label<<8)

    ;specific use: bank 5 & 8, offset to metasprite x/y positions | mode(0-2, 3 is an error)
    function meta(offset, mode) = (mode<<14)|(offset&$3FFF)
}

incsrc "snes_defines.asm"
incsrc "ram_map.asm"
incsrc "object_defines.asm"

{ ;weapon IDs
    !weapon_lance    = $00
    !weapon_knife    = $02
    !weapon_bowgun   = $04
    !weapon_scythe   = $06
    !weapon_torch    = $08
    !weapon_axe      = $0A
    !weapon_triblade = $0C ;JP name: cross sword. todo: rename? most things are based on the jp names...
    !weapon_bracelet = $0E
}

{ ;magic IDs
    !magic_thunder     = 0
    !magic_fire_dragon = 1
    !magic_seek        = 2
    !magic_shield      = 3
    !magic_lightning   = 4
    !magic_tornado     = 5
    !magic_nuclear     = 6
}

{ ;armor states
    !arthur_state_underwear = $00
    !arthur_state_steel     = $01
    ; $02 is unused
    !arthur_state_bronze    = $03
    !arthur_state_gold      = $04
    !arthur_state_baby      = $05
    !arthur_state_seal      = $06
    !arthur_state_bee       = $07
    !arthur_state_maiden    = $08

    !arthur_state_transformed = $05
}

{ ;music / sfx IDs
    !mus_stage_1_boss       = $09
    !mus_stage_2_boss       = $0A
    !mus_stage_3_boss       = $0B
    !mus_stage_6_7_boss     = $0E
    !mus_defeat_boss        = $10
    !sfx_lance              = $20
    !sfx_knife              = $22
    !sfx_lance2             = $27
    !sfx_jump               = $2B
    !sfx_land               = $2C
    !sfx_armor_1            = $2D
    !sfx_armor_2            = $2E
    !sfx_armor_shatter      = $2F
    !sfx_arthur_death       = $31
    !sfx_wave_rise          = $32
    !sfx_wave_crash         = $33
    !sfx_pause              = $36
    !sfx_hit                = $38
    !sfx_impact             = $39
    !sfx_death              = $3B
    !sfx_vortex             = $3E
    !sfx_ghost_spawn        = $3F
    !sfx_guillotine         = $40
    !sfx_grow               = $45
    !sfx_shatter            = $47
    !sfx_gate_open          = $48
    !sfx_rosebud_grow       = $49
    !sfx_ship_creak         = $4A
    !sfx_cockatrice_spew    = $4C
    !sfx_skulls             = $4D
    !sfx_rosebud_explode    = $4E
    !sfx_ghost_destroy      = $4F
    !sfx_mimic_shake        = $50
    !sfx_mimic_jump         = $51
    !sfx_magic_charge       = $52
    !sfx_magic_seek         = $54
    !sfx_transform          = $5A
    !sfx_lightning          = $5D
    !sfx_1up                = $61
    !sfx_death_crawler_spin = $64
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

{ ;include banks
    incsrc bank00.asm
    incsrc bank01.asm
    incsrc bank02.asm
    incsrc bank03.asm
    incsrc bank04.asm
    incsrc bank05.asm
    incsrc bank06-07.asm
    incsrc bank08.asm
    incsrc bank09.asm
    incsrc bank0A.asm
    incsrc bank0B.asm
    incsrc bank0C.asm
    incsrc bank0D.asm
    incsrc bank0E.asm
    incsrc bank0F.asm
    incsrc bank10-1D.asm
    incsrc bank1E.asm
    incsrc bank1F.asm
}
