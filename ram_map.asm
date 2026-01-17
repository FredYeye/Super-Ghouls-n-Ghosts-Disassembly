{ ;ram map
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
    ;02AB unused

    current_weapon_stored = $02AD
    arthur_state_stored   = $02AE
    upgrade_state_stored  = $02AF ;arthur face or plume
    shield_state_stored   = $02B0 ;stores shield status for stage transitions and transformations
    shield_type_stored    = $02B1
    existing_weapon_type  = $02B3

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

    ; $0318 layer 3 VRAM offset?

    layer3_needs_update = $0323

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

    obj_start = $043C;$11B0

    ;13D1 ;active object count lists? create struct here maybe 

    slot_list_objects = $13F1;$142E ;list of 16 bit indices for slot_objects
    slot_list_weapons = $142F;$1442
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

    ; $1EE8 ;distance from left screen edge arthur needs to reach to scroll the screen, 2 bytes

    ; $1F2F bool

    bowgun_magic_active = $1F98 ;todo: rename to "on_raft" or similar? or even raft+bowgun

    struct pot $1FA5;$1FAC
        .enemy_counter:      skip 1 ;spawned enemies that can carry pot
        .counter:            skip 1 ;total pots spawned
        .weapon_req:         skip 1 ;required pot count to drop weapon
        .unused:             skip 1
        .extend_req:         skip 1 ;required pot count to drop 1up
        .armor_statue_req:   skip 1 ;required pot count to drop armor statue
        .weapon_item_count:  skip 1 ;weapons dropped by chests also use this
        .point_statue_count: skip 1
    endstruct

    ;$1FAD used by cockatrice_head2
    ;$1FAF used by icicle spawner / other stage 5 things
    ;$1FD8 unused?

    struct options $1FD9;$1FDD
        .difficulty:       skip 1
        .controls:         skip 1
        .extra_lives:      skip 1
        .sound:            skip 1
        .stage_checkpoint: skip 1
    endstruct

    ;$1FDE;$1FE8 options related
    ;$1FEF

    ;7E2000                 ;meta sprite offsets
    ;7E2300                 ;meta sprite definitions
    ;7EB000;$EFFF           ;tile array, indexes into tile shape array
    _7EF000 = $7EF000;$F0FF ;tile shape array
    ;$7EF100;$F2FF          ;snes sprite data
    ;$7EF300;$F31F          ;also sprite related
    ;$7EF400;$F5FF?         ;palette (and/or DMA) related?
    _7F9000 = $7F9000       ;gfx layer related
}
