org $0A8000

{
    incsrc "stage_layouts/tiles.asm" ;8000 - FD07
    fillbyte $00 : fill 760          ;FD08 - FFFF
}

;-----

org $0B8000

{
    incsrc "stage_layouts/screen_layouts2.asm" ;8000 - EFFF
    fillbyte $00 : fill 256                    ;F000 - F0FF
    incsrc "various/recorded_inputs.asm"       ;F100 - FFFF
}

;-----

org $0C8000

{
    incsrc "stage_layouts/meta_tiles2.asm" ;8000 - F157
    fillbyte $00 : fill 3752               ;F158 - FFFF
}

;-----

org $0D8000

{
    incsrc "stage_layouts/tiles2.asm" ;8000 - FDBF
    fillbyte $00 : fill 576           ;FDC0 - FFFF
}
