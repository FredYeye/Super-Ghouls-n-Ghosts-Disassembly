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
    function meta(id, mode) = (mode<<14)|(offset(sprite_offsets, id)&$3FFF)
}

incsrc "ram_map.asm"
incsrc "constants.asm"
incsrc "snes_defines.asm"
incsrc "object_defines.asm"
incsrc "sound_defines.asm"

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

{ ;include banks
    incsrc bank00.asm
    incsrc bank01.asm
    incsrc bank02.asm
    incsrc bank03.asm
    incsrc bank04.asm
    incsrc bank05.asm
    incsrc bank06-07.asm
    incsrc bank08-0D.asm
    incsrc bank0E-0F.asm
    incsrc bank10-1D.asm
    incsrc bank1E-1F.asm
}
