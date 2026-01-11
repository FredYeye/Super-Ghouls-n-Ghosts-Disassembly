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

{ ;engine defines
    ;4E: 24 bytes * 7, handlers? potentially something else interleaved?
    ;54: offset to _01FF00 function jump table
    ;related functions: _01A6AB, nmi_837D

    ;                   $0276 flags? appears to be the start of this section
    ;                   $0278 game state?
    money_bag_count   = $027A
    difficulty_base   = $027B
    difficulty        = $027C
    shot_buttons      = $027D ;2 bytes
    jump_buttons      = $027F ;2 bytes
    rng_state         = $0289 ;2 bytes
    stage             = $028D
    checkpoint        = $028F
    continues         = $0290
    loop              = $0291
    ;                   $0292 ;related to "ready go"?
    score             = $0293 ;0293-029A (8 bytes)
    extend_threshhold = $029B ;029B-029E (4 bytes)
    extend_counter    = $02A3
    extra_lives       = $02A4
    checkpoint_x_pos  = $02A5
    timer_minutes     = $02A7
    timer_tens        = $02A8
    timer_seconds     = $02A9
    timer_ticks       = $02AA

    arthur_state_stored      = $02AE
    upgrade_state_stored     = $02AF ;arthur face or plume
    shield_state_stored      = $02B0 ;stores shield status for stage transitions and transformations
    shield_type_stored       = $02B1
    existing_weapon_type     = $02B3

    p1_button_hold  = $02B7 ;2 bytes
    p2_button_hold  = $02B9 ;2 bytes
    p1_button_press = $02BB ;2 bytes
    p2_button_press = $02BD ;2 bytes
    shot_hold       = $02BF ;1 byte
    jump_hold       = $02C0 ;1 byte
    shot_press      = $02C1 ;1 byte
    jump_press      = $02C2 ;1 byte

    ;02C3 inc every... "work frame" done? ie, no inc on lag frames
    ;02C4 inc on every video frame? regardless of lag frames
    ;02C5 used as counter for looping over all objs

    ;sfx related
    ;02F5: counter to compare with apu's last played sound(?)
    ;02F6: indexes into 2F8, reads
    ;02F7: indexes into 2F8, writes. increased after sfx is added
    ;02F8 - 317: sound queue of sorts

    ; $032A ;debugging? dpad moves the camera
    ; $032B ;pointer, 2 bytes
    hud_visible              = $032E
    stage1_earthquake_active = $032F
    ; = $0331 some kind of update palette bool (uses 0332)
    ; = $0332 index (normal colors, all white, grayscale BG + white sprites)
    ; = $0333 timer used in demo cutscene, menu
    chest_counter            = $0337
    hud_update_lives         = $036D
    hud_update_score         = $036F
    hud_update_timer         = $0370
    hud_flicker_timer        = $0373

    obj_start = $043C ; $11B0

    slot_list_objects = $13F1 ;list of 16 bit indices for slot_objects
    slot_list_weapons = $142F
    open_object_slots = $1443
    open_weapon_slots = $1445
    open_magic_slots  = $1447
    ;$1448 2 bytes

    ;14A8: some kind of enemy count array?

    is_shooting                  = $14B1
    can_charge_magic             = $14B2
    armor_state                  = $14BA ;armor/transform state
    jump_state                   = $14BC ;name? 1:double jump 2:double jump + shot
    ; = $14BE
    ; = $14C3
    current_cage                 = $14C4 ;0:outside 1:first cage 2:second cage
    double_jump_state            = $14C6
    skip_double_jump_boost       = $14C7
    knife_rapid_timer            = $14C8
    knife_rapid_count            = $14C9
    is_on_stone_pillar           = $14CA ;for wave crash
    hit_by_water_crash           = $14CB
    jump_counter                 = $14CC
    magic_current                = $14CF
    weapon_current               = $14D3
    jump_type                    = $14DC ;jump type based on transform status
    transform_armor_state_stored = $14DD
    transform_timer              = $14DE ;2 bytes
    ;is_casting_magic             = $14E3
    ;is_casting_magic2            = $14E4 ;what is this? magic sound related...?
    weapon_cooldown              = $14EC
    weapon_double_jump_boost     = $14F1
    is_frozen                    = $14F2
    frozen_counter               = $14F3
    ; $14F8 related to the bowgun magic
    ; $14F9 ;some kind of "exiting top of ladder" bool/counter

    camera_x = $15DC ;3 bytes
    camera_y = $15E0 ;3 bytes

    screen_boundary_left = $1A7D

    obj_type_count = $1A9A ;array counting active objects, per type. figure out length

    bat_count = $1EBE ;todo: also used by samael
    zombie_previous_x_spawn = $1ED8

    bowgun_magic_active = $1F98 ;todo: rename to "on_raft" or similar? or even raft+bowgun

    struct pot $1FA5 ; 1FAC
        .enemy_counter:      skip 1 ;spawned enemies that can carry pot
        .counter:            skip 1 ;total pots spawned
        .weapon_req:         skip 1 ;required pot count to drop weapon
        .unused:             skip 1
        .extend_req:         skip 1 ;required pot count to drop 1up
        .armor_statue_req:   skip 1 ;required pot count to drop armor statue
        .weapon_item_count:  skip 1 ;weapons dropped by chests also use this
        .point_statue_count: skip 1
    endstruct

    ;$1FD8 unused?

    struct options $1FD9 ; 1FDD
        .difficulty:       skip 1
        .controls:         skip 1
        .extra_lives:      skip 1
        .sound:            skip 1
        .stage_checkpoint: skip 1
    endstruct

    _7F9000 = $7F9000 ;gfx layer related
}

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
