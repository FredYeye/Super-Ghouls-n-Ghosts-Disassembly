{
    ;$0030;0031 irq pointer? unused?
    task_function_pointer = $003F;0040
    ;$004C;004D ?

    struct task 0 ;24 bytes * 7
        .base:         skip 0

        .state:        skip 1 ;similar to obj active field? C:init 2:pause 1:?
        .timer:        skip 1 ;timer?
        .stack_reg:    skip 2 ;current top of the stack
        .stack_id:     skip 2 ;(const) offset to task's associated stack
        .fn_id:        skip 1 ;which FF00 function to call
        .init_param:   skip 0
        .memory:       skip 17

        .len:          skip 0
    endstruct

    !task_offset = $004E+task ;$004E;00F5

    struct stack $00F6;0275 ;8 stacks * 48 bytes
        .bottom: skip 47
        .top:    skip 1
    endstruct

    ;                   $0276 flags?
    ;                   $0278 game state?
    money_bag_count   = $027A
    difficulty_base   = $027B
    difficulty        = $027C
    shot_buttons      = $027D;027E
    jump_buttons      = $027F;0280
    rng_state         = $0289;028A
    ;                   $028B;028C ;unused?
    stage             = $028D
    checkpoint        = $028F
    continues         = $0290
    loop              = $0291
    ;                   $0292 ;related to "ready go"?
    score             = $0293;029A
    extend_threshhold = $029B;029E
    extend_counter    = $02A3
    extra_lives       = $02A4
    checkpoint_x_pos  = $02A5;02A6
    timer_minutes     = $02A7
    timer_tens        = $02A8
    timer_seconds     = $02A9
    timer_ticks       = $02AA
    ;02AB unused

    current_weapon_stored  = $02AD
    arthur_state_stored    = $02AE
    upgrade_state_stored   = $02AF ;arthur face or plume
    shield_state_stored    = $02B0 ;stores shield status for stage transitions and transformations
    shield_type_stored     = $02B1
    existing_weapon_type   = $02B3

    current_task_offset = $02B4 
    task_loop_count     = $02B5
    ;02B6 task/nmi related bool?

    p1_button_hold         = $02B7;02B8
    p2_button_hold         = $02B9;02BA
    p1_button_press        = $02BB;02BC
    p2_button_press        = $02BD;02BE
    shot_hold              = $02BF
    jump_hold              = $02C0
    shot_press             = $02C1
    jump_press             = $02C2

    frame_counter       = $02C3 ;updated when a frame's worth of work is done? i.e. not on lag frames
    video_frame_counter = $02C4 ;incremented in NMI handler, not used for anything
    ;02C5 used as counter for looping over all objs

    ;sfx related
    ;02F5: counter to compare with apu's last played sound(?)
    ;02F6: indexes into 2F8, reads
    ;02F7: indexes into 2F8, writes. increased after sfx is added
    ;02F8 - 317: sound queue of sorts

    ;$0318;0319 layer 3 VRAM offset?
    ;$031A;031B layer 3 size

    layer3_needs_update = $0323

    ; $032A ;debugging? dpad moves the camera
    ; $032B ;pointer, 2 bytes
    hud_visible              = $032E
    stage1_earthquake_active = $032F
    ; = $0331 some kind of update palette bool (uses 0332)
    ; = $0332 index (normal colors, all white, grayscale BG + white sprites)
    timer_demo               = $0333;0334 ;timer until demo starts, also used for intro cutscene timer
    ;$0335;0336 unused?
    chest_counter            = $0337
    hud_update_lives         = $036D
    hud_update_score         = $036F
    hud_update_timer         = $0370
    hud_flicker_timer        = $0373

    ;$0378 loop counter, sprite prio related

    obj_start = $043C;11B0

    struct sprite_prio 0
        .queues: skip 0
        .queue_0: skip 48*2
        .queue_1: skip 48*2
        .queue_2: skip 48*2
        .queue_3: skip 48*2
        .queue_4: skip 20*2
        .queue_5: skip 20*2
        .queue_6: skip 20*2
        .queue_7: skip 20*2
        .count:   skip 16
        .offsets: skip 16
    endstruct

    !sprite_prio_offset = $11B1+sprite_prio ;$11B1;13F0

    ;$11B1;13D0 ;8 priority queues for sprite drawing
    ;$13D1;13E0 ;active object count lists? create struct here maybe 
    ;$13E1;13F0 ;index values into 11B1 arrays
    slot_list_objects = $13F1;142E ;list of 16 bit indices for slot_objects
    slot_list_weapons = $142F;1442
    open_object_slots = $1443;1444
    open_weapon_slots = $1445;1446
    open_magic_slots  = $1447
    ;$1448 2 bytes

    ;14A8: some kind of enemy count array?

    is_shooting                  = $14B1
    can_charge_magic             = $14B2
    armor_state                  = $14BA ;armor/transform state
    jump_state                   = $14BC ;name? 1:double jump 2:double jump + shot
    ; = $14BE
    ; = $14C3
    current_cage                 = $14C4;14C5 ;0:outside 1:first cage 2:second cage
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
    transform_timer              = $14DE;14DF
    ;is_casting_magic             = $14E3
    ;is_casting_magic2            = $14E4 ;what is this? magic sound related...?
    weapon_cooldown              = $14EC
    weapon_double_jump_boost     = $14F1
    is_frozen                    = $14F2
    frozen_counter               = $14F3
    ; $14F8 related to the bowgun magic
    ; $14F9 ;some kind of "exiting top of ladder" bool/counter
    ; $14FA-14FF unused?

    struct palette_cycle 0 ;14 bytes
        .base: skip 0

        .unk: skip 5
        .timer: skip 1
        .unk2: skip 8

        .len: skip 0
    endstruct

    palette_cycle_start = $1500;1561 ;7 * 14 bytes

    ;$1562;15A1 ;4 * 16 bytes
    ;$15A2;19A3 ;3 * 0x0156 bytes

;0x3A-0x3D cam x
;0x3E-0x41 cam y
;
;0x44-0x46 long ptr
;0x47-0x49 long ptr
;0x4A-0x4C long ptr
;
;0xD6-0x155 word array?

    camera_x = $15DC;15DF
    camera_y = $15E0;15E3

    screen_boundary_left = $1A7D;1A7E

    obj_type_count = $1A9A;1B99 ;array counting active objects per type

    static_obj_count_per_chunk = $1B9A;1C99 ;array of pre-placed obj counts per 32 px X or Y chunk
    ;1C9A;1D99 ;obj related static array
    ;1D9A;1E99 ;obj spawn param list?

    bat_count = $1EBE ;todo: also used by samael
    zombie_previous_x_spawn = $1ED8;1ED9

    ; $1EE8;1EE9 ;distance from left screen edge arthur needs to reach to scroll the screen

    ; $1F2F bool

    in_armor_up_anim = $1F95

    bowgun_magic_active = $1F98 ;todo: rename to "on_raft" or similar? or even raft+bowgun

    struct pot $1FA5;1FAC
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

    ;$1FCB;1FD1 ;stored task state while armor is being picked up (1FCB goes unused)
    ;$1FD2;1FD3 camera x/y direction selector for ? (1FD3 written to but not used)

    ;$1FD8 unused?

    struct options $1FD9;1FDD
        .difficulty:       skip 1
        .controls:         skip 1
        .extra_lives:      skip 1
        .sound:            skip 1
        .stage_checkpoint: skip 1
    endstruct

    ;$1FDE;1FE8 options related
    ;$1FEF
    ;$1FF0;1FFF unused?

    ;7E2000;22FF           ;meta sprite offsets (2298-22FF unused?)
    ;7E2300;ADFF           ;meta sprite definitions (A712-ADFF unused?)
    ;7EAE00;AE7F           ;palette for bosses?
    ;7EAE80;AFFF           ;unused?
    ;7EB000;EFFF           ;tile array, indexes into tile shape array
    _7EF000           = $7EF000;F0FF ;tile shape array
    sprite_attributes = $7EF100;F31F ;snes sprite data
    ;7EF320;F3FF           ;unused?
    ;7EF400;F5FF?          ;palette (and/or DMA) related?
    ;7EF600;F6BF           ;unused?
    ;7EF6C0;FFFF           ;screen IDs?

    ;7F tentative map
    ;7F0000;7FFF ;decompression buffer (7F00-7FFF unused?)
    _7F9000 = $7F9000      ;gfx layer related
    ;7FA000;FFFF ;decompression? (F940-FFFF unused?)
}
