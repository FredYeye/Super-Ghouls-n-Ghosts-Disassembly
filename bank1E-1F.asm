org $1E8000

{ ;8000 - F3D7
	incsrc "data/earthquake_tiles.asm"
}

{ ;F3D8 - FFFF
if !version == 0
	incbin "fill_bytes/jp/bank1Ea.bin"
elseif !version == 1 || !version == 2
	incbin "fill_bytes/eng/bank1Ea.bin"
endif
}

;-----

org $1F8000

{ ;8000 - D5DF
	incsrc "data/earthquake_tiles2.asm"
}

{ ;D5E0 - DFFF
if !version == 0
	incbin "fill_bytes/jp/bank1Fa.bin"
elseif !version == 1 || !version == 2
	incbin "fill_bytes/eng/bank1Fa.bin"
endif
}

{ ;E000 - F4BD
	incsrc "data/speed_xy.asm"
}

{ ;F4BE - FFFF
if !version == 0
	incbin "fill_bytes/jp/bank1Fb.bin"
elseif !version == 1 || !version == 2
	incbin "fill_bytes/eng/bank1Fb.bin"
endif
}
