org $088000

{
	incsrc "stage_layouts/screen_layouts.asm"  ;8000 - C5FF
	gfx_the_end: incbin "graphics/the_end.bin" ;C600 - E052
	fillbyte $00 : fill 941                    ;E053 - E3FF
	incsrc "sprite_data/sprite_defs.asm"       ;E400 - FD6F
	fillbyte $00 : fill 656                    ;FD70 - FFFF
}

;-----

org $098000 : bank09:

{
    incsrc "stage_layouts/meta_tiles.asm"      ;8000 - CEDF
    fillbyte $00 : fill 288                    ;CEE0 - CFFF
    gfx_unk36: incbin "graphics/unknown36.bin" ;D000 - E197 two tilemaps? second one being "the end"
    fillbyte $00 : fill 1640                   ;E198 - E7FF
    incsrc "data/palette_bg.asm"               ;E800 - FBFF
    fillbyte $00 : fill 256                    ;FC00 - FCFF
    incsrc "data/rotation_params.asm"          ;FD00 - FFFF
}

;-----

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
    incsrc "data/recorded_inputs.asm"          ;F100 - FFFF
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
