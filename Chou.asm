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

{ ;toggle register widths
    !A8   = "sep #$20"
    !A16  = "rep #$20"

    !X8   = "sep #$10"
    !X16  = "rep #$10"

    !AX8  = "sep #$30"
    !AX16 = "rep #$30"
}

{ ;snes registers
    INIDISP   = $2100 ;Display Control 1
    OBSEL     = $2101 ;Object Size and Object Base
    OAMADDL   = $2102 ;OAM Address (lower 8bit)
    OAMADDH   = $2103 ;OAM Address (upper 1bit) and Priority Rotation
    !BGMODE   = $2105 ;BG Mode and BG Character Size
    !MOSAIC   = $2106 ;Mosaic Size and Mosaic Enable
    !BG1SC    = $2107 ;BG1 Screen Base and Screen Size
    !BG2SC    = $2108 ;BG2 Screen Base and Screen Size
    !BG3SC    = $2109 ;BG3 Screen Base and Screen Size
    !BG12NBA  = $210B ;BG Character Data Area Designation
    !BG34NBA  = $210C ;BG Character Data Area Designation
    !BG1HOFS  = $210D ;BG1 Horizontal Scroll (X) (write-twice) / M7HOFS
    !BG1VOFS  = $210E ;BG1 Vertical Scroll   (Y) (write-twice) / M7VOFS
    !BG2HOFS  = $210F ;BG2 Horizontal Scroll (X) (write-twice)
    !BG2VOFS  = $2110 ;BG2 Vertical Scroll   (Y) (write-twice)
    !BG3HOFS  = $2111 ;BG3 Horizontal Scroll (X) (write-twice)
    !BG3VOFS  = $2112 ;BG3 Vertical Scroll   (Y) (write-twice)
    !VMAIN    = $2115 ;VRAM Address Increment Mode
    !VMADDL   = $2116 ;VRAM Address (lower 8bit)
    !VMADDH   = $2117 ;VRAM Address (upper 8bit)
    !VMDATAL  = $2118 ;VRAM Data Write (lower 8bit)
    !VMDATAH  = $2119 ;VRAM Data Write (upper 8bit)
    !M7SEL    = $211A ;Rotation/Scaling Mode Settings
    !M7A      = $211B ;Rotation/Scaling Parameter A & Maths 16bit operand (w2)
    !M7B      = $211C ;Rotation/Scaling Parameter B & Maths 8bit operand (w2)
    !M7C      = $211D ;Rotation/Scaling Parameter C         (write-twice)
    !M7D      = $211E ;Rotation/Scaling Parameter D         (write-twice)
    !M7X      = $211F ;Rotation/Scaling Center Coordinate X (write-twice)
    !M7Y      = $2120 ;Rotation/Scaling Center Coordinate Y (write-twice)
    !CGADD    = $2121 ;Palette CGRAM Address
    !W12SEL   = $2123 ;Window BG1/BG2 Mask Settings
    !W34SEL   = $2124 ;Window BG3/BG4 Mask Settings
    !WOBJSEL  = $2125 ;Window OBJ/MATH Mask Settings
    !WH0      = $2126 ;Window 1 Left Position (X1)
    !WH1      = $2127 ;Window 1 Right Position (X2)
    !WH2      = $2128 ;Window 2 Left Position (X1)
    !WH3      = $2129 ;Window 2 Right Position (X2)
    !WBGLOG   = $212A ;Window 1/2 Mask Logic (BG1-BG4)
    !WOBJLOG  = $212B ;Window 1/2 Mask Logic (OBJ/MATH)
    !TM       = $212C ;Main Screen Designation
    !TS       = $212D ;Sub Screen Designation
    !TMW      = $212E ;Window Area Main Screen Disable
    !TSW      = $212F ;Window Area Sub Screen Disable
    !CGWSEL   = $2130 ;Color Math Control Register A
    !CGADSUB  = $2131 ;Color Math Control Register B
    !COLDATA  = $2132 ;Color Math Sub Screen Backdrop Color
    !SETINI   = $2133 ;Display Control 2

    !MPYM     = $2135 ;PPU1 Signed Multiply Result   (middle 8bit)
    !MPYH     = $2136 ;PPU1 Signed Multiply Result   (upper 8bit)
    !SLHV     = $2137 ;PPU1 Latch H/V-Counter by Software (Read=Strobe)
    !RDVRAML  = $2139 ;PPU1 VRAM Data Read           (lower 8bits)
    !RDVRAMH  = $213A ;PPU1 VRAM Data Read           (upper 8bits)
    !OPVCT    = $213D ;PPU2 Vertical Counter Latch   (read-twice)
    !STAT78   = $213F ;PPU2 Status and PPU2 Version Number

    !APUI00   = $2140 ;Main CPU to Sound CPU Communication Port 0
    !APUI01   = $2141 ;Main CPU to Sound CPU Communication Port 1
    !APUI02   = $2142 ;Main CPU to Sound CPU Communication Port 2
    !APUI03   = $2143 ;Main CPU to Sound CPU Communication Port 3

    !NMITIMEN = $4200 ;Interrupt Enable and Joypad Request
    !WRIO     = $4201 ;Joypad Programmable I/O Port (Open-Collector Output)
    !WRMPYA   = $4202 ;Set unsigned 8bit Multiplicand
    !WRMPYB   = $4203 ;Set unsigned 8bit Multiplier and Start Multiplication
    !WRDIVL   = $4204 ;Set unsigned 16bit Dividend (lower 8bit)
    !WRDIVH   = $4205 ;Set unsigned 16bit Dividend (upper 8bit)
    !WRDIVB   = $4206 ;Set unsigned 8bit Divisor and Start Division
    !HTIMEL   = $4207 ;H-Count Timer Setting (lower 8bits)
    !HTIMEH   = $4208 ;H-Count Timer Setting (upper 1bit)
    !VTIMEL   = $4209 ;V-Count Timer Setting (lower 8bits)
    !VTIMEH   = $420A ;V-Count Timer Setting (upper 1bit)
    !MDMAEN   = $420B ;Select General Purpose DMA Channel(s) and Start Transfer
    !HDMAEN   = $420C ;Select H-Blank DMA (H-DMA) Channel(s)

    !RDNMI    = $4210 ;V-Blank NMI Flag and CPU Version Number (Read/Ack)
    !TIMEUP   = $4211 ;H/V-Timer IRQ Flag (Read/Ack)
    !HVBJOY   = $4212 ;H/V-Blank flag and Joypad Busy flag (R)
    !RDDIVL   = $4214 ;Unsigned Division Result (Quotient) (lower 8bit)
    !RDMPYL   = $4216 ;Unsigned Division Remainder / Multiply Product (lower 8bit)
    !RDMPYH   = $4217 ;Unsigned Division Remainder / Multiply Product (upper 8bit)
    !JOY1L    = $4218 ;Joypad 1 (gameport 1, pin 4) (lower 8bit)

    !DMAP0    = $4300 ;DMA/HDMA Parameters
    !DMAP1    = $4310 ;DMA/HDMA Parameters
    !DMAP2    = $4320 ;DMA/HDMA Parameters
    !DMAP3    = $4330 ;DMA/HDMA Parameters
    !DMAP4    = $4340 ;DMA/HDMA Parameters
    !DMAP5    = $4350 ;DMA/HDMA Parameters
    !DMAP7    = $4370 ;DMA/HDMA Parameters

    !BBAD0    = $4301 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD1    = $4311 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD2    = $4321 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD3    = $4331 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD4    = $4341 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD5    = $4351 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD7    = $4371 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)

    !A1T0L    = $4302 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T1L    = $4312 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T2L    = $4322 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T3L    = $4332 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T4L    = $4342 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T5L    = $4352 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T6L    = $4362 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T7L    = $4372 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)

    !A1T0H    = $4303 ;HDMA Table Start Address (high) / DMA Curr Addr (high)
    !A1T1H    = $4313 ;HDMA Table Start Address (high) / DMA Curr Addr (high)
    !A1T3H    = $4333 ;HDMA Table Start Address (high) / DMA Curr Addr (high)
    !A1T4H    = $4343 ;HDMA Table Start Address (high) / DMA Curr Addr (high)
    !A1T5H    = $4353 ;HDMA Table Start Address (high) / DMA Curr Addr (high)

    !A1B0     = $4304 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B1     = $4314 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B2     = $4324 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B3     = $4334 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B4     = $4344 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B5     = $4354 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B7     = $4374 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)

    !DAS0L    = $4305 ;Indirect HDMA Address (low)  / DMA Byte-Counter (low)
    !DAS0H    = $4306 ;Indirect HDMA Address (high) / DMA Byte-Counter (high)

    !DAS1B    = $4317 ;Indirect HDMA Address (bank)
    !DAS3B    = $4337 ;Indirect HDMA Address (bank)
    !DAS4B    = $4347 ;Indirect HDMA Address (bank)
    !DAS5B    = $4357 ;Indirect HDMA Address (bank)

    !A2A1L    = $4318 ;HDMA Table Current Address (low)
    !A2A2L    = $4328 ;HDMA Table Current Address (low)
    !A2A3L    = $4338 ;HDMA Table Current Address (low)
    !A2A4L    = $4348 ;HDMA Table Current Address (low)
    !A2A5L    = $4358 ;HDMA Table Current Address (low)
    !A2A6L    = $4368 ;HDMA Table Current Address (low)
    !A2A7L    = $4378 ;HDMA Table Current Address (low)

    !NTRL1    = $431A ;HDMA Line-Counter (from current Table entry)
    !NTRL2    = $432A ;HDMA Line-Counter (from current Table entry)
    !NTRL3    = $433A ;HDMA Line-Counter (from current Table entry)
    !NTRL4    = $434A ;HDMA Line-Counter (from current Table entry)
    !NTRL5    = $435A ;HDMA Line-Counter (from current Table entry)
    !NTRL6    = $436A ;HDMA Line-Counter (from current Table entry)
    !NTRL7    = $437A ;HDMA Line-Counter (from current Table entry)
}

{ ;SPC ports
    !TEST    = $00F0 ;Testing functions
    !CONTROL = $00F1 ;Timer, I/O and ROM Control
    !DSPADDR = $00F2 ;DSP Register Index
    !DSPDATA = $00F3 ;DSP Register Data
    !CPUIO0  = $00F4 ;CPU Input and Output Register 0
    !CPUIO1  = $00F5 ;CPU Input and Output Register 1
    !CPUIO2  = $00F6 ;CPU Input and Output Register 2
    !CPUIO3  = $00F7 ;CPU Input and Output Register 3
    !AUXIO4  = $00F8 ;Unused
    !AUXIO5  = $00F9 ;Unused
    !T0DIV   = $00FA ;Timer 0 Divider
    !T1DIV   = $00FB ;Timer 1 Divider
    !T2DIV   = $00FC ;Timer 2 Divider
    !T0OUT   = $00FD ;Timer 0 Output
    !T1OUT   = $00FE ;Timer 1 Output
    !T2OUT   = $00FF ;Timer 2 Output
}

{ ;joypad inputs
    ;todo: maybe prefix these with button or something
    ;$02B7, $02B9, $02BB, $02BD
    !r      = $10
    !l      = $20
    !x      = $40
    !a      = $80

    ;$02B8, $02BA, $02BC, $02BE
    !right  = $01
    !left   = $02
    !down   = $04
    !up     = $08
    !start  = $10
    !select = $20
    !y      = $40
    !b      = $80
}

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

    pot_spawn_counter   = $1FA5
    pot_count           = $1FA6
    pot_weapon_req      = $1FA7
    pot_extend_req      = $1FA9
    pot_armor_state_req = $1FAA
    weapon_item_count   = $1FAB
    point_statue_count  = $1FAC

    ;$1FD8 unused?

    struct options $1FD9 ;1FD9 - 1FDD
        .difficulty:       skip 1
        .controls:         skip 1
        .extra_lives:      skip 1
        .sound:            skip 1
        .stage_checkpoint: skip 1
    endstruct
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
