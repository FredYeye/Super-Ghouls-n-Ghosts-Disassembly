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

{
    incsrc "ram_map.asm"
    incsrc "constants.asm"
    incsrc "snes_defines.asm"
    incsrc "object_defines.asm"
    incsrc "sound_defines.asm"
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
